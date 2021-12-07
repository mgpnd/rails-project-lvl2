import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "bootstrap"
import "@fortawesome/fontawesome-free/css/all"
import "../stylesheets/application"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
