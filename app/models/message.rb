class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  def mark_as_seen!
    self.seen = true
    self.save!
  end
end
