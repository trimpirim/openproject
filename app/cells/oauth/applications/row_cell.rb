module OAuth
  module Applications
    class RowCell < ::RowCell
      include ::IconsHelper
      include ::OAuthHelper

      def application
        model
      end

      def name
        link_to application.name, oauth_application_path(application)
      end

      def owner
        link_to application.owner.name, user_path(application.owner)
      end

      def confidential
        if application.confidential?
          op_icon 'icon icon-checkmark'
        end
      end

      def redirect_uri
        urls = application.redirect_uri.split("\n")
        safe_join urls, '<br/>'.html_safe
      end

      def confidential
        application.confidential
      end

      def scopes
        oauth_scope_translations(application)
      end

      def edit_link
        link_to(
          I18n.t(:button_edit),
          edit_oauth_application_path(application),
          class: "oauth-application--edit-link icon icon-edit"
        )
      end

      def button_links
        [
          edit_link,
          delete_link(oauth_application_path(application))
        ]
      end
    end
  end
end
