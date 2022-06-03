defmodule Flightex.Bookings.CreateOrUpdate do
  alias Flightex.Bookings.Booking
  alias Flightex.Bookings.Agent, as: BookingAgent

  def call(%{
        complete_date: complete_date,
        local_origin: local_origin,
        local_destination: local_destination,
        user_id: user_id
      }) do
    Booking.build(complete_date, local_origin, local_destination, user_id)
    |> save()
  end

  defp save({:ok, %Booking{} = booking}), do: BookingAgent.save(booking)
  defp save({:error, _reason} = error), do: error
end
