defmodule MiniHomebroke.OrdensTest do
  use MiniHomebroke.DataCase

  alias MiniHomebroke.Ordens

  describe "ordens" do
    alias MiniHomebroke.Ordens.Ordem

    import MiniHomebroke.OrdensFixtures

    @invalid_attrs %{codigo_ativo: nil, quantidade: nil, tipo: nil, valor: nil}

    test "list_ordens/0 returns all ordens" do
      ordem = ordem_fixture()
      assert Ordens.list_ordens() == [ordem]
    end

    test "get_ordem!/1 returns the ordem with given id" do
      ordem = ordem_fixture()
      assert Ordens.get_ordem!(ordem.id) == ordem
    end

    test "create_ordem/1 with valid data creates a ordem" do
      valid_attrs = %{codigo_ativo: "some codigo_ativo", quantidade: 42, tipo: 42, valor: "120.5"}

      assert {:ok, %Ordem{} = ordem} = Ordens.create_ordem(valid_attrs)
      assert ordem.codigo_ativo == "some codigo_ativo"
      assert ordem.quantidade == 42
      assert ordem.tipo == 42
      assert ordem.valor == Decimal.new("120.5")
    end

    test "create_ordem/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ordens.create_ordem(@invalid_attrs)
    end

    test "update_ordem/2 with valid data updates the ordem" do
      ordem = ordem_fixture()
      update_attrs = %{codigo_ativo: "some updated codigo_ativo", quantidade: 43, tipo: 43, valor: "456.7"}

      assert {:ok, %Ordem{} = ordem} = Ordens.update_ordem(ordem, update_attrs)
      assert ordem.codigo_ativo == "some updated codigo_ativo"
      assert ordem.quantidade == 43
      assert ordem.tipo == 43
      assert ordem.valor == Decimal.new("456.7")
    end

    test "update_ordem/2 with invalid data returns error changeset" do
      ordem = ordem_fixture()
      assert {:error, %Ecto.Changeset{}} = Ordens.update_ordem(ordem, @invalid_attrs)
      assert ordem == Ordens.get_ordem!(ordem.id)
    end

    test "delete_ordem/1 deletes the ordem" do
      ordem = ordem_fixture()
      assert {:ok, %Ordem{}} = Ordens.delete_ordem(ordem)
      assert_raise Ecto.NoResultsError, fn -> Ordens.get_ordem!(ordem.id) end
    end

    test "change_ordem/1 returns a ordem changeset" do
      ordem = ordem_fixture()
      assert %Ecto.Changeset{} = Ordens.change_ordem(ordem)
    end
  end
end
