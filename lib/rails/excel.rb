require 'rails-excel'

module Rails
  module Excel
    class << self
      module_eval do
        def add_strategy(name, instance)
          ActiveSupport::Deprecation.warn("Rails::Excel is deprecated in favor of RailsExcel",caller)
          RailsExcel.add_strategy(name, instance)
        end
        def configure(&block)
          ActiveSupport::Deprecation.warn("Rails::Excel is deprecated in favor of RailsExcel",caller)
          RailsExcel.configure(&block)
        end
      end
    end

  end
end
