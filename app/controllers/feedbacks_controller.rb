class FeedbacksController < ApplicationController

	http_basic_authenticate_with name: "dhh", password: "abc", only: :destroy

  def create
    @article = Article.find(params[:comment_id])
    @feedback = @article.comment.feedbacks.create(feedback_params)
    redirect_to comment_path(@article.comment)
  end
 
  def destroy
    @article = Article.find(params[:comment_id])
    @feedback = @aricle.comment.feedbacks.find(params[:id])
    @feedback.destroy
    redirect_to comment_path(@article.comment)
  end
 
  private
    def feedback_params
      params.require(:feedback).permit(:name1, :body)
    end
end
