class TicketsController < ApplicationController
  before_action :set_project
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def new
    @ticket = @project.tickets.build
  end

  def create
    @ticket = @project.tickets.build(ticket_params)
    @ticket.author = current_user
    if @ticket.save
      flash[:notice] = "Ticket has been created."
      redirect_to [@project, @ticket]
    else
      flash[:alert] = "Ticket has not been created."
      render "new"
    end
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      flash[:notice] = "Project has been updated."
      redirect_to [@project, @ticket]
    else
      flash[:alert] = "Project has not been updated."
      render "edit"
    end
  end

  def destroy
    @ticket.destroy
    flash[:notice] = "Project has been destroyed."
    redirect_to @project
  end

  private
    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_ticket
      @ticket = @project.tickets.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:title, :description)
    end
end
