; Functions
(function_declaration
  name: (identifier) @name) @item

; Type definitions
(typedef_declaration
  name: (type_identifier) @name) @item

; Function overloads
(function_overload_declaration
  name: (identifier) @name) @item

; Operator overloads
(operator_overload_declaration
  op: _ @name) @item

; Struct fields
(struct_field
  name: (identifier) @name) @item

; Enum variants
(enum_variant
  name: (identifier) @name) @item

; Error variants
(error_variant
  name: (identifier) @name) @item

; Namespace
(namespace_declaration
  name: (identifier) @name) @item

; Test blocks
(test_block
  name: (string_literal) @name) @item

; Top-level variable declarations
(variable_declaration
  name: (identifier) @name) @item

; Top-level constant declarations
(constant_declaration
  name: (identifier) @name) @item

; Extern blocks
(extern_block
  library: (string_literal) @name) @item
