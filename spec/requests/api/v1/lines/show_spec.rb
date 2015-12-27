require 'rails_helper'

resource 'Lines show', type: :controller do
  get '/api/v1/lines/:id' do
    let!(:line) { FactoryGirl.create(:line) }
    let!(:id) { line.id }

    example 'should return one line' do
      do_request
      resp = JSON.parse(response_body)

      byebug
    end
  end
end
