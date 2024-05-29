class InnDashboard::GroupReservationsController < InnDashboard::InnDashboardController
  def new
    @group_reservation = @inn.group_reservations.build
  end
  
  def create
    group_reservation_params = params.require(:group_reservation).permit(:name, :start_date, :end_date)
    @group_reservation = @inn.group_reservations.build(group_reservation_params)
    if @group_reservation.save
      redirect_to @inn, notice: 'Reserva criada com sucesso!'
    else
      render 'new'
    end
  end
end