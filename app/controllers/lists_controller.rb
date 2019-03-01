class ListsController < ApplicationController
  def create
    @lists = List.new(list_params)

    if @lists.save
      redirect_to lists_path
    else
      render :new
    end
  end
  
  def index
    @lists = List.all
  end

  def show
  end

  def edit
  end

  def new
  end

  def update
  end

  def destroy
  end
end
