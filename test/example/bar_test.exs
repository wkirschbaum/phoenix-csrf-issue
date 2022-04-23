defmodule Example.BarTest do
  use Example.DataCase

  alias Example.Bar

  describe "foos" do
    alias Example.Bar.Foo

    import Example.BarFixtures

    @invalid_attrs %{name: nil}

    test "list_foos/0 returns all foos" do
      foo = foo_fixture()
      assert Bar.list_foos() == [foo]
    end

    test "get_foo!/1 returns the foo with given id" do
      foo = foo_fixture()
      assert Bar.get_foo!(foo.id) == foo
    end

    test "create_foo/1 with valid data creates a foo" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Foo{} = foo} = Bar.create_foo(valid_attrs)
      assert foo.name == "some name"
    end

    test "create_foo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bar.create_foo(@invalid_attrs)
    end

    test "update_foo/2 with valid data updates the foo" do
      foo = foo_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Foo{} = foo} = Bar.update_foo(foo, update_attrs)
      assert foo.name == "some updated name"
    end

    test "update_foo/2 with invalid data returns error changeset" do
      foo = foo_fixture()
      assert {:error, %Ecto.Changeset{}} = Bar.update_foo(foo, @invalid_attrs)
      assert foo == Bar.get_foo!(foo.id)
    end

    test "delete_foo/1 deletes the foo" do
      foo = foo_fixture()
      assert {:ok, %Foo{}} = Bar.delete_foo(foo)
      assert_raise Ecto.NoResultsError, fn -> Bar.get_foo!(foo.id) end
    end

    test "change_foo/1 returns a foo changeset" do
      foo = foo_fixture()
      assert %Ecto.Changeset{} = Bar.change_foo(foo)
    end
  end
end
