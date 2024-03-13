require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe "GET /categories" do
    context 'succes'  do
      let!(:category) { Category.create(name: 'matemática') }
      let!(:second_category) { Category.create(name: 'matemática') }
      let(:expected_response) do
        {
          categories: [
            { id: category.id, name: category.name },
            { id: second_category.id, name: second_category.name }
          ]
        }.to_json
      end

      subject(:request) { get '/categories', headers: { 'ACCEPT' => 'application/json' } }

      before { request}

      it 'returns the categories' do
        expect(response.body).to eq expected_response
      end
    end
  end
end
