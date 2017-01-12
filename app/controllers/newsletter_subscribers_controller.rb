class NewsletterSubscribersController < ApplicationController
  before_action :set_newsletter_subscriber, only: [:show, :edit, :update, :destroy]

  # GET /newsletter_subscribers
  # GET /newsletter_subscribers.json
  def index
    @newsletter_subscribers = NewsletterSubscriber.all
  end

  # GET /newsletter_subscribers/1
  # GET /newsletter_subscribers/1.json
  def show
  end

  # GET /newsletter_subscribers/new
  def new
    @newsletter_subscriber = NewsletterSubscriber.new
  end

  # GET /newsletter_subscribers/1/edit
  def edit
  end

  # POST /newsletter_subscribers
  # POST /newsletter_subscribers.json
  def create
    @newsletter_subscriber = NewsletterSubscriber.new(newsletter_subscriber_params)

    respond_to do |format|
      if @newsletter_subscriber.save
        format.html { redirect_to @newsletter_subscriber, notice: 'Newsletter subscriber was successfully created.' }
        format.json { render :show, status: :created, location: @newsletter_subscriber }
      else
        format.html { render :new }
        format.json { render json: @newsletter_subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /newsletter_subscribers/1
  # PATCH/PUT /newsletter_subscribers/1.json
  def update
    respond_to do |format|
      if @newsletter_subscriber.update(newsletter_subscriber_params)
        format.html { redirect_to @newsletter_subscriber, notice: 'Newsletter subscriber was successfully updated.' }
        format.json { render :show, status: :ok, location: @newsletter_subscriber }
      else
        format.html { render :edit }
        format.json { render json: @newsletter_subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newsletter_subscribers/1
  # DELETE /newsletter_subscribers/1.json
  def destroy
    @newsletter_subscriber.destroy
    respond_to do |format|
      format.html { redirect_to newsletter_subscribers_url, notice: 'Newsletter subscriber was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newsletter_subscriber
      @newsletter_subscriber = NewsletterSubscriber.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def newsletter_subscriber_params
      params.require(:newsletter_subscriber).permit(:email, :first_name)
    end
end
