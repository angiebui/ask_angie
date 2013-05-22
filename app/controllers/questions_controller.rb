class QuestionsController < ApplicationController

  def index
    # REVIEW: you are only using @questions_by_answer_count in your view.
    # can we just make search return a sorted list just do @questions_by_answer_count = Question.search(params[:search])
    # @topics is not used, remove it.
    @questions = Question.search(params[:search])
    @questions_by_answer_count = @questions.sort
    @topics = Topic.all
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    # @topics is not used, remove it.
    @topics = Topic.topic_sort
  end

  def new
    @question = Question.new
    @topics = Topic.all
  end

  def create
    # REVIEW: look at my comments on answers controller. Move this to a helper.
   if current_user
      @topic = Topic.find(params[:topic_id])
      @question = current_user.questions.build(params[:question])
      # REVIEW: it's preferred to use .topic = @topic
      @question.topic_id = @topic.id
      @answer = Answer.new

      if @question.save
        redirect_to @question
      else
        flash[:notice] = "Not a valid question. Please try again."
        # REVIEW: when you redirect, you lose the errors on the object.
        # you are not telling the user why the question is invalid.
        # render :new instead and render the errors on the form.
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

end

