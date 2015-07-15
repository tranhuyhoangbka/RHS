Warden::Manager.before_logout do |user,auth,opts|
  WebsocketRails.users.users.each do |key, val|
    val.send_message :new_message,
      {user: {id: user.id, name: user.name},
      message: {type: Settings.chat.type.disconnected, content: I18n.t("chat.disconnected")}}
  end
end

Warden::Manager.after_authentication do |user, auth, opts|
  WebsocketRails.users.users.each do |key, val|
    val.send_message :new_message,
      {user: {id: user.id, name: user.name},
      message: {type: Settings.chat.type.connected, content: I18n.t("chat.connected")}}
  end
end
