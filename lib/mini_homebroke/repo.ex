defmodule MiniHomebroke.Repo do
  use Ecto.Repo,
    otp_app: :mini_homebroke,
    adapter: Ecto.Adapters.MyXQL
end
