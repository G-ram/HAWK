package _hawk_lib;

public class _HAWKFileReader{
  public _HAWKFileReader(String[] files){
    if(files.length > 0){
      for(String s : files){
        try{
          byte[] encoded = java.nio.file.Files.readAllBytes(java.nio.file.Paths.get(s));
          concatFile += new String(encoded, java.nio.charset.StandardCharsets.UTF_8);
        }catch(java.io.IOException e){
          System.out.println(s+" does not seem to be valid and/or exist");
        }
      }
    }else{
      concatFile = "";
    }
  }
  public String _getConcatFile(){
    return concatFile;
  }
  private String concatFile;
}
