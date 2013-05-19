class QuestionsController < ApplicationController

  def index
    @questions = Question.search(params[:search])
    @questions_by_answer_count = @questions.sort
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

def edit
  @question = Question.find(params[:id])
  @topics = Topic.all
end

def update
  @question = Question.find(params[:id])
  @question.update_attributes(params[:question])
  redirect_to user_path(current_user.id)
end

def destroy
  @question = Question.find(params[:id])
  @question.destroy
  redirect_to user_path(current_user.id)
end

def search
  @questions_by_answer_count = Question.search params[:search]
  @search = params[:search]
end

end

