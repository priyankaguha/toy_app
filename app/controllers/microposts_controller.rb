class MicropostsController < ApplicationController
def index
    @microposts = Micropost.all
  end

  def new
    @micropost = Micropost.new
  end

  def create
    if @micropost = Micropost.create(micropost_params)
      redirect_to microposts_path
    else
      render :new
    end
  end

  def edit
    @micropost = Micropost.find(params[:id])

  end

  def update
    @micropost = Micropost.find(params[:id])

    if @micropost.update(micropost_params)
      redirect_to @micropost, notice: "Micropost is successfully updated."
    else
      render :edit
    end
  end

  def show
    @micropost = Micropost.find(params[:id])
  end

  def destroy
    @micropost = Micropost.find(params[:id])
    @micropost.destroy

    redirect_to microposts_path, notice: 'Micropost is successfully destroyed.'

  end


  private
  def micropost_params
    params.require(:micropost).permit(:content, :user_id)
  end
end
