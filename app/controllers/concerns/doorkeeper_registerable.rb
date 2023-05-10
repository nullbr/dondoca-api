# frozen_string_literal: true

module DoorkeeperRegisterable
  extend ActiveSupport::Concern

  def generate_refresh_token
    loop do
      # generate a random token string and return it
      # unless there is already another token with the same string
      token = SecureRandom.hex(32)
      break token unless Doorkeeper::AccessToken.exists?(refresh_token: token)
    end
  end

  def generate_access_token(user, client_app)
    @access_token = Doorkeeper::AccessToken.create(resource_owner_id: user.id,
                                                   application_id: client_app.id,
                                                   refresh_token: generate_refresh_token,
                                                   expires_in: Doorkeeper.configuration.access_token_expires_in.to_i,
                                                   scopes: '')
  end
end
