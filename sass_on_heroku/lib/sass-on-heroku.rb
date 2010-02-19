module Sass
  class Heroku
    def initialize(app)
      @app = app
    end
    
    def call(env)
      if /^\/stylesheets\/(\S+.css)/ix === env['PATH_INFO']
        file = Rack::File.new(nil)
        path = [Sass::Plugin.options[:css_location], $1].join("/")
        file.path = path
        File.exist?(path) ? file.serving : @app.call(env)
      else
        @app.call(env)
      end
    end
  end
end
