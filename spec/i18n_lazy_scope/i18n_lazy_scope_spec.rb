require "spec_helper"

module I18nLazyScope
  describe I18nLazyScope do
    describe "#configure" do
      before do
        I18nLazyScope.configure do |config|
          config.action_controller_scope = %i(my scope)
          config.action_mailer_scope = %i(my scope)
          config.action_view_scope = %i(my scope)
        end
      end

      it "sets custom controller scope" do
        controller = FakeController.new
        expect(controller.lazy_scope).to eq [:my, :scope, :users, :show]
      end

      it "sets custom mailer scope" do
        mailer = FakeMailer.new
        expect(mailer.lazy_scope).to eq [:my, :scope, :user_mailer, :welcome_email]
      end

      it "sets custom view scope" do
        view = FakeView.new
        expect(view.lazy_scope).to eq [:my, :scope, "users.show.user_profile"]
      end
    end
  end
end
