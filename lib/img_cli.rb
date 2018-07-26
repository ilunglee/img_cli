# Require Dependencies
require 'pastel'
require 'tty-spinner'
require 'terminal-table'
require 'exifr/jpeg'
require 'csv'
require 'erb'

# Require Version
require 'img_cli/version'

# Require Extensions
require 'extensions/callable'

# Require Exceptions
require 'img_cli/exceptions/errors'

# Require Features
require 'img_cli/exif'
require 'img_cli/exports/csv'
require 'img_cli/exports/html'

# Require Commands
require 'img_cli/commands/exif'

# Base Module
module ImgCLI

  class << self; end

end
