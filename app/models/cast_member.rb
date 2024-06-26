# frozen_string_literal: true

# == Schema Information
#
# Table name: cast_members
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  actor_id   :integer          not null
#  movie_id   :integer          not null
#
# Indexes
#
#  index_cast_members_on_actor_id  (actor_id)
#  index_cast_members_on_movie_id  (movie_id)
#
# Foreign Keys
#
#  fk_rails_...  (actor_id => actors.id)
#  fk_rails_...  (movie_id => movies.id)
#
class CastMember < ApplicationRecord
  belongs_to :movie
  belongs_to :actor
end
