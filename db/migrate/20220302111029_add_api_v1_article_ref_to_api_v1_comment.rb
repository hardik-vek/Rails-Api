class AddApiV1ArticleRefToApiV1Comment < ActiveRecord::Migration[7.0]
  def change
    add_reference :api_v1_comments, :api_v1_article, null: false, foreign_key: true
  end
end
