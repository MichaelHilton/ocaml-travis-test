ocamlfind ocamlc \
	-o test \
	-package oUnit \
	-package js_of_ocaml \
	-package tyxml \
	-package js_of_ocaml.tyxml \
	-package js_of_ocaml.syntax \
	-linkpkg \
	-g hazel.ml test.ml

./test 
