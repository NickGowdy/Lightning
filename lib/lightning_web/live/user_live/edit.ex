defmodule LightningWeb.UserLive.Edit do
  @moduledoc """
  LiveView for editing a single job, which inturn uses `LightningWeb.JobLive.BigFormComponent`
  for common functionality.
  """
  use LightningWeb, :live_view

  alias Lightning.Accounts
  alias Lightning.Accounts.User

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(active_menu_item: :users)}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit User")
    |> assign(:user, Accounts.get_user!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New User")
    |> assign(:user, %User{})
  end
end
