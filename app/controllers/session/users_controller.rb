# frozen_string_literal: true

# Controller that hands the login and logout of the user
class Session::UsersController < Devise::SessionsController
  def new
    render inertia: 'Auth/LoginPage', props: {
      user: User.new
    }
  end

  def create
    super
    # Do something
    user = User.new(user_params)

    if user.save
      redirect_to user, notice: 'Login successful'
    else
      pp user.errors
      redirect_to new_user_session_path, inertia: { errors: user.errors }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end