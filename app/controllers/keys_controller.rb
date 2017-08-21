class KeysController < ApplicationController

  skip_before_action :verify_authenticity_token
  def create
    unless params.has_key? :id
      redirect_to root_path
      return
    end

    redirect_to key_path(params[:id])
  end

  def show
    key = Key.find_matching_key(params[:id])
    if key.nil?
      redirect_to root_path, :flash => { :error => "Invalid key - please check and try again" }
      return
    end

    @game = key.game

    if key.redeemed?
      @platform_key = key.platform_key
      @platform = @platform_key.platform
      render "redeemed"
    else
      @key = key
      @available_platforms = @game.available_platforms
      render "redeemable"
    end
  end

  def redeem
    key = Key.where(id: params[:key_id]).first
    if key.nil?
      redirect_to root_path, :flash => { :error => "Invalid key - please check and try again" }
      return
    end

    platform = Platform.where(id: params[:platform_id])
    if platform.nil?
      redirect_to key_path(key.friendly_key), :flash => { :error => "Could not find platform" }
    end

    if key.redeem_for! platform
      redirect_to key_path(key.friendly_key)
    else
      redirect_to key_path(key.friendly_key), :flash => { :error => "Could not redeem for platform" }
    end
  end

end
