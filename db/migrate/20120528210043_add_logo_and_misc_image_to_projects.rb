class AddLogoAndMiscImageToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :logo, :string

    add_column :projects, :misc_image, :string

  end
end
