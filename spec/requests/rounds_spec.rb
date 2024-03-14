require 'rails_helper'

RSpec.describe "Rounds", type: :request do
  describe "GET /rounds/:id" do
    let!(:category) { Category.create(name: 'matemática') }
    let!(:question1) { Question.create(description: 'Quanto é 1+1?', category_id: category.id, correct_answer: '2' ) }
    let!(:question2) { Question.create(description: 'Quanto é 2+1?', category_id: category.id, correct_answer: '3' ) }

    let!(:option1) { Option.create(label: '5', question_id: question1.id) }
    let!(:option2) { Option.create(label: '2', question_id: question1.id) }
    let!(:option3) { Option.create(label: '7', question_id: question1.id) }

    let!(:option4) { Option.create(label: '3', question_id: question2.id) }
    let!(:option5) { Option.create(label: '8', question_id: question2.id) }
    let!(:option6) { Option.create(label: '2', question_id: question2.id) }

    let!(:player) { Player.create(name: 'Lucas') }
    let!(:round) { Round.create(category_id: category.id, player_id: player.id) }

    let!(:answer) { Answer.create(question_id: question1.id, option_id: option2.id, correct: true, round_id: round.id) }
    let!(:answer2) { Answer.create(question_id: question2.id, option_id: nil, round_id: round.id) }
    let(:expected_response) do
      {
        round: {
          id: round.id,
          player_id: player.id,
          questions: [
            {
              id: question1.id,
              description: question1.description,
              options: [
                { id: option1.id, label: option1.label},
                { id: option2.id, label: option2.label},
                { id: option3.id, label: option3.label}
              ]
            },
            {
              id: question2.id,
              description: question2.description,
              options: [
                { id: option4.id, label: option4.label},
                { id: option5.id, label: option5.label},
                { id: option6.id, label: option6.label}
              ]
            }
          ],
          answers: [
            {
              id: answer.id,
              question_id: answer.question_id,
              option_id: answer.option_id,
              correct: answer.correct
            }
          ]
        }
      }.to_json
    end

    subject(:request) { get "/rounds/#{round.id}", headers: { 'ACCEPT' => 'application/json' } }

    before { request }

    it 'returns the round' do
      expect(response.body).to eq expected_response
    end
  end

  describe "POST /round" do
    let!(:category) { Category.create(name: 'matemática') }
    let!(:question1) { Question.create(description: 'Quanto é 1+1?', category_id: category.id, correct_answer: '2' ) }

    let!(:option1) { Option.create(label: '5', question_id: question1.id) }
    let!(:option2) { Option.create(label: '2', question_id: question1.id) }
    let!(:option3) { Option.create(label: '7', question_id: question1.id) }
    let(:params) do
      {
        round: {
          player_name: 'Lucas',
          category_id: category.id
        }
      }
    end

    let(:round) { Round.last }
    let(:player) { Player.last }
    let(:expected_response) do
      {
        round: {
          id: round.id,
          player_id: player.id,
          questions: [
            {
              id: question1.id,
              description: question1.description,
              options: [
                { id: option1.id, label: option1.label},
                { id: option2.id, label: option2.label},
                { id: option3.id, label: option3.label}
              ]
            }
          ],
          answers: []
        }
      }.to_json
    end
    subject(:request) { post "/rounds", params: }

    before { request}

    it 'creates a round' do
      expect(response.body).to eq expected_response
      expect(response.status).to eq 201
    end

    context 'when category_id is invalid' do
      let(:params) do
        {
          round: {
            player_name: 'Lucas',
            category_id: -1
          }
        }
      end
      let(:expected_response) do
        { errors: 'Validation failed: Category must exist' }.as_json
      end

      it { expect(JSON.parse(response.body)).to include(expected_response) }
    end
  end

  describe "GET /rounds/:id/result" do
    let!(:category) { Category.create(name: 'matemática') }
    let!(:question1) { Question.create(description: 'Quanto é 1+1?', category_id: category.id, correct_answer: '2' ) }
    let!(:question2) { Question.create(description: 'Quanto é 2+1?', category_id: category.id, correct_answer: '3' ) }
    let!(:question3) { Question.create(description: 'Quanto é 2+1?', category_id: category.id, correct_answer: '3' ) }

    let!(:option1) { Option.create(label: '5', question_id: question1.id) }
    let!(:option2) { Option.create(label: '2', question_id: question1.id) }
    let!(:option3) { Option.create(label: '7', question_id: question1.id) }

    let!(:option4) { Option.create(label: '3', question_id: question2.id) }
    let!(:option5) { Option.create(label: '8', question_id: question2.id) }
    let!(:option6) { Option.create(label: '2', question_id: question2.id) }

    let!(:player) { Player.create(name: 'Lucas') }
    let!(:round) { Round.create(category_id: category.id, player_id: player.id) }

    let!(:answer) { Answer.create(question_id: question1.id, option_id: option2.id, correct: true, round_id: round.id) }
    let!(:answer2) { Answer.create(question_id: question2.id, option_id: option5.id, correct: false, round_id: round.id) }
    let!(:answer3) { Answer.create(question_id: question3.id, round_id: round.id) }

    let(:expected_response) do
      {
        round: {
          id: round.id,
          player_id: player.id,
          total_questions: 3,
          total_answered_questions: 2,
          total_correct_answers: 1
        }
      }.to_json
    end

    subject(:request) { get "/rounds/#{round.id}/result", headers: { 'ACCEPT' => 'application/json' } }

    before { request }

    it 'returns the round result' do
      expect(response.body).to eq expected_response
    end

    context 'when round_id does not exist' do
      let(:round) { instance_double('Round', id: -1) }
      let(:expected_response) do
        { errors: "Couldn't find Round with 'id'=-1" }.as_json
      end

      it { expect(JSON.parse(response.body)).to include(expected_response) }
    end
  end

  describe "POST /rounds/:id/answers" do
    let!(:category) { Category.create(name: 'matemática') }
    let!(:question1) { Question.create(description: 'Quanto é 1+1?', category_id: category.id, correct_answer: '2' ) }

    let!(:option1) { Option.create(label: '5', question_id: question1.id) }
    let!(:option2) { Option.create(label: '2', question_id: question1.id) }
    let!(:option3) { Option.create(label: '7', question_id: question1.id) }

    let!(:player) { Player.create(name: 'Lucas') }
    let!(:round) { Round.create(category_id: category.id, player_id: player.id) }

    let!(:answer) { Answer.create(question_id: question1.id, round_id: round.id) }

    let(:params) do
      {
        answer: {
          question_id: question1.id,
          option_id: option2.id
        }
      }
    end

    let(:expected_response) do
      {
        id: answer.id,
        question_id: question1.id,
        option_id: option2.id,
        correct: true,
        round_id: round.id
      }.to_json
    end

    subject(:request) { post "/rounds/#{round.id}/answers", params: }

    before { request }

    it 'create the answered' do
      expect(response.body).to eq expected_response
      expect(response.status).to eq 201
    end
  end
end
