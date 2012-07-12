class UserMailer < ActionMailer::Base
  default from: "berkeley@hubbayarea.com"

  def project_created(project)
    @project = project

    to = project.email
    subject = "Project '#{@project.name}' created on Hub Slideshows"

    mail(to: to, subject: subject)
  end

end
