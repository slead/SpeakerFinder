# Controllers which require full resource security should inherit from this
# class. The user also needs to be authenticated to access all controller actions.
class SecuredController < ApplicationController
  # This filter is invoked before the specified actions new, create, edit and update
  # The filter calls the function authenticate_user! in Devise. Devise by default
  # is configured to redirect the user to the sign_in url if the user does not have
  # a valid session cookie. If a valid session cookie exists the action is called
  # as per normal
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update]
end
