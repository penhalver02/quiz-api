# frozen_string_literal: true

class RoundsController < ApplicationController
  def show
    round = Round.includes(:player, category: [questions: [:options]]).find(params[:id])
    render json: RoundSerializer.new(round).attributes
  end

  def create
    round = RoundService::Creator.call(permitted_params)
    render json: RoundSerializer.new(round).attributes, status: :created
  end

  def result
    round = Round.includes(:player, category: [questions: [:options]]).find(params[:round_id])
    render json: ResultSerializer.new(round).attributes
  end

  def answers
    answer = Answer.includes(:question).find_by(question_id: params[:answer][:question_id],
                                                round_id: params[:round_id])
    option = Option.find(params[:answer][:option_id])
    render json: AnswersService.call(answer, option), status: :created
  end

  private

  def permitted_params
    params.require(:round).permit(:player_name, :category_id)
  end
end
