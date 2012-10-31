$.noty.defaults =
  layout: "top"
  theme: 'defaultTheme'
  type: "alert"
  text: ""
  dismissQueue: true # If you want to use queue feature set this true
  template: "<div class=\"noty_message\"><span class=\"noty_text\"></span><div class=\"noty_close\"></div></div>"
  animation:
    open:
      height: "toggle"
    close:
      height: "toggle"
    easing: "swing"
    speed: 500 # opening & closing animation speed

  timeout: 3000 # delay for closing event. Set false for sticky notifications
  force: false # adds notification to the beginning of queue when set to true
  modal: false
  closeWith: ["hover"]
  callback:
    onShow: ->
    afterShow: ->
    onClose: ->
    afterClose: ->

  buttons: false # an array of buttons

window.send_notify =(text, type='alert') ->
  noty(text: text, type: type)