# frozen_string_literal: true

class CreatePasswords < ActiveRecord::Migration[7.0]
  def change
    create_table :passwords do |t|
      t.string :url
      t.string :username
      t.string :password
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
