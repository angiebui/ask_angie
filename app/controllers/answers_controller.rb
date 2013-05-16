class AnswersController < ApplicationController
  def create
    @answer = Answer.new(params[:answer])
    if @answer.save
      redirect_to @answer.question
    else
      "Please add a body"
    end
  end

  def upvote
    @answer = Answer.find(params[:id])
    @vote = Vote.new
    @vote.user_id = current_user.id
    @vote.answer_id = @answer.id
    @vote.upvote = true
    @vote.save!
    render :nothing => true
  end

  def downvote
    @answer = Answer.find(params[:id])
    @vote = Vote.new
    @vote.user_id = current_user.id
    @vote.answer_id = @answer.id
    @vote.upvote = false
    @vote.save!
    render :nothing => true
  end

end
