class ArticlesController < ApplicationController
	  def index
    @articles = Article.all
    render json: @articles
  end
 
  def show
    # debugger
    @article = Article.find(params[:id])
    render json: @article
  end
 
  def new
    @article = Article.new
  end
 
  def edit
    @article = Article.find(params[:id])
  end
 
  def create
   # debugger
    @article = Article.new(article_params)
      if @article.save
        render json: @article, status: :created, location: @article
      else
        render json: @article.errors, status: :unprocessable_entity
    end
  end

 
  def update
    @article = Article.find(params[:id])
 
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
 
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
 
    redirect_to articles_path
  end
 
  private
    def article_params
      params.permit(:title, :text)
    end
end
