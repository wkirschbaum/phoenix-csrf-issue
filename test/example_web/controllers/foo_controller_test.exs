defmodule ExampleWeb.FooControllerTest do
  use ExampleWeb.ConnCase

  import Example.BarFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  describe "index" do
    test "lists all foos", %{conn: conn} do
      conn = get(conn, Routes.foo_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Foos"
    end
  end

  describe "new foo" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.foo_path(conn, :new))
      assert html_response(conn, 200) =~ "New Foo"
    end
  end

  describe "create foo" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.foo_path(conn, :create), foo: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.foo_path(conn, :show, id)

      conn = get(conn, Routes.foo_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Foo"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.foo_path(conn, :create), foo: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Foo"
    end
  end

  describe "edit foo" do
    setup [:create_foo]

    test "renders form for editing chosen foo", %{conn: conn, foo: foo} do
      conn = get(conn, Routes.foo_path(conn, :edit, foo))
      assert html_response(conn, 200) =~ "Edit Foo"
    end
  end

  describe "update foo" do
    setup [:create_foo]

    test "redirects when data is valid", %{conn: conn, foo: foo} do
      conn = put(conn, Routes.foo_path(conn, :update, foo), foo: @update_attrs)
      assert redirected_to(conn) == Routes.foo_path(conn, :show, foo)

      conn = get(conn, Routes.foo_path(conn, :show, foo))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, foo: foo} do
      conn = put(conn, Routes.foo_path(conn, :update, foo), foo: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Foo"
    end
  end

  describe "delete foo" do
    setup [:create_foo]

    test "deletes chosen foo", %{conn: conn, foo: foo} do
      conn = delete(conn, Routes.foo_path(conn, :delete, foo))
      assert redirected_to(conn) == Routes.foo_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.foo_path(conn, :show, foo))
      end
    end
  end

  defp create_foo(_) do
    foo = foo_fixture()
    %{foo: foo}
  end
end
