package _hawk_lib;

public class _HAWKRegexMatcher{
  public _HAWKRegexMatcher(String aInput){
    input = aInput;
  }
  public String[] _match(String pat){
      pattern = java.util.regex.Pattern.compile(pat);
      return pattern.split(input);
  }
  java.util.regex.Pattern pattern;
  String input;
}
