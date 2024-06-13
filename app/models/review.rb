# frozen_string_literal: true

# == Schema Information
#
# Table name: reviews
#
#  id         :bigint           not null, primary key
#  review     :text
#  stars      :integer
#  user       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  movie_id   :integer
#
class Review < ApplicationRecord
  belongs_to :movie

  validates :movie_id, :user, :stars, :review, presence: true
  validates :stars, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
