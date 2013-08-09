class Entry
  include Motion::Encodable
  properties :title
  def initialize(params={})
    @title = params[:title]
  end
end

describe Motion::Encodable do
  before do
    @params = {
        title: 'bar',
    }
  end

  describe 'NSCoderプロトコル準拠' do
    before do
      @entry = Entry.new(@params)
    end

    it '必要なメソッドを実装している' do
      @entry.respond_to?(:'initWithCoder:').should == true
      @entry.respond_to?(:'encodeWithCoder:').should == true
    end

    it '保存->ロードできる' do
      entry_as_data = @entry.to_data
      loaded_entry = Entry.load(entry_as_data)
      loaded_entry.title.should == @params[:title]
    end
  end
end