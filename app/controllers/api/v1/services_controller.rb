# frozen_string_literal: true

class Api::V1::ServicesController < ApplicationController
  before_action :set_service, only: %i[show edit update destroy]

  # GET /services
  def index
    render json: Service.all.order(name: :asc)
  end

  # GET /services/1
  def show
    render json: @service
  end

  # GET /services/new
  def new
    render json: @service = Service.new
  end

  # GET /services/1/edit
  def edit
    render json: @service
  end

  # POST /services
  def create
    @service = Service.new(service_params)

    if @service.save
      render json: @service, status: :created
    else
      render json: @service.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /services/1
  def update
    if @service.update(service_params)
      render json: @service, status: :ok
    else

      render json: @service.errors, status: :unprocessable_entity
    end
  end

  # DELETE /services/1
  def destroy
    @service.destroy

    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_service
    @service = Service.find_by(id: params[:id])
    render json: { error: t('errors.not_found', resource_name: t('models.service.name')) }, status: :not_found if @service.nil?
  end

  # Only allow a list of trusted parameters through.
  def service_params
    params.permit(:start_date, :end_date)
  end
end
