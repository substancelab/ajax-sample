class DogsController < ApplicationController
  before_action :set_dog, only: %i[ description show edit update destroy ]

  # GET /dogs or /dogs.json
  def index
    @dogs = Dog.all
    @dog = Dog.new
  end

  def description
    respond_to do |format|
      format.html { render :description, :layout => !request.xhr? }
    end
  end

  # GET /dogs/1 or /dogs/1.json
  def show
    respond_to do |format|
      format.js { render :body => "alert('hi')" }
      format.text { render :body => "Jeg er tekxt" }
      format.html { render :body => "<html>is awesome</html>" }
      format.json { render :body => {:json => [:data, :stuff]}.to_json }
      format.any { render :body => "wut?" }
    end
  end

  # GET /dogs/new
  def new
    @dog = Dog.new
  end

  # GET /dogs/1/edit
  def edit
  end

  # POST /dogs or /dogs.json
  def create
    @dog = Dog.new(dog_params)

    respond_to do |format|
      if @dog.save
        format.html { redirect_to dogs_path, notice: "Dog was successfully created." }
        format.json { render :show, status: :created, location: @dog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dogs/1 or /dogs/1.json
  def update
    respond_to do |format|
      if @dog.update(dog_params)
        format.html { redirect_to @dog, notice: "Dog was successfully updated." }
        format.json { render :show, status: :ok, location: @dog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dogs/1 or /dogs/1.json
  def destroy
    @dog.destroy
    respond_to do |format|
      format.html { redirect_to dogs_url, notice: "Dog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dog
      @dog = Dog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dog_params
      params.require(:dog).permit(:name, :age, :description)
    end
end
