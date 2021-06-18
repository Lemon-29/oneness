module RecordsHelper
  def record_new_or_edit_path?
    if action_name == "new"
       records_path
    elsif action_name == "edit"
      records_path
    end
  end
end
