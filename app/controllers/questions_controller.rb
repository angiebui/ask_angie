class QuestionsController < ApplicationController
  before_filter :get_question, only: [:upvote, :downvote, :create_vote]

  def index
    @questions = Question.search(params[:search])
    @questions_by_vote_count = Question.sorted_by_vote
    @topics = Topic.all
  end
  
  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @topics = Topic.topic_sort
  end

  def new
    @question = Question.new
    @topics = Topic.all
  end

  def create
   if current_user
      @topic = Topic.find(params[:topic_id])
      @question = current_user.questions.build(params[:question])
      @question.topic_id = @topic.id
      @answer = Answer.new
      
      if @question.save
        redirect_to @question
      else
        flash[:notice] = "Not a valid question. Please try again."
        redirect_to new_question_path
      end
    else
      flash[:notice] = "You must be logged in to create a question."
      redirect_to login_users_path
    end
  end

  def search
    @questions_by_answer_count = Question.search params[:search]
    @search = params[:search]
  end

  def upvote
    if current_user
      if vote = @question.votes.find_by_user_id(current_user.id)
        update_vote(vote, true)
        score = @question.vote_count
        return render :json => {answer_score: score, action_type: "update_vote"}
      else
        create_vote(true) 
        score = @question.vote_count
        return render :json => {answer_score: score, action_type: "create_vote"}
      end
    else
     return render :json => {error: "You must log in to vote"}
    end
  end

  def downvote
    if current_user
      if vote = @question.votes.find_by_user_id(current_user.id)
        update_vote(vote, false)
        score = @question.vote_count
        return render :json => {answer_score: score, action_type: "update_vote"}
      else
        create_vote(false) 
        score = @question.vote_count
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
  @vote.voteable_id = @question.id
  @vote.voteable_type = 'Question'
  @vote.upvote = arg
  @vote.save!
  end

  def get_question
    @question = Question.find(params[:id])
  end
end
