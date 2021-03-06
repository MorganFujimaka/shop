class StaticPagesController < ApplicationController
  def contact_us
  end

  def send_email
    UserMailer.message_from_user(name, email, text).deliver_now

    redirect_to root_path, notice: 'Message was send successfully'
  end

  private

  %w(name email text).each do |method|
    define_method method do
      params[:message][method.to_sym]
    end
  end
end
