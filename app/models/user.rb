# frozen_string_literal: true

# User info Class
class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
end
