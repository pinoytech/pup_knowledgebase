class PageController < ApplicationController
  skip_before_filter :authenticate_user!
  def about
  end
end