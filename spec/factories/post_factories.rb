# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { FFaker::Book.title }
    body { FFaker::Book.description }
  end
end