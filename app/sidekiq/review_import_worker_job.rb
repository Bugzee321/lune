# frozen_string_literal: true

class ReviewImportWorkerJob
  include Sidekiq::Worker

  def perform(reviews)
    data = JSON.parse(reviews).map(&:with_indifferent_access)

    data.each do |review|
      movie = Movie.find_by(title: review[:movie])
      if movie.present?
        review.delete(:movie)
        movie.reviews.create(review)
      end
    end
  end
end
