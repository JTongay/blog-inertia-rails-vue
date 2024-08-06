# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Post' do
  describe '.validations' do
    it 'creates a post' do
      post = Post.new(title: 'title', body: 'body')
      expect(post.valid?).to be true
    end
  end
end