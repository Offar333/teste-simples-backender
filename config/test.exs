import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :mini_homebroke, MiniHomebroke.Repo,
  username: "root",
  password: "",
  hostname: "localhost",
  database: "mini_homebroke_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :mini_homebroke, MiniHomebrokeWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "8N4/Opg7zBx6zd45TOoN7GpA26ZfUVDy8s+Ze6iNUW3Ljo+8o4AG0v2jAyZIXNNx",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
