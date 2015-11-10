class PostsController < ApplicationController

  before_action :require_sign_in, except: :show
  before_action :authorize_user, except: [:show, :new, :create]

  def show
    @post = Post.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.new # creates a new instance of Post
    @post = @topic.posts.build(post_params)

    @post.user = current_user # assigns the post that is being created to current_user

    if @post.save
      @post.labels = Label.update_labels(params[:post][:labels])
      flash[:notice] = "Post was saved"
      redirect_to [@topic, @post]
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
    @post.assign_attributes(post_params) # assigns the updated attributes // calls the private method post_params

    if @post.save
      @post.labels = Label.update_labels(params[:post][:labels])
      flash[:notice] = "Post was updated"
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was an error updating the post. Please try again."
      render  :edit
    end
  end
  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" has been deleted"
      redirect_to @post.topic
    else
      flash[:error] = "An error occurred while trying to delete the post. Please try again."
      render :show
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body) #params require that there is a post then it will permit mass assignment of the title & body params
  end

  def authorize_user
    post = Post.find(params[:id])

    unless current_user == post.user || current_user.admin?
      flash[:error] = "You must be an Admin or the Post Author to do that."
      redirect_to [post.topic, post]
    end
  end
end
