class CreateSessions < ActiveRecord::Migration
  def change
    change_table :sessions do |t|
      t.string :session_name
      t.timestamps
    end 

    create_table :sessions_photos, id: false do |t|
    	t.belongs_to :session
    	t.belongs_to :photo
    end
  end
end

