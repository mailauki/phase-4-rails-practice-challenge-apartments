class ApartmentsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_errors

  def index
    apartments = Apartment.all
    render json: apartments
  end

  def show
    apartment = find_aparment
    render json: apartment
  end

  def create
    apartment = Apartment.create!(apartment_params)
    render json: apartment, status: :created
  end

  def update
    apartment = find_aparment
    apartment.update!(apartment_params)
    render json: apartment
  end

  def destroy
    apartment = find_aparment
    apartment.destroy
    head :no_content
  end

  private
  
  def find_aparment
    Apartment.find(params[:id])
  end

  def apartment_params
    params.permit(:number)
  end

  def render_not_found_response
    render json: { errors: "Apartment not found" }, status: :not_found
  end

  def render_invalid_errors(e)
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

end
