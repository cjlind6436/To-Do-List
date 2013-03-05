class TasksController < ApplicationController

	respond_to :html, :xmp, :js

	# Allows for  a new task linked to the User ID.
	def new
		@user = User.find(params[:user_id])
		@task = @user.tasks.new

	end

	# Allows for a new task to actually be created. It is linked to the User ID.
	def create
		@user = User.find(params[:user_id])
		@task = @user.tasks.new(params[:task])
		if @task.save
			flash.keep[:notice] = "Task added!" #! This doesn't work for some reason
			redirect_to user_url(@user)
		else
			flash.keep[:error] = "Could not add task." #! This doesn't work for some reason
			redirect_to user_url(@user)
		end
	end

	# Allows subtasks to be shown. Each subtask belongs to a task, which belongs to a user.
	def show
		@user = User.find(params[:user_id])
		@task = Task.find(params[:id])
		@subtask = @task.subtasks.new
	end

	# Allows tasks to be edited.
	def edit
		@user = User.find(params[:user_id])
		@task = Task.find(params[:id])
	end

	# Allows edited tasks to be updated on the tasks page.
	def update
		@user = User.find(params[:user_id])
		@task = Task.find(params[:id])
		if @task.update_attributes(params[:task])
			flash[:notice] = "Task successfully udated!" #! This doesn't work for some reason
			redirect_to user_url(@user)
		else
			flash[:notice] = "Task could not update." #! This doesn't work for some reason
			redirect_to edit_user_task_url(@task)
		end
	end

	# Allows tasks to be destroyed.
	# AS OF THIS RELEASE: Implementing this method and using it will permanently prevent the User with ID matching the Task ID you removed from accessing their tasks (i.e. destroying the task with ID 3 with make it so User with ID 3 cannot access their account).
	def destroy
		@user = User.find(params[:user_id])
		@task = Task.find(params[:id])
		if @task.destroy
			flash[:notice] = "Task deleted!" #! This doesn't work for some reason
			redirect_to user_url(@user)
		else
			flash[:notice] = "Task could not be deleted." #! This doesn't work for some reason
			redirect_to user_url(@user)
		end
	end

end
