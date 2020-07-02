defmodule Sam.Repo.Migrations.CreateWhatsnews do
  use Ecto.Migration

  def change do
    create table(:whatsnews) do
      add :題名, :string
      add :本文, :text
      add :作成日, :date

      timestamps()
    end

  end
end
