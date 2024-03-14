require 'rails_helper'

RSpec.describe Option, type: :model do
  describe 'validations' do
    it "requires the presence of a label" do
      expect(Option.new).not_to be_valid
    end
  end
end
