class CategoriesController < ApplicationController
	before_action :logged_in_user, only: [:index, :show]
  before_action :admin_user, only: [:new, :create, :destroy]
  

  def index
    @categories = Category.paginate(page: params[:page])
  end
  
  def show
    @category = Category.find(params[:id])

  end
  
  def new
    @category = Category.new
  end
  
  def create
  	@category = Category.new(category_params)
    if @category.save
      flash[:success] = "category created!"
      redirect_to categories_path
    else
      @feed_items = []
      render 'new'
    end
  end
  
  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = "Category deleted"
    redirect_to request.referrer || root_url
  end

  
  private
    
    def category_params
      params.require(:category).permit(:name)
    end
end
