class CreateIdeas < ActiveRecord::Migration[5.0]
  def change
    create_table :ideas do |t|

    	t.text :question
    	t.text :answer

      t.timestamps
    end
  end
end
