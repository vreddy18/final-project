class AttractionsController < ApplicationController
	def index
		if params[:tag]
    		@attractions = Attraction.tagged_with(params[:tag])
    	elsif params[:q]
    		query = params[:q]
    		@search = Attraction.search do 
    			keywords query
    		end
    		@attractions = @search.results
		else
			@attractions = Attraction.all
		end
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
	
	def favorite
		type = params[:type]
		@attraction = Attraction.find(params[:id])
		if type == "add"
			current_user.attractions << @attraction
			redirect_to :back, notice: "You have added #{@attraction.title} to your trip"
		elsif type == "remove"
			current_user.attractions.delete(@attraction)
			redirect_to :back, notice: "You have removed #{@attraction.title} from your trip"
		else 
			redirect_to :back, notice: 'Nothing happened.'
		end
	end

	def destroy
		@attraction = Attraction.find(params[:id])
		@attraction.destroy
		redirect_to attractions_path(@attraction)
	end


	private
	def attraction_params
		params.require(:attraction).permit(:title, :content, :price, :tagline, :tag_list, :address, :link, :avatar, :latitude, :longitude)
	end
end