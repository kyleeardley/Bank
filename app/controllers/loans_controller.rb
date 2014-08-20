class LoansController < ApplicationController
include CurrentUser
before_action :set_current_user
respond_to :html, :json


def index

	@loans=Loan.all
	respond_with @loans
end


def new
	@loan=Loan.new
end

def create
	@loan = @current_user.loans.build(loan_params)
	if @loan.save
		redirect_to @loan
	end
end



def destroy
	
	Loan.find(params[:id]).destroy
	
	redirect_to loans_url
end

def show
	@loan = Loan.find(params[:id])
	respond_with @loan
end

def edit
		@loan= Loan.find(params[:id])
  	end

  	def update
  		@loan= Loan.find(params[:id])
    	if @loan.update_attributes(loan_params)
      		flash[:success] = "Profile updated"
      		redirect_to @loan
      	else
      		render 'edit'
      	end
      
    	
  	end

  	def clientterminal
  		#if @current_user.loans

  	@count = @current_user.loans.first.id
  	  	#	else 
  	#		flash[:error]= 'No Loan in File'
  		#	redirect_to root_path
  		#end
  	end







private

	def loan_params
		params.require(:loan).permit(:origination_date, :closed_date,
		:loan_status, :loan_principle, :name_of_banker, :name_of_borrower,:loan_interest_rate, :loan_term, 
		:mortgage_agreement_docs, :employment_verification_docs, 
		:purchase_contract_docs, :loan_type, :financials_docs, :Application_docs,
		:title_insurance_docs)
	end

end
