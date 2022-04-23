defmodule Example.Bar do
  @moduledoc """
  The Bar context.
  """

  import Ecto.Query, warn: false
  alias Example.Repo

  alias Example.Bar.Foo

  @doc """
  Returns the list of foos.

  ## Examples

      iex> list_foos()
      [%Foo{}, ...]

  """
  def list_foos do
    Repo.all(Foo)
  end

  @doc """
  Gets a single foo.

  Raises `Ecto.NoResultsError` if the Foo does not exist.

  ## Examples

      iex> get_foo!(123)
      %Foo{}

      iex> get_foo!(456)
      ** (Ecto.NoResultsError)

  """
  def get_foo!(id), do: Repo.get!(Foo, id)

  @doc """
  Creates a foo.

  ## Examples

      iex> create_foo(%{field: value})
      {:ok, %Foo{}}

      iex> create_foo(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_foo(attrs \\ %{}) do
    %Foo{}
    |> Foo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a foo.

  ## Examples

      iex> update_foo(foo, %{field: new_value})
      {:ok, %Foo{}}

      iex> update_foo(foo, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_foo(%Foo{} = foo, attrs) do
    foo
    |> Foo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a foo.

  ## Examples

      iex> delete_foo(foo)
      {:ok, %Foo{}}

      iex> delete_foo(foo)
      {:error, %Ecto.Changeset{}}

  """
  def delete_foo(%Foo{} = foo) do
    Repo.delete(foo)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking foo changes.

  ## Examples

      iex> change_foo(foo)
      %Ecto.Changeset{data: %Foo{}}

  """
  def change_foo(%Foo{} = foo, attrs \\ %{}) do
    Foo.changeset(foo, attrs)
  end
end
