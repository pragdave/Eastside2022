import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :wordchain, WordchainWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "7ggKlo2j/Jn2MMjy4s1MVLvGudQm28EeJyP5iusT2eUV49LA9X8skqhR06I4inqL",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
