defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def hello(conn,_params) do
    json(conn, %{id: 1, name: "anik alam", age: 27, status: %{:active => true} })
  end

  def external(conn,_params) do
    redirect(conn, external: "https://facebook.com")
  end

  def view(conn,%{"message" => message}) do
    render(conn,"view.html", message: message)
  end

end
