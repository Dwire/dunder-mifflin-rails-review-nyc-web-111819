class EmployeesController < ApplicationController
  def index 
    @employees = Employee.all
  end 

  def show
    @employee = Employee.find(params[:id])
  end 

  def new
    @employee = Employee.new
  end
  
  def create 
    employee = Employee.create(employee_params)

    if employee.valid? 
      redirect_to employee_path(employee)
    else 
      flash[:messages] = employee.errors.full_messages
      redirect_to new_employee_path
    end 

  end
  
  private 

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :office, :alias, :title, :img_url, :dog_id)
  end 

end
