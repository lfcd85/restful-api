class HomeController < ApplicationController
  def index
    render json: { message: "APIs are implemented at /recipes." }
  end
end
