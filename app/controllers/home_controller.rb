class HomeController < ApplicationController
  skip_before_filter :authenticate_user!
  def index
    @questions = Question.order("id DESC")
  end
end
