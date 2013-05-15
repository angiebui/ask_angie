class QuestionsController < ApplicationController

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    @answer = Answer.new

    if @question.save
      redirect_to @question
    else
      flash[:error] = "Not a valid question. Please try again"
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

end

