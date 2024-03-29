class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index] 
  before_action :set_event, only: [:show]
  before_action :set_current_user_event, only: [:edit, :update, :destroy]

  before_action :password_guard!, only: [:show]

  def index
     @events = Event.all.order(datetime: :desc)
    #@events = Event.where(datetime: 5.day.ago..Date.today).order(datetime: :desc)
  end

  def show
    @new_comment = @event.comments.build(params[:comment])
    @new_subscription = @event.subscriptions.build(params[:subscription])
    @new_photo = @event.photos.build(params[:photo])
  end

  def new
    @event = current_user.events.build
  end

  def edit
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to @event, notise: I18n.t('controllers.events.created')
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notiсe: I18n.t('controllers.events.updated')
    else
      render :edit
    end
  end

  def destroy
    @event.destroy 
    redirect_to events_url, notiсe: I18n.t('controllers.events.destroyed')
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def set_current_user_event
      @event = current_user.events.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :address, :datetime, :description, :pincode)
    end

    def password_guard!
      return true if @event.pincode.blank?
      return true if signed_in? && current_user == @event.user

      if params[:pincode].present? && @event.pincode_valid?(params[:pincode])
        cookies.permanent["events_#{@event.id}_pincode"] = params[:pincode]
      end

      unless @event.pincode_valid?(cookies.permanent["events_#{@event.id}_pincode"])
        flash.now[:alert] = I18n.t('controllers.events.wrong_pincode') if params[:pincode].present?
        render 'password_form'
      end
    end
end
