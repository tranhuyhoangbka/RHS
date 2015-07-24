class ChatsController < WebsocketRails::BaseController
  def client_connected
    WebsocketRails.users.users.delete(current_user.id.to_s) unless current_user.nil?
    WebsocketRails.users.users[connection.id] = connection
  end

  def client_disconnected
    WebsocketRails.users.users.delete(connection.id)
  end

  def incoming_message
    broadcast_message :new_message,
      {user: {id: current_user.id, name: current_user.name},
      message: {type: Settings.chat.type.new_message, content: message}}
  end
end
