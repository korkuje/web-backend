require 'rails_helper'

RSpec.describe Problem::Form::Create do
  let(:user)            { FactoryGirl.create(:user) }
  let(:line)            { FactoryGirl.create(:line) }
  let(:problem_params)  { FactoryGirl.attributes_for(:problem) }
  let(:form)            { Problem::Form::Create.new(problem_params, user, line) }

  it 'should save the form if params are proper' do
    expect do
      form.save
    end.to change{ Problem.count }.by(1)
  end
end
