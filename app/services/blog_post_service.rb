# frozen_string_literal: true

# Handles the reading and parsing of Markdown files in the posts directory
class BlogPostService
  POSTS_DIR = Rails.root.join('app', 'content', 'posts')

  def all_posts
    post_files = Dir.glob(POSTS_DIR.join('*.md')).sort

    pp post_files

    post_files.map do |file_path|
      parse_file(file_path:)
    end

    # compact.sort_by { |post| post[:date] }.reverse
  end

  def find_post(slug:)
    file_path = POSTS_DIR.join("#{slug}.md")

    return nil unless File.exist?(file_path)

    parse_file(file_path:)
  end

  def published_posts
    all_posts.select { |post| post[:published] }
  end

  private

  def parse_file(file_path:)
    # content = File.read(file_path)

    # Parse frontmatter and content using frontmatter gem
    parsed = FrontMatterParser::Parser.parse_file(file_path)
    frontmatter = parsed.front_matter || {}
    mardown_content = parsed.content

    # Parse markdown to HTML
    renderer = Redcarpet::Render::HTML.new(
      filter_html: false,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      # disable_indented_code_blocks: false,
      autolink: true,
      tables: true,
      underline: true,
      highlight: true,
      prettify: true
    )

    markdown = Redcarpet::Markdown.new(
      renderer,
      autolink: true,
      fenced_code_blocks: true,
      tables: true,
      strikethrough: true,
      superscript: true,
      underline: true,
      highlight: true,
      quote: true,
      prettify: true,
      footnotes: true
    )

    html_content = markdown.render(mardown_content)

    # Generate Slug from filename if not provided
    filename = File.basename(file_path, '.md')
    slug = frontmatter['slug'] || filename

    {
      slug:,
      title: frontmatter['title'] || filename.humanize,
      date: parse_date(frontmatter['date']) || File.mtime(file_path),
      authored_on: parse_date(frontmatter['authored_on']) || nil,
      author: frontmatter['author'] || 'Anonymous',
      tags: frontmatter['tags'] || [],
      excerpt: frontmatter['excerpt'] || extract_excerpt(file_path),
      published: frontmatter.fetch('published', true),
      content: html_content,
      reading_time: calculate_reading_time(mardown_content)
    }
  rescue StandardError => e
    Rails.logger.error "Error parsing blog post #{file_path}: #{e.message}"
  end

  def parse_date(date_string)
    return nil unless date_string

    case date_string
    when String
      Date.parse(date_string)
    when Date, Time
      date_string
    end
  rescue StandardError
    nil
  end

  def extract_excerpt(content, length: 150)
    # Remove markdown formatting for excerpt

    plain_text = content.gsub(/[#*`_\[\]()>-]/, '').strip
    if plain_text.length > length
      plain_text[0..length].gsub(/\s\w+\s*$/, '...').strip
    else
      plain_text
    end
  end

  def calculate_reading_time(content)
    word_count = content.split.length
    (word_count / 200.0).ceil
  end
end
