require 'rails_helper'

RSpec.describe CategorySerializer do
  describe '#attributes' do
    let(:category_mock1) do
      instance_double('Category', id: 1, name: 'matemática')
    end
    let(:category_mock2) do
      instance_double('Category', id: 2, name: 'português')
    end
    let(:categories) do
      [ category_mock1,  category_mock2 ]
    end

    let(:expected_response) do
      {
        categories: [
          { id: category_mock1.id, name: category_mock1.name },
          { id: category_mock2.id, name: category_mock2.name }
        ]
      }
    end

    subject { described_class.new(categories).attributes }

    it { expect(subject).to eql(expected_response) }
  end
end
