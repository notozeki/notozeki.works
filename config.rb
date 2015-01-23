# Config
set :site_name, 'notozeki works'

set :css_dir, 'assets/css'
set :js_dir, 'assets/js'
set :images_dir, 'assets/img'
set :fonts_dir, 'assets/font'
set :partials_dir, 'partials'

set :trailing_slash, false

set :markdown_engine, :redcarpet
set :markdown, tables: true, autolink: true, fenced_code_blocks: true

# Helpers
helpers do
  def make_title
    [current_page.data.title, config[:site_name]].compact.join(' | ')
  end

  def nav_link(text, path)
    here = normalize_path(current_path)
    active = path == '/' ? (here == '/') : here.start_with?(path)
    content_tag :li, class: (active ? 'active' : '') do
      if active
        link_to "#{text} <span class=\"sr-only\">(今見ているページ)</span>", path
      else
        link_to text, path
      end
    end
  end

  def normalize_path(path)
    unless path.start_with? '/'
      path = '/' + path
    end
    path.sub!(/index.html$/, '')
  end

  def time_tag_ja(date)
    content_tag :time, datetime: date.strftime('%F') do
      date.strftime('%Y年%-m月%-d日')
    end
  end
end

# Extensions
activate :blog do |blog|
  blog.prefix = 'blog'
  blog.permalink = '{title}.html'
  blog.layout = 'blog'
end
activate :autoprefixer
activate :directory_indexes

# Rack middleware
use Rack::GoogleAnalytics, tracker: 'UA-58422142-1'

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
end
