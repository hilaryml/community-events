require_relative './config/environment'

use Rack::MethodOverride
use UserController
use EventController
run SessionController
