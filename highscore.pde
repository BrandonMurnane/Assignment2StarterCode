PrintWriter output;
BufferedReader reader;
String highscoreFile = "highscore.txt";
int highscore;
//checks old high score then changes if current score is greater
void updateHighscore() {
  if (highscore < score) {
    highscore = score;
    // Create a new file in the sketch directory
    output = createWriter(highscoreFile);
    output.println(highscore);
    output.close(); // Writes the remaining data to the file & Finishes the file
  }
}

void importHighscore() {
  // Open the file from the createWriter()
  reader = createReader(highscoreFile);
  if (reader == null) {
    highscore = 0;
    return;
  }
  String line;
  try{
  line = reader.readLine();
  } 
  catch (IOException e) {
    e.printStackTrace();
    line = null;
  }
  if (line != null) {
    highscore = int(line);
    println(highscore);
  }
}
