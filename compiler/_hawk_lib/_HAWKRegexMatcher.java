package _hawk_lib;

public class _HAWKRegexMatcher{
  public _HAWKRegexMatcher(String aInput){
    input = aInput;
  }
  public String[] _match(String pat){
      matcher = java.util.regex.Pattern.compile(pat).matcher(input);
      java.util.ArrayList<String> allMatches = new java.util.ArrayList<String>();
      while(matcher.find()){
        allMatches.add(matcher.group());
      }
      return allMatches.toArray(new String[allMatches.size()]);
  }
  java.util.regex.Matcher matcher;
  String input;
}
