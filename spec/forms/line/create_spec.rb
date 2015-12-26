require 'rails_helper'

RSpec.describe Line::Form::Create do
  let(:line_params) { FactoryGirl.attributes_for(:line) }
  let(:form) { Line::Form::Create.new(line_params) }

  it 'should save the form if params are proper' do
    expect do
      form.save
    end.to change{Line.count}.by(1)
  end

  it 'check uniqueness of name' do
    form.save
    expect(Line.count).to eq(1)
    #try to save it once again
    expect(form.save).not_to be true
  end
end
