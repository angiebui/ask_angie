class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(params[:user])
    if user.save
      session[:id] = user.id
      redirect_to root_path
    else
      redirect_to new_user_path, :notice => user.errors.full_messages
    end
  end

  def signout
    session.clear
    redirect_to :root, :notice => "bye bye"
  end

  def login
    if request.post?
      user = User.find_by_username(params[:user]["username"])
      if user && user.authenticate(params[:user]["password"])
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
