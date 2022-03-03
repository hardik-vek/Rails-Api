class Api::V1::CommentsController < ApplicationController
  before_action :find_comment, only: [:show, :update, :destroy]

  def index
    @comments = Comment.all
    render json: @comments
  end

  def show
    render json: @comment
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save!
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
  end

  def search
    @comment = Comment.find_by(comment_name: params[:comment_name])
    if @comment
      @comments = Comment.where("comment_name=?", @comment.comment_name)
      render json: @comments
    else
      render json: { message: "Comment not exist" }
    end
  end


  private

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment_name, :date_of_comment, :article_id)
  end
end
