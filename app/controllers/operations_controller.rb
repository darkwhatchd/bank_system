class OperationsController < ApplicationController
  def show
    @operation = Operation.find(params[:id])

    authorize @operation
  end

  def new
    authorize Operation

    @operation = Operation.new
  end

  def create
    authorize Operation

    @operation = current_user.account.operations.new(operation_params.merge({ operation_date: Time.now }))
    operable_type = params[:operation][:operable_type]

    OperableSavingService.new(@operation, operable_type).call

    if TransferSavingService.new(@operation, operable_type).call
      MoneyTransferService.new(@operation, operable_type).call
      redirect_to @operation, notice: "#{operable_type} success!"
    else
      render "new", :locals => { :operable_type => operable_type }, status: :unprocessable_entity
    end
  end

  private

  def operation_params
    params.require(:operation).permit(:value, :operation_date, :operable_id, :operable_type)
  end
end
