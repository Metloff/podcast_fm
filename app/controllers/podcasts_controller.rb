class PodcastsController < ApplicationController
	before_action :find_podcast, only: [:show]

	def index
		@podcasts = Podcast.order('created_at DESC').paginate(page: params[:page], per_page: 12)
	end

	def show	
		@episodes = Episode.where(podcast_id: @podcast).order('created_at DESC').paginate(page: params[:page], per_page: 5)
	end

	def dashboard
		@podcast = current_podcast
		@episodes = Episode.where(podcast_id: @podcast).order('created_at DESC').paginate(page: params[:page], per_page: 5)
	end

	private

	def find_podcast
		@podcast = Podcast.find(params[:id])
	end
end
