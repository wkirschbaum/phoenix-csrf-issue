defmodule Example.BarFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Example.Bar` context.
  """

  @doc """
  Generate a foo.
  """
  def foo_fixture(attrs \\ %{}) do
    {:ok, foo} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Example.Bar.create_foo()

    foo
  end
end
