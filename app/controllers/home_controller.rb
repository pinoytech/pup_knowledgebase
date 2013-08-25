class HomeController < ApplicationController
  skip_before_filter :authenticate_user!
  def index
    @questions = Question.plusminus_tally.limit(10).order('plusminus_tally DESC')
  end
end
