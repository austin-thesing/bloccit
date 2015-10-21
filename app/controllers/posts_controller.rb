class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @posts = Post.find(params[:id])
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

  def edit
  end
end
