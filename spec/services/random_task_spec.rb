require 'rails_helper'

RSpec.describe do 
    let(:random_task) { RandomTask.generate }

    before do
        stub_request(:get, 'https://random-word-form.repl.co/random/noun').to_return(status: 200, body: "[\"rspec test\"]")
    end

    it 'generates a random task and adds it to the database' do
        expect {random_task}.to change(Todo, :count).by(1)
        expect(random_task.description).to include('rspec test')
    end
end