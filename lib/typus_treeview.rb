module TypusTreeview
  class Engine < Rails::Engine
    initializer 'typus_treeview.helper' do |app|
      ActionView::Base.send :include, TypusTreeviewHelper
    end
  end
end

module Typus
  class << self
    def treeview= val
      @treeview = val
    end

    def treeview
      @treeview || {}
    end
  end
end
