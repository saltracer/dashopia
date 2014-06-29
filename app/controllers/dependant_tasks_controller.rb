class DependantTasksController < ApplicationController
  before_action :set_dependant_task, only: [:show, :edit, :update, :destroy]

  # GET /dependant_tasks
  # GET /dependant_tasks.json
  def index
    @dependant_tasks = DependantTask.all
  end

  # GET /dependant_tasks/1
  # GET /dependant_tasks/1.json
  def show
  end

  # GET /dependant_tasks/new
  def new
    @dependant_task = DependantTask.new
  end

  # GET /dependant_tasks/1/edit
  def edit
  end

  # POST /dependant_tasks
  # POST /dependant_tasks.json
  def create
    @dependant_task = DependantTask.new(dependant_task_params)

    respond_to do |format|
      if @dependant_task.save
        format.html { redirect_to @dependant_task, notice: 'Dependant task was successfully created.' }
        format.json { render :show, status: :created, location: @dependant_task }
      else
        format.html { render :new }
        format.json { render json: @dependant_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dependant_tasks/1
  # PATCH/PUT /dependant_tasks/1.json
  def update
    respond_to do |format|
      if @dependant_task.update(dependant_task_params)
        format.html { redirect_to @dependant_task, notice: 'Dependant task was successfully updated.' }
        format.json { render :show, status: :ok, location: @dependant_task }
      else
        format.html { render :edit }
        format.json { render json: @dependant_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dependant_tasks/1
  # DELETE /dependant_tasks/1.json
  def destroy
    @dependant_task.destroy
    respond_to do |format|
      format.html { redirect_to dependant_tasks_url, notice: 'Dependant task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dependant_task
      @dependant_task = DependantTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dependant_task_params
      params.require(:dependant_task).permit(:task_id)
    end
end
