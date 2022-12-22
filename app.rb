require_relative 'format_time'
require 'rack'

class App

  def call(env)
    @request = Rack::Request.new(env)
    response
    [status, {}, body]
  end

  private

  def response
    return wrong_url unless @request.path == '/time'

    @format_time = FormatTime.new(@request.params)
    @format_time.check_format
    
    return unknown_format unless @format_time.valid?
    
    correct_format
  end

  def status
    @status_code
  end

  def body
    ["#{@message}"]
  end

  def correct_format
    @status_code = 200
    @message = @format_time.time_format
  end

  def unknown_format
    @status_code = 400
    @message = "Unknown time format #{@incorrect}"
  end

end
