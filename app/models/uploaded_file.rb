require 'ftools'

class UploadedFile < ActiveRecord::Base

  after_create :write_file
  before_destroy :prepare_file_for_delete
  after_destroy :delete_file
  
  STORAGE_DIR = "doc/uploaded_files/"
  
  def inputfile=(input)
    @file_contents = input
    
    self.file_name = sanitize_filename(
      "#{Time.parse(self.created_at.to_s).to_i}#{File.extname(input.original_filename)}")
      
    self.file_type = input.content_type
  end
  
  def inputfile
    self.file_name
  end
  
  def file_path
    t = Time.parse(self.created_at.to_s)
    File.join(UploadedFile::STORAGE_DIR, "#{t.year}/#{t.month}/#{t.day}/")
  end
  
  def contents
    File.open(File.join(self.file_path, self.file_name)).read.to_s
  end
  
  # before_destroy
  def prepare_file_for_delete
    @filename = File.join(self.file_path, self.file_name)
  end
  
  # after_create
  def write_file(data = nil)
    # allow user to provide data
    contents = data || @file_contents.read
    
    # make sure that there is data to write
    if contents
      # filename to use
      filename = self.file_name
    
      # directory to store it in
      dir = self.file_path
    
      # create the nested directory to store the file
      File.makedirs dir.to_s unless File.directory?(dir)
    
      # write the file
      File.open( File.join(dir, filename), "wb") { |f| f.write(contents) }
    end
  end
  
  # after_destroy
  def delete_file
    if @filename.nil? || @filename.empty?
      return
    end
    
    file_exists = File.exists?(@filename)
          
    if file_exists
      File.delete(@filename)
    end
  end
  
  private
  
    # santize filenames removing non-alphanumeric 
    def sanitize_filename(filename)
      # IE likes to include the entire path, rather than just the filenam
      just_filename = File.basename(filename) 
    
      # replace all none alphanumeric, underscore or perioids with underscore
      just_filename.sub(/[^\w\.\-]/,'-').downcase
    end
end
