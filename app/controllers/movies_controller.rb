# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    @movies = Movie.includes(:reviews).sorted_by_average_stars.all
  end
end
