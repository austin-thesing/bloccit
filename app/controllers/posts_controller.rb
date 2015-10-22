class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new # creates a new instance of Post
    @post.title = params[:post][:title] # what are the params and why are we using them
    @post.body = params[:post][:body]

    if @post.save
      flash[:notice] = "Post was saved"
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new # does this just render a new form?
    end
  end

  def edit # are controller actions or crud actions new/edit literally just to find or create a post so that we can then use it in another action that effects the database?
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]

    if @post.save
      flash[:notice] = "Post was updated"
      redirect_to @post
    else
      flash[:error] = "There was an error updating the post. Please try again."
      render  :edit
    end
  end
  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" has been deleted"
    else
      flash[:error] = "An error occurred while trying to delete the post. Please try again."
      render :show
    end
  end
end
