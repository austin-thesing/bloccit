class SponsoredPostsController < ApplicationController
  def show
    @sponsored_post = SponsoredPost.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @sponsored_post = SponsoredPost.new
  end

  def create
    @sponsored_post = SponsoredPost.new # creates a new instance of SponsoredPost
    @sponsored_post.title = params[:sponsored_post][:title] # what are the params and why are we using them
    @sponsored_post.body = params[:sponsored_post][:body]
    @sponsored_post.price = params[:sponsored_post][:price]
    @topic = Topic.find(params[:topic_id])

    @sponsored_post.topic = @topic

    if @sponsored_post.save
      flash[:notice] = "SponsoredPost was saved"
      redirect_to [@topic, @sponsored_post]
    else
      flash[:error] = "There was an error saving the sponsored_post. Please try again."
      render :new # keeps your values and renders the form with them including any validation errors 
    end
  end

  def edit # are controller actions or crud actions new/edit literally just to find or create a sponsored_sponsored_post so that we can then use it in another action that effects the database?
    @sponsored_post = SponsoredPost.find(params[:id])
  end

  def update
    @sponsored_post = SponsoredPost.find(params[:id])
    @sponsored_post.title = params[:sponsored_post][:title]
    @sponsored_post.body = params[:sponsored_post][:body]
    @sponsored_post.price = params[:sponsored_post][:price]

    if @sponsored_post.save
      flash[:notice] = "SponsoredPost was updated"
      redirect_to [@sponsored_post.topic, @sponsored_post]
    else
      flash[:error] = "There was an error updating the sponsored_post. Please try again."
      render  :edit
    end
  end
  def destroy
    @sponsored_post = SponsoredPost.find(params[:id])

    if @sponsored_post.destroy
      flash[:notice] = "\"#{@sponsored_post.title}\" has been deleted"
      redirect_to @sponsored_post.topic
    else
      flash[:error] = "An error occurred while trying to delete the sponsored_post. Please try again."
      render :show
    end
  end
end
