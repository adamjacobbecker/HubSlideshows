if Rails.env.development?
    class Hook
        def self.delivering_email(message)
            message.to  = "\"#{message.to.first}\" <ad@mbecker.cc>"
            message.cc  = nil if !message.cc.nil?
            message.bcc = nil if !message.bcc.nil?
        end
    end

    ActionMailer::Base.register_interceptor(Hook)
end