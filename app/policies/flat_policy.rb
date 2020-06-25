class FlatPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all #tout le monde voit les appart de tout le monde
      # scope.where(user: user) le user voit seulement ses appartements
    end
  end

  def create?
    true #tous les users peuvent créer des apparts moi je veux que les owners
  end

  def show?
    true #tous les users peuvent voir tous les flat
  end

  def update?
    # seul le owner du flat peut le modifier
    user_is_owner?
  end

  def destroy?
    user_is_owner?
  end

  private

  def user_is_owner?
    record.user == user
  end
end
