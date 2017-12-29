class UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def create
    user = User.new(email: params[:email], password: params[:password])
    if user.save
      render json: {email: user.email, id: user.id, token: issue_token({id: user.id}), appointments: user.appointments, start_time: user.start_time, end_time: user.end_time}
    else
      render json: {error: "Invalid username or password"}, status: 401
    end
  end

  def update
    user = User.find(params[:id])
    user.update(start_time: params[:start_time], end_time: params[:end_time])
    render json: user
  end

  def destroy
    users = User.all
    user = User.find(params[:id])
    user.delete
    render json: users
  end





end
