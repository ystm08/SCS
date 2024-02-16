class User::SearchesController < ApplicationController
  before_action :authenticate_user!
end
