# frozen_string_literal: true

class ExamplesController < ApplicationController
  def index
    render inertia: "example/index", props: {
      test: "howdy!"
    }
  end
end