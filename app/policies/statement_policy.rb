class StatementPolicy < ApplicationPolicy
  def show?
    user&.account&.active? && record&.account&.user == user
  end

  def new?
    user&.account&.active?
  end

  def create?
    user&.account&.active?
  end
end
