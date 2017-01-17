class TicksController < ApplicationController
  before_action :set_tick, only: [:show, :edit, :update, :destroy]
  # before_filter :update_active

  # GET /ticks
  # GET /ticks.json
  def index
    if current_user.subscribed != true 
      redirect_to new_subscriber_path
    end

    if params[:active].blank?
      @search = TickSearch.new(params[:search])
      @ticks = @search.scope

      respond_to do |format|
        format.html
        format.csv { send_data @ticks.to_csv }
        format.xls { send_data @ticks.to_csv(col_sep: "\t")}
        format.pdf do 
          pdf = TicksPdf.new(@tick, view_context)
          send_data pdf.render, filename: 'member.pdf', type: 'application/pdf', disposition: "inline"
        end
      end
    else 
      # code here
      @ticks = Tick.all.order("created_at DESC")
    end

    if params[:stage].blank?
      @search = TickSearch.new(params[:search])
      @ticks = @search.scope
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
    
    @staffs = current_user.staff.map { |staff| [staff.first_name + " " + staff.surname, staff.id] }
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
    @staffs = current_user.staff.map { |staff| [staff.first_name, staff.id] }

    if @tick.temperature != nil 
        @tick.complete = true
    end


    @tick.update(tick_params)

    @last_tick = Tick.last

    if @tick.edited < 1
      @last_tick.update(edited: @last_tick.edited += 1)
    end

    respond_to do |format|
      if @tick.update!(tick_params)
        format.html { redirect_to ticks_path, notice: 'Tick was successfully updated.' }
        format.json { render :show, status: :ok, location: @tick }
        
        if @tick.edited != 1 && @tick.regularity_id == 1
          current_user.ticks.create!(complete: false, 
                                      task_id: @tick.task_id, 
                                      stage: @tick.stage,
                                      staff_id: 10,
                                      date: @tick.date + 1.day, 
                                      regularity_id: @tick.regularity_id, 
                                      edited: 0) # 'staff_id: 1' is a hack — must fix
        else
          format.html { render :edit, notice: "@tick.edited == reg is failing" }  
        end
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
      params.require(:tick).permit(:complete, :temperature, :task_id, :regularity_id, :category_id, :staff_id, :active, :date, :edited)

        # if params[:active]
        #   return params.require(:tick).permit(:name, :body).merge(active: true)
        # else    
        #   return params.require(:tick).permit(:name, :body).merge(active: false)
        # end
    end
end
