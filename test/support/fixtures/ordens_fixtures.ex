defmodule MiniHomebroke.OrdensFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MiniHomebroke.Ordens` context.
  """

  @doc """
  Generate a ordem.
  """
  def ordem_fixture(attrs \\ %{}) do
    {:ok, ordem} =
      attrs
      |> Enum.into(%{
        codigo_ativo: "some codigo_ativo",
        quantidade: 42,
        tipo: 42,
        valor: "120.5"
      })
      |> MiniHomebroke.Ordens.create_ordem()

    ordem
  end
end
