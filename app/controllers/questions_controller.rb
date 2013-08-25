class QuestionsController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:index, :search, :show, :unanswered, :search]
  load_and_authorize_resource
  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.order('id DESC').page(params[:page]).per(20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions }
    end
  end

  def downvote
    @question = Question.find(params[:id])
    begin
      current_user.vote_against @question unless current_user.questions.include? @question
    rescue ActiveRecord::RecordInvalid
      render 'already_voted'
    end
  end

  def upvote
    begin
      current_user.vote_for @question unless current_user.questions.include? @question
    rescue ActiveRecord::RecordInvalid
      render 'already_voted'
    end
  end

  def unanswered
    @questions = Question.unanswered
  end

  def search
    @questions = Question.search(params[:keyword])
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    # @question = Question.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    @question = current_user.questions.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/1/edit
  def edit
    # @question = Question.find(params[:id])
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = current_user.questions.new(params[:question])

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.json
  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    # @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to @question.user }
      format.json { head :no_content }
    end
  end
end
