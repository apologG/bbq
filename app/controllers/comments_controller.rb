class CommentsController < ApplicationController
  before_action :set_event, only: [:create, :destroy]
  before_action :set_comment, only: [:destroy]

  # POST /comments
  def create
    @new_comment = @event.comments.build(comment_params)
    @new_comment.user = current_user

    respond_to do |f|
      if @new_comment.save
        f.html {redirect_to @event, notice: I18n.t('controllers.comments.created')}
        f.js

      else
        f.html { render action: 'new', alert: I18n.t('controllers.comments.error')}
        f.js

      end
    end

    # if @new_comment.save
    #   redirect_to @event, notice: I18n.t('controllers.comments.created')
    # else
    #   render 'events/show', alert: I18n.t('controllers.comments.error')
    # end
  end

  # DELETE /comments/1
  def destroy
    message = { notice: I18n.t('controllers.comments.destroyed') }
    
    if current_user_can_edit?(@comment)
      @comment.destroy
    else
      message = { alert: I18n.t('controllers.comments.error') }
    end

    redirect_to @event, message
  end

  private
    def set_event
      @event = Event.find(params[:event_id])
    end

    def set_comment
      @comment = @event.comments.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :user_name)
    end
end