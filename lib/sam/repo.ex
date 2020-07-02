defmodule Sam.Repo do
  use Ecto.Repo,
    otp_app: :sam,
    adapter: Ecto.Adapters.Postgres
end
