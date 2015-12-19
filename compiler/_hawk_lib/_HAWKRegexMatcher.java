package _hawk_lib;

public class _HAWKRegexMatcher{
  public _HAWKRegexMatcher(String aInput){
    input = aInput;
  }
  public _HAWKTable<_HAWKTable<String>> _match(String pat){
      matcher = java.util.regex.Pattern.compile(pat).matcher(input);
      _HAWKTable<_HAWKTable<String>> allMatches = new _HAWKTable<_HAWKTable<String>>();
      int i = 0;
      while(matcher.find()){
        _HAWKTable<String> temp = new _HAWKTable<String>();
        temp.setIntIndex(0, matcher.group());
        allMatches.setIntIndex(i, temp);
        i++;
      }
      return allMatches;
  }
  java.util.regex.Matcher matcher;
  String input;
}
