defmodule Hello.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :text, :text
      add :extranote, :string

      timestamps()
    end

  end
end
