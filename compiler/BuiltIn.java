private static void print(Object o){
  System.out.println(o);
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
private static <T> java.util.Set<String> keys(_HAWKTable<T> t){
  return t.getKeys();
}
