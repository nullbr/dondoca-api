# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class WorkersControllerTest < ActionDispatch::IntegrationTest
      setup do
        @worker = workers(:one)
        create(:doorkeeper_application)
        access_token = create(:doorkeeper_access_token).token
        @token = "Bearer #{access_token}"
      end

      test 'should get index' do
        get(api_v1_workers_url)
        assert_response :success
      end

      # test 'should not get index if signed out' do
      #   get(api_v1_workers_url, headers: { 'Authorization' => nil })
      #   assert_response :unauthorized
      # end

      test 'should get new' do
        get(new_api_v1_worker_url, headers: { 'Authorization' => @token })
        assert_response :success
      end

      test 'should create worker' do
        assert_difference('Worker.count') do
          post api_v1_workers_url,
               params: { worker: { first_name: @worker.first_name, last_name: @worker.last_name, phone_number: @worker.phone_number, job: @worker.job } },
               headers: { 'Authorization' => @token }
        end
        assert_response :success
      end

      test 'should show worker' do
        get api_v1_worker_url(@worker), headers: { 'Authorization' => @token }
        assert_response :success
      end

      test 'should get edit' do
        get edit_api_v1_worker_url(@worker), headers: { 'Authorization' => @token }
        assert_response :success
      end

      test 'should update worker' do
        patch api_v1_worker_url(@worker),
              params: { worker: { first_name: @worker.first_name, last_name: @worker.last_name, phone_number: @worker.phone_number, job: @worker.job } },
              headers: { 'Authorization' => @token }
        assert_response :success
      end

      test 'should destroy worker' do
        assert_difference('Worker.count', -1) do
          delete api_v1_worker_url(@worker),
                 headers: { 'Authorization' => @token }
        end

        assert_response :success
      end
    end
  end
end
