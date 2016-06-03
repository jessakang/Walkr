class WalkersController < ApplicationController
  before_action :set_walker, only: [:show, :edit, :update, :destroy]
  skip_before_action :fetch_user, :only => [:new, :create]

  # GET /walkers
  def index
    @walkers = Walker.all
  end

  # GET /walkers/1
  def show
      @walker = Walker.find params[:id]
  end

  # GET /walkers/new
  def new
    @walker = Walker.new
  end

  # GET /walkers/1/edit
  def edit
  end

  # POST /walkers
  def create
    @walker = Walker.new(walker_params)
    cloudinary = Cloudinary::Uploader.upload( params[:file] )
    @walker.image = cloudinary["url"]
    # binding.pry
    respond_to do |format|
      if @walker.save
        session[:walker_id] = @walker.id
        session[:owner_id] = nil
        format.html { redirect_to @walker, notice: 'Walker was successfully created.' }
        format.json { render :show, status: :created, location: @walker }
      else
        format.html { render :new }
        format.json { render json: @walker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /walkers/1
  def update
    respond_to do |format|
      if @walker.update(walker_params)
        format.html { redirect_to @walker, notice: 'Walker was successfully updated.' }
        format.json { render :show, status: :ok, location: @walker }
      else
        format.html { render :edit }
        format.json { render json: @walker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /walkers/1
  def destroy
    @walker.destroy
    respond_to do |format|
      format.html { redirect_to walkers_url, notice: 'Walker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_walker
      @walker = Walker.find(params[:id])
    end
    def walker_params
      params.require(:walker).permit(:name, :email, :experience, :suburbs, :car, :wage, :image, :password, :password_confirmation)
    end
end
