class ArticlesController < ApplicationController

  def index
    @articles = Article.all.paginate(page: params[:page], per_page: 10)
  end
  
  def show
    @article = Article.find(params[:id])
    @comments = @article.comments.paginate(page: params[:page], per_page: 3)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    session[:return_to] = request.referer
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status, :user_id)
    end
end
