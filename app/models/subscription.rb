# (с) goodprogrammer.ru
#
# Модель Подписки
class Subscription < ActiveRecord::Base
  belongs_to :event
  belongs_to :user, optional: true

  validates :event, presence: true

  validates :user_name, presence: true, unless: -> {user.present?}

  validates :user_email, presence: true, format:{ with: URI::MailTo::EMAIL_REGEXP}, unless: -> {user.present?}

  validates :user, uniqueness: {scope: :event_id}, if: -> {user.present?}

  validates :user_email, uniqueness: {scope: :event_id}, unless: -> {user.present?}

  validate :email_exists, unless: -> {user.present?}

  def user_name
    if user.present?
      user.name
    else
      super
    end
  end

  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  def email_exists
    if User.find_by(email: user_email).present?
      errors.add(:user_email, I18n.t('errors.dublicate_email'))
    end
  end
end
