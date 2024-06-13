# frozen_string_literal: true

# == Schema Information
#
# Table name: movies
#
#  id               :bigint           not null, primary key
#  description      :text
#  director         :string
#  filming_location :json
#  title            :string
#  year             :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_movies_on_title  (title) UNIQUE
#
class Movie < ApplicationRecord
  has_many :cast_members
  has_many :actors, through: :cast_members
  has_many :reviews
  validates :title, presence: true, uniqueness: true
  validates :year, numericality: { only_integer: true }

  def attach_actor(store_actor_name)
    # Find or create the actor and associate them with the movie
    actor = Actor.find_or_create_by(name: store_actor_name)
    CastMember.create(movie: self, actor: actor) if actors.where(name: store_actor_name).count.zero?
  end

  scope :sorted_by_average_stars, lambda {
    select('movies.*, COALESCE(SUM(reviews.stars), 0) AS average_stars')
      .joins('LEFT JOIN reviews ON movies.id = reviews.movie_id')
      .group('movies.id')
      .order('average_stars DESC')
  }
end
