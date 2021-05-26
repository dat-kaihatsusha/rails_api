class Api::PaymentsController < ApiController
  before_action :set_payment, only: [:show, :update, :destroy]

  # GET /payments
  def index
    @payments = Payment.all

    render json: :ok
  end

  # GET /payments/1
  def show
    render json: @payment
  end

  # PUT /payment/register
  def create
    # @payment = Payment.new(payment_params)
    render json: :ok
    # if @payment.save
    #   render json: @payment, status: :created, location: @api_payment
    # else
    #   render json: @payment.errors, status: :unprocessable_entity
    # end
  end

  # PATCH/PUT /payments/1
  def update
    if @payment.update(payment_params)
      render json: @payment
    else
      render json: @payment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /payments/1
  def destroy
    @payment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def payment_params
      params.fetch(:payment, {})
    end
end
