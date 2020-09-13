class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  def index
    @tags = Tag.all.order(:name)
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    
    if @tag.save
      flash[:success] = "Tag created"
      redirect_to @tag
    else
      # nothing yet
    end
  end

  def show
  end

  def edit
  end

  def update
    if @tag.update(tag_params)
      flash[:success] = "Tag updated"
      redirect_to @tag
    else
      flash[:alert] = "Tag has not been updated"
      render 'edit'
    end
  end

  def destroy
    if @tag.destroy
      flash[:success] = "Tag deleted"
      redirect_to tags_path
    end
  end

  def remove
    transaction = Transaction.find(params[:transaction_id])
    tag = Tag.find(params[:id])

    transaction.tags.destroy(tag)
    head :ok
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name, :description)
  end
end
