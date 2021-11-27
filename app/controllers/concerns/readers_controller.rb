class ReadersController < ApplicationController
    skip_before_action :authenticate_user!
    
    layout 'readers'
end