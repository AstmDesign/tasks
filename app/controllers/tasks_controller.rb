class TasksController < ApplicationController
  load_and_authorize_resource

  # GET /tasks for current user
  def index
    @tasks = current_user.tasks
  end

  # GET /tasks/1
  def show; end

  # GET /tasks/new
  def new
    @task = Task.new
    @projects = Project.all
  end

  # GET /tasks/1/edit
  def edit
    @projects = Project.all
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private

  # Only allow a trusted parameter "white list" through.
  def task_params
    params.require(:task).permit(:title, :details, :priority, :status, :deadline, :project_id).merge(user: current_user)
  end
end
