defmodule MiniHomebroke.AtivosTest do
  use MiniHomebroke.DataCase

  alias MiniHomebroke.Ativos

  describe "ativos" do
    alias MiniHomebroke.Ativos.Ativo

    import MiniHomebroke.AtivosFixtures

    @invalid_attrs %{codigo: nil, preco: nil}

    test "list_ativos/0 returns all ativos" do
      ativo = ativo_fixture()
      assert Ativos.list_ativos() == [ativo]
    end

    test "get_ativo!/1 returns the ativo with given id" do
      ativo = ativo_fixture()
      assert Ativos.get_ativo!(ativo.id) == ativo
    end

    test "create_ativo/1 with valid data creates a ativo" do
      valid_attrs = %{codigo: "some codigo", preco: "120.5"}

      assert {:ok, %Ativo{} = ativo} = Ativos.create_ativo(valid_attrs)
      assert ativo.codigo == "some codigo"
      assert ativo.preco == Decimal.new("120.5")
    end

    test "create_ativo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ativos.create_ativo(@invalid_attrs)
    end

    test "update_ativo/2 with valid data updates the ativo" do
      ativo = ativo_fixture()
      update_attrs = %{codigo: "some updated codigo", preco: "456.7"}

      assert {:ok, %Ativo{} = ativo} = Ativos.update_ativo(ativo, update_attrs)
      assert ativo.codigo == "some updated codigo"
      assert ativo.preco == Decimal.new("456.7")
    end

    test "update_ativo/2 with invalid data returns error changeset" do
      ativo = ativo_fixture()
      assert {:error, %Ecto.Changeset{}} = Ativos.update_ativo(ativo, @invalid_attrs)
      assert ativo == Ativos.get_ativo!(ativo.id)
    end

    test "delete_ativo/1 deletes the ativo" do
      ativo = ativo_fixture()
      assert {:ok, %Ativo{}} = Ativos.delete_ativo(ativo)
      assert_raise Ecto.NoResultsError, fn -> Ativos.get_ativo!(ativo.id) end
    end

    test "change_ativo/1 returns a ativo changeset" do
      ativo = ativo_fixture()
      assert %Ecto.Changeset{} = Ativos.change_ativo(ativo)
    end
  end
end
