class Api::DiagnosesController < ApiController
  before_action :set_diagnosis, only: [:show, :update, :destroy]

  # GET /diagnoses
  def index
    @diagnoses = Diagnose.all

    render json: @diagnoses
  end

  # GET /diagnoses/1
  def show
    render json: @diagnosis
  end

  # POST /diagnoses
  def create
    @diagnosis = Diagnose.new(diagnosis_params)

    if @diagnosis.save
      render json: @diagnosis, status: :created, location: @api_diagnosis
    else
      render json: @diagnosis.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /diagnoses/1
  def update
    if @diagnosis.update(diagnosis_params)
      render json: @diagnosis
    else
      render json: @diagnosis.errors, status: :unprocessable_entity
    end
  end

  # DELETE /diagnoses/1
  def destroy
    @diagnosis.destroy
  end

  def questions
    return render json: {status: :ok}
  end

  def answers
    return render json: {status: :ok}
  end

  def courses
    return render json: {status: :ok}
  end

  def period
    return render json: {status: :ok}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diagnosis
      @diagnosis = Diagnose.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def diagnosis_params
      params.fetch(:diagnosis, {})
    end
end
