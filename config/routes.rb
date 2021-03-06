Rails.application.routes.draw do

  get("/", { :controller => "application", :action => "homepage"})

  # Routes for the Donation resource:

  # CREATE
  post("/insert_donation", { :controller => "donations", :action => "create" })
          
  # READ
  get("/donations", { :controller => "donations", :action => "index" })
  
  get("/donations/:path_id", { :controller => "donations", :action => "show" })
  
  # UPDATE
  
  post("/modify_donation/:path_id", { :controller => "donations", :action => "update" })
  
  # DELETE
  get("/delete_donation/:path_id", { :controller => "donations", :action => "destroy" })

  #------------------------------

  # Routes for the Subscription resource:

  # CREATE
  post("/insert_subscription", { :controller => "subscriptions", :action => "create" })
          
  # READ
  get("/subscriptions", { :controller => "subscriptions", :action => "index" })
  
  get("/subscriptions/:path_id", { :controller => "subscriptions", :action => "show" })
  
  # UPDATE
  
  post("/modify_subscription/:path_id", { :controller => "subscriptions", :action => "update" })
  
  # DELETE
  get("/delete_subscription/:path_id", { :controller => "subscriptions", :action => "destroy" })

  #------------------------------

  # Routes for the Comment resource:

  # CREATE
  post("/insert_comment", { :controller => "comments", :action => "create" })
          
  # READ
  get("/comments", { :controller => "comments", :action => "index" })
  
  get("/comments/:path_id", { :controller => "comments", :action => "show" })
  
  # UPDATE
  
  post("/modify_comment/:path_id", { :controller => "comments", :action => "update" })
  
  # DELETE
  get("/delete_comment/:path_id", { :controller => "comments", :action => "destroy" })

  #------------------------------

  # Routes for the Like resource:

  # CREATE
  post("/insert_like", { :controller => "likes", :action => "create" })
          
  # READ
  get("/likes", { :controller => "likes", :action => "index" })
  
  get("/likes/:path_id", { :controller => "likes", :action => "show" })
  
  # UPDATE
  
  post("/modify_like/:path_id", { :controller => "likes", :action => "update" })
  
  # DELETE
  get("/delete_like/:path_id", { :controller => "likes", :action => "destroy" })

  #------------------------------

  # Routes for the User content resource:

  # CREATE
  post("/insert_user_content", { :controller => "user_contents", :action => "create" })
          
  # READ
  get("/user_contents", { :controller => "user_contents", :action => "index" })
  
  get("/user_contents/:path_id", { :controller => "user_contents", :action => "show" })
  
  # UPDATE
  
  post("/modify_user_content/:path_id", { :controller => "user_contents", :action => "update" })
  
  # DELETE
  get("/delete_user_content/:path_id", { :controller => "user_contents", :action => "destroy" })

  #------------------------------

  # Routes for the Follow request resource:

  # CREATE
  post("/insert_follow_request", { :controller => "follow_requests", :action => "create" })
          
  # READ
  get("/follow_requests", { :controller => "follow_requests", :action => "index" })
  
  get("/follow_requests/:path_id", { :controller => "follow_requests", :action => "show" })
  
  # UPDATE
  
  post("/modify_follow_request/:path_id", { :controller => "follow_requests", :action => "update" })
  
  # DELETE
  get("/delete_follow_request/:path_id", { :controller => "follow_requests", :action => "destroy" })

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
