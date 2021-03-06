class CommentsController < ApplicationController
    before_filter :load_article
    
    def create
        @comment = @article.comments.new(params[:comment])
        @comment.user =  logged_in? ? current_user : User.find_by_email("anonymous@internet.org")
        if @comment.save
            redirect_to @article, :notice => 'Thanks for your comment'
        else
            redirect_to @article, :alert => 'Unable to add comment'
        end
    end
    
    def destroy
        @article = current_user.articles.find(params[:article_id])
        @comment = @article.comments.find(params[:comment])
        @comment.destroy
        redirect_to @article, :notice => 'Comment deleted'
    end
    
    private
        def load_article
            @article = Article.find(params[:article_id])
        end
end
