class CardTypesController < ApplicationController
  before_filter :authenticate_admin!
  
  def index
    @card_types = CardType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @card_types }
    end
  end

  def show
    @card_type = CardType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @card_type }
    end
  end

  def new
    @card_type = CardType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @card_type }
    end
  end

  def edit
    @card_type = CardType.find(params[:id])
  end

  def create
    @card_type = CardType.new(params[:card_type])

    respond_to do |format|
      if @card_type.save
        format.html { redirect_to card_types_url, notice: 'Card type was successfully created.' }
        format.json { render json: @card_type, status: :created, location: @card_type }
      else
        format.html { render action: "new" }
        format.json { render json: @card_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @card_type = CardType.find(params[:id])

    respond_to do |format|
      if @card_type.update_attributes(params[:card_type])
        format.html { redirect_to card_types_url, notice: 'Card type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @card_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @card_type = CardType.find(params[:id])
    @card_type.destroy

    respond_to do |format|
      format.html { redirect_to card_types_url }
      format.json { head :no_content }
    end
  end
end
