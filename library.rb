require 'find'

paths = []
entries = []
Find.find('.') do |path|
  paths << path unless FileTest.directory?(path)
end

paths.each do |path|
  if path.include?(".obj") || path.include?(".OBJ") 
    lib = path[2..-1]
    entries << lib
  end
end

File.open("library.txt","w") do |f|
  f.write("A\n")
  f.write("800\n")
  f.write("LIBRARY\n\n")
  f.write("# World2XPlane Model Library\n\n")
  entries.each do |entry|
    f.write("EXPORT " << "objects/" << entry << " " << entry << "\n");
   
    
  end
  f.write("EXPORT network/w2xp.net w2xp.net\n")
  
  
  
  entries = []
  paths.each do |path|
    if path.include?(".fac") || path.include?(".FAC") 
      lib = path[2..-1]
      entries << lib
    end
  end

  entries.each do |entry|
    if entry.include?("facades/")
      f.write("EXPORT " << entry << " " << entry << "\n");
    else
      f.write("EXPORT " << "facades/" << entry << " " << entry << "\n");
    end
  end
  
  
  entries = []
  paths.each do |path|
    if path.include?(".for") || path.include?(".FOR") 
      lib = path[2..-1]
      entries << lib
    end
  end

  entries.each do |entry|
    f.write("EXPORT " << entry << " " << entry << "\n");
  end
  
  
  # Autogen
  entries = []
  paths.each do |path|
    if path.include?(".ags") || path.include?(".AGS") 
      lib = path[2..-1]
      entries << lib
    end
  end

  entries.each do |entry|
    f.write("EXPORT " << entry << " " << entry << "\n");
  end
  
  # Look for local library files
  entries = []
  paths.each do |path|
    if path.include?("library.txt")
      entries << path
    end
  end

  entries.each do |entry|
    unless (entry == "./library.txt")
      lib = File.open(entry,"r")
      l = lib.read
      lib.close
      
      exports = l.split("\n")
      exports.each do |export_entry|
        if export_entry.start_with?("EXPORT ")
          virtual = export_entry.split(" ")[1]
          real = export_entry.split(" ")[2]
          f.write("EXPORT " << virtual << " " << real << "\n")
        end
        if export_entry.start_with?("EXPORT_RATIO ")
          ratio = export_entry.split(" ")[1] 
          virtual = export_entry.split(" ")[2]
          real = export_entry.split(" ")[3]
          f.write("EXPORT_RATIO " << ratio << " " << virtual << " " << real << "\n")
        end
      end
    end
  end

  

end

  

