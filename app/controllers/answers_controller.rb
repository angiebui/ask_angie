class AnswersController < ApplicationController

  before_filter :get_answer_id, only: [:upvote, :downvote, :create_vote]

  def get_answer_id
    @answer = Answer.find(params[:id])
  end

  def create
    if current_user
      @answer = current_user.answers.new(params[:answer])
      flash[:notice] = "Invalid answer. Please try again." unless @answer.save 
      redirect_to @answer.question
    else
      flash[:notice] = "You must login to answer a question."
      redirect_to login_users_path
    end
  end

  def upvote
    vote = Vote.find_by_user_id_and_answer_id(current_user.id, @answer.id)
    vote ? update_vote(vote, true) : create_vote(true)
  end

  def downvote
   vote = Vote.find_by_user_id_and_answer_id(current_user.id, @answer.id)
   vote ? update_vote(vote, false) : create_vote(false)
  end

  private

  def update_vote(vote, arg)
   vote.upvote = arg
   vote.save
   render :nothing => true
  end

  def create_vote(arg)
    @vote = Vote.new
    @vote.user_id = current_user.id
    @vote.answer_id = @answer.id
    @vote.upvote = arg
    @vote.save!
    render :nothing => true    
  end


end
