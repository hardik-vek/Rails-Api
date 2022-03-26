class AddApiV1ArticleRefToApiV1Comment < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :article, null: false, foreign_key: true
  end
end
