require_relative 'routes'
require_relative 'app'

use Rack::ContentType, 'text/plain'
run Rack::URLMap.new(ROUTES)
