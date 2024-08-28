class ArticlesController < ApplicationController
  before_action :set_article, only: [ :show, :edit, :update, :destroy ]
  def show
  end
  def index
    @articles = Article.all
  end
  def edit
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash.notice = "Article was deleted successfully."
    redirect_to action: :index
  end

  def update
    if @article.update(article_params)
      flash.notice = "Article was updated successfully."
      redirect_to @article
    else
      render :edit
    end
  end
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash.notice = "Article created"
      redirect_to @article
    else
      flash.notice = "Something went wrong"
      render :new
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
