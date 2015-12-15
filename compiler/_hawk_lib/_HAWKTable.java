package _hawk_lib;

public class _HAWKTable<T>{
	
	private java.util.Hashtable<String,T> storage;

	public _HAWKTable(){
		storage = new java.util.Hashtable<String,T>();
	}

	//ensure that HAWK Tables have a consistent mechanism of converting ints to strings and back
	private static String intToString(int i){
		return i + "";
	}
	
    public T getIntIndex(int i){
        return storage.get(intToString(i));
    }

    public T getStringIndex(String s){
        return storage.get(s);
    }

    public _HAWKTable setIntIndexChained(int i, T t){
        storage.put(intToString(i),t);
        return this;
    }

    public _HAWKTable setStringIndexChained(String s, T t){
        storage.put(s,t);
        return this;
    }

    public void setIntIndex(int i, T t){
        storage.put(intToString(i),t);
    }

    public void setStringIndex(String s, T t){
        storage.put(s,t);
    }
	
	public java.util.Set<String> getKeys(){
		return storage.keySet();
	}

    public String toString(){
        String temp = "";
        for( java.util.Map.Entry<String, T> entry : storage.entrySet() ){
            temp += entry.toString();
        } 
        return temp;
    }
}

