class CreateNouns < ActiveRecord::Migration
  def change
    create_table :nouns do |t|
      t.string :word
      t.text :meaning
      t.string :image_url

      t.timestamps null: false
    end
  end
end
