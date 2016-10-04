class GymsController < ApplicationController
  def index
    @gyms = Gym.all.order('created_at DESC')
  end

  def new
    @gym = Gym.new
  end

  def create
    @gym = Gym.new(gym_params)

		if @gym.save
			redirect_to @gym
		else
			render 'new'
		end
  end

  def show
    @gym = Gym.find(params[:id])
  end

  def edit
    @gym = Gym.find(params[:id])
  end

  def update
    @gym = Gym.find(params[:id])

		if @gym.update(params[:gym].permit(:name, :owner, :fb_page, :tw_page, :ins_page, :website))
			redirect_to @gym
		else
			render 'edit'
		end
  end

  def destroy
    @gym = Gym.find(params[:id])
		@gym.destroy

		redirect_to gyms_path
  end

  private

  def gym_params
    params.require(:gym).permit(:name, :owner, :fb_page, :tw_page, :ins_page, :website)
  end
end