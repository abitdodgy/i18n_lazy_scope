require "spec_helper"

class FakeController
  include I18nLazyScope::ActionController::Helper
  include I18nLazyScope::Helper

  def t(*args)
    I18n.t(*args)
  end

  def controller_name; :users; end
  def action_name;     :show;  end
end

describe FakeController do
  before :each do
    @controller = FakeController.new
  end

  describe "#t_scoped" do
    it "delegates to t" do
      expect(@controller).to receive(:t)
      @controller.t_scoped(:key)
    end

    it "returns correct key with scope" do
      string = @controller.t_scoped(:hello)
      expect(string).to eq('World!')
    end

    it "interpolates passed variables" do
      string = @controller.t_scoped(:greet, name: 'Mohamad', greeting: 'Hello')
      expect(string).to eq('Hello, Mohamad!')
    end
  end
end
