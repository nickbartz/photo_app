class RenameTable < ActiveRecord::Migration
    def self.up
        rename_table :sessions_photos, :photos_sessions
    end 
    def self.down
        rename_table :photos_sessions, :sessions_photos
    end
 end