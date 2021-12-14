if ENV['API_MODE']
  class ApplicationController < ActionController::API
  end
else
  class ApplicationController < ActionController::Base
  end
end
