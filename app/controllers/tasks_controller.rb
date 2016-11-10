class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = current_user.tasks.build
    @ticks = current_user.ticks.build
    @categories = Category.all.map{ |c| [c.name, c.id] }
    @regularities = Regularity.all.map{ |r| [r.name, r.id] } 
  end

  # GET /tasks/1/edit
  def edit
    @categories = Category.all.map{ |c| [c.name, c.id] }
    @regularities = Regularity.all.map{ |r| [r.name, r.id] } 
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = current_user.tasks.build(task_params)

    @task.category_id = params[:category_id]
    @task.regularity_id = params[:regularity_id]
    # @task.ticks.build(user_id: @user, complete: false) # throws NoMethodError in Tasks#create ... undefined method `map' for nil:NilClass

    if params[:create_and_add]
        respond_to do |format|
          if @task.save
          @task.ticks.create(user_id: current_user.id, complete: false) # doesn't create tick, but shows no error
            format.html { redirect_to new_task_path, notice: 'Task was successfully created.' }
            format.json { render :show, status: :created, location: @task }
          
          # Tick.create(user_id: @user.id, tick_id: @tick.id, complete: false) #error: undefined method `id' for nil:NilClass
          else
            format.html { render :new }
            format.json { render json: @task.errors, status: :unprocessable_entity }
          end
        end
    else
        respond_to do |format|
          if @task.save
          @task.ticks.create(user_id: current_user.id, complete: false) # doesn't create tick, but shows no error
            format.html { redirect_to tasks_path, notice: 'Task was successfully created.' }
            format.json { render :show, status: :created, location: @task }
          
          # Tick.create(user_id: @user.id, tick_id: @tick.id, complete: false) #error: undefined method `id' for nil:NilClass
          else
            format.html { render :new }
            format.json { render json: @task.errors, status: :unprocessable_entity }
          end
        end

    end


  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @task.regularity_id = params[:regularity_id]
    
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_path, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :description, :category_id, :regularity_id, :opening)
    end
end
