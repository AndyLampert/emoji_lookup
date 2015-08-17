class CommentsController < ApplicationController
  include EmojiHelper

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
    params[:content] = emojify(params[:content])
    resource.update_attributes(params)
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

  # post.votes.where(user... type: "DownVote"),first
  def vote_comment_up
    @comment = Comment.find(params[:id])

    if @comment.votes.where(:user_id => current_user.id).blank?
      @comment.votes.where(:user_id => current_user.id, :type => 'UpVote').first_or_create
      redirect_to @comment.post, notice: 'Thanks for voting!'
    elsif @comment.votes.where(:user_id => current_user.id, :type => 'DownVote')
      @comment.votes.where(:user_id => current_user.id, :type => 'DownVote').delete_all
      @comment.votes.where(:user_id => current_user.id, :type => 'UpVote').first_or_create
      redirect_to @comment.post, notice: 'Thanks for voting!'
    else
      redirect_to @comment.post, notice: 'You\'ve already voted!'
    end
  end

  def vote_comment_down
    @comment = Comment.find(params[:id])

    if @comment.votes.where(:user_id => current_user.id).blank?
       @comment.votes.where(:user_id => current_user.id, :type => 'DownVote').first_or_create
      redirect_to @comment.post, notice: 'Thanks for voting!'
    elsif @comment.votes.where(:user_id => current_user.id, :type => 'UpVote')
      @comment.votes.where(:user_id => current_user.id, :type => 'UpVote').delete_all
      @comment.votes.where(:user_id => current_user.id, :type => 'DownVote').first_or_create
      redirect_to @comment.post, notice: 'Thanks for voting!'
    else
      redirect_to @comment.post, notice: 'You\'ve already voted!'
    end
  end

  # @comments = Comments.find(:all)
  # @comments.sort! {|a, b|
  #   rel = a.rating_score <=> b.rating_score
  #   # if "rating_scores" are equivalent, only then consider "ratings"
  #   rel == 0 ? a.ratings <=> b.ratings : rel
  # }

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
