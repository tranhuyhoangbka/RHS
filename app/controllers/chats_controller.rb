class ChatsController < WebsocketRails::BaseController
  def client_connected
    WebsocketRails.users.users.delete(current_user.id.to_s) unless current_user.nil?
    WebsocketRails.users.users[connection.id] = connection
    chats = Chat.last Settings.num_of_chat_history
    chats.each do |chat|
      WebsocketRails.users.users[connection.id].send_message :new_message,
        {user: {id: chat.user_id, name: chat.user_name},
        message: {type: Settings.chat.type.new_message,
        content: chat.content}}
    end
  end

  def client_disconnected
    WebsocketRails.users.users.delete(connection.id)
  end

  def incoming_message
    chat = Chat.create user_id: current_user.id, content: message
    broadcast_message :new_message,
      {user: {id: current_user.id, name: current_user.name},
      message: {type: Settings.chat.type.new_message, content: message}}
  end
end
