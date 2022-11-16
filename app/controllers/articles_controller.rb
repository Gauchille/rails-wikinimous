class ArticlesController < ApplicationController
  before_action :find_id, only: %i[edit update destroy]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
  end

  def edit
    # @Article = Article.find(params[:id])
  end

  def update
    # @Article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(params[:id])
  end

  def destroy
    # @Article = Article.find(params[:id])
    @Article.destroy
    redirect_to Articles_path, status: :see_other
  end

  private

  def find_id
    @article = Article.find(params[:id])
  end

  def Article_params
    params.require(:article).permit(:title, :content)
  end
end
