class SubtasksController < ApplicationController

	respond_to :html, :xml, :js

	#! This allows for the creation of new subtasks. 
	def create
		@user = User.find(params[:user_id])
		@task = Task.find(params[:task_id])
		@subtask = @task.subtasks.new(params[:subtask])
		if @subtask.save
			flash.keep[:notice] = "Subtask added!" #! This does not work for some reason

			redirect_to user_task_url(@user, @task)
		else
			flash.keep[:error] = "Could not add subtask." #! This does not work for some reason
			redirect_to user_task_url(@user, @task)
		end
	end

end
