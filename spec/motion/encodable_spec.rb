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
      dir_path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)[0]
      @file_path = dir_path + '/entry.dat'
    end

    after do
      # remove saved file
      file_manager = NSFileManager.defaultManager
      if file_manager.fileExistsAtPath(@file_path)
        error = Pointer.new(:object)
        file_manager.removeItemAtPath(@file_path, error: error)
        raise error[0] if error[0]
      end
    end

    it 'should responds to required methods' do
      @entry.respond_to?(:'initWithCoder:').should == true
      @entry.respond_to?(:'encodeWithCoder:').should == true
    end

    it 'should be able to load as data' do
      entry_as_data = @entry.to_data
      loaded_entry = Entry.load(entry_as_data)
      loaded_entry.title.should == @params[:title]
    end

    it 'should be able to save into file' do
      @entry.save_to_file(@file_path)
      entry_as_data = NSData.dataWithContentsOfFile(@file_path)
      loaded_entry = Entry.load(entry_as_data)
      loaded_entry.title.should == @params[:title]
    end
  end
end