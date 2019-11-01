class TasksLabelsController < ApplicationController
  before_action :set_tasks_label, only: [:show, :edit, :update, :destroy]

  # GET /tasks_labels
  # GET /tasks_labels.json
  def index
    @tasks_labels = TasksLabel.all
  end

  # GET /tasks_labels/1
  # GET /tasks_labels/1.json
  def show
  end

  # GET /tasks_labels/new
  def new
    @tasks_label = TasksLabel.new
  end

  # GET /tasks_labels/1/edit
  def edit
  end

  # POST /tasks_labels
  # POST /tasks_labels.json
  def create
    @tasks_label = TasksLabel.new(tasks_label_params)

    respond_to do |format|
      if @tasks_label.save
        format.html { redirect_to @tasks_label, notice: 'Tasks label was successfully created.' }
        format.json { render :show, status: :created, location: @tasks_label }
      else
        format.html { render :new }
        format.json { render json: @tasks_label.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks_labels/1
  # PATCH/PUT /tasks_labels/1.json
  def update
    respond_to do |format|
      if @tasks_label.update(tasks_label_params)
        format.html { redirect_to @tasks_label, notice: 'Tasks label was successfully updated.' }
        format.json { render :show, status: :ok, location: @tasks_label }
      else
        format.html { render :edit }
        format.json { render json: @tasks_label.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks_labels/1
  # DELETE /tasks_labels/1.json
  def destroy
    @tasks_label.destroy
    respond_to do |format|
      format.html { redirect_to tasks_labels_url, notice: 'Tasks label was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tasks_label
      @tasks_label = TasksLabel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tasks_label_params
      params.require(:tasks_label).permit(:task_id, :label_id)
    end
end
