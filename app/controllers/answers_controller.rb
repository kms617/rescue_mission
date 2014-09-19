class AnswersController < ApplicationController

  # POST answers
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question_id = @question.id
    @answers_chron = Answer.all.order(created_at: :desc).where(question_id: @question.id)

    if @answer.save
      redirect_to question_path(@question)
    else
      render 'questions/show'
    end
  end

  private

  #Don't trust people!
  def answer_params
    params.require(:answer).permit(:answer)

  end

end
