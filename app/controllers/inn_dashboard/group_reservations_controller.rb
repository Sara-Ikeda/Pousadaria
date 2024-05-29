class InnDashboard::GroupReservationsController < InnDashboard::InnDashboardController
  def new
    @group_reservation = @inn.group_reservations.build
  end
  
  def create
  end
end