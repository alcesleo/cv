# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

# Don't require .html suffixes to pages
activate :directory_indexes

# Use /en/ and /sv/ paths to translations
activate :i18n, mount_at_root: false

# Default language to Swedish
redirect "index.html", to: "/sv/"

# Autoreload in development mode
activate :livereload

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# Webpack
activate :external_pipeline,
  name: :webpack,
  command: build? ?
    './node_modules/webpack/bin/webpack.js --bail' :
    './node_modules/webpack/bin/webpack.js --watch -d',
  source: ".tmp/dist",
  latency: 1


# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

helpers do
  def switch_language(language_code)
    current_page_without_language_code = "#{current_page.url.gsub(/^\/\w\w\//, '')}"
    "/#{language_code}/#{current_page_without_language_code}"
  end
end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end
