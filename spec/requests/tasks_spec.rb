require 'rails_helper'

RSpec.describe 'Tasks', type: :request do
  describe 'GET /index' do
    it 'render index template' do
      get tasks_path
      expect(response).to have_http_status(:ok)
    end
  end
end
