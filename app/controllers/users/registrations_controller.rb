# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super
    CreateAccountService.new(resource).call
  end
end
