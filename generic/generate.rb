# Produce some generic buildings

def generate_building(texture, prefix, postfix, width, length, height)
    
  obj_text = ""
  obj_text << "I\n"
  obj_text << "800\n"
  obj_text << "OBJ\n\n"
  
  # Write texture, and texture lit
  obj_text << "TEXTURE #{texture}\n"
  # Write LOD
  obj_text << "ATTR_LOD 0 5000.000000\n"
  
  w_txt_width = 10.0;
  w_txt_height = 10.0;
  
  u_width = width / w_txt_width
  u_length = length / w_txt_width
  
  
  radiusX = width / 2
  radiusY = length / 2
  
  
  obj_text << "POINT_COUNTS 20 0 0 30\n"
  
  # Back Face
  obj_text << "VT #{-radiusX} #{-height} #{-radiusY} 0.0000 0.0000 1.0000 0 0\n" #0
  obj_text << "VT #{radiusX} #{-height} #{-radiusY} 0.0000 0.0000 1.0000 #{u_width} 0\n"  #1
  obj_text << "VT #{radiusX} #{height} #{-radiusY} 0.0000 0.0000 1.0000 #{u_width} 0.5\n"   #2
  obj_text << "VT #{-radiusX} #{height} #{-radiusY} 0.0000 0.0000 1.0000 0 0.5\n"  #3
  
  # Right Face
  obj_text << "VT #{radiusX} #{-height} #{-radiusY} 1.0000 0.0000 0.0000 0 0\n"  #4
  obj_text << "VT #{radiusX} #{-height} #{radiusY} 1.0000 0.0000 0.0000 #{u_length} 0\n"   #5
  obj_text << "VT #{radiusX} #{height} #{radiusY} 1.0000 0.0000 0.0000 #{u_length} 0.5\n"    #6
  obj_text << "VT #{radiusX} #{height} #{-radiusY} 1.0000 0.0000 0.0000 0 0.5\n"   #7
  
  # Front Face
  obj_text << "VT #{-radiusX} #{-height} #{radiusY} 0.0000 0.0000 -1.0000 0 0\n" #8
  obj_text << "VT #{radiusX} #{-height} #{radiusY} 0.0000 0.0000 -1.0000 #{u_width} 0\n"  #9
  obj_text << "VT #{radiusX} #{height} #{radiusY} 0.0000 0.0000 -1.0000 #{u_width} 0.5\n"   #10
  obj_text << "VT #{-radiusX} #{height} #{radiusY} 0.0000 0.0000 -1.0000 0 0.5\n"  #11
  
  # Left Face
  obj_text << "VT #{-radiusX} #{-height} #{-radiusY} -1.0000 0.0000 0.0000 0 0\n"  #12
  obj_text << "VT #{-radiusX} #{-height} #{radiusY} -1.0000 0.0000 0.0000 #{u_length} 0\n"   #13
  obj_text << "VT #{-radiusX} #{height} #{radiusY} -1.0000 0.0000 0.0000 #{u_length} 0.5\n"    #14
  obj_text << "VT #{-radiusX} #{height} #{-radiusY} -1.0000 0.0000 0.0000 0 0.5\n"   #15
  

  # Flat Roof
  obj_text << "VT #{-radiusX} #{height} #{-radiusY} 0.0000 -1.0000 0.0000 0 0.5\n"  #16
  obj_text << "VT #{radiusX} #{height} #{-radiusY} 0.0000 -1.0000 0.0000 1 0.5\n"  #17
  obj_text << "VT #{radiusX} #{height} #{radiusY} 0.0000 -1.0000 0.0000 1 1\n"  #18
  obj_text << "VT #{-radiusX} #{height} #{radiusY} 0.0000 -1.0000 0.0000 0 1\n"  #19
  
  
  
  
  
  
  
  obj_text << "\n"
  obj_text << "IDX10 0 1 2 0 2 3 4 5 6 6\n"
  obj_text << "IDX 7\nIDX 4\n"
  
  obj_text << "IDX 10\nIDX 9\nIDX 8\nIDX 11\nIDX 10\nIDX 8\n"
  
  obj_text << "IDX 14\nIDX 13\nIDX 12\n";
  
  obj_text << "IDX 12\nIDX 15\nIDX 14\n";
 
 
  obj_text << "IDX 16\nIDX 17\nIDX 18\n";
  obj_text << "IDX 18\nIDX 19\nIDX 16\n";
  
  obj_text << "TRIS 0 30\n"
  
  f = File.new("#{prefix}_#{width.to_i}x#{length.to_i}x#{height.to_i}_#{postfix}.obj","w")
  f << obj_text
  f.close
  
  "#{prefix}_#{width.to_i}x#{length.to_i}x#{height.to_i}_#{postfix}.obj"
  
end

system "rm *.obj"

entries = ""
entries << "width,length,type,region,model,height-min,height-max,stories,shape,library\n"
20.upto(100) do |x|
  20.upto(100) do |y|
    s1 = generate_building("ind1.png", "IND", "1", x.to_f, y.to_f, 8.0);
    s2 = generate_building("ind2.png", "IND", "2", x.to_f, y.to_f, 10.0);
    entries << "#{x.to_f},#{y.to_f},INDUSTRIAL,,objects/generic/#{s1},,,,SQ,GENERIC\n"
    entries << "#{x.to_f},#{y.to_f},INDUSTRIAL,,objects/generic/#{s2},,,,SQ,GENERIC\n"    
  end
end

f = File.new("industrial_generic.csv","w")
f << entries
f.close

