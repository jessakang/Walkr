class OwnersController < ApplicationController
  before_action :set_owner, only: [:show, :edit, :update, :destroy]
  skip_before_action :fetch_user, :only => [:new, :create]
  # GET /owners
  def index
    @owners = Owner.all
  end

  # GET /owners/1
  def show
    @owner = Owner.find params[:id]
  end

  # GET /owners/new
  def new
    @owner = Owner.new
  end

  # GET /owners/1/edit
  def edit
  end

  # POST /owners
  def create
    @owner = Owner.new(owner_params)
    if params[:file].present?
      cloudinary = Cloudinary::Uploader.upload( params[:file] )
      @owner.image = cloudinary["url"]
    end
    respond_to do |format|
      if @owner.save
        session[:owner_id] = @owner.id
        session[:walker_id] = nil
        format.html { redirect_to @owner, notice: 'Owner was successfully created.' }
        format.json { render :show, status: :created, location: @owner }
      else
        format.html { render :new }
        format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /owners/1
  def update
    respond_to do |format|
      if @owner.update(owner_params)
        format.html { redirect_to @owner, notice: 'Owner was successfully updated.' }
        format.json { render :show, status: :ok, location: @owner }
      else
        format.html { render :edit }
        format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /owners/1
  def destroy
    @owner.destroy
    respond_to do |format|
      format.html { redirect_to owners_url, notice: 'Owner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_owner
      @owner = Owner.find(params[:id])
    end
    def owner_params
      params.require(:owner).permit(:name, :email, :image, :password, :password_confirmation)
    end
end
