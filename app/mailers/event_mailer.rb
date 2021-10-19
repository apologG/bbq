class EventMailer < ApplicationMailer

  def subscriptions(event, subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @event = event

    mail to: @email, subject: "Новая подписка на #{event.title}"
  end
end
