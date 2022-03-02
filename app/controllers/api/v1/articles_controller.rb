class Api::V1::ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :update, :destroy]

  def index
    @api_v1_articles = Api::V1::Article.all
    render json: @api_v1_articles
  end

  def show
    render json: @api_v1_article
  end

  def create
    @api_v1_article = Api::V1::Article.new(article_params)
    if @api_v1_article.save!
      render json: @api_v1_article, status: :created
    else
      render json: @api_v1_article.errors, status: :unprocessable_entity
    end
  end

  def update
    if @api_v1_article.update(article_params)
      render json: @api_v1_article
    else
      render json: @api_v1_article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @api_v1_article.destroy
  end

  private

  def find_article
    @api_v1_article = Api::V1::Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :release_date)
  end
end
