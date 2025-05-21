require("config.options")
require("config.commands")
require("config.autocmd")
-- Must be loaded before `config.lazy` for leader key
require("config.mappings")
require("config.lazy")
