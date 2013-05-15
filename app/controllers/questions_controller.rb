class QuestionsController < ApplicationController
  # before_filter :get_user 

  # def get_user
  #   @question.user_id = 1
  # end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    if @question.save
      redirect_to @question
    else
      flash[:error] = "Not a valid question. Please try again"
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
  end

end

