class AnswersController < ApplicationController

  before_filter :get_answer_id, only: [:upvote, :downvote, :create_vote]

  def get_answer_id
    @answer = Answer.find(params[:id])
  end

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
    vote = Vote.find_by_user_id_and_answer_id(current_user.id, @answer.id)
    # refactor this to look for the primary "composite key"
    if vote
      update_vote(vote, true)
    else
      create_vote(true)
    end
  end

  def downvote
   vote = Vote.find_by_user_id_and_answer_id(current_user.id, @answer.id)
    if vote
      update_vote(vote, false)
    else
      create_vote(false)
    end
  end

  private
  def update_vote(vote, arg)
   vote.upvote = arg
   vote.save
   flash[:notice] = "Your vote has been updated!"
   # notice is currently not showing up
  end

  def create_vote(arg)
    @vote = Vote.new
    @vote.user_id = current_user.id
    @vote.answer_id = @answer.id
    @vote.upvote = arg
    @vote.save!
    render :nothing => true
    flash[:notice] = "Your vote has been created!"
  end
end
