require 'rails_helper'

resource 'Lines index', type: :controller do
  get '/api/v1/lines' do
    let!(:line) { FactoryGirl.create(:line) }
    let!(:line2) { FactoryGirl.create(:line, name: 'asd') }

    example 'should return list of lines' do
      do_request
      resp = JSON.parse(response_body)

      byebug
    end
  end
end
