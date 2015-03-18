class CommentsController < ApplicationController
	def create  #each request for a comment needs to keep track of of the artile to which it's attached 
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(comment_params) #creates and saves the comment
		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)	
	end

	private
	def comment_params
			params.require(:comment).permit(:commenter, :body)
	end
end
