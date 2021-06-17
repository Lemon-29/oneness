module YogaRecordsHelper
  def yoga_record_new_or_edit_path?
    if action_name == "new"
       yoga_records_path
    elsif action_name == "edit"
      yoga_records_path
    end
  end
end
