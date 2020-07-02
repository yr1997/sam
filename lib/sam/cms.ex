defmodule Sam.Cms do
  @moduledoc """
  The Cms context.
  """

  import Ecto.Query, warn: false
  alias Sam.Repo

  alias Sam.Cms.WhatsNew

  @doc """
  Returns the list of whatsnews.

  ## Examples

      iex> list_whatsnews()
      [%WhatsNew{}, ...]

  """
  def list_whatsnews do
    Repo.all(WhatsNew)
  end

  @doc """
  Gets a single whats_new.

  Raises `Ecto.NoResultsError` if the Whats new does not exist.

  ## Examples

      iex> get_whats_new!(123)
      %WhatsNew{}

      iex> get_whats_new!(456)
      ** (Ecto.NoResultsError)

  """
  def get_whats_new!(id), do: Repo.get!(WhatsNew, id)

  @doc """
  Creates a whats_new.

  ## Examples

      iex> create_whats_new(%{field: value})
      {:ok, %WhatsNew{}}

      iex> create_whats_new(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_whats_new(attrs \\ %{}) do
    %WhatsNew{}
    |> WhatsNew.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a whats_new.

  ## Examples

      iex> update_whats_new(whats_new, %{field: new_value})
      {:ok, %WhatsNew{}}

      iex> update_whats_new(whats_new, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_whats_new(%WhatsNew{} = whats_new, attrs) do
    whats_new
    |> WhatsNew.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a whats_new.

  ## Examples

      iex> delete_whats_new(whats_new)
      {:ok, %WhatsNew{}}

      iex> delete_whats_new(whats_new)
      {:error, %Ecto.Changeset{}}

  """
  def delete_whats_new(%WhatsNew{} = whats_new) do
    Repo.delete(whats_new)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking whats_new changes.

  ## Examples

      iex> change_whats_new(whats_new)
      %Ecto.Changeset{data: %WhatsNew{}}

  """
  def change_whats_new(%WhatsNew{} = whats_new, attrs \\ %{}) do
    WhatsNew.changeset(whats_new, attrs)
  end
end
