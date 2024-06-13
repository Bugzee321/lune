# frozen_string_literal: true

class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.integer :year
      t.string :director
      t.json :filming_location

      t.timestamps
    end
  end
end
