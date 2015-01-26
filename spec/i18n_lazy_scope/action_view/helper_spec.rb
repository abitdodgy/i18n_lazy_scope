require "spec_helper"

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
