class writer {
  String[] lines;
  StringList lines2 = new StringList();
  
  writer() {
    lines = loadStrings("positions.txt");
    for(int i = 0; i<lines.length; i++) {
     lines2.append(lines[i]); 
    }
    println(lines2.size());
  }
  
  String word() {
    if(lines2.size() == 0) return("ERROR: NO MORE WORDS IN LIST");
    int value = floor(random(1)*lines2.size());
    String res = lines2.get(value);
    lines2.remove(value);
    return(res);
  }
}
