class DropJoint < ActiveRecord::Migration
  def change
  	drop_table :photos_sessions
  end 
end
