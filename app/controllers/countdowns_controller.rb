class CountdownsController < InheritedResources::Base

	before_action :authenticate_user!, only: [:destroy, :create, :new, :edit, :update]

  def create
    @countdown = Countdown.create(countdown_params)

	  @countdown.save
	  redirect_to @countdown
  end

  def show
    @countdown = Countdown.find(params[:id])
    date = @countdown.countdown_date
    @year = date.strftime('%Y')
    @month = date.strftime('%m').to_i - 1
    @day = date.strftime('%d')
    @hour = date.strftime('%H')
    @minute = date.strftime('%M')
    @second = date.strftime('%S')
  end

  private

    def countdown_params
      params.require(:countdown).permit(:name, :description, :countdown_date, :link, :user_id)
    end

     # Use callbacks to share common setup or constraints between actions.
    def set_countdown
      unless @countdown = current_user.countdowns.where(id: params[:id]).first
        flash[:alert] = 'Bookmark not found.'
        redirect_to root_url
      end
    end

end
