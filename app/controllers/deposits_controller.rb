class DepositsController < ApplicationController
  def new
    @deposit = Deposit.new
    @deposit.build_operation
  end

  def create
    @deposit = Deposit.new(deposit_params)
    @deposit.operation.operation_date = Time.now

    if OperationSavingService.new(@deposit, params[:deposit][:operation_attributes][:value].to_f).call
      MoneyTransferService.new(@deposit).call
      redirect_to root_path, notice: "Cash deposit success!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def deposit_params
    params.require(:deposit).permit(:account_id, operation_attributes: [:value, :operation_date, :operable])
  end
end
