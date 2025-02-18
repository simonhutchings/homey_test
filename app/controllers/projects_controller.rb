class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    @project.change_state(params[:project][:new_state]) if params[:project][:new_state].present?

    # TO_DO add in error response if cannot save

    redirect_to @project
  end

  private

  def project_params
    params.require(:project).permit(
      :name,
      :new_state
    )
  end
end
