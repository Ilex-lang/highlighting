; Indent on open braces/parens/brackets
[
  (block)
  (struct_definition)
  (enum_definition)
  (union_definition)
  (error_definition)
  (when_statement)
  (when_expression)
  (parameter_list)
  (array_init_expression)
  (struct_init_expression)
  (map_init_expression)
  (extern_block)
  (anonymous_struct_type)
] @indent

; Dedent on close braces
[
  "}"
  ")"
  "]"
] @outdent
