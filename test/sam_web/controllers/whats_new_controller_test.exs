defmodule SamWeb.WhatsNewControllerTest do
  use SamWeb.ConnCase

  alias Sam.Cms

  @create_attrs %{作成日: ~D[2010-04-17], 本文: "some 本文", 題名: "some 題名"}
  @update_attrs %{作成日: ~D[2011-05-18], 本文: "some updated 本文", 題名: "some updated 題名"}
  @invalid_attrs %{作成日: nil, 本文: nil, 題名: nil}

  def fixture(:whats_new) do
    {:ok, whats_new} = Cms.create_whats_new(@create_attrs)
    whats_new
  end

  describe "index" do
    test "lists all whatsnews", %{conn: conn} do
      conn = get(conn, Routes.whats_new_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Whatsnews"
    end
  end

  describe "new whats_new" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.whats_new_path(conn, :new))
      assert html_response(conn, 200) =~ "New Whats new"
    end
  end

  describe "create whats_new" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.whats_new_path(conn, :create), whats_new: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.whats_new_path(conn, :show, id)

      conn = get(conn, Routes.whats_new_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Whats new"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.whats_new_path(conn, :create), whats_new: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Whats new"
    end
  end

  describe "edit whats_new" do
    setup [:create_whats_new]

    test "renders form for editing chosen whats_new", %{conn: conn, whats_new: whats_new} do
      conn = get(conn, Routes.whats_new_path(conn, :edit, whats_new))
      assert html_response(conn, 200) =~ "Edit Whats new"
    end
  end

  describe "update whats_new" do
    setup [:create_whats_new]

    test "redirects when data is valid", %{conn: conn, whats_new: whats_new} do
      conn = put(conn, Routes.whats_new_path(conn, :update, whats_new), whats_new: @update_attrs)
      assert redirected_to(conn) == Routes.whats_new_path(conn, :show, whats_new)

      conn = get(conn, Routes.whats_new_path(conn, :show, whats_new))
      assert html_response(conn, 200) =~ "some updated 本文"
    end

    test "renders errors when data is invalid", %{conn: conn, whats_new: whats_new} do
      conn = put(conn, Routes.whats_new_path(conn, :update, whats_new), whats_new: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Whats new"
    end
  end

  describe "delete whats_new" do
    setup [:create_whats_new]

    test "deletes chosen whats_new", %{conn: conn, whats_new: whats_new} do
      conn = delete(conn, Routes.whats_new_path(conn, :delete, whats_new))
      assert redirected_to(conn) == Routes.whats_new_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.whats_new_path(conn, :show, whats_new))
      end
    end
  end

  defp create_whats_new(_) do
    whats_new = fixture(:whats_new)
    %{whats_new: whats_new}
  end
end
