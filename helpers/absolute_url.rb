# frozen_string_literal: true

def absolute_url(url)
  url = url_for(url, relative: false).prepend(data.settings.site.base_url)
  url
end
