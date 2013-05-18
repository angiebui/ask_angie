class AnswersController < ApplicationController

  before_filter :get_answer_id, only: [:upvote, :downvote, :create_vote]


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
    if current_user
      if vote = @answer.votes.find_by_user_id(current_user.id)
        update_vote(vote, true)
        score = @answer.vote_count
        return render :json => {answer_score: score, action_type: "update_vote"}
      else
        create_vote(true) 
        score = @answer.vote_count
        return render :json => {answer_score: score, action_type: "create_vote"}
      end
    else
     return render :json => {error: "You must login to vote"}
    end
  end

  def downvote
    if current_user
      if vote = @answer.votes.find_by_user_id(current_user.id)
        update_vote(vote, false)
        score = @answer.vote_count
        return render :json => {answer_score: score, action_type: "update_vote"}
      else
        create_vote(false) 
        score = @answer.vote_count
        return render :json => {answer_score: score, action_type: "create_vote"}
      end
    else
      return render :json => {error: "You must login to vote"}
    end
  end

  private

  def update_vote(vote, arg)
   vote.upvote = arg
   vote.save
 end

 def create_vote(arg)
  @vote = Vote.new
  @vote.user_id = current_user.id
  @vote.voteable_id = @answer.id
  @vote.voteable_type = 'Answer'
  @vote.upvote = arg
  @vote.save!
end

def get_answer_id
  @answer = Answer.find(params[:id])
end
end
