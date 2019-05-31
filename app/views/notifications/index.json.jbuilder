json.array! @notifications do |notification|
  json.recipient notification.recipient
  json.actor notification.actor
  json.action notification.action
  json.notifiable do
    json.type "#{notification.notifiable.class.to_s.underscore.humanize}"
  end
  json.url bet_request_path(notification.notifiable, anchor: dom_id(notification.notifiable))
end
