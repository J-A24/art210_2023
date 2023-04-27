String[] lines = loadStrings("english3.txt");
StringList lines2 = new StringList();
//int j = 0;
//int n = 0;
//int count = 0;
//////////////////
for(int i = 0; i<10; i++) {
 lines2.append(lines[i]); 
}

println(lines2);

lines2.remove(2);

println(lines2);
println(lines2.get(2));
/////////////////




/*
println("there are " + lines.length + " lines");
int count=0;
int n=0;
int i =0;

frameRate(.00001);
size(720,720);
background(255);
fill(200,0,200);
println(lines[i]);*/
 
/*while (i < lines.length) {
  println(lines[i]);
  text(lines[i], 200, 200);
  n=i;
  count=n;
  i++;
}

print(n);*/
