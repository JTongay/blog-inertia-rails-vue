# frozen_string_literal: true

# This is the NowController

class NowsController < ApplicationController
  def index
    render inertia: pages[:index], props: {}
  end

  private

  def pages
    {
      index: 'Now/Index'
    }
  end
end
