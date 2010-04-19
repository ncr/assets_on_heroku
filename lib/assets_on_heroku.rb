module AssetsOnHeroku
  class Rack
    def initialize(app)
      @app = app
      
      setup_sass
      setup_rails
      setup_merb
    end
    
    def call(env)
      root = "tmp/public"
      path = ::Rack::Request.new(env).path
      
      is_stylesheet_request = path.start_with?("/stylesheets/") && path.end_with?(".css")
      is_javascript_request = path.start_with?("/javascripts/") && path.end_with?(".js")
      
      if is_stylesheet_request || is_javascript_request
        ::Rack::File.new(root).call(env)
      else
        @app.call(env)
      end
    end
    
    private 
    
    def setup_sass      
      Sass::Plugin.options = {
        :css_location      => "tmp/public/stylesheets",
        :template_location => "public/stylesheets/sass"
      } if defined?(Sass::Plugin)
    end
    
    def setup_rails
      ActionView::Helpers::AssetTagHelper.module_eval do
        def write_asset_file_contents_with_heroku(broken_joined_asset_path, asset_paths)
          fixed_joined_asset_path = broken_joined_asset_path.sub("public", "tmp/public")
          write_asset_file_contents_without_heroku(fixed_joined_asset_path, asset_paths)
        end
        alias_method_chain :write_asset_file_contents, :heroku
      end if defined?(ActionView::Helpers::AssetTagHelper)
    end
    
    def setup_merb
      # Coming soon!
    end
  end
end
