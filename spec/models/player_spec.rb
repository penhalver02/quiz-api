require 'rails_helper'

RSpec.describe Player, type: :model do
  describe 'validations' do
    it "requires the presence of a name" do
      expect(Player.new).not_to be_valid
    end
  end
end
