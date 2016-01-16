require 'rails_helper'

resource 'Lines index'do
  let!(:line) { FactoryGirl.create(:line) }

  example 'should return list of lines' do
    get '/api/v1/lines'
    resp = JSON.parse(response.body)
    expect(resp['lines'].count).to eq(1)
    expect(resp['lines'][0]['id']).to eq(line.id)
    expect(resp['lines'][0]['name']).to eq(line.name)
  end
end
