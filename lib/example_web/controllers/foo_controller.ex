defmodule ExampleWeb.FooController do
  use ExampleWeb, :controller

  alias Example.Bar
  alias Example.Bar.Foo

  def index(conn, _params) do
    foos = Bar.list_foos()
    render(conn, "index.html", foos: foos)
  end

  def new(conn, _params) do
    changeset = Bar.change_foo(%Foo{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"foo" => foo_params}) do
    case Bar.create_foo(foo_params) do
      {:ok, foo} ->
        conn
        |> put_flash(:info, "Foo created successfully.")
        |> redirect(to: Routes.foo_path(conn, :show, foo))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    foo = Bar.get_foo!(id)
    render(conn, "show.html", foo: foo)
  end

  def edit(conn, %{"id" => id}) do
    foo = Bar.get_foo!(id)
    changeset = Bar.change_foo(foo)
    render(conn, "edit.html", foo: foo, changeset: changeset)
  end

  def update(conn, %{"id" => id, "foo" => foo_params}) do
    foo = Bar.get_foo!(id)

    case Bar.update_foo(foo, foo_params) do
      {:ok, foo} ->
        conn
        |> put_flash(:info, "Foo updated successfully.")
        |> redirect(to: Routes.foo_path(conn, :show, foo))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", foo: foo, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    foo = Bar.get_foo!(id)
    {:ok, _foo} = Bar.delete_foo(foo)

    conn
    |> put_flash(:info, "Foo deleted successfully.")
    |> redirect(to: Routes.foo_path(conn, :index))
  end
end
