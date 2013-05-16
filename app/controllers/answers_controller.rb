class AnswersController < ApplicationController
  def create
    if current_user
      @answer = Answer.new(params[:answer])
      flash[:notice] = "Invalid answer. Please try again." unless @answer.save 
      redirect_to @answer.question
    else
      flash[:notice] = "You must login to answer a question."
      redirect_to login_users_path
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
