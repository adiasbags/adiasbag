class IdeasController < ApplicationController
	before_action :admin_user, only: [:new, :create, :destroy]
  before_action :logged_in_user, only: [:index, :show]

  def index
    @ideas = Idea.paginate(page: params[:page])
  end
  
  def show
    @idea = Idea.find(params[:id]) 
  end
  
  def new
    @idea     = Idea.new
    @all_categories = Category.all
  end
  
  def create
  	@idea = Idea.new(idea_params)

    if @idea.save
      flash[:success] = "idea created!"
      redirect_to ideas_path
    else
      @feed_items = []
      render 'new'
    end
  end
  
  def destroy
    Idea.find(params[:id]).destroy
    flash[:success] = "Idea deleted"
    redirect_to request.referrer || root_url
  end
  
  private
    
    def idea_params
      params.require(:idea).permit(:question, :answer)
    end
end
