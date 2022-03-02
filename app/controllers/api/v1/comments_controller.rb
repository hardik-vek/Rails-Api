class Api::V1::CommentsController < ApplicationController
  before_action :find_comment, only: [:show, :update, :destroy]

  def index
    @api_v1_comments = Api::V1::Comment.all
    render json: @api_v1_comments
  end

  def show
    render json: @api_v1_comment
  end

  def create
    @api_v1_comment = Api::V1::Comment.new(comment_params)
    if @api_v1_comment.save!
      render json: @api_v1_comment, status: :created
    else
      render json: @api_v1_comment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @api_v1_comment.update(comment_params)
      render json: @api_v1_comment
    else
      render json: @api_v1_comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @api_v1_comment.destroy
  end

  private

  def find_comment
    @api_v1_comment = Api::V1::Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment_name, :date_of_comment, :api_v1_article_id)
  end
end
