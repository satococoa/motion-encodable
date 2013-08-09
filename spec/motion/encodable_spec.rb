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

  describe 'NSCoder protocol' do
    before do
      @entry = Entry.new(@params)
    end

    it 'should responds to required methods' do
      @entry.respond_to?(:'initWithCoder:').should == true
      @entry.respond_to?(:'encodeWithCoder:').should == true
    end

    it 'should be able to load' do
      entry_as_data = @entry.to_data
      loaded_entry = Entry.load(entry_as_data)
      loaded_entry.title.should == @params[:title]
    end
  end
end