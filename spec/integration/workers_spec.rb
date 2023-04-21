# frozen_string_literal: true

require 'swagger_helper'
require 'rails_helper'

# Describe the workers API
describe 'Worker API' do
  before do
    @token = "Bearer #{create(:doorkeeper_access_token).token}"
    @worker = create(:worker).attributes
    puts @worker
    puts ''
  end
  # GET /workers
  # Get all workers
  path '/api/v1/workers' do
    get 'Get all workers' do
      tags 'Worker'
      security [Bearer: []]
      parameter name: :Authorization, in: :header, type: :string, required: true,
                description: 'Authorization token'
      response '200', 'workers found' do
        let(:Authorization) { @token }
        run_test!
      end
      response '401', 'unauthorized' do
        let(:Authorization) { 'invalid' }
        run_test!
      end
    end
  end

  # GET /workers/:id
  # Get a worker by id
  path '/api/v1/workers/{id}' do
    get 'Get a worker' do
      tags 'Worker'
      security [Bearer: []]
      parameter name: :Authorization, in: :header, type: :string, required: true,
                description: 'Authorization token'
      parameter name: :id, in: :path, type: :string, required: true,
                description: 'ID of the worker'
      response '200', 'worker found' do
        let(:Authorization) { @token }
        let(:id) { @worker['id'] }
        run_test!
      end
      response '404', 'worker not found' do
        let(:Authorization) { @token }
        let(:id) { 'invalid' }
        run_test!
      end
      response '401', 'unauthorized' do
        let(:Authorization) { 'invalid' }
        let(:id) { @worker['id'] }
        run_test!
      end
    end
  end

  # POST /workers
  # Create a worker
  path '/api/v1/workers' do
    post 'Create a worker' do
      tags 'Worker'
      consumes 'application/json', 'application/xml'
      security [Bearer: []]
      parameter name: :Authorization, in: :header, type: :string, required: true,
                description: 'Authorization token'
      parameter name: :worker, in: :body, schema: {
        type: :object,
        properties: {
          worker: {

            title: { type: :string },
            body: { type: :string }
          }
        },
        required: %w[title body]
      }
      response '302', 'redirected' do
        let(:Authorization) { @token }
        let(:worker) { { first_name: 'Hobbit', last_name: 'worker', phone_number: '(11)99999999', job: 'job' } }
        run_test!
      end
      response '401', 'unauthorized' do
        let(:Authorization) { 'invalid' }
        let(:worker) { { worker: attributes_for(:worker) } }
        run_test!
      end
    end
  end
end
