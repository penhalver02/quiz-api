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
      ActiveRecord::Base.transaction do
        create_player
        create_round
        create_answers
      end
      create_round
    end

    private

    def create_player
      @create_player ||= Player.create!(name: @player_name)
    end

    def create_round
      @create_round ||= Round.create!(category_id: @category_id, player_id: create_player.id)
    end

    def random_questions_ids
      RandomQuestionsService.call(@category_id)
    end

    def create_answers
      random_questions_ids.each do |random_question_id|
        Answer.create!(question_id: random_question_id.id, round_id: create_round.id)
      end
    end
  end
end
