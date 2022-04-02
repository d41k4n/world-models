$csv = "width,length,type,region,model,height-min,height-max,stories\n"

def read_entry(entry)
  puts entry
  file = File.open(entry, "rb")
  contents = file.read
  file.close
  lines = contents.split("\n");
  
  x1 = x2 = y1 = y2 = z1 = z2 = 0
  levels = 0
  commercial = false
  lines.each do |line|
    if line.include?("commercialTexture")
      commercial = true
    end
    if line.include?("VT ")
      points = line.gsub(/\s+/m, ' ').strip.split(" ")
      x = points[1].to_f
      y = points[2].to_f
      z = points[3].to_f
      if x < x1
        x1 = x
      end
      if x > x2
        x2 = x
      end
      if z < y1
        y1 = z
      end
      if z > y2
        y2 = z
      end
      
      if y < z1
        z1 = y
      end
      if y > z2
        z2 = y
      end
      
    end
  end
  name = (commercial ? "COM_" : "RES_") << "#{x2-x1}x#{y2-y1}"; 
  levels = ((z2 - z1 - 4) / 3).to_i
  
  count = 0;
  while File.exist?(name << "_#{count}.obj")
    count = count + 1
  end
  name = name << "_#{count}.obj"
  puts name
  $csv = "#{$csv}#{x2-x1},#{y2-y1},residential,DE,objects/uwespeed/germany/#{name},,,#{levels},SQ,UWESPEED\n"
  File.rename(entry, name)
    
end


entries = Dir.entries(".")
entries.each do |entry|
  if entry.include? ".obj"
    read_entry(entry)
  end
end

File.open("residential_generic.csv", 'w') {|f| f.write($csv) }