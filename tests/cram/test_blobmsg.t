check that blobmsg is producing expected results:

  $ [ -n "$TEST_BIN_DIR" ] && export PATH="$TEST_BIN_DIR:$PATH"

  $ valgrind --quiet --leak-check=full test-blobmsg
  [*] blobmsg dump:
  Message: Hello, world!
  List: {
  0 (i8)
  100 (i8)
  -128 (i8)
  127 (i8)
  -32768 (i16)
  32767 (i16)
  -2147483648 (i32)
  2147483647 (i32)
  -9223372036854775808 (i64)
  9223372036854775807 (i64)
  133.700000 (dbl)
  }
  Testdata: {
  \tdouble : 133.700000 (dbl) (esc)
  \tfoo : 0 (i8) (esc)
  \tpoo : 100 (i8) (esc)
  \tmoo-min : -128 (i8) (esc)
  \tmoo-max : 127 (i8) (esc)
  \tbar-min : -32768 (i16) (esc)
  \tbar-max : 32767 (i16) (esc)
  \tbaz-min : -2147483648 (i32) (esc)
  \tbaz-max : 2147483647 (i32) (esc)
  \ttaz-min : -9223372036854775808 (i64) (esc)
  \ttaz-max : 9223372036854775807 (i64) (esc)
  \tworld : 2 (str) (esc)
  }
  
  [*] blobmsg to json: {"message":"Hello, world!","testdata":{"double":133.700000,"foo":false,"poo":true,"moo-min":true,"moo-max":true,"bar-min":-32768,"bar-max":32767,"baz-min":-2147483648,"baz-max":2147483647,"taz-min":-9223372036854775808,"taz-max":9223372036854775807,"world":"2"},"list":[false,true,true,true,-32768,32767,-2147483648,2147483647,-9223372036854775808,9223372036854775807,133.700000]}
  
  [*] blobmsg from json:
  Message: Hello, world!
  List: {
  0 (i8)
  1 (i8)
  1 (i8)
  1 (i8)
  -32768 (i32)
  32767 (i32)
  -2147483648 (i32)
  2147483647 (i32)
  -9223372036854775808 (i64)
  9223372036854775807 (i64)
  133.700000 (dbl)
  }
  Testdata: {
  \tdouble : 133.700000 (dbl) (esc)
  \tfoo : 0 (i8) (esc)
  \tpoo : 1 (i8) (esc)
  \tmoo-min : 1 (i8) (esc)
  \tmoo-max : 1 (i8) (esc)
  \tbar-min : -32768 (i32) (esc)
  \tbar-max : 32767 (i32) (esc)
  \tbaz-min : -2147483648 (i32) (esc)
  \tbaz-max : 2147483647 (i32) (esc)
  \ttaz-min : -9223372036854775808 (i64) (esc)
  \ttaz-max : 9223372036854775807 (i64) (esc)
  \tworld : 2 (str) (esc)
  }

  $ test-blobmsg-san
  [*] blobmsg dump:
  Message: Hello, world!
  List: {
  0 (i8)
  100 (i8)
  -128 (i8)
  127 (i8)
  -32768 (i16)
  32767 (i16)
  -2147483648 (i32)
  2147483647 (i32)
  -9223372036854775808 (i64)
  9223372036854775807 (i64)
  133.700000 (dbl)
  }
  Testdata: {
  \tdouble : 133.700000 (dbl) (esc)
  \tfoo : 0 (i8) (esc)
  \tpoo : 100 (i8) (esc)
  \tmoo-min : -128 (i8) (esc)
  \tmoo-max : 127 (i8) (esc)
  \tbar-min : -32768 (i16) (esc)
  \tbar-max : 32767 (i16) (esc)
  \tbaz-min : -2147483648 (i32) (esc)
  \tbaz-max : 2147483647 (i32) (esc)
  \ttaz-min : -9223372036854775808 (i64) (esc)
  \ttaz-max : 9223372036854775807 (i64) (esc)
  \tworld : 2 (str) (esc)
  }
  
  [*] blobmsg to json: {"message":"Hello, world!","testdata":{"double":133.700000,"foo":false,"poo":true,"moo-min":true,"moo-max":true,"bar-min":-32768,"bar-max":32767,"baz-min":-2147483648,"baz-max":2147483647,"taz-min":-9223372036854775808,"taz-max":9223372036854775807,"world":"2"},"list":[false,true,true,true,-32768,32767,-2147483648,2147483647,-9223372036854775808,9223372036854775807,133.700000]}
  
  [*] blobmsg from json:
  Message: Hello, world!
  List: {
  0 (i8)
  1 (i8)
  1 (i8)
  1 (i8)
  -32768 (i32)
  32767 (i32)
  -2147483648 (i32)
  2147483647 (i32)
  -9223372036854775808 (i64)
  9223372036854775807 (i64)
  133.700000 (dbl)
  }
  Testdata: {
  \tdouble : 133.700000 (dbl) (esc)
  \tfoo : 0 (i8) (esc)
  \tpoo : 1 (i8) (esc)
  \tmoo-min : 1 (i8) (esc)
  \tmoo-max : 1 (i8) (esc)
  \tbar-min : -32768 (i32) (esc)
  \tbar-max : 32767 (i32) (esc)
  \tbaz-min : -2147483648 (i32) (esc)
  \tbaz-max : 2147483647 (i32) (esc)
  \ttaz-min : -9223372036854775808 (i64) (esc)
  \ttaz-max : 9223372036854775807 (i64) (esc)
  \tworld : 2 (str) (esc)
  }

  $ test-blobmsg-san
  [*] blobmsg dump:
  Message: Hello, world!
  List: {
  0 (i8)
  100 (i8)
  -128 (i8)
  127 (i8)
  -32768 (i16)
  32767 (i16)
  -2147483648 (i32)
  2147483647 (i32)
  -9223372036854775808 (i64)
  9223372036854775807 (i64)
  133.700000 (dbl)
  }
  Testdata: {
  \tdouble : 133.700000 (dbl) (esc)
  \tfoo : 0 (i8) (esc)
  \tpoo : 100 (i8) (esc)
  \tmoo-min : -128 (i8) (esc)
  \tmoo-max : 127 (i8) (esc)
  \tbar-min : -32768 (i16) (esc)
  \tbar-max : 32767 (i16) (esc)
  \tbaz-min : -2147483648 (i32) (esc)
  \tbaz-max : 2147483647 (i32) (esc)
  \ttaz-min : -9223372036854775808 (i64) (esc)
  \ttaz-max : 9223372036854775807 (i64) (esc)
  \tworld : 2 (str) (esc)
  }
  
  [*] blobmsg to json: {"message":"Hello, world!","testdata":{"double":133.700000,"foo":false,"poo":true,"moo-min":true,"moo-max":true,"bar-min":-32768,"bar-max":32767,"baz-min":-2147483648,"baz-max":2147483647,"taz-min":-9223372036854775808,"taz-max":9223372036854775807,"world":"2"},"list":[false,true,true,true,-32768,32767,-2147483648,2147483647,-9223372036854775808,9223372036854775807,133.700000]}
  
  [*] blobmsg from json:
  Message: Hello, world!
  List: {
  0 (i8)
  1 (i8)
  1 (i8)
  1 (i8)
  -32768 (i32)
  32767 (i32)
  -2147483648 (i32)
  2147483647 (i32)
  -9223372036854775808 (i64)
  9223372036854775807 (i64)
  133.700000 (dbl)
  }
  Testdata: {
  \tdouble : 133.700000 (dbl) (esc)
  \tfoo : 0 (i8) (esc)
  \tpoo : 1 (i8) (esc)
  \tmoo-min : 1 (i8) (esc)
  \tmoo-max : 1 (i8) (esc)
  \tbar-min : -32768 (i32) (esc)
  \tbar-max : 32767 (i32) (esc)
  \tbaz-min : -2147483648 (i32) (esc)
  \tbaz-max : 2147483647 (i32) (esc)
  \ttaz-min : -9223372036854775808 (i64) (esc)
  \ttaz-max : 9223372036854775807 (i64) (esc)
  \tworld : 2 (str) (esc)
  }

  $ test-blobmsg-san
  [*] blobmsg dump:
  Message: Hello, world!
  List: {
  0 (i8)
  100 (i8)
  -128 (i8)
  127 (i8)
  -32768 (i16)
  32767 (i16)
  -2147483648 (i32)
  2147483647 (i32)
  -9223372036854775808 (i64)
  9223372036854775807 (i64)
  133.700000 (dbl)
  }
  Testdata: {
  \tdouble : 133.700000 (dbl) (esc)
  \tfoo : 0 (i8) (esc)
  \tpoo : 100 (i8) (esc)
  \tmoo-min : -128 (i8) (esc)
  \tmoo-max : 127 (i8) (esc)
  \tbar-min : -32768 (i16) (esc)
  \tbar-max : 32767 (i16) (esc)
  \tbaz-min : -2147483648 (i32) (esc)
  \tbaz-max : 2147483647 (i32) (esc)
  \ttaz-min : -9223372036854775808 (i64) (esc)
  \ttaz-max : 9223372036854775807 (i64) (esc)
  \tworld : 2 (str) (esc)
  }
  
  [*] blobmsg to json: {"message":"Hello, world!","testdata":{"double":133.700000,"foo":false,"poo":true,"moo-min":true,"moo-max":true,"bar-min":-32768,"bar-max":32767,"baz-min":-2147483648,"baz-max":2147483647,"taz-min":-9223372036854775808,"taz-max":9223372036854775807,"world":"2"},"list":[false,true,true,true,-32768,32767,-2147483648,2147483647,-9223372036854775808,9223372036854775807,133.700000]}
  
  [*] blobmsg from json:
  Message: Hello, world!
  List: {
  0 (i8)
  1 (i8)
  1 (i8)
  1 (i8)
  -32768 (i32)
  32767 (i32)
  -2147483648 (i32)
  2147483647 (i32)
  -9223372036854775808 (i64)
  9223372036854775807 (i64)
  133.700000 (dbl)
  }
  Testdata: {
  \tdouble : 133.700000 (dbl) (esc)
  \tfoo : 0 (i8) (esc)
  \tpoo : 1 (i8) (esc)
  \tmoo-min : 1 (i8) (esc)
  \tmoo-max : 1 (i8) (esc)
  \tbar-min : -32768 (i32) (esc)
  \tbar-max : 32767 (i32) (esc)
  \tbaz-min : -2147483648 (i32) (esc)
  \tbaz-max : 2147483647 (i32) (esc)
  \ttaz-min : -9223372036854775808 (i64) (esc)
  \ttaz-max : 9223372036854775807 (i64) (esc)
  \tworld : 2 (str) (esc)
  }
