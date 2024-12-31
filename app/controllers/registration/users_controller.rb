# frozen_string_literal: true

# Controller that handles the registration of the user
class Registration::UsersController < Devise::RegistrationsController
  respond_to :json

  def new
    render inertia: 'Auth/SignupPage', props: {
      user: User.new
    }
  end

  def create
    # Do something
    @user = User.new(user_params)

    pp @user

    if @user.save
      pp "User saved"
      redirect_to_posts
    else
      pp "User not saved"
      pp @user.errors
      redirect_to new_user_registration_path, inertia: { errors: @user.errors }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end

  def redirect_to_posts
    redirect_to posts_path, inertia: true
  end
end