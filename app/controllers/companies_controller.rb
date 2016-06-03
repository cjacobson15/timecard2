class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new
    @company.state = params[:state]
    @company.city = params[:city]
    @company.name = params[:name]

    if @company.save
      redirect_to "/companies", :notice => "Company created successfully."
    else
      render 'new'
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])

    @company.state = params[:state]
    @company.city = params[:city]
    @company.name = params[:name]

    if @company.save
      redirect_to "/companies", :notice => "Company updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @company = Company.find(params[:id])

    @company.destroy

    redirect_to "/companies", :notice => "Company deleted."
  end
end
