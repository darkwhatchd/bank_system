class TransfersController < ApplicationController
  before_action :authenticate_user!

  def show
    @transfer = Transfer.find(params[:id])

    authorize @transfer
  end

  def new
    authorize Transfer

    @transfer = current_user.account.transfers.new
  end

  def create
    authorize Transfer

    @transfer = current_user.account.transfers.new(transfer_params.merge({ transfer_date: Time.now }))

    @transfer.value += TaxCalculateService.new(@transfer).call

    if TransferSavingService.new(@transfer, @transfer.value).call
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
