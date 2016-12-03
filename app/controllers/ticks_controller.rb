class TicksController < ApplicationController
  before_action :set_tick, only: [:show, :edit, :update, :destroy]
  # before_filter :update_active

  # GET /ticks
  # GET /ticks.json
  def index
    if params[:active].blank?
      @ticks = Tick.all.order("created_at DESC")
    else 
      # code here
      @ticks = Tick.where(:active => params[:active]).order("created_at DESC")
    end

    if params[:stage].blank?
      @ticks = Tick.all.order("created_at DESC")
    else
      @ticks = Tick.all.order("created_at DESC")
      
    end
  end

  # GET /ticks/1
  # GET /ticks/1.json
  def show
  end

  # GET /ticks/new
  def new
    @tick = current_user.ticks.build

    @tasks = Task.all.map{ |t| [t.name, t.id] }
  end

  # GET /ticks/1/edit
  def edit
    @tasks = Task.all.map{ |t| [t.name, t.id] }
    @staffs = Staff.all.map{ |s| [s.first_name + " " + s.surname, s.id]}
  end

  # POST /ticks
  # POST /ticks.json
  def create
    @tick = current_user.ticks.build(tick_params)


    @tick.task_id = params[:task_id]

    

    respond_to do |format|
      if @tick.save
        format.html { redirect_to @tick, notice: 'Tick was successfully created.' }
        format.json { render :show, status: :created, location: @tick }
      else
        format.html { render :new }
        format.json { render json: @tick.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ticks/1
  # PATCH/PUT /ticks/1.json
  def update
    @tick.staff_id = params[:staff_id]
    @staffs = Staff.all.map{ |s| [s.first_name, s.id]}

    if @tick.temperature != nil 
        @tick.complete = true
    end

    @last_tick = Tick.last
    @last_tick.update(active: false)


    @tick.update(tick_params)



    respond_to do |format|
      if @tick.update(tick_params)
        format.html { redirect_to ticks_path, notice: 'Tick was successfully updated.' }
        format.json { render :show, status: :ok, location: @tick }
      else
        format.html { render :edit }
        format.json { render json: @tick.errors, status: :unprocessable_entity }
      end


    end
  end

  # DELETE /ticks/1
  # DELETE /ticks/1.json
  def destroy
    @tick.destroy
    respond_to do |format|
      format.html { redirect_to ticks_url, notice: 'Tick was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  
  # def update_active
  #   @ticks = Tick.all
  #   @ticks.update_all(active: false)
  #   flash[:notice] = "marked as false"
  # end

  def completed
    @ticks = Tick.where(:active => 'false').all
  end

  private
    


    # Use callbacks to share common setup or constraints between actions.
    def set_tick
      @tick = Tick.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tick_params
      params.require(:tick).permit(:complete, :temperature, :task_id, :category_id, :staff_id, :active)

        # if params[:active]
        #   return params.require(:tick).permit(:name, :body).merge(active: true)
        # else    
        #   return params.require(:tick).permit(:name, :body).merge(active: false)
        # end
    end
end
