class UploadedFilesController < ApplicationController
  # GET /uploaded_files
  # GET /uploaded_files.xml
  def index
    @uploaded_files = UploadedFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @uploaded_files }
    end
  end

  # GET /uploaded_files/1
  # GET /uploaded_files/1.xml
  def show
    @uploaded_file = UploadedFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @uploaded_file }
    end
  end

  # GET /uploaded_files/new
  # GET /uploaded_files/new.xml
  def new
    @uploaded_file = UploadedFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @uploaded_file }
    end
  end

  # GET /uploaded_files/1/edit
  def edit
    @uploaded_file = UploadedFile.find(params[:id])
  end

  # POST /uploaded_files
  # POST /uploaded_files.xml
  def create
    @uploaded_file = UploadedFile.new(params[:uploaded_file])

    respond_to do |format|
      if @uploaded_file.save
        format.html { redirect_to(@uploaded_file, :notice => 'UploadedFile was successfully created.') }
        format.xml  { render :xml => @uploaded_file, :status => :created, :location => @uploaded_file }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @uploaded_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /uploaded_files/1
  # PUT /uploaded_files/1.xml
  def update
    @uploaded_file = UploadedFile.find(params[:id])

    respond_to do |format|
      if @uploaded_file.update_attributes(params[:uploaded_file])
        format.html { redirect_to(@uploaded_file, :notice => 'UploadedFile was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @uploaded_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /uploaded_files/1
  # DELETE /uploaded_files/1.xml
  def destroy
    @uploaded_file = UploadedFile.find(params[:id])
    @uploaded_file.destroy

    respond_to do |format|
      format.html { redirect_to(uploaded_files_url) }
      format.xml  { head :ok }
    end
  end
end
