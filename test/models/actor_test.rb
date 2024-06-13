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
require 'test_helper'

class ActorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
