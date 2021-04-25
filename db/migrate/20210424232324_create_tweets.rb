class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.text :text
      t.string :username
      t.integer :user_id

      t.timestamps
      #created_at
      #updated_at
    end
  end
end
