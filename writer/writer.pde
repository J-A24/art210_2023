String[] lines = loadStrings("english3.txt");
StringList lines2 = new StringList();

size(720,720);
background(255);
fill(200,0,200);

//////////////////
for(int i = 0; i<10; i++) {
 lines2.append(lines[i]); 
}

println(lines2);

lines2.remove(2);

println(lines2);
println(lines2.get(2));
text(lines2.get(2), 200, 200);
/////////////////
