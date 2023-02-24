class MedicsController < ApplicationController
  before_action :set_medic, only: %i[ show edit update destroy ]
  before_action :set_hospitals, only: [:edit, :update, :new, :create]

  # GET /medics or /medics.json
  def index
    @medics = Medic.where(tenant_id: @hospitals.id)
  end

  # GET /medics/1 or /medics/1.json
  def show
  end

  # GET /medics/new
  def new
    @medic = Medic.new
  end

  # GET /medics/1/edit
  def edit
  end

  # POST /medics or /medics.json
  def create
    @medic = Medic.new(medic_params)

    respond_to do |format|
      if @medic.save
        format.html { redirect_to medic_url(@medic), notice: "Medic was successfully created." }
        format.json { render :show, status: :created, location: @medic }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @medic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medics/1 or /medics/1.json
  def update
    respond_to do |format|
      if @medic.update(medic_params)
        format.html { redirect_to medic_url(@medic), notice: "Medic was successfully updated." }
        format.json { render :show, status: :ok, location: @medic }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @medic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medics/1 or /medics/1.json
  def destroy
    @medic.destroy

    respond_to do |format|
      format.html { redirect_to medics_url, notice: "Medic was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medic
      @medic = Medic.find_by!(id: params[:id], tenant_id: @hospitals.id)
    end

    # Only allow a list of trusted parameters through.
    def medic_params
      params.require(:medic).permit(:name, :specialty, :tenant_id)
    end

    def set_hospitals
     @hospitals = Hospital.find_by!(slug: request.subdomain)
    end
end
