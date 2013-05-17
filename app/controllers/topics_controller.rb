class TopicsController < ApplicationController

  def show
    @topic = Topic.find_by_title(params[:title])
    @questions = @topic.questions
  end


  def index
    @topic = Topic.all
  end


end
