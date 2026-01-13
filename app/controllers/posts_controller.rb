# frozen_string_literal: true

# This is the PostsController
class PostsController < ApplicationController
  before_action :set_post, only: %i[show]

  inertia_share flash: -> { flash.to_hash }

  # GET /posts
  def index
    @posts = post_service.all_posts
    pp '----------------------------'
    pp @posts
    pp '----------------------------'
    render inertia: 'Post/Index', props: {
      posts: @posts.map do |post|
        serialize_post(post)
      end
    }
  end

  # GET /posts/1
  def show
    pp @post
    render inertia: 'Post/Show', props: {
      post: serialize_post(@post)
    }
  end

  private

  def post_service
    BlogPostService.new
  end

  def set_post
    @post = post_service.find_post(slug: params[:id])
  end

  def serialize_post(post)
    post.as_json(only: %i[
                   slug title content authored_on author
                 ])
  end

  def pages
    {
      index: 'Post/Index',
      show: 'Post/Show'
    }
  end
end
