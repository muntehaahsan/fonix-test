class UserController < ApplicationController
  require 'zensend'

  #enter mobile number on index page
  def index
    @exception_str = params[:exception_str]
  end

  #send user code to mobile number
  def user_code
    client = ZenSend::Client.new("demo_kjMUHLoJTdz1paVgLLAKy0VA5jMJavNwKzlIj9NHq2M=")
    begin
      @random_str = [*('1'..'9')].sample(4).join
      result = client.send_sms(
          originator: "Zensend",
          # Add your number here to send a message to yourself
          # The number should be in international format.
          # For example GB numbers will be 447400123456
          numbers: [params[:phone]],
          body: "Hello from Zensend! Enter #{@random_str} to verify your number"
      )
    rescue ZenSend::ZenSendException => e
      puts "ZenSendException: #{e.parameter} => #{e.failcode}"

    end
  end

  #verify user code sent on mobile number
  def verify_user

  end

end
