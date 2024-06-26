# frozen_string_literal: true

class AddUserReferenceToClients < ActiveRecord::Migration[7.1]
  def change
    add_reference :clients, :user, null: false, foreign_key: true
  end
end
