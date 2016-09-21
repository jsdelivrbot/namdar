require 'socket'
prefix = sprintf(
  '%s@%s ',
  Pry::Helpers::Text.bright_red(Rails.env.upcase),
  Pry::Helpers::Text.bright_magenta(Socket.gethostname)
)

Pry.config.prompt = [
  proc { |*a| prefix + Pry::DEFAULT_PROMPT.first.call(*a) },
  proc { |*a| prefix + Pry::DEFAULT_PROMPT.second.call(*a) }
]
