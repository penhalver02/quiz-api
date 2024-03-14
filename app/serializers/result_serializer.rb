# frozen_string_literal: true

class ResultSerializer
  include ActiveModel::Serializers::JSON

  def initialize(round)
    @round = round
  end

  def attributes
    {
      round: {
        id: @round.id,
        player_id: @round.player.id,
        total_questions:,
        total_answered_questions: total_answered,
        total_correct_answers:
      }
    }
  end

  private

  def total_questions
    @round.questions.count
  end

  def total_answered
    @round.answers.select { |answer| answer.option_id.present? }.count
  end

  def total_correct_answers
    @round.answers.select { |answer| answer.correct == true }.count
  end
end
