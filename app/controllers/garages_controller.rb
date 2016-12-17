class GaragesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_garage, only: [:show, :edit, :update, :destroy]
  before_action :check_user, except: [:index, :show, :search]

  def search
    if params[:search].present?
      @garages = Garage.search(params[:search])
    else
      @garages = Garage.all
    end
  end

  # GET /garages
  # GET /garages.json
  def index
    @garages = Garage.all
  end

  # GET /garages/1
  # GET /garages/1.json
  def show
    @reviews = Review.where(garage_id: @garage.id).order(created_at: :desc)
    if @reviews.empty?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(0)
    end
  end

  # GET /garages/new
  def new
    @garage = Garage.new
  end

  # GET /garages/1/edit
  def edit
  end

  # POST /garages
  # POST /garages.json
  def create
    @garage = Garage.new(garage_params)

    respond_to do |format|
      if @garage.save
        format.html { redirect_to @garage, notice: 'Garage was successfully created.' }
        format.json { render :show, status: :created, location: @garage }
      else
        format.html { render :new }
        format.json { render json: @garage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /garages/1
  # PATCH/PUT /garages/1.json
  def update
    respond_to do |format|
      if @garage.update(garage_params)
        format.html { redirect_to @garage, notice: 'Garage was successfully updated.' }
        format.json { render :show, status: :ok, location: @garage }
      else
        format.html { render :edit }
        format.json { render json: @garage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /garages/1
  # DELETE /garages/1.json
  def destroy
    @garage.destroy
    respond_to do |format|
      format.html { redirect_to garages_url, notice: 'Garage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_garage
      @garage = Garage.find(params[:id])
    end

    def check_user
      unless current_user.admin?
        redirect_to root_url, alert: "Restricted access"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def garage_params
      params.require(:garage).permit(:name, :address, :phone, :website, :image)
    end
end
