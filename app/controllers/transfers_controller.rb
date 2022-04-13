class TransfersController < ApplicationController
  def show
    @transfer = Transfer.find(params[:id])
  end

  def new
    @transfer = current_user.account.transfers.new
  end

  def create
    @transfer = current_user.account.transfers.new(transfer_params.merge({ transfer_date: Time.now }))

    @transfer.value += TaxCalculateService.new(@transfer).call

    if TransferSavingService.new(@transfer).call
      MoneyTransferService.new(@transfer).call
      redirect_to transfer_path(@transfer), notice: "Transfer success!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def transfer_params
    params.require(:transfer).permit(:account_id, :destiny_account_id, :transfer_date, :value)
  end
end
