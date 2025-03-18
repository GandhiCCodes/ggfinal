Rails.application.routes.draw do
  get("/", { :controller => "places", :action => "index" })
  get( "/login", { controller: "sessions", action: "new" })
  resources "entries"
  resources "places"
  resources "sessions"
  resources "users"
end
