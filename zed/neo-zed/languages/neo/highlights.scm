; ==========================================================================
; Highlights for Neo language - tree-sitter queries for Zed
; ==========================================================================

; --------------------------------------------------------------------------
; Keywords (first for highest priority)
; --------------------------------------------------------------------------

; Control flow
[
  "if"
  "elif"
  "else"
  "for"
  "while"
  "until"
  "when"
  "return"
  "break"
  "continue"
  "goto"
  "yields"
  "fallthrough"
  "defer"
  "defer_err"
  "try"
] @keyword

; Declarations & type keywords
[
  "fn"
  "typedef"
  "struct"
  "enum"
  "union"
  "operator"
  "overloads"
  "test"
  "skip"
  "push_context"
  "assert"
  "assert_db"
  "simd"
] @keyword

; error keyword in definition context (avoid conflict with primitive_type)
(error_definition "error" @keyword)

; Modifiers
[
  "mut"
  "const"
] @keyword

; Import keywords
[
  "extern"
  "#import"
  "using"
  "from"
  "as"
  "in"
] @keyword

; Compile-time directive keywords
[
  "#run"
  "#insert"
  "#macro"
  "#modify"
  "#if"
  "#ifndef"
  "#else"
  "#elif"
  "#define"
  "#set"
  "#undef"
  "#unset"
  "#assert"
  "#error"
  "#warn"
  "#info"
  "#todo"
  "#ordered"
  "#soa"
  "#c_varargs"
  "#code"
  "#asm"
  "#for"
  "#specialize"
  "#bake_constants"
] @keyword

; --------------------------------------------------------------------------
; Casts & Intrinsics
; --------------------------------------------------------------------------

[
  "cast"
  "recast"
  "auto_cast"
  "size_of"
  "align_of"
  "type_of"
  "typename_of"
  "typeid_of"
  "typeinfo_of"
  "type_assert"
] @keyword

; --------------------------------------------------------------------------
; Builtin functions
; --------------------------------------------------------------------------

(builtin_function) @keyword

; Identifiers that are builtins but not grammar keywords (used as both
; function calls and properties like arr.len)
((identifier) @keyword
  (#any-match? @keyword "^(len|cap|includes)$"))

; --------------------------------------------------------------------------
; Comments
; --------------------------------------------------------------------------

(line_comment) @comment
(block_comment) @comment

; --------------------------------------------------------------------------
; Literals
; --------------------------------------------------------------------------

(number_literal) @number

[
  (boolean_literal)
  (null_literal)
  (undefined_expression)
  (unreachable_expression)
  (unused_expression)
] @boolean

(unreachable_statement "unreachable" @boolean)

(string_literal) @string
(raw_string_literal) @string
(char_literal) @string
(string_content) @string
(char_content) @string
(escape_sequence) @string.escape

; --------------------------------------------------------------------------
; Types
; --------------------------------------------------------------------------

(primitive_type) @type.builtin
(type_identifier) @type
(self_type) @type.builtin

(qualified_type
  namespace: (identifier) @type
  name: (type_identifier) @type)

(generic_parameter
  "$" @type
  name: (identifier) @type)

(generic_parameter_type
  "$" @type
  name: (identifier) @type)

(builtin_constraint) @type.builtin

; --------------------------------------------------------------------------
; Functions
; --------------------------------------------------------------------------

(function_declaration
  name: (identifier) @function)

(function_overload_declaration
  name: (identifier) @function)

(call_expression
  function: (identifier) @function)

(call_expression
  function: (qualified_identifier
    name: (identifier) @function))

(call_expression
  function: (field_expression
    field: (identifier) @function))

; --------------------------------------------------------------------------
; Parameters
; --------------------------------------------------------------------------

(parameter
  name: (identifier) @variable.parameter)

; --------------------------------------------------------------------------
; Variables & Declarations
; --------------------------------------------------------------------------

(variable_declaration
  name: (identifier) @variable)

(constant_declaration
  name: (identifier) @variable)

(shorthand_variable_declaration
  name: (identifier) @variable)

(shorthand_constant_declaration
  name: (identifier) @variable)

(destructuring_binding
  name: (identifier) @variable)

; --------------------------------------------------------------------------
; Properties / Fields
; --------------------------------------------------------------------------

(field_expression
  field: (identifier) @property)

(arrow_expression
  field: (identifier) @property)

(optional_chain_expression
  field: (identifier) @property)

(struct_field
  name: (identifier) @property)

(struct_init_field
  name: (identifier) @property)

; --------------------------------------------------------------------------
; Enum & Error Variants
; --------------------------------------------------------------------------

(enum_variant
  name: (identifier) @constant)

(error_variant
  name: (identifier) @constant)

; --------------------------------------------------------------------------
; Labels
; --------------------------------------------------------------------------

(label_statement
  name: (identifier) @label)

(block_expression
  label: (identifier) @label)

(break_statement
  label: (identifier) @label)

(continue_statement
  label: (identifier) @label)

(yields_statement
  label: (identifier) @label)

; --------------------------------------------------------------------------
; Attributes
; --------------------------------------------------------------------------

(attribute
  "#[" @punctuation.special
  "]" @punctuation.special)

(attribute_item
  name: (identifier) @attribute)

; --------------------------------------------------------------------------
; Namespace
; --------------------------------------------------------------------------

(namespace_declaration
  name: (identifier) @type)

(import_symbol
  name: (identifier) @type)

; --------------------------------------------------------------------------
; Compile-time
; --------------------------------------------------------------------------

(macro_value) @constant

; --------------------------------------------------------------------------
; Operators
; --------------------------------------------------------------------------

(binary_expression
  operator: _ @operator)

(unary_expression
  operator: _ @operator)

(compound_assignment_statement
  operator: _ @operator)

(increment_expression
  operator: _ @operator)

(decrement_expression
  operator: _ @operator)

(range_expression
  operator: _ @operator)

(operator_overload_declaration
  op: _ @operator)

[
  "="
  ":="
  "::="
  "??"
  "=>"
  "->"
  "?."
  ".."
  "..="
  "..<"
  "..."
  "&"
  "@@"
] @operator

; --------------------------------------------------------------------------
; Punctuation
; --------------------------------------------------------------------------

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

[
  ";"
  ","
  ":"
  "::"
  "."
] @punctuation.delimiter

; --------------------------------------------------------------------------
; Qualified Identifiers
; --------------------------------------------------------------------------

(qualified_identifier
  namespace: (identifier) @type
  name: (identifier) @variable)

; --------------------------------------------------------------------------
; Identifiers (fallback)
; --------------------------------------------------------------------------

(identifier) @variable
