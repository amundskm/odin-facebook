class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.belongs_to :commentable, polymorphic: true
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :comments, [:commentable_id, :commentable_type]
  end
end
