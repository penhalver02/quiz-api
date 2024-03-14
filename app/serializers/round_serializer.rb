# frozen_string_literal: true

class RoundSerializer
  include ActiveModel::Serializers::JSON

  def initialize(round)
    @round = round
  end

  def attributes
    {
      round: {
        id: @round.id,
        player_id: @round.player.id,
        questions: questions_list,
        answers: answers_list
      }
    }
  end

  private

  def questions_list
    @round.questions.map do |question|
      { id: question.id, description: question.description }.merge(options: options_list(question))
    end
  end

  def options_list(question)
    question.options.map do |option|
      { id: option.id, label: option.label }
    end
  end

  def answers_list
    @round.answers.map do |answer|
      next if answer.option_id.blank?

      { id: answer.id, question_id: answer.question.id, option_id: answer.option_id,
        correct: answer.correct }
    end.compact
  end
end
