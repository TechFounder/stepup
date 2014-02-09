ActiveAdmin.register Message do
    permit_params :message

    index do
      column :message
      default_actions
    end

    filter :email

    form do |f|
      f.inputs "Message Details" do
        f.input :message
      end
      f.actions
    end

  end
