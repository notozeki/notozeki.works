# Config
set :site_name, 'notozeki works (仮)'
set :css_dir, 'assets/css'
set :js_dir, 'assets/js'
set :images_dir, 'assets/img'
set :fonts_dir, 'assets/font'

# Helpers
helpers do
  def make_title
    [current_page.data.title, config[:site_name]].compact.join(' | ')
  end

  def nav_link(text, path)
    here = normalize_path(current_path)
    content_tag :li, class: (here == path ? 'active' : '') do
      link_to text, path
    end
  end

  def normalize_path(path)
    unless path.start_with? '/'
      path = '/' + path
    end
    path.sub!(/index.html$/, '')
  end
end

# Extensions
activate :autoprefixer
activate :directory_indexes

# Rack middleware
use Rack::GoogleAnalytics, tracker: 'UA-58422142-1'

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
end
