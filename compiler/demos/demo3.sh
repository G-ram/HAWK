args="$*"
q=${args// /'%20'}
./prog ./demos/demo3.hk > Program.java && javac Program.java && java -cp ./_hawk_lib/jsoup.jar: Program http://www.wunderground.com/cgi-bin/findweather/getForecast?query=$q
