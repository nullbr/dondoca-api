# frozen_string_literal: true

require 'swagger_helper'
require 'rails_helper'

# Describe the clients API
describe 'Client API' do
  before do
    @token = "Bearer #{create(:doorkeeper_access_token).token}"
    @client = create(:client).attributes
  end
  # GET /clients
  # Get all clients
  path '/api/v1/clients' do
    get 'Get all clients' do
      tags 'Client'
      security [Bearer: []]
      parameter name: :Authorization, in: :header, type: :string, required: true,
                description: 'Authorization token'
      response '200', 'clients found' do
        let(:Authorization) { @token }
        run_test!
      end
      response '401', 'unauthorized' do
        let(:Authorization) { 'invalid' }
        run_test!
      end
    end
  end

  # GET /clients/:id
  # Get a client by id
  path '/api/v1/clients/{id}' do
    get 'Get a client' do
      tags 'Client'
      security [Bearer: []]
      parameter name: :Authorization, in: :header, type: :string, required: true,
                description: 'Authorization token'
      parameter name: :id, in: :path, type: :string, required: true,
                description: 'ID of the client'
      response '200', 'client found' do
        let(:Authorization) { @token }
        let(:id) { @client['id'] }
        run_test!
      end
      response '404', 'client not found' do
        let(:Authorization) { @token }
        let(:id) { 'invalid' }
        run_test!
      end
      response '401', 'unauthorized' do
        let(:Authorization) { 'invalid' }
        let(:id) { @client['id'] }
        run_test!
      end
    end
  end

  # POST /clients
  # Create a client
  path '/api/v1/clients' do
    post 'Create a client' do
      tags 'Client'
      consumes 'application/json', 'application/xml'
      security [Bearer: []]
      parameter name: :Authorization, in: :header, type: :string, required: true,
                description: 'Authorization token'
      parameter name: :client, in: :body, schema: {
        type: :object,
        properties: {
          client: {

            title: { type: :string },
            body: { type: :string }
          }
        },
        required: %w[title body]
      }
      response '201', 'client created' do
        let(:Authorization) { @token }
        let(:client) { { first_name: 'Hobbit', last_name: 'client', phone_number: '(11)99999999', birthday: (Time.zone.now - 20.years) } }
        run_test!
      end
      response '401', 'unauthorized' do
        let(:Authorization) { 'invalid' }
        let(:client) { { client: attributes_for(:client) } }
        run_test!
      end
    end
  end
end
