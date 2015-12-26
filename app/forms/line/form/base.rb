class Line::Form::Base
  include ActiveModel::Model
  include Virtus.model

  attr_reader :line

  attribute :name, String

  validates :name, presence: true


  def save
    return false unless valid?
    persist!
  rescue ActiveRecord::RecordNotUnique
    errors.add(:name, 'is not unique')
    false
  end

  private

  def persist!
    @line = Line.create!(attributes)
  end
end
