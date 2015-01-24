require "spec_helper"
require "i18n_lazy_scope/action_view/helper"
require "i18n"

class FakeView
  include I18nLazyScope::ActionView::Helper

  def t(*args)
    I18n.t(*args)
  end

private

  def lazy_scope
    [:views, :users, :show]
  end
end

describe FakeView do
  before :each do
    @view = FakeView.new
  end

  describe "#t_scoped" do
    it "delegates to t" do
      expect(@view).to receive(:t)
      @view.t_scoped(:key)
    end

    it "returns correct key with scope" do
      string = @view.t_scoped(:hello)
      expect(string).to eq('World!')
    end

    it "interpolates passed variables" do
      string = @view.t_scoped(:greet, name: 'Mohamad', greeting: 'Hello')
      expect(string).to eq('Hello, Mohamad!')
    end
  end
end
