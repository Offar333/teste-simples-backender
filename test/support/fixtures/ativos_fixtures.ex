defmodule MiniHomebroke.AtivosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MiniHomebroke.Ativos` context.
  """

  @doc """
  Generate a ativo.
  """
  def ativo_fixture(attrs \\ %{}) do
    {:ok, ativo} =
      attrs
      |> Enum.into(%{
        codigo: "some codigo",
        preco: "120.5"
      })
      |> MiniHomebroke.Ativos.create_ativo()

    ativo
  end
end
