defmodule SamWeb.WhatsNewController do
  use SamWeb, :controller

  alias Sam.Cms
  alias Sam.Cms.WhatsNew

  def index(conn, _params) do
    whatsnews = Cms.list_whatsnews()
    render(conn, "index.html", whatsnews: whatsnews)
  end

  def new(conn, _params) do
    changeset = Cms.change_whats_new(%WhatsNew{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"whats_new" => whats_new_params}) do
    case Cms.create_whats_new(whats_new_params) do
      {:ok, whats_new} ->
        conn
        |> put_flash(:info, "Whats new created successfully.")
        |> redirect(to: Routes.whats_new_path(conn, :show, whats_new))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    whats_new = Cms.get_whats_new!(id)
    render(conn, "show.html", whats_new: whats_new)
  end

  def edit(conn, %{"id" => id}) do
    whats_new = Cms.get_whats_new!(id)
    changeset = Cms.change_whats_new(whats_new)
    render(conn, "edit.html", whats_new: whats_new, changeset: changeset)
  end

  def update(conn, %{"id" => id, "whats_new" => whats_new_params}) do
    whats_new = Cms.get_whats_new!(id)

    case Cms.update_whats_new(whats_new, whats_new_params) do
      {:ok, whats_new} ->
        conn
        |> put_flash(:info, "Whats new updated successfully.")
        |> redirect(to: Routes.whats_new_path(conn, :show, whats_new))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", whats_new: whats_new, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    whats_new = Cms.get_whats_new!(id)
    {:ok, _whats_new} = Cms.delete_whats_new(whats_new)

    conn
    |> put_flash(:info, "Whats new deleted successfully.")
    |> redirect(to: Routes.whats_new_path(conn, :index))
  end
end
