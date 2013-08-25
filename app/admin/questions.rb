ActiveAdmin.register Question do
  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :collection
    end
    f.inputs "Content" do
      f.input :answer
    end
    f.inputs "Attachment" do
      f.file_field :attachment
    end
    f.actions
  end

  show do |question|
    attributes_table do
      row :title
      row :answer
      row :attachment do
        image_tag(question.attachment.url)
      end
    end
    # active_admin_comments
  end
end
