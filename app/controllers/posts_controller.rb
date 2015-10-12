class PostsController < ApplicationController
  def index
    @posts = Post.all
    # => Assignment 34 Attempt // Not really sure how to pull this off
    @posts.each do |post| 
      if post.id % 5 == 0 # Divides the post_id by 5 and if it returns 0 as the remainder
        post.title = "SPAM" # then replaces the post title with spam
      end
    end
  end

  def show
  end

  def new
  end

  def edit
  end
end
