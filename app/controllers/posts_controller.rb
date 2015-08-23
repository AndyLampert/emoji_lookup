class PostsController < ApplicationController
  before_action :set_post_and_comments, only: [:show, :edit, :update, :destroy]
  # this makes sure a you are a logged in user on pages except...
  before_action :authenticate_user!, :except => [:index, :show]
  # You have to be authorized to...
  before_action :authorized_user, only: [:edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    @comments = Comment.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def add_comment
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comment.body = 'hi hi test'
  end

  # GET /posts/new
  def new
    @post = current_user.posts.build
  end

  # GET /posts/1/edit
  def edit
    #  show your posts
    @posts = Post.where(user_id: current_user.id)
  end

  # POST /posts
  # POST /posts.json
  def create
    # ?? @post = current_user.posts.build(params[:post])
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post_and_comments
    @post = Post.find(params[:id]) if params[:id]
    @comments = @post.comments
    @user = @post.user
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:entry)
  end

  def authorized_user
    @post = current_user.posts.find(params[:id])
  end

end
