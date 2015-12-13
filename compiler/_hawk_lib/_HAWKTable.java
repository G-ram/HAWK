package _hawk_lib;

public class _HAWKTable<T>{
	private java.util.Hashtable<Integer,T> intPart;
	private java.util.Hashtable<String,T> stringPart;

	public _HAWKTable(){
		intPart = new java.util.Hashtable<Integer,T>();
		stringPart = new java.util.Hashtable<String,T>();
	}

    public T getIntIndex(int i){
        return intPart.get(i);
    }

    public T getStringIndex(String s){
        return stringPart.get(s);
    }

    public _HAWKTable setIntIndexChained(int i, T t){
        intPart.put(i,t);
        return this;
    }

    public _HAWKTable setStringIndexChained(String s, T t){
        stringPart.put(s,t);
        return this;
    }

    public void setIntIndex(int i, T t){
        intPart.put(i,t);
    }

    public void setStringIndex(String s, T t){
        stringPart.put(s,t);
    }

    public String toString(){
        String temp = "";
        for( java.util.Map.Entry<Integer, T> entry : intPart.entrySet() ){
            temp += entry.toString();
        }

        for( java.util.Map.Entry<String, T> entry : stringPart.entrySet() ){
            temp += entry.toString();
        }        
        return temp;
    }
}

