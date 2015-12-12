package _hawk_lib;

public class _HAWKCSSMatcher{
    public _HAWKCSSMatcher(String aInput){
        input = aInput;
    }
    public org.jsoup.nodes.Element[] _match(String pat){

        org.jsoup.nodes.Document doc = org.jsoup.Jsoup.parse(input);
        return doc.select(pat);
    }

    String input;
}
