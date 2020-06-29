class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(receiver_id: user.id)
    end
  end

  def index

  end
end
