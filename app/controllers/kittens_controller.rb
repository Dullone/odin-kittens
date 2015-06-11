class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html
      format.json { render :json => @kittens }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:created] = "Kitten created!"
    else
      flash.now[:error] = "Kitten error!  Where you distracted by cuteness?"
      render :new
    end
    redirect_to kittens_path
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def show
    @kitten = Kitten.find(params[:id])
    respond_to do |format| 
      format.html
      format.json { render json: @kitten}
    end
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update_attributes(kitten_params)
      flash[:updated] = "Kitten updated!"
    else
      flash.now[:error] = "Kitten error!  Where you distracted by cuteness?"
      render :edit
    end
    redirect_to kittens_path
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    redirect_to kittens_path
  end

  private

    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end
