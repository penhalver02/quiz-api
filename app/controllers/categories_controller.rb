class CategoriesController < ApplicationController
  def index
    render json: CategorySerializer.new(Category.all).attributes
  end
end
