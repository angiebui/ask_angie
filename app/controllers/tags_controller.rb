class TagsController < ApplicationController

  def show
    @tag = Tag.find_by_name(params[:name])
    @questions = @tag.questions
  end

  def index
    @tags = Tag.all
  end

end
