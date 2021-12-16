class TenantsController < ApplicationController
  before_action :find_tenant, only: %i[update destroy show]

  def index
    render json: Tenant.all, status: :ok
  end

  #READ
  def show
    render json: @tenant, status: :ok
  end

  #CREATE
  def create
    render json: Tenant.create!(tenant_params), status: :created
  end

  #Update
  def update
    @tenant.update!(tenant_params)
    render json: @tenant, status: :accepted
  end

  #DESTROY
  def destroy
    @tenant.destroy
    head :no_content
  end

  private

  # all methods below here are private

  def find_tenant
    @tenant = Tenant.find(params[:id])
  end

  def tenant_params
    params.permit(:name)
  end
end
