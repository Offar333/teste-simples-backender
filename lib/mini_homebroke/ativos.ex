defmodule MiniHomebroke.Ativos do
  @moduledoc """
  The Ativos context.
  """

  import Ecto.Query, warn: false
  alias MiniHomebroke.Repo

  alias MiniHomebroke.Ativos.Ativo

  @doc """
  Returns the list of ativos.

  ## Examples

      iex> list_ativos()
      [%Ativo{}, ...]

  """
  def list_ativos do
    Repo.all(Ativo)
  end

  @doc """
  Gets a single ativo.

  Raises `Ecto.NoResultsError` if the Ativo does not exist.

  ## Examples

      iex> get_ativo!(123)
      %Ativo{}

      iex> get_ativo!(456)
      ** (Ecto.NoResultsError)

  """
  def get_ativo!(id), do: Repo.get!(Ativo, id)

  @doc """
  Creates a ativo.

  ## Examples

      iex> create_ativo(%{field: value})
      {:ok, %Ativo{}}

      iex> create_ativo(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_ativo(attrs \\ %{}) do
    %Ativo{}
    |> Ativo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a ativo.

  ## Examples

      iex> update_ativo(ativo, %{field: new_value})
      {:ok, %Ativo{}}

      iex> update_ativo(ativo, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_ativo(%Ativo{} = ativo, attrs) do
    ativo
    |> Ativo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ativo.

  ## Examples

      iex> delete_ativo(ativo)
      {:ok, %Ativo{}}

      iex> delete_ativo(ativo)
      {:error, %Ecto.Changeset{}}

  """
  def delete_ativo(%Ativo{} = ativo) do
    Repo.delete(ativo)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking ativo changes.

  ## Examples

      iex> change_ativo(ativo)
      %Ecto.Changeset{data: %Ativo{}}

  """
  def change_ativo(%Ativo{} = ativo, attrs \\ %{}) do
    Ativo.changeset(ativo, attrs)
  end
end
