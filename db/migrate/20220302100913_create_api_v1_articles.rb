class CreateApiV1Articles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.date :release_date

      t.timestamps
    end
  end
end
