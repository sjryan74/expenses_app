class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all.order(:trans_date)
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      flash[:success] = "Transaction created"
      redirect_to transactions_path
    else
      # nothing yet
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:trans_date, :amount, :description)
  end
end
