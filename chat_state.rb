def customer_state(session_id = nil)
  return { state: 'chat_disabled' } unless Setting.get('chat')
  return chat_session_state(session_id) if session_id
  return { state: 'offline' } if Chat.active_agent_count([id]).zero?
  return {
    state: 'no_seats_available',
    queue: waiting_count,
  } if Chat.waiting_chat_count(id) >= max_queue

  { state: 'online' }
end

def chat_session_state(session_id)
  state = nil
  chat_session = Chat::Session.find_by(session_id: session_id, state: %w[waiting running])
    if chat_session.state == 'running'
      state = running_atributes(chat_session)

    elsif chat_session.state == 'waiting'
      state = {
        state:    'reconnect',
        position: chat_session.position,
      }
    end
  state
end

def running_atributes(chat_session)
  atributes = nil
  if chat_session.user_id
    user = user_atributes(session_id)
    session = Chat::Session.messages_by_session_id(session_id)

    if session
      atributes = {
        state:   'reconnect',
        session: session,
        agent:   user,
      }
    end
  end
  atributes
end

def user_atributes(session_id)
  url = nil
  chat_user = User.lookup(id: chat_session.user_id)

  if chat_user.image && chat_user.image != 'none'
    url = "#{Setting.get('http_type')}://#{Setting.get('fqdn')}/api/v1/users/image/#{chat_user.image}"
  end
  {
    name:   chat_user.fullname,
    avatar: url,
  }
end 