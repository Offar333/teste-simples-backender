defmodule MiniHomebrokeWeb.OrdemControllerTest do
  use MiniHomebrokeWeb.ConnCase

  import MiniHomebroke.OrdensFixtures

  alias MiniHomebroke.Ordens.Ordem

  @create_attrs %{
    codigo_ativo: "some codigo_ativo",
    quantidade: 42,
    tipo: 42,
    valor: "120.5"
  }
  @update_attrs %{
    codigo_ativo: "some updated codigo_ativo",
    quantidade: 43,
    tipo: 43,
    valor: "456.7"
  }
  @invalid_attrs %{codigo_ativo: nil, quantidade: nil, tipo: nil, valor: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all ordens", %{conn: conn} do
      conn = get(conn, Routes.ordem_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create ordem" do
    test "renders ordem when data is valid", %{conn: conn} do
      conn = post(conn, Routes.ordem_path(conn, :create), ordem: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.ordem_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "codigo_ativo" => "some codigo_ativo",
               "quantidade" => 42,
               "tipo" => 42,
               "valor" => "120.5"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.ordem_path(conn, :create), ordem: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update ordem" do
    setup [:create_ordem]

    test "renders ordem when data is valid", %{conn: conn, ordem: %Ordem{id: id} = ordem} do
      conn = put(conn, Routes.ordem_path(conn, :update, ordem), ordem: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.ordem_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "codigo_ativo" => "some updated codigo_ativo",
               "quantidade" => 43,
               "tipo" => 43,
               "valor" => "456.7"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, ordem: ordem} do
      conn = put(conn, Routes.ordem_path(conn, :update, ordem), ordem: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete ordem" do
    setup [:create_ordem]

    test "deletes chosen ordem", %{conn: conn, ordem: ordem} do
      conn = delete(conn, Routes.ordem_path(conn, :delete, ordem))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.ordem_path(conn, :show, ordem))
      end
    end
  end

  defp create_ordem(_) do
    ordem = ordem_fixture()
    %{ordem: ordem}
  end
end
