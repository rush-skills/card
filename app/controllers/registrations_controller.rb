# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    # add custom create logic here
    super
    hex = SecureRandom.hex(3)
    while User.find_by_uid(hex)
    	hex = SecureRandom.hex(3)
    end
    resource.uid = hex
    resource.save!
    puts hex
  end

  def update
    super
  end
end 