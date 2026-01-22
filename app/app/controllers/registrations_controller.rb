class RegistrationsController < ApplicationController
  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(registration_params)
    if @registration.save
      redirect_to root_path, notice: "Submitted"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:name, :man_number, :attending)
  end
end