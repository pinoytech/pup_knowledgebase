class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :answer
      t.integer :collection_id

      t.timestamps
    end
  end
end
