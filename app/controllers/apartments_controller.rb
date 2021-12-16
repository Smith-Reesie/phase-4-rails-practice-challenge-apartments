class ApartmentsController < ApplicationController
  before_action :find_apratment, only: %i[update destroy show]

  #READ
  def index
    render json: Apartment.all, status: :ok
  end

  #READ
  def show
    render json: @apartment, status: :ok
  end

  #CREATE
  def create
    render json: Apartment.create!(apartment_params), status: :created
  end

  #Update
  def update
    #using find_by returns nil if id cant be found
    @apartment.update!(apartment_params)
    render json: @apartment, status: :accepted
  end

  #DESTROY
  def destroy
    @apartment.destroy
    head :no_content
  end

  private

  # all methods below here are private

  def find_apratment
    @apartment = Apartment.find(params[:id])
  end

  def apartment_params
    params.permit(:number)
  end
end
