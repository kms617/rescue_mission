class QuestionsController < ApplicationController

    # GET /questions
  def index
    @questions = Question.all.order(created_at: :desc)
  end

  # GET /questions/1
  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers_chron = Answer.all.order(created_at: :desc).where(question_id: @question.id)
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  #POST question
  def create
    @question = Question.new(question_params)

    if @question.save
      # flash[:notice] = "Your question has been submitted."
      redirect_to @question

    else
    #   flash[:notice] = "There was an error with your submission. Please try again."
      render :new
    end
  end

  #PUT question
  def edit
    @question = Question.find(params[:id])
  end

  #UPDATE new question
  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  #DELETE question
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

  flash[:notice] = "You have successfully deleted your question"
  redirect_to @question
  end



  private

  #Don't trust people!
  def question_params
    params.require(:question).permit(:title, :description)
  end

end
