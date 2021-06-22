class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.float :score, null: false, default: 0.0

      t.timestamps
    end
  end
end
