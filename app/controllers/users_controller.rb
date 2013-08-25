class UsersController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:index, :show]
  load_and_authorize_resource
  rescue_from ActiveRecord::RecordNotFound do
    redirect_to root_url, alert: 'User does not Exist'
  end

  def show
    # @user = User.find(params[:id])
  end

  # GET /users/1/edit
  def edit
    # @user = current_user
    # @user = User.find_by_id(params[:id])
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    # @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
