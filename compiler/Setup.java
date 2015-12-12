_HAWKFileReader _fileReader = new _HAWKFileReader(_args);
_HAWKRegexMatcher _regexMatcher = new _HAWKRegexMatcher(_fileReader._getConcatFile());
_HAWKCSSMatcher _cssMatcher = new _HAWKCSSMatcher(_fileReader._getConcatFile());
