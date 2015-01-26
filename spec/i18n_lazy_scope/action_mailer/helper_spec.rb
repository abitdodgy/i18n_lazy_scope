require "spec_helper"

describe FakeMailer do
  before :each do
    @mailer = FakeMailer.new
  end

  describe "#t_scoped" do
    it "delegates to t" do
      expect(@mailer).to receive(:t)
      @mailer.t_scoped(:key)
    end

    it "returns correct key with scope" do
      string = @mailer.t_scoped(:hello)
      expect(string).to eq('World!')
    end

    it "interpolates passed variables" do
      string = @mailer.t_scoped(:subject, name: 'Mohamad', greeting: 'Hello')
      expect(string).to eq('Hello, Mohamad!')
    end
  end
end
