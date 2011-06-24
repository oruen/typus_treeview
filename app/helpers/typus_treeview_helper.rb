module TypusTreeviewHelper
  def treeview
    model = @object_name.classify.constantize
    if model.respond_to?(:roots) && method = Typus.treeview[@object_name.to_sym]
      res = ''
      res << javascript_include_tag("jquery.treeview")
      res << stylesheet_link_tag("jquery.treeview")
      res << (content_tag :ul, :id => "treeview" do
        model.roots.map do |root|
          treeview_draw(root, method)
        end.join.html_safe
      end)
      res << javascript_tag('$(document).ready(function(){$("#treeview").treeview({persist: "location"});});')
      res.html_safe
    end
  end

  def treeview_draw node, method
    content_tag :li, :class => "closed" do
      res = ''
      name = method.is_a?(Proc) ? method.call(node) : node.send(method)
      res << content_tag(:span, link_to(name, { :action => "edit",
                                                :id => node.id,
                                                :host => request.host,
                                                :port => request.port == 80 ? nil : request.port,
                                                :protocol => request.scheme }))
      if node.children.size > 0
        res << (content_tag :ul do
          node.children.map do |child|
            treeview_draw(child, method)
          end.join.html_safe
        end)
      end
      res.html_safe
    end
  end
end
