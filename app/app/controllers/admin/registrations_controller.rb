class Admin::RegistrationsController < ApplicationController
  http_basic_authenticate_with name: ENV.fetch("ADMIN_USER", "admin"),
                               password: ENV.fetch("ADMIN_PASS", "admin")

  def index
    @registrations = Registration.order(created_at: :desc)
  end

  def edit
    @registration = Registration.find(params[:id])
  end

  def update
    @registration = Registration.find(params[:id])
    if @registration.update(registration_params)
      redirect_to admin_registrations_path, notice: "Updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy
    redirect_to admin_registrations_path, notice: "Deleted!"
  end

  private

  def registration_params
    params.require(:registration).permit(:name, :man_number, :attending)
  end
end