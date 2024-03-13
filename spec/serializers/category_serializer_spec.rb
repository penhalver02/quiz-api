require 'rails_helper'

RSpec.describe CategorySerializer do
  describe '#attributes' do
    let(:category__mock1) do
      instance_double('Category', id: 1, name: 'matemática')
    end
    let(:category__mock2) do
      instance_double('Category', id: 2, name: 'português')
    end
    let(:categories) do
      [ category__mock1,  category__mock2 ]
    end

    let(:expected_response) do
      {
        categories: [
          { id: category__mock1.id, name: category__mock1.name },
          { id: category__mock2.id, name: category__mock2.name }
        ]
      }
    end

    subject { described_class.new(categories).attributes }

    it { is_expected.to eql(expected_response) }
  end
end
