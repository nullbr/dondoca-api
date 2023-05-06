# frozen_string_literal: true

namespace :deploy do
  namespace :check do
    before :linked_files, :set_master_key do
      on roles(:app), in: :sequence, wait: 10 do
        unless test("[ -f #{shared_path}/config/master.key ]") && test("[ -f #{shared_path}/.env.production ]")
          upload! 'config/master.key', "#{shared_path}/config/master.key", '.env.production', "#{shared_path}/.env.production"
        end
      end
    end
  end
end
