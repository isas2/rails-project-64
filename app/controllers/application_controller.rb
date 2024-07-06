# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def not_found
    render file: Rails.public_path.join('404.html').to_s, layout: false, status: :not_found
  end
end
