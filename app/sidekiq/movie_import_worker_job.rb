# frozen_string_literal: true

class MovieImportWorkerJob
  include Sidekiq::Worker

  def perform(params)
    data = JSON.parse(params).map(&:with_indifferent_access)
    
    ActiveRecord::Base.transaction do
      data.each do |movie_data|
        # Prepare attributes
        movie_data[:filming_location] = { city: movie_data[:filming_location], country: movie_data[:country] }
        movie_data.delete(:country)
        store_actor_name = movie_data.delete(:actor)
        movie_title = movie_data[:title]

        # Find or create movie
        movie = Movie.find_or_create_by(title: movie_title) do |new_movie|
          new_movie.attributes = movie_data
        end

        # Attach actor to the movie
        movie.attach_actor(store_actor_name)
      end
    rescue StandardError => e
      # Handle any errors gracefully
      Rails.logger.error "Error in MovieImportWorkerJob: #{e.message}"
      raise ActiveRecord::Rollback
    end
  end
end
