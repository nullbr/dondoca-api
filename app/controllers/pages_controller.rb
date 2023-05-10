# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @application = Doorkeeper::Application.first

    return if @application.nil?

    @application = {
      name: @application.name,
      client_id: @application.uid,
      client_secret: @application.secret
    }
  end
end
