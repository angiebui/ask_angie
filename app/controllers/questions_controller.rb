class QuestionsController < ApplicationController


  def new
    @question = Question.new
  end

  def create
    if user_signed_in?
      @question = current_user.questions.new(params[:question])
      @answer = Answer.new
        if @question.save
          redirect_to @question
        else
          flash[:error] = "Not a valid question. Please try again"
          render 'new'
        end
    else
      flash[:notice] = "You must be logged in to create a question"
      redirect_to login_users_path
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

end

