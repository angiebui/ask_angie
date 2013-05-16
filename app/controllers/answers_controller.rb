class AnswersController < ApplicationController
  def create
    @answer = Answer.new(params[:answer])
    if @answer.save
      redirect_to @answer.question
    else
      "Please add a body"
    end
  end

end
