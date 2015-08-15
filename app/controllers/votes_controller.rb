# class VotesController < CommentsController
#   def vote_up
#     @comment = Comment.find(params[:id])
#     @vote_count = Vote.create(user_id: current_user, comment_id: @comment.id) unless @comment.vote_count
#   end
# end
