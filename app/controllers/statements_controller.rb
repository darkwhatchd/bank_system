class StatementsController < ApplicationController
  def show
    @statement = Statement.find(params[:id])

    authorize @statement

    @operations = SelectOperationsService.new(@statement).call
  end

  def new
    authorize Statement

    @statement = Statement.new
  end

  def create
    authorize Statement

    @statement = Statement.new(statement_params.merge({ account_id: current_user.account.id }))

    if @statement.save
      redirect_to @statement, notice: "Bank statement success!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def statement_params
    params.require(:statement).permit(:account_id, :start_date, :finish_date)
  end
end
