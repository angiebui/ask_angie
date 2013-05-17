class QuestionsController < ApplicationController
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

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @topics = Topic.all
  end

  def index
    @questions_by_answer_count = Question.answer_count
    @topics = Topic.all
  end
  
end

