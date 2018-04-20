defmodule Rumbl.Video do
  use Rumbl.Web, :model

  schema "videos" do
    field :url, :string
    field :title, :string
    field :description, :string
    belongs_to :user, Rumbl.User
    belongs_to :category, Rumbl.Category

    timestamps()
  end

  
  def changeset(model, params \\ :invalid) do
    model
    |> cast(params, [:url, :title, :description, :category_id])
    |> assoc_constraint(:category)
  end
end
