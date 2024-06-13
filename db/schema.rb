# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 20_240_307_164_654) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'citext'
  enable_extension 'plpgsql'

  create_table 'actors', force: :cascade do |t|
    t.citext 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_actors_on_name', unique: true
  end

  create_table 'cast_members', force: :cascade do |t|
    t.integer 'movie_id', null: false
    t.integer 'actor_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['actor_id'], name: 'index_cast_members_on_actor_id'
    t.index ['movie_id'], name: 'index_cast_members_on_movie_id'
  end

  create_table 'movies', force: :cascade do |t|
    t.string 'title'
    t.text 'description'
    t.integer 'year'
    t.string 'director'
    t.json 'filming_location'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['title'], name: 'index_movies_on_title', unique: true
  end

  create_table 'reviews', force: :cascade do |t|
    t.integer 'movie_id'
    t.string 'user'
    t.integer 'stars'
    t.text 'review'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'cast_members', 'actors'
  add_foreign_key 'cast_members', 'movies'
end
