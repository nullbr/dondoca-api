# frozen_string_literal: true

json.user do
  json.partial! '/api/v1/users/info', user: @user

  json.access_token         @access_token.token
  json.token_type           'Bearer'
  json.expires_in           @access_token.expires_in
  json.refresh_token        @access_token.refresh_token
end
