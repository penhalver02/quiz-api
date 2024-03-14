# frozen_string_literal: true

class CategorySerializer
  include ActiveModel::Serializers::JSON

  def initialize(categories)
    @categories = categories
  end

  def attributes
    { categories: list_categories }
  end

  private

  def list_categories
    @categories.map do |category|
      { id: category.id, name: category.name }
    end
  end
end
