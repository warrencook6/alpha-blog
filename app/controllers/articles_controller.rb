class ArticlesController < ApplicationController

  #Gets all of the articles
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
  end

  #edit Article
  def edit
    @article = Article.find(params[:id])
  end

  #update article
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = "Your article has been updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  #Creates the article
  def create
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:success] = "Your article has been created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  #Reads us the article per id
  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:danger] = 'Article has been deleted!'
    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end

end
