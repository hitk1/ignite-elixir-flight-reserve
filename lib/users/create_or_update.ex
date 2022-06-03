defmodule Flightex.Users.CreateOrUpdate do
  alias Flightex.Users.User
  alias Flightex.Users.Agent, as: UserAgent

  def call(%{name: name, email: email, cpf: cpf}) do
    User.build(name, email, cpf)
    |> save()
  end

  defp save({:ok, %User{} = user}), do: UserAgent.save(user)
  defp save({:error, _reason} = error), do: error
end
