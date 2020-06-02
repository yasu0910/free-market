class CardController < ApplicationController
  require "payjp"
  Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_PRIVATE_KEY)

  def pay #payjpとCardのデータベース作成を実施
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to root_path
      else
        redirect_to action: "new"
      end
    end
  end

  def delete #PayjpとCardデータベースを削除
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to root_path
  end

  def show #Cardのデータpayjpに送り情報を取り出す
    @card = Card.where(user_id: current_user.id).first
    if @card.blank?
      redirect_to action: "new" 
    else
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def buy #クレジット購入
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new"
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
      @item = Item.find(params[:item_id])
      @card = Card.where(user_id: current_user.id).first
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_PRIVATE_KEY)
      Payjp::Charge.create(
      amount: @item.price,
      customer: @card.customer_id,
      currency: 'jpy',
      )
      @item.update(buyer_id: current_user.id)
      if @item.buyer_id.blank?
        flash[:buy_alert] = '購入に失敗しました。'
        redirect_to item_path(@item.id)
      else
        flash[:buy_notice] = '購入しました。'
        redirect_to item_path(@item.id)
      end
    end
  end
  
  def confirm
    @item = Item.find(params[:item_id])
    @card = Card.where(user_id: current_user.id).first
  end
end

