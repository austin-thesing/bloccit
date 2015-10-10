class PostsController < ApplicationController
  def index
    @posts = Post.all
    # => Assignment 34 Attempt // Not really sure how to pull this off
    index = 0
    @posts.each_with_index do |title,index|
      index += 5
      @posts.title = "SPAM" # => best guess but this would replace every title correct?
    end
  end

  def show
  end

  def new
  end

  def edit
  end
end
