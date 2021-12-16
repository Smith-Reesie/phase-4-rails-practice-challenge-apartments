class LeasesController < ApplicationController
  def index
    lease = Lease.all
    render json: lease
  end
  def destroy
    lease = find_lease
    lease.destroy
    head :no_content
  end

  def create
    lease = Lease.create!(lease_params)
    render json: lease, status: :created
  end

  private

  def find_lease
    lease = Lease.find(params[:id])
  end

  def lease_params
    params.permit(:rent, :apartment_id, :tenant_id)
  end
end
