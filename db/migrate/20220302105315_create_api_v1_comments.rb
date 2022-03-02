class CreateApiV1Comments < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_comments do |t|
      t.string :comment_name
      t.date :date_of_comment

      t.timestamps
    end
  end
end
