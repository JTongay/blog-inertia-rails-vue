# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Post' do
  describe '.validations' do
    it 'creates a post' do
      post = Post.new(title: 'title', body: 'body')
      expect(post.valid?).to be true
    end

    it 'does not create a post without a title' do
      post = Post.new(body: 'body')
      expect(post.valid?).to be false
    end

    it 'does not create a post without a body' do
      post = Post.new(title: 'title')
      expect(post.valid?).to be false
    end

    it 'does not create a post without a title and body' do
      post = Post.new
      expect(post.valid?).to be false
    end

    it 'does not create a post with the same title' do
      post = create :post
      post2 = Post.new(title: post.title, body: 'body')
      expect(post2.valid?).to be false
    end

    it 'does not create a post with the same body' do
      post = create :post
      post2 = Post.new(title: 'title', body: post.body)
      expect(post2.valid?).to be false
    end
  end

  describe 'factories' do
    it 'has a valid factory' do
      post = build(:post)
      expect(post.valid?).to be true
    end
  end
end