# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class ClientsControllerTest < ActionDispatch::IntegrationTest
      setup do
        @client = clients(:one)
        create(:doorkeeper_application)
        access_token = create(:doorkeeper_access_token).token
        @token = "Bearer #{access_token}"
      end

      test 'should get index' do
        get(api_v1_clients_url, headers: { 'Authorization' => @token })
        assert_response :success
      end

      test 'should not get index if signed out' do
        get(api_v1_clients_url, headers: { 'Authorization' => nil })
        assert_response :unauthorized
      end

      test 'should get new' do
        get(new_api_v1_client_url, headers: { 'Authorization' => @token })
        assert_response :success
      end

      test 'should create client' do
        assert_difference('Client.count') do
          post api_v1_clients_url,
               params: { client: { first_name: @client.first_name, last_name: @client.last_name, phone_number: @client.phone_number, birthday: @client.birthday } },
               headers: { 'Authorization' => @token }
        end
        assert_response :success
      end

      test 'should show client' do
        get api_v1_client_url(@client), headers: { 'Authorization' => @token }
        assert_response :success
      end

      test 'should get edit' do
        get edit_api_v1_client_url(@client), headers: { 'Authorization' => @token }
        assert_response :success
      end

      test 'should update client' do
        patch api_v1_client_url(@client),
              params: { client: { first_name: @client.first_name, last_name: @client.last_name, phone_number: @client.phone_number, birthday: @client.birthday } },
              headers: { 'Authorization' => @token }
        assert_response :success
      end

      test 'should destroy client' do
        assert_difference('Client.count', -1) do
          delete api_v1_client_url(@client),
                 headers: { 'Authorization' => @token }
        end

        assert_response :success
      end
    end
  end
end
