class PostsController < ApplicationController
  before_action :set_instagram_account
  before_action :set_post, only: [:edit, :update, :destroy]
  before_action :check_instagram_account_presence

  def new
    @post = @instagram_account.posts.new(scheduled_at: Time.now)
  end

  def edit
  end

  def create
    @post = @instagram_account.posts.new(post_params)
    @post.picture = params[:post][:file]

    respond_to do |format|
      if @post.save
        format.html { redirect_to instagram_account_path(@instagram_account), notice: 'Picture was scheduled successfully.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to instagram_account_path(@instagram_account), notice: 'Picture was scheduled successfully.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to instagram_account_path(@instagram_account), notice: 'Picture was deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def set_instagram_account
    @instagram_account = current_user.instagram_accounts.find(params[:instagram_account_id])
  end

  def set_post
    @post = @instagram_account.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :scheduled_at)
  end
end
