Rails.application.routes.draw do



  # Routes for the Company resource:
  # CREATE
  get "/companies/new", :controller => "companies", :action => "new"
  post "/create_company", :controller => "companies", :action => "create"

  # READ
  get "/companies", :controller => "companies", :action => "index"
  get "/companies/:id", :controller => "companies", :action => "show"

  # UPDATE
  get "/companies/:id/edit", :controller => "companies", :action => "edit"
  post "/update_company/:id", :controller => "companies", :action => "update"

  # DELETE
  get "/delete_company/:id", :controller => "companies", :action => "destroy"
  #------------------------------

  # Routes for the Admin resource:
  # CREATE
  get "/admins/new", :controller => "admins", :action => "new"
  post "/create_admin", :controller => "admins", :action => "create"

  # READ
  get "/admins", :controller => "admins", :action => "index"
  get "/admins/:id", :controller => "admins", :action => "show"

  # UPDATE
  get "/admins/:id/edit", :controller => "admins", :action => "edit"
  post "/update_admin/:id", :controller => "admins", :action => "update"

  # DELETE
  get "/delete_admin/:id", :controller => "admins", :action => "destroy"
  #------------------------------

  # Routes for the Job resource:
  # CREATE
  get "/jobs/new", :controller => "jobs", :action => "new"
  post "/create_job", :controller => "jobs", :action => "create"

  # READ
  get "/jobs", :controller => "jobs", :action => "index"
  get "/jobs/:id", :controller => "jobs", :action => "show"

  # UPDATE
  get "/jobs/:id/edit", :controller => "jobs", :action => "edit"
  post "/update_job/:id", :controller => "jobs", :action => "update"

  # DELETE
  get "/delete_job/:id", :controller => "jobs", :action => "destroy"
  #------------------------------

  # Routes for the Shift resource:
  # CREATE
  get "/shifts/new", :controller => "shifts", :action => "new"
  post "/create_shift", :controller => "shifts", :action => "create"


  # READ
  get "/shifts", :controller => "shifts", :action => "index"
  get "/shifts/:id", :controller => "shifts", :action => "show"

  # UPDATE
  get "/shifts/:id/edit", :controller => "shifts", :action => "edit"
  post "/update_shift/:id", :controller => "shifts", :action => "update"

  post "/clock_out_shift/:id", :controller => "shifts", :action => "clock_out"

  # DELETE
  get "/delete_shift/:id", :controller => "shifts", :action => "destroy"
  #------------------------------

get "/approvals/:id", :controller => "shifts", :action => "approval_list"


  devise_for :users
  root 'jobs#index'

end
