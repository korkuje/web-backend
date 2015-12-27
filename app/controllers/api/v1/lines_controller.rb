class Api::V1::LinesController < ApplicationController
  def index
    lines = Line.all
    render json: lines, each_serializer: LineSerializer
  end

  def show
    line = Line.find(params[:id])
  end
end
