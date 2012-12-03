require 'active_support'
require "rails-excel/version"
require 'rails-excel/delegation'
require 'rails-excel/template_handler'

module RailsExcel
  @available_strategies = Hash.new

  class << self
    module_eval do

      attr_accessor :strategy
      attr_reader :available_strategies

      def add_strategy(name, instance)
        strategy = instance
        if Class === instance && !instance.respond_to?(:compile)
          strategy = instance.new
        end
        @available_strategies[name.to_sym] = strategy
      end

      def configure(&block)
        yield(self)
        ::ActionView::Base.send :include, RailsExcel::Delegation::View
        ::ActionController::Base.send :include,RailsExcel::Delegation::Controller
        ActionView::Template.register_template_handler :rxls, RailsExcel::TemplateHandler
      end

    end
  end

end
