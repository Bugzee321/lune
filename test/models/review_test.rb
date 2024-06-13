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
require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
