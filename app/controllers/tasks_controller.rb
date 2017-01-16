class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    if current_user.subscribed != true 
      redirect_to new_subscriber_path
    end
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

    if params[:create_and_add]
        respond_to do |format|
          if @task.save!
              
              if @last_task.starting == true  
                @task.ticks.create(user: current_user, 
                                    complete: false, 
                                    # staff_id: 1, 
                                    stage: "starting", 
                                    date: Time.current, 
                                    regularity_id: @task.regularity_id,
                                    edited: 0) # 'staff_id: 1' is a hack — must fix
              end 

              if @last_task.midday == true 
                @task.ticks.create(user: current_user, 
                                    complete: false, 
                                    # staff_id: 1, 
                                    stage: "middle", 
                                    date: Time.current, 
                                    regularity_id: @task.regularity_id,
                                    edited: 0) # 'staff_id: 1' is a hack — must fix
              end

              if @last_task.ending == true 
                @task.ticks.create(user: current_user, 
                                    complete: false, 
                                    # staff_id: 1, 
                                    stage: "ending", 
                                    date: Time.current, 
                                    regularity_id: @task.regularity_id,
                                    edited: 0) # 'staff_id: 1' is a hack — must fix
              end

            format.html { redirect_to new_task_path, notice: 'Task was successfully created.' }
            format.json { render :show, status: :created, location: @task }
          
          else
            format.html { render :new }
            format.json { render json: @task.errors, status: :unprocessable_entity }
          end
        end
    else
        respond_to do |format|
          if @task.save!

              @last_task = Task.last

              if @last_task.starting == true        
                @task.ticks.create(user: current_user, 
                                    complete: false, 
                                    # staff_id: 1, 
                                    stage: "starting", 
                                    date: Time.current, 
                                    regularity_id: @task.regularity_id,
                                    edited: 0) # 'staff_id: 1' is a hack — must fix
              end 

              if @last_task.midday == true 
                @task.ticks.create(user: current_user, 
                                    complete: false, 
                                    # staff_id: 1, 
                                    stage: "middle", 
                                    date: Time.current, 
                                    regularity_id: @task.regularity_id,
                                    edited: 0) # 'staff_id: 1' is a hack — must fix
              end

              if @last_task.ending == true 
                @task.ticks.create(user: current_user, 
                                    complete: false, 
                                    # staff_id: 1, 
                                    stage: "ending", 
                                    date: Time.current, 
                                    regularity_id: @task.regularity_id,
                                    edited: 0) # 'staff_id: 1' is a hack — must fix
              end
            format.html { redirect_to tasks_path, notice: 'Task was successfully created.' }
            format.json { render :show, status: :created, location: @task }
          
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
      params.require(:task).permit(:name, :description, :category_id, :regularity_id, :starting, :midday, :ending)
    end
end
