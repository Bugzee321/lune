# frozen_string_literal: true

class ChangeActorNameToCitext < ActiveRecord::Migration[7.1]
  def change
    enable_extension 'citext' unless extension_enabled?('citext')
    change_column :actors, :name, :citext
  end
end
