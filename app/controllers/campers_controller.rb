class CampersController < ApplicationController
  before_action :set_camper, only: [:show, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_entry

  # GET /campers
  def index
    @campers = Camper.all

    render json: @campers
  end

  # GET /campers/1
  def show
    render json: @camper
  end

  # POST /campers
  def create
    @camper = Camper.create!(camper_params)

      render json: @camper, status: :created

  end

  # PATCH/PUT /campers/1
  def update

   camper= set_camper
   camper.update!(camper_params)
      render json: @camper, status: :ok

  end

  # DELETE /campers/1
  def destroy
    @camper.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camper
      @camper = Camper.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def camper_params
      params.permit(:name, :age)
    end

    def render_not_found
      render json: {error: "Camper not found"}, status: :not_found
    end

    def invalid_entry(invalid)
      render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
