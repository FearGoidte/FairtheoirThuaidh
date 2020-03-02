# frozen_string_literal: true

Time.zone = 'London'

###
# Page options, layouts, aliases and proxies
###

# Set the default layout
set :layout, 'layout'

# Ignore Icons used for folders
ignore '*Icon*'

###
# Helpers
###

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  # blog.prefix = "blog"
  blog.permalink = '/publications/{title}.xhtml'
  # Matcher for blog source files
  blog.sources = 'publications/{title}.xhtml'
  blog.generate_day_pages = false
  blog.generate_month_pages = false
  blog.generate_tag_pages = false
  blog.generate_year_pages = false
  blog.layout = 'publications'
  blog.summary_length = -1
  blog.default_extension = '.markdown'
  # Enable pagination
  blog.paginate = false
  blog.new_article_template = expand_path('/new_publication.erb', __dir__)
end

# Activate directory indices and remove file extensions from urls
activate :directory_indexes
set :index_file, 'index.xhtml'
set :trailing_slash, true

# On GitHub pages, 404 page must be "404.html" or "404.md"
page '/404.html', directory_index: false
page '/google65d5e4337d3800b9.html', directory_index: false

# Relative links
set :relative_links, true
activate :relative_assets

# Asset hashes so that cache times can be increased
activate :asset_hash, exts: ['.css',
                             '.eot',
                             '.gif',
                             '.ico',
                             '.jpg',
                             '.jpeg',
                             '.js',
                             '.otf',
                             '.png',
                             '.map',
                             '.svg',
                             '.svgz',
                             '.ttf',
                             '.webp',
                             '.woff',
                             '.woff2']

# Development-specific configuration
configure :development do
  # set :https, true # Ensures consistency if also deployed over https
end

# Build-specific configuration
configure :build do
  activate :gzip, exts: ['.css',
                         '.htm',
                         '.html',
                         '.js',
                         '.svg',
                         '.xhtml',
                         '.xml'],
                  ignore: ['google*.html']
  activate :minify_html, remove_quotes: false
  activate :minify_css
end

# Copy files to build folder after build
after_build do
  print 'After_build fixes … '
  system("cp \licence.txt #{config[:build_dir] + '/licence.txt'}")
  system("cp \README.markdown #{config[:build_dir] + '/README.markdown'}")
  puts 'done.'
end

# Deploy to GitHub
activate :deploy do |deploy|
  deploy.build_before = true
  deploy.branch = 'gh-pages'
  deploy.clean = true
  deploy.commit_message = 'Published from build of master branch'
  deploy.deploy_method = :git
end
