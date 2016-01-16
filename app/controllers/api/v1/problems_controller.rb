class Api::V1::ProblemsController < ApplicationController
  def all_problems
    problems = Problem.all
    render json: problems, each_serializer: ProblemSerializer
  end

  def show
    line = Line.find(params[:line_id])
    problem = line.problems.find(params[:id])
    render json: problem, serializer: ProblemSerializer
  end

  def index
    line = Line.find(params[:line_id])
    problems = line.problems
    render json: problems, each_serializer: ProblemSerializer
  end

  def create
    line = Line.find(params[:line_id])
    user = User.find_by!(phone_uuid: params[:phone_uuid])
    form = Problem::Form::Create.new(params, user, line)
    if form.save
      render json: form.problem, serializer: ProblemSerializer
    else
      render json: { errors: form.errors }, status: 400
    end

  rescue ArgumentError => e
    render json: {errors: e }
  end
end
