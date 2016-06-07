class JobsController < ApplicationController
  def index

  end

  def show
    @job = Job.find(params[:id])

    current_user.jobs.each do |job|
      job.shifts.each do |shift|
        if shift.time_out.nil?
          @open_shift = shift
        end
      end
    end
    if @open_shift.nil?
      redirect_to controller: "shifts", action: "new", job_id: @job.id
    end

  end

  def new
    @job = Job.new
    @admin = Admin.all
    @company = Company.all
    @user = User.all
  end

  def create
    @job = Job.new
    @job.approval = params[:approval]
    @job.pay_rate = params[:pay_rate]
    @job.title = params[:title]
    @job.company_id = params[:company_id]
    @job.admin_id = params[:admin_id]
    @job.user_id = params[:user_id]

    if @job.save
      redirect_to "/jobs", :notice => "Job created successfully."
    else
      render 'new'
    end
  end

  def edit
    @job = Job.find(params[:id])
    @admin = Admin.all
  end

  def update
    @job = Job.find(params[:id])

    @job.pay_rate = params[:pay_rate]
    @job.title = params[:title]
    @job.admin_id = params[:admin_id]

    if @job.save
      redirect_to "/manage/jobs", :notice => "Job updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @job = Job.find(params[:id])

    @job.destroy

    redirect_to "/jobs", :notice => "Job deleted."
  end

  def manage
    @jobs = Job.all.order('user_id ASC')
    @admin_id = current_user.id
  end
end
