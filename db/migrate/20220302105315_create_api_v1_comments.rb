class CreateApiV1Comments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :comment_name
      t.date :date_of_comment

      t.timestamps
    end
  end
end
