# frozen_string_literal: true

class HomesController < ApplicationController
  def index
    render inertia: pages[:index], props: {}
  end

  def pages
    {
      index: 'Home/Index'
    }
  end
end
