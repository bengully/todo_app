require 'rails_helper'

RSpec.describe Api::TodosController, type: :controller do
    describe 'Index' do
        before { create(:todo) }
        
        it 'returns all todos' do
            get :index

            json_response = JSON.parse(response.body)
            expect(json_response.first['task']).to eq 'Make a test'
            expect(json_response.first['description']).to eq 'Have test work'
            expect(json_response.first['status']).to eq 0
        end
    end
end
