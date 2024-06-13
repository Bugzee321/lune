# frozen_string_literal: true

# == Schema Information
#
# Table name: actors
#
#  id         :bigint           not null, primary key
#  name       :citext
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_actors_on_name  (name) UNIQUE
#
class Actor < ApplicationRecord
  has_many :cast_members
  has_many :movies, through: :cast_members

  validates :name, presence: true, uniqueness: true
end
