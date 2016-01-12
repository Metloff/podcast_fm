class PodcastsController < ApplicationController
	before_action :find_podcast, only: [:show, :dashboard]
	before_action :find_episodes, only: [:show, :dashboard]
	def index
		@podcasts = Podcast.order ('created_at DESC')
	end

	def show
		
		@episodes = Episode.where(podcast_id: @podcast).order('created_at DESC')
	end

	def dashboard
	end

	private

	def find_episodes
		@episodes = Episode.where(podcast_id: @podcast).order('created_at DESC')
	end

	def find_podcast
		if params[:id].nil?
			@podcast = current_podcast
		else
			@podcast = Podcast.find(params[:id])
		end
	end
end
