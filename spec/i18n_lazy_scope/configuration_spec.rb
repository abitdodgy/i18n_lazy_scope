require "spec_helper"

module I18nLazyScope
  describe Configuration do
    describe "#action_controller_scope" do
      it "defaults to [:controllers]" do
        scope = Configuration.new.action_controller_scope
        expect(scope).to eq([:controllers])
      end
    end

    describe "#action_controller_scope=" do
      it "sets a value" do
        config = Configuration.new
        config.action_controller_scope = [:my, :controller, :scope]
        scope = config.action_controller_scope
        expect(scope).to eq([:my, :controller, :scope])
      end
    end

    describe "#action_mailer_scope" do
      it "defaults to [:mailers]" do
        scope = Configuration.new.action_mailer_scope
        expect(scope).to eq([:mailers])
      end
    end

    describe "#action_mailer_scope=" do
      it "sets a value" do
        config = Configuration.new
        config.action_mailer_scope = [:my, :mailer, :scope]
        scope = config.action_mailer_scope
        expect(scope).to eq([:my, :mailer, :scope])
      end
    end

    describe "#action_view_scope" do
      it "defaults to [:views]" do
        scope = Configuration.new.action_view_scope
        expect(scope).to eq([:views])
      end
    end

    describe "#action_view_scope=" do
      it "sets a value" do
        config = Configuration.new
        config.action_view_scope = [:my, :view, :scope]
        scope = config.action_view_scope
        expect(scope).to eq([:my, :view, :scope])
      end
    end
  end
end
