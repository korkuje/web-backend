class Api::V1::LinesController < ApplicationController
  def index
    lines = Line.all
    render json: lines, each_serializer: LineSerializer
  end

  def show
    line = Line.find(params[:id])
    render json: line, serializer: LineSerializer
  end
end
