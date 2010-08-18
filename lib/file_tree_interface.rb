# Made into a module and refactored by Michael Leone 18 August 2010.
#
# jQuery File Tree Ruby Connector
# Version 1.01
# Erik Lax
# http://datahack.se
# 13 July 2008
# History
# 1.01 Initial Release
# Output a list of files for jQuery File Tree

module FileTreeInterface
  def render_file_tree(dir)
    @result = "<ul class=\"jqueryFileTree\" style=\"display: none;\">"
    begin
      path = File.join MEDIA_DIR, dir 
      Dir.chdir(File.expand_path(path).untaint)
      
      # check that our base path still begins with root path
      if Dir.pwd[0,MEDIA_DIR.length] == MEDIA_DIR
        
        render_directory_contents dir
      else
        @result << "Sorry, you're not allowed there."
      end
    rescue
      @result << "Internal error"
    ensure
      @result << "</ul>"
      return @result
    end
  end

  private

  def render_directory_contents(dir)
    Dir.glob("*") do |entry|
      if File.file?(entry.untaint)
        ext = File.extname(entry)[1..-1]
        @result << "<li class=\"file ext_#{ext}\"><a href=\"#\" rel=\"#{dir}#{entry}\">#{entry}</a></li>"
      elsif File.directory?(entry.untaint)
         @result << "<li class=\"directory collapsed\"><a href=\"#\" rel=\"#{dir}#{entry}/\">#{entry}</a></li>"
      end
    end
  end
end
