Rails.application.routes.draw do



  # Routes for the Event spot resource:

  # CREATE
  post("/insert_event_spot", { :controller => "event_spots", :action => "create" })
          
  # READ
  get("/event_spots", { :controller => "event_spots", :action => "index" })
  
  get("/event_spots/:path_id", { :controller => "event_spots", :action => "show" })
  
  # UPDATE
  
  post("/modify_event_spot/:path_id", { :controller => "event_spots", :action => "update" })
  
  # DELETE
  get("/delete_event_spot/:path_id", { :controller => "event_spots", :action => "destroy" })

  #------------------------------

  # Routes for the Category resource:

  # CREATE
  post("/insert_category", { :controller => "categories", :action => "create" })
          
  # READ
  get("/categories", { :controller => "categories", :action => "index" })
  
  get("/categories/:path_id", { :controller => "categories", :action => "show" })
  
  # UPDATE
  
  post("/modify_category/:path_id", { :controller => "categories", :action => "update" })
  
  # DELETE
  get("/delete_category/:path_id", { :controller => "categories", :action => "destroy" })

  #------------------------------

  # Routes for the Dinner spot resource:

  # CREATE
  post("/insert_dinner_spot", { :controller => "dinner_spots", :action => "create" })
          
  # READ
  get("/dinner_spots", { :controller => "dinner_spots", :action => "index" })
  
  get("/dinner_spots/:path_id", { :controller => "dinner_spots", :action => "show" })
  
  # UPDATE
  
  post("/modify_dinner_spot/:path_id", { :controller => "dinner_spots", :action => "update" })
  
  # DELETE
  get("/delete_dinner_spot/:path_id", { :controller => "dinner_spots", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
