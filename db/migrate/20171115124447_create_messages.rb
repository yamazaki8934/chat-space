class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer       :user_id, foreign_key: true
      t.integer       :group_id, foreign_key: true
      t.text          :body
      t.string        :image
      t.timestamps
    end
  end
end
