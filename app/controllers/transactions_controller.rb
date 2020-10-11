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
    @transaction.tags = processed_tags
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
    @transaction.tags << processed_tags

    if @transaction.update(transaction_params)
      flash[:success] = "Transaction updated"
      redirect_to @transaction
    else
      # nothing yet
    end
  end

  def add_tag
    tag_name = params[:tag_name]
    transaction = Transaction.find(params[:transaction_id])

    tag = Tag.find_or_initialize_by(name: tag_name)
    transaction.tags << tag
    render json: tag
    # head :ok
  end

  def show
  end

  def destroy
    if @transaction.destroy
      flash[:success] = "Transaction deleted"
      redirect_to tags_path
    end
  end

  def search
    search_field = params[:search]
    if search_field.nil?
      @transactions = Transaction.all.order(:trans_date)
    elsif search_field.starts_with?('tag:')
      @transactions = Transaction.search(search_field).order(:trans_date)
    else
      @transactions = Transaction.where('description like ?', "%#{search_field}%").order(:trans_date)
    end
    render 'index'
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:trans_date, :amount, :description)
  end

  def processed_tags
    params[:tag_names].split(",").map do |tag|
      Tag.find_or_initialize_by(name: tag)
    end
  end
end
