# frozen_string_literal: true

class ActorsController < ApplicationController
  def search
    @query = params[:query]
    @actors = Actor.where('name LIKE ?', "%#{@query}%")
  end
end
