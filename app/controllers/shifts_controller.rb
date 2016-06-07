class ShiftsController < ApplicationController
  def index
    @shifts = Shift.all.order('time_in DESC')
    @jobs = Job.all
  end



  def show
    @shift = Shift.find(params[:id])
  end

  def new
    @shift = Shift.new
    @job = Job.find(params[:job_id])

  end

  def create
    @shift = Shift.new
    @shift.job_id = params[:job_id]
    @shift.total_pay = params[:total_pay]
    @shift.approval = params[:approval]
    @shift.reimbursements = params[:reimbursements]
    @shift.bonus = params[:bonus]
    @shift.hours_worked = params[:hours_worked]
    @shift.time_out = params[:time_out]
    @shift.time_in = params[:time_in]

    if @shift.save
      redirect_to controller: "jobs", action: "show", id: @shift.job_id, :notice => "Shift created successfully."
    else
      render 'new'
    end
  end




  def edit
    @shift = Shift.find(params[:id])
  end

  def update
    @shift = Shift.find(params[:id])

    @shift.reimbursements = params[:reimbursements]
    @shift.bonus = params[:bonus]
    @shift.time_out = params[:time_out]
    @shift.time_in = params[:time_in]
    @shift.hours_worked = ((@shift.time_out - @shift.time_in)/3600).round(2)
    @shift.total_pay = (@shift.hours_worked * @shift.job.pay_rate).round(2)

    if @shift.save
      redirect_to "/shifts", :notice => "Shift updated successfully."
    else
      render 'edit'
    end
  end

  def approve
    @shift = Shift.find(params[:id])
    @shift.approval = true
    @shift.save
    redirect_to :back, :notice => "Shift approved"
  end

  def unapprove
    @shift = Shift.find(params[:id])
    @shift.approval = false
    @shift.save
    redirect_to :back, :notice => "Shift unapproved"
  end


  def destroy
    @shift = Shift.find(params[:id])

    @shift.destroy

    redirect_to "/shifts", :notice => "Shift deleted."
  end

  def approval_list
    @shifts = Shift.all.order('time_in DESC')
    @admin_id = params[:id]
    @jobs = Job.all.order('user_id ASC')
  end




  def clock_out
    @shift = Shift.find(params[:id])
    @shift.time_out = params[:time_out]
    @shift.hours_worked = ((@shift.time_out - @shift.time_in)/3600).round(2)
    @shift.total_pay = (@shift.hours_worked * @shift.job.pay_rate).round(2)


    if @shift.save
      redirect_to "/shifts/#{@shift.id}/edit", :notice => "Shift clocked successfully. Make edits if you wish otherwise your time has already been saved."
    else
      render 'edit'
    end
  end

end
