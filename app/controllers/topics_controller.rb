class TopicsController < ApplicationController

  def show
    @topic = Topic.find_by_name(params[:name])
    @questions = @topic.questions
  end

  def index
    @topics = Topic.all
  end

end
