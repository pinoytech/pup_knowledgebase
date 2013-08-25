class HomeController < ApplicationController
  def index
    @designs = Design.order("id DESC")
  end
end
