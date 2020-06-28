class Chatroom < ApplicationRecord
  belongs_to :flat
  belongs_to :user
  has_many :messages, dependent: :destroy
  has_many :users, through: :flats

  def unread_messages_for_user(user)
    self.messages.filter do |message|
      message.user != user && !message.seen
    end
  end

  def mark_messages_as_seen(user)
    messages = unread_messages_for_user(user)
    messages.each do |message|
      message.mark_as_seen!
    end
  end
end
