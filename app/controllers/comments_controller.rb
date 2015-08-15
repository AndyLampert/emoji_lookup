class CommentsController < ApplicationController
  before_action :set_comment_post_and_user, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    @vote_count = @comment.vote_count
  end

  # GET /comments/new
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comment.build
    # @post.comments << @comment
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new
    @comment.vote_count = 0
    @comment.post_id = params[:post_id]
    @comment.user_id = current_user.id
    @comment.body = params[:comment]['body']
    @comment.save
    redirect_to post_path(params[:post_id])
    # render json: [params, @comment]
  end

  # def create
  #   @post = Post.find(params[:post_id])
  #   # @comment = this posts' new comment on submit
  #   @comment
  #   if @comment.save
  #
  #     # put this comment into the the post.comments array
  #     #   then go back to this posts' show page
  #   end
  # end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def vote_comment_up
    # @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.votes.create
    redirect_to @comment.post, notice: "oianersioarst"

    # @vote = @comment.votes.create(:user_id => current_user.id, :comment_id => @comment.id)
    # @comment.votes.create(:user_id => current_user.id)
    # redirect_to @comment.post, notice: "thanks for voting!! "
  end

  def vote_comment_down
    @comment.vote_count = @comment.vote_count - 1
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment_post_and_user
      @comment = Comment.find(params[:id])
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:post_id, :body, :user_id)
    end
end
