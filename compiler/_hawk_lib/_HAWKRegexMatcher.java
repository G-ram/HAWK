package _hawk_lib;

public class _HAWKRegexMatcher{
  public _HAWKRegexMatcher(String aInput){
    input = aInput;
  }
  public _HAWKTable<String> _match(String pat){
      matcher = java.util.regex.Pattern.compile(pat).matcher(input);
      _HAWKTable<String> allMatches = new _HAWKTable<String>();
      int i = 0;
      while(matcher.find()){
        allMatches.setIntIndex(i, matcher.group());
        i++;
      }
      return allMatches;
  }
  java.util.regex.Matcher matcher;
  String input;
}
