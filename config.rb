activate :aria_current
activate :autoprefixer
activate :inline_svg

set :css_dir, "assets/stylesheets"
set :fonts_dir, "assets/fonts"
set :images_dir, "assets/images"
set :js_dir, "assets/javascripts"
set :markdown,
  autolink: true,
  fenced_code_blocks: true,
  footnotes: true,
  highlight: true,
  smartypants: true,
  strikethrough: true,
  tables: true,
  with_toc_data: true
set :markdown_engine, :redcarpet
set :relative_links, true
activate :i18n

activate :blog do |writing|
  writing.layout = "layout"
  writing.prefix = "writing"
  writing.sources = "/articles/:year/:title.html"
  writing.permalink = "/:year/:title.html"
end

page "/*.json", layout: false
page "/*.txt", layout: false
page "/*.xml", layout: false
page "/writing/*", layout: "article"

configure :development do
  activate :livereload do |reload|
    reload.no_swf = true
  end
end

activate :deploy do |deploy|
  deploy.deploy_method = :git
  deploy.build_before = true
  deploy.branch = "master"
end

configure :production do
  activate :asset_hash
  activate :gzip
  activate :minify_css
  activate :minify_html
  activate :minify_javascript
end

helpers do
  def format_date(date)
    date.strftime("%B %e, %Y")
  end
end
