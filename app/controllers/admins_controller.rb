class AdminsController < ApplicationController
  def index
    @admins = Admin.all
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new
    @admin.full_access = params[:full_access]
    @admin.user_id = params[:user_id]
    @admin.company_id = params[:company_id]

    if @admin.save
      redirect_to "/admins", :notice => "Admin created successfully."
    else
      render 'new'
    end
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])

    @admin.full_access = params[:full_access]
    @admin.user_id = params[:user_id]
    @admin.company_id = params[:company_id]

    if @admin.save
      redirect_to "/admins", :notice => "Admin updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @admin = Admin.find(params[:id])

    @admin.destroy

    redirect_to "/admins", :notice => "Admin deleted."
  end
end
