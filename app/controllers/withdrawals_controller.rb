class WithdrawalsController < ApplicationController
  before_action :authenticate_user!

  def show
    @withdrawal = Withdrawal.find(params[:id])

    authorize @withdrawal
  end

  def new
    authorize Withdrawal

    @withdrawal = Withdrawal.new
    @withdrawal.build_operation
  end

  def create
    authorize Withdrawal

    @withdrawal = current_user.account.withdrawals.new(withdrawal_params)
    @withdrawal.operation.operation_date = Time.now

    if OperationSavingService.new(@withdrawal, params[:withdrawal][:operation_attributes][:value].to_f).call
      MoneyTransferService.new(@withdrawal).call
      redirect_to @withdrawal, notice: "Cash withdrawal success!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def withdrawal_params
    params.require(:withdrawal).permit(:account_id, operation_attributes: [:value, :operation_date, :operable])
  end
end
