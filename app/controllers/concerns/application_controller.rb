class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    

    def current_or_guest_user
        if current_user
          if session[:guest_user_id] && session[:guest_user_id] != current_user.id
            logging_in
            # reload guest_user to prevent caching problems before destruction
            guest_user(with_retry = false).try(:reload).try(:destroy)
            session[:guest_user_id] = nil
          end
          current_user
        else
          guest_user
        end
      end
    
      # find guest_user object associated with the current session,
      # creating one as needed
      def guest_user(with_retry = true)
        # Cache the value the first time it's gotten.
        @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)
    
      rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
         session[:guest_user_id] = nil
         guest_user if with_retry
      end
    
      private
    
      # called (once) when the user logs in, insert any code your application needs
      # to hand off from guest_user to current_user.
      def logging_in
        # For example:
        # guest_comments = guest_user.comments.all
        # guest_comments.each do |comment|
          # comment.user_id = current_user.id
          # comment.save!
        # end
      end
      
      def transfer_guest_to_user
        # At this point you have access to:
        #   * current_user - the user they've just logged in as
        #   * guest_user - the guest user they were previously identified by
        # 
        # After this block runs, the guest_user will be destroyed!
      end

      def create_guest_user
        u = User.new(email: "Anonymous_#{Time.now.to_i}#{rand(100)}@example.com")
        u.save!(validate: false)
        session[:guest_user_id] = u.id
        u
      end
end
