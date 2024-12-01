require_relative 'config/config'

module Dokno
  class Engine < ::Rails::Engine
    isolate_namespace Dokno

    config.generators do |g|
      g.test_framework :rspec
    end

    initializer 'Dokno precompile', group: :all do |app|
      app.config.assets.precompile << "dokno_manifest.js"
    end

    initializer 'local_helper.action_controller' do
      ActiveSupport.on_load :action_controller_base do
        helper Dokno::ApplicationHelper
      end
    end
  end
end
