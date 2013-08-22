class TagsController < ApplicationController

  def show
    @tag = Tag.find_by_name(params[:name])
    @questions = @tag.questions
  end

  # REVIEW: this is never used since tags/index is an empty file.
  def index
    @tags = Tag.all
  end

end
