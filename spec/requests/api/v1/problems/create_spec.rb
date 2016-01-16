require 'rails_helper'

resource 'Problems create' do
  let(:problem_attributes) { FactoryGirl.attributes_for(:problem) }
  let!(:line) { FactoryGirl.create(:line) }
  let!(:user) { FactoryGirl.create(:user) }
  let(:line_id) { line.id }

  example 'should create problem when all params are present and return serialized problem' do
    post "/api/v1/lines/#{line_id}/problems", params: problem_attributes.merge(phone_uuid: user.phone_uuid)
    binding.pry
    resp = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(Problem.count).to eq(1)
    expect(Problem.last.user_id).to eq(user.id)
    expect(Problem.last.line_id).to eq(line.id)

    problem = Problem.last
    expect(resp['problem']['id']).to eq(problem.id)
    expect(resp['problem']['created_at']).to eq(problem.created_at.to_s)
    expect(resp['problem']['lat']).to eq(problem.lat)
    expect(resp['problem']['line_id']).to eq(problem.line_id)
    expect(resp['problem']['lng']).to eq(problem.lng)
    expect(resp['problem']['reason']).to eq(problem.reason)
    expect(resp['problem']['user_id']).to eq(problem.user_id)
  end

  example 'should return error on missing parameter' do
    attributes = problem_attributes.merge(phone_uuid: user.phone_uuid)
    attributes_to_be_missing = [:lat, :lng, :reason]

    attributes_to_be_missing.each do |missing_param|
      post "/api/v1/lines/#{line_id}/problems", params: attributes.reject{|key, _| key == missing_param}

      resp = JSON.parse(response.body)
      expect(response.status).to eq(422)
      expect(resp['error']).to eq("param is missing or the value is empty: #{missing_param.to_s}")
    end
  end
end
