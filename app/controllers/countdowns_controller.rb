class CountdownsController < InheritedResources::Base

  # Using "Person.create(params[:person])" would raise an
  # ActiveModel::ForbiddenAttributes exception because it'd
  # be using mass assignment without an explicit permit step.
  # This is the recommended form:
  def create
    @countdown = Countdown.create(countdown_params)

	  @countdown.save
	  redirect_to @countdown
  end

  # This will pass with flying colors as long as there's a person key in the
  # parameters, otherwise it'll raise an ActionController::MissingParameter
  # exception, which will get caught by ActionController::Base and turned
  # into a 400 Bad Request reply.
  # def update
  #   redirect_to current_account.countdown.find(params[:id]).tap { |person|
  #     countdown.update!(countdown_params)
  #   }
  # end

# Ad.create(permitted_params(params[:ad]))
# def permitted_params(params)
#   params.require(:ad).permit(:title, :price, :description)
# end

  private

    def countdown_params
      params.require(:countdown).permit(:name, :description, :date, :link)
    end

     # Use callbacks to share common setup or constraints between actions.
    def set_countdown
      unless @countdown = current_user.countdowns.where(id: params[:id]).first
        flash[:alert] = 'Bookmark not found.'
        redirect_to root_url
      end
    end

end
