# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super
    CreateAccountService.new(resource).call
  end

  def destroy
    resource.account.update(status: :inactive)
  end
end
