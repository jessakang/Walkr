class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]

  # GET /dogs
  def index
    @dogs = Dog.all
  end

  # GET /dogs/1
  def show
    @dog = Dog.find params[:id]
  end

  # GET /dogs/new
  def new
    @dog = Dog.new
    @owners = Owner.all
  end

  # GET /dogs/1/edit
  def edit
  end

  # POST /dogs
  def create
    @dog = Dog.new(dog_params)
    @dog.owner = @current_user
    unless params[:file].nil?
      cloudinary = Cloudinary::Uploader.upload params[:file]
      @dog.image = cloudinary["url"]
    end

    respond_to do |format|
      if @dog.save
        format.html { redirect_to @dog, notice: 'Dog was successfully created.' }
        format.json { render :show, status: :created, location: @dog }
      else
        format.html { render :new }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dogs/1
  def update
    respond_to do |format|
      if @dog.update(dog_params)
        format.html { redirect_to @dog, notice: 'Dog was successfully updated.' }
        format.json { render :show, status: :ok, location: @dog }
      else
        format.html { render :edit }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end

    cloudinary = Cloudinary::Uploader.upload params[:file] if params[:file]
    dog = Dog.find params[:id]
    dog.image = cloudinary["url"] if cloudinary

    dog.update dog_params

    redirect_to dog

  end

  # DELETE /dogs/1
  def destroy
    @dog.destroy
    respond_to do |format|
      format.html { redirect_to dogs_url, notice: 'Dog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_dog
      @dog = Dog.find(params[:id])
    end
    def dog_params
      params.require(:dog).permit(:name, :breed, :weight, :suburb, :concerns, :image)
    end
end
