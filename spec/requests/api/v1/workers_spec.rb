# frozen_string_literal: true

require 'swagger_helper'
require 'rails_helper'

# Describe the workers API
describe 'Worker API' do
  before do
    @token = "Bearer #{create(:doorkeeper_access_token).token}"
    @worker = create(:worker).attributes
    @client_id = create(:doorkeeper_application).uid
    puts @client_id
  end
  # GET /workers
  # Get all workers
  path '/api/v1/workers' do
    get 'Get all workers' do
      tags 'Worker'
      parameter name: :Client, in: :header, type: :string, required: true,
                description: 'Client id'
      response '200', 'workers found' do
        let(:Client) { @client_id }
        run_test!
      end
      response '401', 'client invalid' do
        let(:Authorization) { @token }
        let(:Client) { 'invalid' }
        let(:id) { @worker['id'] }
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
      parameter name: :Client, in: :header, type: :string, required: true,
                description: 'Client id'
      parameter name: :id, in: :path, type: :string, required: true,
                description: 'ID of the worker'
      response '200', 'worker found' do
        let(:Authorization) { @token }
        let(:Client) { @client_id }
        let(:id) { @worker['id'] }
        run_test!
      end
      response '404', 'worker not found' do
        let(:Authorization) { @token }
        let(:Client) { @client_id }
        let(:id) { 'invalid' }
        run_test!
      end
      response '401', 'unauthorized' do
        let(:Authorization) { 'invalid' }
        let(:Client) { @client_id }
        let(:id) { @worker['id'] }
        run_test!
      end
      response '401', 'client invalid' do
        let(:Authorization) { @token }
        let(:Client) { 'invalid' }
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
      parameter name: :Client, in: :header, type: :string, required: true,
                description: 'Client id'
      parameter name: :worker, in: :body, schema: {
        properties: {
          worker: {
            first_name: { type: :string },
            last_name: { type: :string },
            job: { type: :string },
            instagram: { type: :string },
            image_url: { type: :string },
            description: { type: :string },
            phone_number: { type: :bigint },
            categories: { type: :array }
          }
        },
        required: %w[first_name]
      }
      response '201', 'worker created' do
        let(:Authorization) { @token }
        let(:Client) { @client_id }
        let(:worker) { { worker: attributes_for(:worker) } }
        run_test!
      end
      response '401', 'unauthorized' do
        let(:Authorization) { 'invalid' }
        let(:Client) { @client_id }
        let(:worker) { { worker: attributes_for(:worker) } }
        run_test!
      end
    end
  end
end
