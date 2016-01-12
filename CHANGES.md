## 113.24.00

- ppx

  An umbrella feature for development on ppx syntax extensions.
  All work except for rebasing should be done in subfeatures.

* Affected files

  ppx/ppx_csv_conv/src/ppx_csv_conv.ml

- ppx/changes-for-public-release

  Changes required for the first public release of our ppx rewriters
  
  Improved the type_conv export to ppx_deriving
  ---------------------------------------------
  
  - improved how it works, to enable it we just need:
  
      Type_conv.Ppx_deriving_exporter.set (module Ppx_deriving)
  
  - Type_conv.add_alias now takes as argument registered type_conv
    deriviers. This ensure that we can resolve aliases right from the
    registration time. This simplify the export to ppx_deriving
  
  Split some ppx rewirters
  ------------------------
  
  Split some functions out of their main ppx_XXX library that does the
  registration with ppx_driver or ppx_type_conv.
  
  For instance:
  
  - ppx_sexp_conv defines sexp_of_quote that is used by ppx_assert
  - ppx_here defines ast_of_pos that is used by ppx_fail and ppx_assert
  
  Making ppx_assert depends on ppx_sexp_conv and ppx_here is not good as
  it enables `@@deriving sexp` and `%sexp_of: ty` even if the user only
  writes ppx_assert in the jbuild.
  This is especially problematic for the public release as it makes
  ppx_assert incompatible with ppx_deriving.
  
  This feature moves these functions into libraries called
  ppx_XXX_expander (and ppx_inline_test_libname for ppx_inline_test).
  
  To help reviewing the changes, you can run:
  
    patdiff <(hg cat -r `fe show -base` ppx/ppx_compare/src/ppx_compare.ml) <(hg cat -r `fe show -tip` ppx/ppx_compare/expander/ppx_compare_expander.ml)
    patdiff <(hg cat -r `fe show -base` ppx/ppx_sexp_conv/src/ppx_sexp_conv.ml) <(hg cat -r `fe show -tip` ppx/ppx_sexp_conv/expander/ppx_sexp_conv_expander.ml)
  
  Move Ppx_type_conv.Std.Type_conv_path to Ppx_core
  -------------------------------------------------
  
  It's not type-conv specific anymore and is needed by libraries that
  don't use type_conv otherwise.
  
  Rename some old runtime libraries
  ---------------------------------
  
  pa_test_lib  --> ppx_assert_lib
  pa_bench_lib --> ppx_bench_lib

* Affected files

  ppx/ppx_csv_conv/src/ppx_csv_conv.ml

- ppx

  An umbrella feature for development on ppx syntax extensions.
  All work except for rebasing should be done in subfeatures.

* Affected files

  ppx/ppx_csv_conv/src/ppx_csv_conv.ml

- ppx/delete-make-at-the-end

  Cleanup in type_conv: remove Type_conv.Generator_result.make_at_the_end, which was a hack
  to remove warnings. We can do it better now, and because this is only for signatures, the
  code generation issue what we had in simplify-type-conv-ignore-unused-warning doesn't
  apply.
  
  For users
  =========
  
  This feature moves a few values up in signatures. For instance in this
  interface `sexp_of_t` is now the first value instead of the second one
  as before this feature:
  
      type t `@@deriving sexp_of`
      val x : int
  
  In some cases this caused the OCaml compiler to complain about items
  in the signature being re-ordered. In these cases the signature was
  adapted to match the expected ordering.

* Affected files

  ppx/ppx_csv_conv/src/ppx_csv_conv.ml

- ppx

  An umbrella feature for development on ppx syntax extensions.
  All work except for rebasing should be done in subfeatures.

* Affected files

  ppx/ppx_csv_conv/example/example.ml
  ppx/ppx_csv_conv/example/example.mli
  ppx/ppx_csv_conv/example/test.csv

- ppx/ppx_csv_conv-example

  Make ppx_csv_conv example do something.
  
  Testing
  -------
  Added inline test.

* Affected files

  ppx/ppx_csv_conv/example/example.ml
  ppx/ppx_csv_conv/example/example.mli
  ppx/ppx_csv_conv/example/test.csv






































