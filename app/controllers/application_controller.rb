class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
      ##choose url to visit
      @app_url = params[:url] || "http://honeybelleshop.com/"

      #ensure that it starts with http
      @app_url = "http://#{app_url}" unless @app_url.starts_with?("http")

      begin
        #retrieve the webpage
        @news = HTTParty.get(@app_url)
      rescue StandardError
        #if error occurs, flash an error
        @news = OpenStruct.new(:code => nil, :message => "Domain not found.")
      end
  end
end




