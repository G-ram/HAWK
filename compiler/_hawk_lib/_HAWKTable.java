package _hawk_lib;

import java.util.*;

public class _HAWKTable<T>{
	private Hashtable<Integer,T> intPart;
	private Hashtable<String,T> stringPart;

	public _HAWKTable(){
		intPart = new Hashtable<Integer,T>();
		stringPart = new Hashtable<String,T>();
	}

    public T getIntIndex(int i){
        return intPart.get(i);
    }

    public T getStringIndex(String s){
        return stringPart.get(s);
    }

    public _HAWKTable<T> setIntIndexChained(int i, T t){
        intPart.put(i,t);
        return this;
    }

    public _HAWKTable<T> setStringIndexChained(String s, T t){
        stringPart.put(s,t);
        return this;
    }

    public void setIntIndex(int i, T t){
        intPart.put(i,t);
    }

    public _HAWKTable<T> setStringIndexString s, T t){
        stringPart.put(s,t);
    }
}

