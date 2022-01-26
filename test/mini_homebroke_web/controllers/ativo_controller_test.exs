defmodule MiniHomebrokeWeb.AtivoControllerTest do
  use MiniHomebrokeWeb.ConnCase

  import MiniHomebroke.AtivosFixtures

  alias MiniHomebroke.Ativos.Ativo

  @create_attrs %{
    codigo: "some codigo",
    preco: "120.5"
  }
  @update_attrs %{
    codigo: "some updated codigo",
    preco: "456.7"
  }
  @invalid_attrs %{codigo: nil, preco: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all ativos", %{conn: conn} do
      conn = get(conn, Routes.ativo_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create ativo" do
    test "renders ativo when data is valid", %{conn: conn} do
      conn = post(conn, Routes.ativo_path(conn, :create), ativo: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.ativo_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "codigo" => "some codigo",
               "preco" => "120.5"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.ativo_path(conn, :create), ativo: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update ativo" do
    setup [:create_ativo]

    test "renders ativo when data is valid", %{conn: conn, ativo: %Ativo{id: id} = ativo} do
      conn = put(conn, Routes.ativo_path(conn, :update, ativo), ativo: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.ativo_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "codigo" => "some updated codigo",
               "preco" => "456.7"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, ativo: ativo} do
      conn = put(conn, Routes.ativo_path(conn, :update, ativo), ativo: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete ativo" do
    setup [:create_ativo]

    test "deletes chosen ativo", %{conn: conn, ativo: ativo} do
      conn = delete(conn, Routes.ativo_path(conn, :delete, ativo))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.ativo_path(conn, :show, ativo))
      end
    end
  end

  defp create_ativo(_) do
    ativo = ativo_fixture()
    %{ativo: ativo}
  end
end
