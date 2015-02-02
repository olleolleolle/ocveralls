open OUnit

let foo = fun () -> "foo"
let bar = fun () -> "bar"
let baz = fun () -> "baz"

let _ =
  "test" >:::
    [ "foo" >:: (fun () -> assert_equal "foo" (foo ())) ;
      "bar" >:: (fun () -> assert_equal "foo" (bar ())) ]
  |> OUnit.run_test_tt_main
