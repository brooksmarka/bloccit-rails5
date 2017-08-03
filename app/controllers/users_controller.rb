class UsersController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.save
      flash[:notice] = "Welcome to Bloccit #{@user.name}!"
      redirect_to root_path
    else
      flash.now[:alert] = "There was an error creating your account.  Please try again."
      render :new
    end
  end

  def confirm
    @user = User.new
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

  end


    #confirm should create a new user from the params hash and set its attributes appropriately.
    #Send the params hash back to the create action in UsersController to save the params to the database after user confirmation.
    #Use a button in the confirm form to achieve this:

    #<%= button_to "Yes", {controller: "users", action: "create", params: params}, class: 'btn btn-success' %>

    #When a user clicks the "No" button it should take them back to the initial sign up view.


end
