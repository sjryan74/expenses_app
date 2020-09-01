class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

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

  def edit
  end

  def update
    if @transaction.update(transaction_params)
      flash[:success] = "Transaction updated"
      redirect_to @transaction
    else
      # nothing yet
    end
  end

  def show
  end

  def destroy
    if @transaction.destroy
      flash[:success] = "Transaction deleted"
      redirect_to tags_path
    end
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:trans_date, :amount, :description)
  end
end
