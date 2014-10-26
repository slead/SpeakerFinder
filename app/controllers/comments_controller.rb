class CommentsController < ApplicationController
    def create
      @speaker = Speaker.find(params[:speaker_id])
      @comment = @speaker.comments.create(comment_params)
      @comment.user_id = current_user.id
      @comment.save
      redirect_to speaker_path(@speaker)
      
    end
    
    def destroy
      @speaker = Speaker.find(params[:speaker_id])
      @comment = @speaker.comments.find(params[:id])
      @comment.destroy
      redirect_to speaker_path(@speaker)
    
    end
    
    private
      def comment_params
        params.require(:comment).permit(current_user.id, :body)
      end    
  
  
end
