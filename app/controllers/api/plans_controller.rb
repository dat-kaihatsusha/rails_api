class Api::PlansController < ApiController
  # before_action :set_api_plan, only: [:show, :update, :destroy]

  # GET /api/plan
  def index
    # @plan = Plan.all
    render json: :ok
  end

  # GET /api/plans/1
  def show
    render json: @api_plan
  end

  # PUT /api/plan
  def create
    render json: :ok
    # @api_plan = Api::Plan.new(api_plan_params)
    #
    # if @api_plan.save
    #   render json: @api_plan, status: :created, location: @api_api_plan
    # else
    #   render json: @api_plan.errors, status: :unprocessable_entity
    # end
  end

  # PATCH/PUT /api/plans/1
  def update
    if @api_plan.update(api_plan_params)
      render json: @api_plan
    else
      render json: @api_plan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/plans/1
  def destroy
    render json: :ok
    # @api_plan.destroy
  end

  # GET /api/recommend_plan
  def recommend
    render json: :ok
  end

  # GET /api/music_list
  def music_list
    render json: :ok
  end

  # GET /api/dashboard
  def dashboard
    render json: :ok
  end

  # PUT /api/record
  def record
    render json: :ok
  end

  # GET /api/love_list
  def love_list
    render json: :ok
  end

  # PUT/DELETE /api/love
  def create_love
    render json: :ok
  end

  # PUT/DELETE /api/time
  def create_time
    render json: :ok
  end

  # GET /api/result
  def result
    render json: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_api_plan
  #   @api_plan = Api::Plan.find(params[:id])
  # end

  # Only allow a list of trusted parameters through.
  def api_plan_params
    params.fetch(:api_plan, {})
  end
end
