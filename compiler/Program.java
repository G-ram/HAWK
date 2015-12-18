import _hawk_lib.*;
public class Program {
	public static void main(String[] _args){
		_HAWKFileReader _fileReader = new _HAWKFileReader(_args);
		_HAWKRegexMatcher _regexMatcher = new _HAWKRegexMatcher(_fileReader._getConcatFile());
		_HAWKCSSMatcher _cssMatcher = new _HAWKCSSMatcher(_fileReader._getConcatFile());
		_HAWKTable<_HAWKTable<_HAWKTable<_HAWKTable<Integer>>>> t = (new _HAWKTable<_HAWKTable<_HAWKTable<_HAWKTable<Integer>>>>()).setIntIndexChained(1,(new _HAWKTable<_HAWKTable<_HAWKTable<Integer>>>()).setIntIndexChained(2,(new _HAWKTable<_HAWKTable<Integer>>())));
		t.getIntIndex(1).getIntIndex(2).setIntIndex(3,(new _HAWKTable<Integer>()).setIntIndexChained(4,5));
		print(t.getIntIndex(1).getIntIndex(2).getIntIndex(3).getIntIndex(4));


	}
	private static void print(Object o){
	  System.out.println(o);
	}
	private static String charAt(String s, Integer i){
	  return ""+s.charAt(i);
	}
	private static Integer stringEqual(String s1, String s2){
	  if(s1.equals(s2)){
	    return 1;
	  }else{
	    return 0;
	  }
	}
	private static Boolean _checkIf(Integer i){
	  return (i != 0) ? true : false;
	}
	private static Boolean _checkIf(Double d){
	  return (d != 0.0) ? true : false;
	}
	private static Boolean _checkIf(Boolean b){
	  return b;
	}
	private static <T> int length(_HAWKTable<T> t){
	  return t.getLength();
	}
	private static <T> int exists(T e){
	  if(e == null){
	    return 0;
	  }
	  return 1;
	}
	private static <T> _HAWKTable<String> keys(_HAWKTable<T> t){
	  java.util.Set<String> set = t.getKeys();
	  _HAWKTable<String> hawkTable = new _HAWKTable<String>();
	  int i = t.getLength()-1;
	  for (String s : set) {
	    hawkTable.setIntIndex(i, s);
	    i--;
	  }
	  return hawkTable;
	}

}
