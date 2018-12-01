defmodule Hello.TodoTasksTest do
  use Hello.DataCase

  alias Hello.TodoTasks

  describe "tasks" do
    alias Hello.TodoTasks.Task

    @valid_attrs %{extranote: "some extranote", text: "some text"}
    @update_attrs %{extranote: "some updated extranote", text: "some updated text"}
    @invalid_attrs %{extranote: nil, text: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TodoTasks.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert TodoTasks.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert TodoTasks.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = TodoTasks.create_task(@valid_attrs)
      assert task.extranote == "some extranote"
      assert task.text == "some text"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TodoTasks.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, %Task{} = task} = TodoTasks.update_task(task, @update_attrs)
      assert task.extranote == "some updated extranote"
      assert task.text == "some updated text"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = TodoTasks.update_task(task, @invalid_attrs)
      assert task == TodoTasks.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = TodoTasks.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> TodoTasks.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = TodoTasks.change_task(task)
    end
  end
end
