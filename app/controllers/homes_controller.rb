# frozen_string_literal: true

class HomesController < ApplicationController
  def index
    recent_posts = BlogPostService.new.published_posts.first(3)

    render inertia: pages[:index], props: {
      about: {
        name: 'Joey Tongay',
        title: 'Software Engineering Lead',
        years_experience: 8,
        years_leading: 4,
        summary: 'Full stack software engineer with experience across many languages and frameworks.',
        skills: ['Ruby on Rails', 'Vue.js', 'TypeScript', 'React', 'Node.js']
      },
      recent_posts: recent_posts.map do |post|
        post.as_json(only: %i[slug title authored_on author reading_time excerpt])
      end
    }
  end

  def pages
    {
      index: 'Home/Index'
    }
  end
end
