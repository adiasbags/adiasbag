class HomePagesController < ApplicationController
	def index
    if logged_in? 
      @idea_items = Idea.all      
     end
  end

  def about
  end
end
