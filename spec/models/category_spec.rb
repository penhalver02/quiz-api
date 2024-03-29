require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it "requires the presence of a name" do
      expect(Category.new).not_to be_valid
    end
  end
end
