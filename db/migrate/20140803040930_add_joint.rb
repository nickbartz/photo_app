class AddJoint < ActiveRecord::Migration
  def change
  	create_table :questions do |t|
  		t.belongs_to :session
  		t.belongs_to :photo
  		t.timestamps
  	end 
  end
end
