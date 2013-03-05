class UsersController < ApplicationController

	respond_to :html, :xml, :js

	#! This sets user_controller as the index (home page)
	def index
		respond_with(@users = User.all)
	end

	#! This allows for the creation of a new user
	def new
		@user = User.new
	end

	#! This lets the new user actually be created
	def create
		@user = User.new(params[:user])
		if @user.save
			flash.keep[:notice] = "Welcome!" #! This doesn't work for some reason
			respond_with(@user, :location => user_url(@user))
		else
			flash.keep[:error] = "Could not add user" #! This doesn't work for some reason
			redirect_to new_user_url
		end
	end

	#! Allows the page to show the user and task. This is very possibly incorrect.
	#! Problems with Task ID are probably from calling id twice. I don't know how to fix this.
	#! Just changing the name of one of the ids causes a missing ID error.
	def show
		@user = User.find(params[:id])
		@task = @user.tasks.new
		@task = Task.find(params[:id])
	end

end
