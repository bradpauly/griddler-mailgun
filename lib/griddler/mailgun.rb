require 'griddler'
require "griddler/mailgun/version"
require 'griddler/mailgun/adapter'

module Griddler
  module Mailgun
  end
end

Griddler.adapter_registry.register(:mailgun, Griddler::Mailgun::Adapter)