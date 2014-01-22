class AttractionsController < ApplicationController
	def index
		@attractions = Attraction.all
		@q = Attraction.search(params[:q])
  		@attractions = @q.result(distinct: true)
	end

	def load_suggestions
 	 	@suggestions = Attraction.find(:all, conditions: [:title, :tags]) #Select the data you want to load on the typeahead.
  		render json: @suggestions
	end

	def new
		@attraction = Attraction.new
	end

	def create
		@attraction = Attraction.new(attraction_params)
		respond_to do |format|
      		if @attraction.save
        		format.html { redirect_to @attraction, notice: 'Attraction was successfully created.' }
        		format.json { render action: 'show', status: :created, location: @attraction }
     		else
        		format.html { render action: 'new' }
        		format.json { render json: @attraction.errors, status: :unprocessable_entity }
      		end
    	end
 	end

	def show
		@attraction = Attraction.find(params[:id])
	end

	def edit
		@attraction = Attraction.find(params[:id])
	end

	def update
		@attraction = Attraction.find(params[:id])

		@attraction.update_attributes(attraction_params)
		redirect_to @attraction
	end
		

	def destroy
		@attraction = Attraction.find(params[:id])
		@attraction.destroy
		redirect_to attractions_path(@attraction)
	end

	private
	def attraction_params
		params.require(:attraction).permit(:title, :content, :price, :tagline, :tags, :address, :link, :avatar, :latitude, :longitude)
	end
end