class Admin::ProjectsController < Admin::ApplicationController
	def new
		@project = Project.new 
	end

	def create
	  @project = Project.new(project_params)

	  if @project.save
	    flash[:hola] = "Project has been created."
	    redirect_to @project
	  else
	    flash[:alert] = "Project has not been created."
    	render "new"
	  end 
	end

	def destroy
	  @project = Project.find(params[:id])
	  @project.destroy
	  flash[:notice] = "Project has been destroyed."
	  redirect_to @project
	end

	private
	  	def project_params
	   	  params.require(:project).permit(:name, :description)
	    end
end
