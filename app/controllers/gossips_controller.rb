class GossipsController < ApplicationController
#On trouvera sur cette page les differentes définitions qui sont utilisé par le controlleur
	def index
		@gossip = Gossip.all
	end

	def new
  		@gossip = Gossip.new
	end
 
	def create
  		@gossip = Gossip.new(gossip_params)
  		@gossip.save
    		redirect_to @gossip
	end

	def edit
  		@gossip = Gossip.find(params[:id])
	end
 
	def update
  		@gossip = Gossip.find(params[:id])
  		if @gossip.update(gossip_params)
    		redirect_to @gossip
		end
	end

	def show
		@gossip = Gossip.find(params[:id])
	end

	def destroy
		@gossip = Gossip.find(params[:id])
		if @gossip.destroy
		redirect_to @gossip
		end
	end

#partie privée qui ne sera pas affiché
	private

	def gossip_params
		params.require(:gossip).permit(:anonymous_author, :content)
	end

end

