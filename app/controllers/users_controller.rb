class UsersController < ApplicationController
  inertia_share flash: -> { flash.to_hash }

  def new
    render inertia: 'User/New', props: {
      user: User.new
    }
  end
end