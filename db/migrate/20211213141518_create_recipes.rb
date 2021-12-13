class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :content
      t.string :state
      t.datetime :published_at

      t.timestamps
    end
    add_index :recipes, :published_at
  end
end
