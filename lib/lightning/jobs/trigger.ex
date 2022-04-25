defmodule Lightning.Jobs.Trigger do
  @moduledoc """
  Ecto model for Triggers.

  Triggers represent the criteria in which a Job might be invoked.

  ## Types

  ### Webhook (default)

  A webhook trigger allows a Job to invoked (via `Lightning.Invocation`) when it's
  endpoint is called.
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Lightning.Jobs.Job

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "triggers" do
    field :comment, :string
    field :custom_path, :string
    belongs_to :job, Job
    belongs_to :upstream_job, Job

    field :type, Ecto.Enum,
      values: [:webhook, :on_job_success, :on_job_failure],
      default: :webhook

    timestamps()
  end

  @doc false
  def changeset(trigger, attrs) do
    trigger
    |> cast(attrs, [:comment, :custom_path, :type, :upstream_job_id])
    |> validate_required([:type])
    |> assoc_constraint(:job)
    |> validate_by_type()
  end

  # Append validations based on the type of the Trigger.
  # - `:on_job_success` must have an associated upstream Job model.
  # - `:webhook` should _not_ have an upstream Job.
  defp validate_by_type(changeset) do
    changeset
    |> fetch_field!(:type)
    |> case do
      type when type in [:on_job_success, :on_job_failure] ->
        changeset
        |> validate_required(:upstream_job_id)
        |> assoc_constraint(:upstream_job)

      :webhook ->
        changeset
        |> put_change(:upstream_job_id, nil)
    end
  end
end
