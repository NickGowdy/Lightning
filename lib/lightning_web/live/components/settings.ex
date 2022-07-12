defmodule LightningWeb.Components.Settings do
  @moduledoc """
  Components for Settings live session
  """
  use LightningWeb, :component

  def menu_item(assigns) do
    base_classes = ~w[
      px-3 py-2 rounded-md text-sm font-medium rounded-md block
    ]

    active_classes = ~w[text-white-200 bg-primary-light] ++ base_classes
    inactive_classes = ~w[text-white-300 hover:bg-primary-light] ++ base_classes

    assigns =
      assigns
      |> assign(
        class:
          if assigns[:active] do
            active_classes
          else
            inactive_classes
          end
      )

    ~H"""
    <div class="h-12 mx-4">
      <%= live_redirect(to: @to, class: @class) do %>
        <%= if assigns[:inner_block] do %>
          <%= render_slot(@inner_block) %>
        <% else %>
          <%= @text %>
        <% end %>
      <% end %>
    </div>
    """
  end
end
