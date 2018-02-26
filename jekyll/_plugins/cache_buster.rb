# Plugin to add environment variables to the `site` object in Liquid templates

module Jekyll

  class EnvironmentVariablesGenerator < Generator

    def generate(site)
      site.config['js_md5'] = ENV['JS_MD5']
      site.config['css_md5'] = ENV['CSS_MD5']
      site.config['svg_md5'] = ENV['SVG_MD5']
    end

  end

end
