class AquaticsController < ApplicationController
  before_action :set_aquatic, only: %i[ show edit update destroy ]
  include AquaticsHelper
  # GET /aquatics or /aquatics.json
  def index
    @aquatics = Aquatic.all
  end

  # GET /aquatics/1 or /aquatics/1.json
  def show
  end

  # GET /aquatics/new
  def new
    @aquatic = Aquatic.new
  end

  # GET /aquatics/1/edit
  def edit
  end

  # POST /aquatics or /aquatics.json
  def create
    @aquatic = Aquatic.new(aquatic_params)
    @aquatic = assign_aquatic_creator(@aquatic, current_user)
    respond_to do |format|
      if @aquatic.save
        format.html { redirect_to aquatic_url(@aquatic), notice: "Aquatic was successfully created." }
        format.json { render :show, status: :created, location: @aquatic }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @aquatic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aquatics/1 or /aquatics/1.json
  def update
    respond_to do |format|
      if @aquatic.update(aquatic_params)
        format.html { redirect_to aquatic_url(@aquatic), notice: "Aquatic was successfully updated." }
        format.json { render :show, status: :ok, location: @aquatic }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @aquatic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aquatics/1 or /aquatics/1.json
  def destroy
    @aquatic.destroy

    respond_to do |format|
      format.html { redirect_to aquatics_url, notice: "Aquatic was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aquatic
      @aquatic = Aquatic.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def aquatic_params
      params.require(:aquatic).permit(:nick_name, :common_name, :scientific_name, :length, :max_lifespan, :purchased_on, :user_id, :notes)
    end
end
