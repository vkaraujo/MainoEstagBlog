module Readers
    class HomeController < ReadersController
      def index
        @posts = Post.published.most_recently_published.paginate(page: params[:page], per_page: 3)
      end
    end
end