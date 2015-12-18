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
