require 'rails_helper'

resource 'Lines show', type: :controller do
  get '/api/v1/lines/:id' do
    let!(:line) { FactoryGirl.create(:line) }
    let!(:id) { line.id }

    example 'should return one line' do
      do_request
      resp = JSON.parse(response_body)

      expect(status).to eq(200)
      expect(resp['line']['id']).to eq(id)
      expect(resp['line']['name']).to eq(line.name)
      expect(resp['errors']).not_to be_present
    end

    example 'should return record not foudnd when wrong id' do
      do_request(id: 9999)
      resp = JSON.parse(response_body)

      expect(status).to eq(404)
      expect(resp['errors']).to be_present
      expect(resp['errors'].count).to eq(1)
      expect(resp['errors'][0]).to eq(RECORD_NOT_FOUND_MESSAGE)
    end
  end
end
