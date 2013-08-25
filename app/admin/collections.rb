ActiveAdmin.register Collection do
  show do |collection|
    attributes_table do
      row :name
    end
    # active_admin_comments
  end
end
