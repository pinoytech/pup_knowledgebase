class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  before_filter :count_unanswered
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  protect_from_forgery

  def count_unanswered
    @unanswered = Question.unanswered
  end
end
