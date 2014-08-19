require_relative 'config_store'

describe "ConfigStore" do

  let(:config_store) { ConfigStore.new }
  let(:config_file) { "#{File.expand_path(File.dirname(__FILE__))}/config/settings.txt" }

  describe ".format" do
    it "should remove comments from a string" do
      config = config_store.send(:format, config_file)
      expect(config).to_not include("#")
    end
  end

  describe "#numeric?" do
    it "should return true if given a numeric string" do
      value = config_store.send(:numeric?, "123")
      expect(value).to be(true)
    end

    it "should return false if given a non numeric string" do
      value = config_store.send(:numeric?, "abc")
      expect(value).to be(false)
    end
  end

  describe "#bool?" do
    it "should return true if given a boolean like string" do
      value = config_store.send(:bool?, "true")
      expect(value).to be(true)
      value = config_store.send(:bool?, "false")
      expect(value).to be(true)
      value = config_store.send(:bool?, "on")
      expect(value).to be(true)
      value = config_store.send(:bool?, "off")
      expect(value).to be(true)
      value = config_store.send(:bool?, "yes")
      expect(value).to be(true)
      value = config_store.send(:bool?, "no")
      expect(value).to be(true)
    end
  end

  describe "#make_bool" do
    it "should convert a 'true' string to true" do
      value = config_store.send(:make_bool, "true")
      expect(value).to be(true)
    end

    it "should convert a 'false' string to false" do
      value = config_store.send(:make_bool, "false")
      expect(value).to be(false)
    end
  end

  describe "#make_numeric" do
    it "should convert an integer string to an integer" do
      value = config_store.send(:make_numeric, "100")
      expect(value).to eq("100".to_i)
    end

    it "should convert an float string to a float" do
      value = config_store.send(:make_numeric, "100.0")
      expect(value).to eq("100.0".to_f)
    end

  end

end
