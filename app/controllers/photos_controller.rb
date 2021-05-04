class PhotosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_session, only: [:edit, :update, :destroy]
  def index
    @photos = Photo.includes(:user).order('created_at DESC')
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @photo.update(photo_params)
      redirect_to photo_path
    else
      render :edit
    end
  end

  def destroy
    @photo.destroy
    redirect_to root_path
  end

  private

  def photo_params
    params.require(:photo).permit(:name, :explanation, :condition_id, :burden_id, :area_id, :shipping_id, :price,
                                  :image).merge(user_id: current_user.id)
  end

  def set_item
    @photo = Photo.find(params[:id])
  end

  def move_to_session
    redirect_to action: :index if @photo.purchase.present? || (current_user.id != @photo.user.id)
  end
end
