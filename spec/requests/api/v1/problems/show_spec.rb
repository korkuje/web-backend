require 'rails_helper'

resource 'Problems show' do
  let!(:problem) { FactoryGirl.create(:problem_with_line_and_user) }
  let(:line) { problem.line }
  let!(:line_id) { line.id }
  let!(:id) {problem.id}

  example 'should return one line' do
    get "/api/v1/lines/#{line_id}/problems/#{id}"
    resp = JSON.parse(response.body)

    expect(status).to eq(200)
    expect(resp['problem']['id']).to eq(problem.id)
    expect(resp['problem']['created_at']).to eq(problem.created_at.to_s)
    expect(resp['problem']['lat']).to eq(problem.lat)
    expect(resp['problem']['line_id']).to eq(problem.line_id)
    expect(resp['problem']['lng']).to eq(problem.lng)
    expect(resp['problem']['reason']).to eq(problem.reason)
    expect(resp['problem']['user_id']).to eq(problem.user_id)
  end

  example 'should return record not foudnd when wrong id' do
    get "/api/v1/lines/#{line_id}/problems/9999"
    resp = JSON.parse(response.body)

    expect(status).to eq(404)
    expect(resp['errors']).to be_present
    expect(resp['errors'].count).to eq(1)
    expect(resp['errors'][0]).to eq(RECORD_NOT_FOUND_MESSAGE)
  end
end

