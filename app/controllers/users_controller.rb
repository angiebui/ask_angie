class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(params[:user])
    if user.save
      # REVIEW: this code is repeated and it's better if you move it into a helper method in
      # application controller or module. something like: def login(user)
      session[:id] = user.id
      redirect_to user_path(user.id)
    else
      # REVIEW: render :new and display errors instead of redirecting and having to send all messages into a notice.
      redirect_to new_user_path, :notice => user.errors.full_messages
    end
  end

  # REVIEW: this should move to a sessions_controller and become a destroy action (DELETE).
  def signout
    session.clear
    redirect_to :root, :notice => "bye bye"
  end

  # REVIEW: this should move into a sessions_controller and become a POST create action
  def login
    if request.post?
      user = User.find_by_username(params[:user]["username"])
      if user && user.authenticate(params[:user]["password"])
        # REVIEW: use helper method
        session[:id] = user.id
        redirect_to root_path
      else
        redirect_to login_users_path, :notice => "Invalid username or password. Please try again."
      end
    else
    end
  end

  def show
    @user = User.find(params[:id])
    @questions = @user.questions
    @answers = @user.answers.sorted_by_vote
  end

  def about
  end

end
