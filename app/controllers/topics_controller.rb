class TopicsController < ApplicationController
  # REVIEW: as a convention, index should come before show.
  def show
    @topic = Topic.find_by_title(params[:title])
    @questions = @topic.questions
  end

  def index
    @topics = Topic.all
  end

end
