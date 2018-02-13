class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.text :tweet, null: false
      t.string :image, default: ""
      t.string :video, default: ""
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
