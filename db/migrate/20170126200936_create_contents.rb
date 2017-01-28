class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.references :link, foreign_key: true
      t.string :tag, null: false
      t.text :body

      t.timestamps
    end
  end
end
