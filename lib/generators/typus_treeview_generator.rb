class TypusTreeviewGenerator < Rails::Generators::Base
  class << self
    def source_root
      File.expand_path("../templates", __FILE__)
    end
  end

  def copy_views
    copy_file "views/sidebar.html.erb", "app/views/admin/helpers/sidebar/_sidebar.html.erb"
  end

  def copy_assets
    copy_file "assets/jquery.treeview.js", "public/javascripts/jquery.treeview.js"
    copy_file "assets/jquery.treeview.css", "public/stylesheets/jquery.treeview.css"
    directory "assets/images", "public/images/jquery_treeview"
  end
end
