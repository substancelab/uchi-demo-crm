module Uchi
  class ApplicationController < Uchi::Controller
    include Authentication

    def uchi_user
      return nil unless authenticated?

      Current.session.user
    end

    def new_session_path
      main_app.new_session_path
    end
  end
end
