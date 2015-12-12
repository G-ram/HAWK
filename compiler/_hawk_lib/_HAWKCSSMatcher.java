package _hawk_lib;

public class _HAWKCSSMatcher{
    public _HAWKCSSMatcher(String aInput){
        input = aInput;
    }
    public String[] _match(String pat){
        java.util.ArrayList<String> allMatches = new java.util.ArrayList<String>();
        org.jsoup.nodes.Document doc = org.jsoup.Jsoup.parse(input);
        return allMatches.toArray(new String[doc.select(pat).size()]);
    }

    String input;
}
