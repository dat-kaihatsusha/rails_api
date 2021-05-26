class Api::AccountsController < ApiController
  # before_action :set_account, only: [:show, :update, :destroy]

  # GET /accounts
  def index
    @accounts = Account.all

    render json: :ok
  end

  # GET /accounts/1
  def show
    render json: @account
  end

  # POST /accounts
  def create
    # @account = Account.new(account_params)
    # @account.save
    render json: :ok
  end

  # PATCH/PUT /accounts/1
  def update
    if @account.update(account_params)
      render json: @account
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  # DELETE /accounts/1
  def destroy
    # @account.destroy
    render json: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:email, :password)
    end
end
