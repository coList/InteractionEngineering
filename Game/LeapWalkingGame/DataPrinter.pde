class DataPrinter {
  PrintWriter output;
  String path;

  DataPrinter(String path) {
    this.path = path;
    
    String[] lines = loadStrings(path);  //store old Data
    output = createWriter(path);
    for (int i = 0; i < lines.length; i++) {
      printData(lines[i]);
    }
    
  }

  void printData(String data) {
    output.println(data);
  }

  void saveData() {
    output.flush();
    output.close();
  }
}