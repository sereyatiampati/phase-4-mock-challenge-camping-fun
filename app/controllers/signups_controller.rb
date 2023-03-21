class SignupsController < ApplicationController
  before_action :set_signup, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_entry

  # GET /signups
  def index
    signups = Signup.all

    render json: signups
  end

  # GET /signups/1
  def show
    signup=set_signup
    render json: signup
  end

  # POST /signups
  def create
    signup = Signup.create!(signup_params)
      render json: signup.activity, status: :created
  end

  # PATCH/PUT /signups/1
  def update
    signup=set_signup
    signup.update!(signup_params)
    render json: signup

  end

  # DELETE /signups/1
  def destroy
    @signup.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_signup
      @signup = Signup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def signup_params
      params.permit(:time, :activity_id, :camper_id)
    end

    def invalid_entry(invalid)
      render json: {errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
