class PodcastsController < ApplicationController
	before_action :find_podcast, only: [:show]
	before_action :find_episodes, only: [:show, :dashboard]
	def index
		@podcasts = Podcast.order ('created_at DESC')
	end

	def show	
		@episodes = Episode.where(podcast_id: @podcast).order('created_at DESC')
	end

	def dashboard
		@podcast = current_podcast
		@episodes = Episode.where(podcast_id: @podcast).order('created_at DESC')
	end

	private

	def find_episodes
		@episodes = Episode.where(podcast_id: @podcast).order('created_at DESC')
	end

	def find_podcast
		@podcast = Podcast.find(params[:id])
	end
end
