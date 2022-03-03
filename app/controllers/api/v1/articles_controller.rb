class Api::V1::ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :update, :destroy]

  def index
    @articles = Article.all
    render json: @articles
  end

  def show
    render json: @article
  end

  def create
    @article = Article.new(article_params)
    if @article.save!
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
  end

  def search
    @article = Article.find_by(title: params[:title])
    if @article
      @articles = Article.where("title=?", @article.title)
      render json: @articles
    else
      render json: { message: "Article not exist" }
    end
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :release_date)
  end
end
