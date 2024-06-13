# frozen_string_literal: true

require 'test_helper'

class ActorsControllerTest < ActionDispatch::IntegrationTest
  test 'should get search' do
    get actors_search_url
    assert_response :success
  end
end
