# Config
set :site_name, 'notozeki works'
set :site_url, 'https://notozeki.works'

set :css_dir, 'assets/css'
set :js_dir, 'assets/js'
set :images_dir, 'assets/img'
set :fonts_dir, 'assets/font'
set :partials_dir, 'partials'

set :trailing_slash, false

set :markdown_engine, :redcarpet
set :markdown, {
  tables: true,
  autolink: true,
  fenced_code_blocks: true,
  strikethrough: true,
  hard_wrap: true,
  footnotes: true
}

set :blog_thumb_geometry, '150x150'

# Helpers
helpers do
  #
  # View helpers
  #
  def make_title
    title = current_page.data.title ? current_page.data.title : yield_content(:title)
    [title, config[:site_name]].compact.join(' | ')
  end

  def nav_link(text, path)
    here = normalize_path(current_path)
    active = path == '/' ? (here == '/') : here.start_with?(path)
    content_tag :li, class: (active ? 'active' : '') do
      if active
        link_to text + '<span class="sr-only">(今見ているページ)</span>', path
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

  def time_tag(date)
    content_tag :time, datetime: date.strftime('%F') do
      date.strftime('%Y.%m.%d')
    end
  end

  def time_tag_ja(date, with_weekday: false)
    content_tag :time, datetime: date.strftime('%F') do
      if with_weekday
        weekday = %w(日 月 火 水 木 金 土)[date.wday]
        date.strftime('%Y年%-m月%-d日') + "(#{weekday})"
      else
        date.strftime('%Y年%-m月%-d日')
      end
    end
  end

  def fa(name, hidden: false)
    content_tag(:span, class: "fa fa-#{name}", 'aria-hidden' => hidden) {''}
  end

  def gl(name)
    content_tag(:span, class: "glyphicon glyphicon-#{name}") {''}
  end

  def thumb_path(orig_path)
    geometry = config[:blog_thumb_geometry]
    ['', config[:images_dir], geometry, orig_path].join('/')
  end

  def full_url(path)
    config[:site_url] + path
  end

  def thumb_image(article)
    article.data.thumb_image || article.data.header_image
  end

  def has_thumb_image?(article)
    article.data.thumb_image? || article.data.header_image?
  end

  #
  # Pseudo-models
  #
  def upnext_events
    data.events.select{|event| event.date >= Date.today }
  end

  def updates
    (site_updates + blog_updates).sort_by(&:date).reverse
  end

  def latest_updates(max=8)
    updates[0..max]
  end

  def old_updates(max=8)
    updates[(max+1)..-1] || []
  end

  def site_updates
    data.updates.reject(&:deprecated)
  end

  def blog_updates
    blog.articles.map do |article|
      Thor::CoreExt::HashWithIndifferentAccess.new(
        date: article.date.to_datetime,
        content: article.title,
        link: article.url,
        type: 'ブログ',
        class: 'label-blog'
      )
    end
  end
end

# Time Zone
Time.zone = 'Tokyo'

# Dynamic Pages
data.items.each do |item|
  proxy "/items/#{item.id}/index.html", "/items/template.html", locals: { item: item }, ignore: true
end

# Extensions
activate :blog do |blog|
  blog.prefix = 'blog'
  blog.permalink = '{title}.html'
  blog.layout = 'blog'
  blog.summary_length = nil
  blog.tag_template = 'blog/tag.html'
end
activate :autoprefixer
activate :directory_indexes
activate :dragonfly_thumbnailer

# Rack middleware
use Rack::GoogleAnalytics, tracker: 'UA-58422142-1'

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
end
