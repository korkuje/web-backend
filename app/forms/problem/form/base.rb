class Problem::Form::Base
  include ActiveModel::Model
  include Virtus.model
  attr_reader :problem

  attribute :lat,       Float
  attribute :line,      Line
  attribute :lng,       Float
  attribute :reason,    Integer
  attribute :user,      User

  validates :lat, :line, :reason, :user, presence: :true

  def initialize(params, user, line)
    @lat =    params.fetch(:lat)
    @lng =    params.fetch(:lng)
    @reason = Integer(params.fetch(:reason))
    @line =   line
    @user =   user
  end

  def save
    return false unless valid?
    persist!
  end

  private

  def persist!
    @problem = Problem.create!(attributes.merge({user: @user, line: @line}))
  end
end
