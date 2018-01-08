class ArticlesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @articles = Article.all
    respond_to do |format|
      format.json {render json: {status: 'Success', message: 'Articles', data: @articles}, status: :ok}
      format.html 
    end
  end 
  def show
    @article = Article.find(params[:id])
    respond_to do |format|
      format.json {render json: {status: 'SUCCESS', message: 'Selected article', data: @article}, status: :ok}
      format.html 
    end
  end
  def new
    @article = Article.new
  end 
  def edit
    @article = Article.find(params[:id])
  end
  def create
    @article = Article.new(article_params)
    if @article.save
      respond_to do |format|
        format.html {redirect_to @article}
        format.json {render json: {status: 'Success', message: 'Article created', data: @article}, status: :ok}
      end
    else
      respond_to do |format|
        format.html {render 'new'}
        format.json {render json: {status: 'Error', message: 'Error in article creation', data: @article.errors}, status: :unprocessable_entity}
      end
    end
  end 
  def update
    @article = Article.find(params[:id]) 
    if @article.update(article_params)
      respond_to do |format|
        format.html {redirect_to @article}
        format.json {render json: {status: 'SUCCESS', message: 'Updated article', data: @article}, status: :ok}
      end      
    else
      respond_to do |format|
        format.html {render 'edit'}
        format.json {render json: {status: 'Error', message: 'Error in article', data: @article.errors}, status: :unprocessable_entity}
      end
    end
  end
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    respond_to do |format|
      format.json {render json: {status: 'SUCCESS', message: 'Destroyed article', data: @article}, status: :ok}
      format.html {redirect_to articles_path}
    end    
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
