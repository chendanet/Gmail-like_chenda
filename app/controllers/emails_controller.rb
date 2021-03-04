class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def create
    @email = Email.create(
      object: Faker::Games::Pokemon.name,
      body: Faker::TvShows::HowIMetYourMother.quote)

    respond_to do |format|
      format.html { redirect_to root_path}
      format.js {}
    flash[:notice] = "Email created"
    end 
  end

  def show
    @email = Email.find(params[:id])
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

end
