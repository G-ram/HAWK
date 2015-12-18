package _hawk_lib;

public class _HAWKCSSMatcher{
    public _HAWKCSSMatcher(String aInput){
        input = aInput;
    }
    public _HAWKTable<_HAWKTable<String>> _match(String pat){
        _HAWKTable<_HAWKTable<String>> _allMatches = new _HAWKTable<>();
        org.jsoup.nodes.Document doc = org.jsoup.Jsoup.parse(input);
        int ctr = 0;
        for(org.jsoup.nodes.Element e : doc.select(pat)){
            _HAWKTable<String> _matches = new _HAWKTable<>();
            // inserts empty string if no id
            _matches.setStringIndex("id", e.id());
            // insert attributes as key-val pairs
            org.jsoup.nodes.Attributes elementAttributes = e.attributes();
            for(org.jsoup.nodes.Attribute a : elementAttributes){
                _matches.setStringIndex(a.getKey(), a.getValue());
            }

            try{
                _matches.setStringIndex("nextChild", e.child(0).id());
            }
            catch(IndexOutOfBoundsException err){
                _matches.setStringIndex("nextChild", "");
            }

            // insert innerhtml into table
            _matches.setStringIndex("innerhtml", e.html());
            _allMatches.setIntIndex(ctr++, _matches);
        }

        return _allMatches;
    }

    String input;
}
