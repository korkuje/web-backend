require 'rails_helper'

resource 'Problems index' do
  let!(:problem) { FactoryGirl.create(:problem_with_line_and_user) }
  let(:line) { problem.line }

  example 'should return list of problems of given line' do
    get "/api/v1/lines/#{line.id}/problems"
    resp = JSON.parse(response.body)
    expect(resp['problems'].count).to eq(1)
    expect(resp['problems'][0]['id']).to eq(problem.id)
    expect(resp['problems'][0]['created_at']).to eq(problem.created_at.to_s)
    expect(resp['problems'][0]['lat']).to eq(problem.lat)
    expect(resp['problems'][0]['line_id']).to eq(problem.line_id)
    expect(resp['problems'][0]['lng']).to eq(problem.lng)
    expect(resp['problems'][0]['reason']).to eq(problem.reason)
    expect(resp['problems'][0]['user_id']).to eq(problem.user_id)

  end
end
