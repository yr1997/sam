defmodule Sam.CmsTest do
  use Sam.DataCase

  alias Sam.Cms

  describe "whatsnews" do
    alias Sam.Cms.WhatsNew

    @valid_attrs %{作成日: ~D[2010-04-17], 本文: "some 本文", 題名: "some 題名"}
    @update_attrs %{作成日: ~D[2011-05-18], 本文: "some updated 本文", 題名: "some updated 題名"}
    @invalid_attrs %{作成日: nil, 本文: nil, 題名: nil}

    def whats_new_fixture(attrs \\ %{}) do
      {:ok, whats_new} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Cms.create_whats_new()

      whats_new
    end

    test "list_whatsnews/0 returns all whatsnews" do
      whats_new = whats_new_fixture()
      assert Cms.list_whatsnews() == [whats_new]
    end

    test "get_whats_new!/1 returns the whats_new with given id" do
      whats_new = whats_new_fixture()
      assert Cms.get_whats_new!(whats_new.id) == whats_new
    end

    test "create_whats_new/1 with valid data creates a whats_new" do
      assert {:ok, %WhatsNew{} = whats_new} = Cms.create_whats_new(@valid_attrs)
      assert whats_new.作成日 == ~D[2010-04-17]
      assert whats_new.本文 == "some 本文"
      assert whats_new.題名 == "some 題名"
    end

    test "create_whats_new/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cms.create_whats_new(@invalid_attrs)
    end

    test "update_whats_new/2 with valid data updates the whats_new" do
      whats_new = whats_new_fixture()
      assert {:ok, %WhatsNew{} = whats_new} = Cms.update_whats_new(whats_new, @update_attrs)
      assert whats_new.作成日 == ~D[2011-05-18]
      assert whats_new.本文 == "some updated 本文"
      assert whats_new.題名 == "some updated 題名"
    end

    test "update_whats_new/2 with invalid data returns error changeset" do
      whats_new = whats_new_fixture()
      assert {:error, %Ecto.Changeset{}} = Cms.update_whats_new(whats_new, @invalid_attrs)
      assert whats_new == Cms.get_whats_new!(whats_new.id)
    end

    test "delete_whats_new/1 deletes the whats_new" do
      whats_new = whats_new_fixture()
      assert {:ok, %WhatsNew{}} = Cms.delete_whats_new(whats_new)
      assert_raise Ecto.NoResultsError, fn -> Cms.get_whats_new!(whats_new.id) end
    end

    test "change_whats_new/1 returns a whats_new changeset" do
      whats_new = whats_new_fixture()
      assert %Ecto.Changeset{} = Cms.change_whats_new(whats_new)
    end
  end
end
