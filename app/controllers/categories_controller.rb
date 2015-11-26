class CategoriesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def index
    @categories = Category.paginate page: params[:page], per_page: Settings.length.page
  end
end
