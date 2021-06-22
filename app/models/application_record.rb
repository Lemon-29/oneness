class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def error_message_list(message = '')
    self.errors.full_messages.each_with_index do |msg|
      message += "\n・#{msg}"
    end
    return message
  end
end
