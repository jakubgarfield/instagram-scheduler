class InstagramAccountsController < ApplicationController
  before_action :set_instagram_account, only: [:show, :edit, :update, :destroy]

  def index
    @instagram_accounts = current_user.instagram_accounts.all
  end

  def show
  end

  def new
    @instagram_account = current_user.instagram_accounts.build
  end

  def edit
  end

  def create
    @instagram_account = current_user.instagram_accounts.build(instagram_account_params)

    respond_to do |format|
      if @instagram_account.save
        format.html { redirect_to @instagram_account, notice: 'Instagram account was successfully created.' }
        format.json { render :show, status: :created, location: @instagram_account }
      else
        format.html { render :new }
        format.json { render json: @instagram_account.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @instagram_account.update(instagram_account_params)
        format.html { redirect_to @instagram_account, notice: 'Instagram account was successfully updated.' }
        format.json { render :show, status: :ok, location: @instagram_account }
      else
        format.html { render :edit }
        format.json { render json: @instagram_account.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @instagram_account.destroy
    respond_to do |format|
      format.html { redirect_to instagram_accounts_url, notice: 'Instagram account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_instagram_account
    @instagram_account = current_user.instagram_accounts.find(params[:id])
  end

  def instagram_account_params
    params.require(:instagram_account).permit(:username, :password)
  end
end
