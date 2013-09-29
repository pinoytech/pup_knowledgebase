class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :question_id
      t.text :body
      t.string :user_id

      t.timestamps
    end
  end
end
