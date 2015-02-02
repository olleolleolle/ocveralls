open OUnit

let foo = fun () -> "foo"
let bar = fun () -> "bar"
let baz = fun () -> "baz"

let _ =
  run_test_tt_main
    ("foo" >::: [ "foo" >:: (fun () -> assert_equal "foo" (foo ())) ])
