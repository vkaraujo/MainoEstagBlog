module Users
    class CommentsController < UsersController
        skip_before_action :authenticate_user!
        
        def create
            @post = Post.find(params[:post_id])
            @comment = current_or_guest_user.comments.new(comment_params)
            @comment.post = @post

            if !@comment.save
                flash[:notice] = @comment.errors.full_messages.to_sentence
            end
            redirect_to blog_post_path(params[:post_id])
            
        end

        

        private
       
        def comment_params
            params.require(:comment).permit(:content, :parent_id)
        end
        
    end
end
