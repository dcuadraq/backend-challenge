class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :name
      t.string :url
      t.string :short_url
      t.text :topics

      t.timestamps
    end
  end
end
