# frozen_string_literal: true

module RoundService
  class Creator
    def self.call(params)
      new(params).call
    end

    def initialize(params)
      @player_name = params[:player_name]
      @category_id = params[:category_id].to_i
    end

    def call
      player = create_player
      round = create_round(player)
      create_answers(round)
      round
    end

    private

    def create_player
      Player.create!(name: @player_name)
    end

    def create_round(player)
      Round.create!(category_id: @category_id, player_id: player.id)
    end

    def random_questions_ids
      RandomQuestionsService.call(@category_id)
    end

    def create_answers(round)
      random_questions_ids.each do |random_question_id|
        Answer.create!(question_id: random_question_id.id, round_id: round.id)
      end
    end
  end
end
