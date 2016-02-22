class AddeMailAndProfileImageColumnToUser < ActiveRecord::Migration
  def change
  	add_column :users, :email, :string
  	add_column :users, :profileurl, :string
  end
end
