module Uchi
  class ApplicationController < ActionController::Base
    include Authentication

    # before_action { raise "OMG" }

    def new_session_path
      main_app.new_session_path
    end
  end
end
