class KeyValuesController < ApplicationController
  before_action :set_key_value, only: [:show, :update, :destroy]

  # GET /keys/:key
  def show
    render json: @key_value
  rescue ActiveRecord::RecordNotFound
    render status: :not_found
  end

  # POST /keys
  def create
    @key_value = KeyValue.new(key_value_params)
    if KeyValue.exists?(key: @key_value.key)
      render status: :conflict
    elsif @key_value.save
      render json: @key_value, status: :created
    else
      render json: @key_value.errors, status: :unprocessable_entity
    end
  end

  # PATCH /keys/:key/:value
  def update
    if @key_value.update(value: params[:value])
      render json: @key_value
    else
      render json: @key_value.errors, status: :unprocessable_entity
    end
  end

  # DELETE /keys/:key
  def destroy
    @key_value.destroy
    render status: :no_content
  end

  private

    def set_key_value
      @key_value = KeyValue.find_by!(key: params[:key])
    end

    def key_value_params
      params.require(:key_value).permit(:key, :value)
    end
end