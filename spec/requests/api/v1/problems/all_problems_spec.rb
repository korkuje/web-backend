require 'rails_helper'
resource 'Problems all_problems' do
  let(:line1)    { FactoryGirl.create(:line) }
  let(:line2)    { FactoryGirl.create(:line) }
  let(:user)      { FactoryGirl.create(:user) }
  let!(:problem1)  { FactoryGirl.create(:problem, line: line1, user: user) }
  let!(:problem2)  { FactoryGirl.create(:problem, line: line2, user: user) }

  example 'should return list of all problems' do
    get '/api/v1/all_problems'
    resp = JSON.parse(response.body)

    expect(resp['problems'].count).to eq(2)
  end
end
