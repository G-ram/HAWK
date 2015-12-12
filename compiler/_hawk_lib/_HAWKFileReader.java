package _hawk_lib;

public class _HAWKFileReader{
  public _HAWKFileReader(String[] files){
    concatFile = "";
    if(files.length > 0){
      for(String s : files){
        try {
            concatFile += org.jsoup.Jsoup.connect(s).get().toString();
        } catch (Exception e) {
            try{
              byte[] encoded = java.nio.file.Files.readAllBytes(java.nio.file.Paths.get(s));
              concatFile += new String(encoded, java.nio.charset.StandardCharsets.UTF_8);
            }catch(java.io.IOException e1){
              System.out.println(s+" does not seem to be valid and/or exist");
            }
        }
      }
    }
  }
  public String _getConcatFile(){
    return concatFile;
  }
  private String concatFile;
}
