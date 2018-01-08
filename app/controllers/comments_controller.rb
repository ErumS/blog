class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def show
  end
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    respond_to do |format|
      format.json {render json: {status: 'Success', message: 'Comment', data: @comment}, status: :ok}
      format.html {redirect_to article_path(@article)}
    end  
  end 
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.json {render json: {status: 'SUCCESS', message: 'Destroyed comment', data: @comment}, status: :ok}
      format.html {redirect_to article_path(@article)}
    end
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end