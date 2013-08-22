class AnswersController < ApplicationController

  before_filter :get_answer_id, only: [:upvote, :downvote, :create_vote]


  def create
    if current_user
      # REVIEW, use .build instead of .new
      @answer = current_user.answers.new(params[:answer])
      # REVIEW: you're handling save errors by just sending back a flash?
      # you need to tell the user what went wrong.
      flash[:notice] = "Invalid answer. Please try again." unless @answer.save
      redirect_to @answer.question
    else
      # REVIEW: instead of doing this, why not have a method authorize! in our application controller
      # that checks to see if we have current_user and run that in a before filter. Otherwise, you'll end
      # up repeating yourself all over the place.
      flash[:notice] = "You must login to answer a question."
      redirect_to login_users_path
    end
  end

  def upvote
    if current_user
      if vote = @answer.votes.find_by_user_id(current_user.id)
        # REVIEW: nice move to put some logic in a helper method, but it would be
        # better if we move the whole logic to the vote model and this way just call
        # vote.update!(true)
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
  # REVIEW: you can just do @vote.voteable = @answer instead of lines 69 and 70
  @vote.voteable_id = @answer.id
  @vote.voteable_type = 'Answer'
  @vote.upvote = arg
  # REVIEW: why save! ?
  @vote.save!
end

# REVIEW: this method name is misleading, you're returning the entire answer object not the id.
def get_answer_id
  @answer = Answer.find(params[:id])
end
end
