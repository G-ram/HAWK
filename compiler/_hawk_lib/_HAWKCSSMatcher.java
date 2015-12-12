package _hawk_lib;

public class _HAWKCSSMatcher{
    public _HAWKCSSMatcher(String aInput){
        input = aInput;
    }
    public org.jsoup.select.Elements _match(String pat){

        org.jsoup.nodes.Document doc = org.jsoup.Jsoup.parse(input);
        return doc.select(pat);
    }

    String input;
}
