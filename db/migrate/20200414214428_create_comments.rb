class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :author
      t.string :content
      t.references :opportunity, foreign_key: true

      t.timestamps
    end
  end
end
