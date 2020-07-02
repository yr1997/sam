defmodule Sam.Cms.WhatsNew do
  use Ecto.Schema
  import Ecto.Changeset

  schema "whatsnews" do
    field :作成日, :date
    field :本文, :string
    field :題名, :string

    timestamps()
  end

  @doc false
  def changeset(whats_new, attrs) do
    whats_new
    |> cast(attrs, [:題名, :本文, :作成日])
    |> validate_required([:題名, :本文, :作成日])
  end
end
