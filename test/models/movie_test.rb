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
require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
