class PostsController < ApplicationController
	before_action :set_posts, only: [:show, :edit, :update, :destroy]
    # main index of the posts 
	def index 
	  @post = Post.all 
	end 
    # new action for the post 
	def new 
	  @post = Post.new
	end 
    # create action a new post is created here 
	def create 
	  @post = Post.new(post_params)
	  @post.user_id = current_user.id
	  
	  if @post.save
	  redirect_to @post, notice: "your post was created" 
	  else 
	  	render :new 
	  end 
	end 
    # edit action 
	def edit
	end 
    # update action  
	def update 
      if @post.update(post_params)	
      redirect_to @post, notice: "Your post was just changed"
      else 
      render :edit 
      end	
	end 
    # show action 
	def show  	
	end 
	# destroy action 
	def destroy 
	  @post.delete
	  redirect_to posts_path, notice: "Your post was deleted"
	end 

	private

	def post_params 
	  params.require(:post).permit(:date, :rationale)	
	end 

	def set_posts 
	  @post = Post.find(params[:id])	
	end 
end
