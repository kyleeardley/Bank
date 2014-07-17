class BankController < ApplicationController
	include CurrentUser
	before_action :set_current_user
end


def clienthome
	@id = Loan.find(@current_user.loans.id)
end
