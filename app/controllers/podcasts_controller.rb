class PodcastsController < ApplicationController
	def index
		@podcasts = Podcast.order ('created_at DESC')
	end

	def show
		@podcast = Podcast.find(params[:id])
	end
end
