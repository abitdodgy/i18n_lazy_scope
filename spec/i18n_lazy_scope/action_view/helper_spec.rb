require "spec_helper"

class FakeView
  include I18nLazyScope::ActionView::Helper

  def initialize
    @virtual_path = 'users.show.user_profile'
  end

  def t(*args)
    I18n.t(*args)
  end

  def controller_name; :users; end
  def action_name;     :show;  end
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
