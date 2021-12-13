class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :commentable, polymorphic: true
      t.text :content
      t.string :restricted_at
      t.string :approved_at

      t.timestamps
    end
  end
end
