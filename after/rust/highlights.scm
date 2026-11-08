; Forked from https://github.com/tree-sitter/tree-sitter-rust
; Copyright (c) 2017 Maxim Sokolov
; Licensed under the MIT license.
; Identifier conventions
; Identifier conventions
(shebang) @keyword.directive

(const_item
  name: (identifier) @constant)

((identifier) @constant
  (#lua-match? @constant "^[A-Z][A-Z%d_]*$"))

(type_identifier) @type
(primitive_type) @type.builtin

(field_identifier) @variable.member
(shorthand_field_identifier) @variable.member
(shorthand_field_initializer
  (identifier) @variable.member)

(mod_item
  name: (identifier) @module)

(self) @variable.builtin
"_" @character.special

(label
  [
    "'"
    (identifier)
  ] @label)

; -----------------------
; Functions / methods
; -----------------------

((function_item
  name: (identifier) @function.definition)
 (#set! priority 140))

; Associated functions in inherent impl blocks
((impl_item
  !trait
  body: (declaration_list
    (function_item
      name: (identifier) @associated.function.definition
      parameters: (parameters))))
 (#set! priority 140))

; Methods in inherent impl blocks
((impl_item
  !trait
  body: (declaration_list
    (function_item
      name: (identifier) @method.definition
      parameters: (parameters
        (self_parameter)))))
 (#set! priority 140))

; Trait declarations
((trait_item
  name: (type_identifier) @trait.definition)
 (#set! priority 140))

((trait_item
  body: (declaration_list
    (function_signature_item
      name: (identifier) @trait.function.definition
      parameters: (parameters))))
 (#set! priority 140))

((trait_item
  body: (declaration_list
    (function_signature_item
      name: (identifier) @trait.method.definition
      parameters: (parameters
        (self_parameter)))))
 (#set! priority 140))

; Trait impls
((impl_item
  trait: (type_identifier) @trait.reference
  body: (declaration_list
    (function_item
      name: (identifier) @trait.impl.function.definition
      parameters: (parameters))))
 (#set! priority 140))

((impl_item
  trait: (type_identifier) @trait.reference
  body: (declaration_list
    (function_item
      name: (identifier) @trait.impl.method.definition
      parameters: (parameters
        (self_parameter)))))
 (#set! priority 140))

; -----------------------
; Calls
; -----------------------

((call_expression
  function: (identifier) @function.call)
 (#set! priority 140))

((call_expression
  function: (scoped_identifier
    name: (identifier) @function.call))
 (#set! priority 140))

((call_expression
  function: (field_expression
    field: (field_identifier) @method.call))
 (#set! priority 140))

((generic_function
  function: (identifier) @function.call)
 (#set! priority 140))

((generic_function
  function: (scoped_identifier
    name: (identifier) @function.call))
 (#set! priority 140))

((generic_function
  function: (field_expression
    field: (field_identifier) @method.call))
 (#set! priority 140))

; -----------------------
; Enum variants / constructors
; -----------------------

((enum_variant
  name: (identifier) @constant))

((identifier) @constant.builtin
  (#any-of? @constant.builtin "Some" "None" "Ok" "Err")
 (#set! priority 145))

((field_identifier) @constant
  (#lua-match? @constant "^[A-Z]"))

((scoped_identifier
  name: (identifier) @constant)
 (#lua-match? @constant "^[A-Z]"))

((scoped_identifier
  name: (identifier) @type)
 (#lua-match? @type "^[A-Z]"))

(scoped_identifier
  path: (identifier) @module)

(scoped_identifier
  (scoped_identifier
    name: (identifier) @module))

(scoped_type_identifier
  path: (identifier) @module)

(scoped_type_identifier
  path: (identifier) @type
  (#lua-match? @type "^[A-Z]"))

(scoped_type_identifier
  (scoped_identifier
    name: (identifier) @module))

((scoped_identifier
  path: (identifier) @type)
  (#lua-match? @type "^[A-Z]"))

((scoped_identifier
  name: (identifier) @type)
  (#lua-match? @type "^[A-Z]"))

((scoped_identifier
  name: (identifier) @constant)
  (#lua-match? @constant "^[A-Z][A-Z%d_]*$"))

((scoped_identifier
  path: (identifier) @type
  name: (identifier) @constant)
  (#lua-match? @type "^[A-Z]")
  (#lua-match? @constant "^[A-Z]"))

((scoped_type_identifier
  path: (identifier) @type
  name: (type_identifier) @constant)
  (#lua-match? @type "^[A-Z]")
  (#lua-match? @constant "^[A-Z]"))

[
  (crate)
  (super)
] @module

(scoped_use_list
  path: (identifier) @module)

(scoped_use_list
  path: (scoped_identifier
    (identifier) @module))

(use_list
  (scoped_identifier
    (identifier) @module
    .
    (_)))

(use_list
  (identifier) @type
  (#lua-match? @type "^[A-Z]"))

(use_as_clause
  alias: (identifier) @type
  (#lua-match? @type "^[A-Z]"))

(call_expression
  function: (scoped_identifier
    "::"
    name: (identifier) @constant)
  (#lua-match? @constant "^[A-Z]"))

((match_arm
  pattern: (match_pattern
    (identifier) @constant))
  (#lua-match? @constant "^[A-Z]"))

((match_arm
  pattern: (match_pattern
    (scoped_identifier
      name: (identifier) @constant)))
  (#lua-match? @constant "^[A-Z]"))

; -----------------------
; Macros
; -----------------------

"$" @function.macro
(metavariable) @function.macro

(macro_definition
  "macro_rules!" @function.macro)

(attribute_item
  (attribute
    (identifier) @function.macro))

(inner_attribute_item
  (attribute
    (identifier) @function.macro))

(attribute
  (scoped_identifier
    (identifier) @function.macro .))

(macro_invocation
  macro: (identifier) @function.macro)

(macro_invocation
  macro: (scoped_identifier
    (identifier) @function.macro .))

; -----------------------
; Literals
; -----------------------

(boolean_literal) @boolean
(integer_literal) @number
(float_literal) @number.float

[
  (raw_string_literal)
  (string_literal)
] @string

(escape_sequence) @string.escape
(char_literal) @character

; -----------------------
; Keywords
; -----------------------

[
  "use"
  "mod"
] @keyword.import

(use_as_clause
  "as" @keyword.import)

[
  "default"
  "impl"
  "let"
  "move"
  "unsafe"
  "where"
] @keyword

[
  "enum"
  "struct"
  "union"
  "trait"
  "type"
] @keyword.type

[
  "async"
  "await"
  "gen"
] @keyword.coroutine

"try" @keyword.exception

[
  "ref"
  "pub"
  "raw"
  (mutable_specifier)
  "const"
  "static"
  "dyn"
  "extern"
] @keyword.modifier

(lifetime
  "'" @keyword.modifier)

(lifetime
  (identifier) @attribute)

(lifetime
  (identifier) @attribute.builtin
  (#any-of? @attribute.builtin "static" "_"))

"fn" @keyword.function

[
  "return"
  "yield"
] @keyword.return

(type_cast_expression
  "as" @keyword.operator)

(qualified_type
  "as" @keyword.operator)

(use_list
  (self) @module)

(scoped_use_list
  (self) @module)

(scoped_identifier
  [
    (crate)
    (super)
    (self)
  ] @module)

(visibility_modifier
  [
    (crate)
    (super)
    (self)
  ] @module)

[
  "if"
  "else"
  "match"
] @keyword.conditional

[
  "break"
  "continue"
  "in"
  "loop"
  "while"
] @keyword.repeat

"for" @keyword

(for_expression
  "for" @keyword.repeat)

; -----------------------
; Operators / punctuation
; -----------------------

[
  "!"
  "!="
  "%"
  "%="
  "&"
  "&&"
  "&="
  "*"
  "*="
  "+"
  "+="
  "-"
  "-="
  ".."
  "..="
  "..."
  "/"
  "/="
  "<"
  "<<"
  "<<="
  "<="
  "="
  "=="
  ">"
  ">="
  ">>"
  ">>="
  "?"
  "@"
  "^"
  "^="
  "|"
  "|="
  "||"
] @operator

(use_wildcard
  "*" @character.special)

(remaining_field_pattern
  ".." @character.special)

(range_pattern
  [
    ".."
    "..="
    "..."
  ] @character.special)

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

(closure_parameters
  "|" @punctuation.bracket)

(type_arguments
  [
    "<"
    ">"
  ] @punctuation.bracket)

(type_parameters
  [
    "<"
    ">"
  ] @punctuation.bracket)

(bracketed_type
  [
    "<"
    ">"
  ] @punctuation.bracket)

(for_lifetimes
  [
    "<"
    ">"
  ] @punctuation.bracket)

[
  ","
  "."
  ":"
  "::"
  ";"
  "->"
  "=>"
] @punctuation.delimiter

(attribute_item
  "#" @punctuation.special)

(inner_attribute_item
  [
    "!"
    "#"
  ] @punctuation.special)

(macro_invocation
  "!" @function.macro)

(never_type
  "!" @type.builtin)

(macro_invocation
  macro: (identifier) @_identifier @keyword.exception
  "!" @keyword.exception
  (#eq? @_identifier "panic"))

(macro_invocation
  macro: (identifier) @_identifier @keyword.exception
  "!" @keyword.exception
  (#contains? @_identifier "assert"))

(macro_invocation
  macro: (identifier) @_identifier @keyword.debug
  "!" @keyword.debug
  (#eq? @_identifier "dbg"))

; -----------------------
; Comments
; -----------------------

[
  (line_comment)
  (block_comment)
] @comment @spell

[
  (outer_doc_comment_marker)
  (inner_doc_comment_marker)
] @comment.documentation

(line_comment
  (doc_comment)) @comment.documentation

(block_comment
  (doc_comment)) @comment.documentation

; -----------------------
; Regex literals
; -----------------------

(call_expression
  function: (scoped_identifier
    path: (identifier) @_regex
    (#any-of? @_regex "Regex" "ByteRegexBuilder")
    name: (identifier) @_new
    (#eq? @_new "new"))
  arguments: (arguments
    (raw_string_literal
      (string_content) @string.regexp)))

(call_expression
  function: (scoped_identifier
    path: (scoped_identifier
      (identifier) @_regex
      (#any-of? @_regex "Regex" "ByteRegexBuilder") .)
    name: (identifier) @_new
    (#eq? @_new "new"))
  arguments: (arguments
    (raw_string_literal
      (string_content) @string.regexp)))

(call_expression
  function: (scoped_identifier
    path: (identifier) @_regex
    (#any-of? @_regex "RegexSet" "RegexSetBuilder")
    name: (identifier) @_new
    (#eq? @_new "new"))
  arguments: (arguments
    (array_expression
      (raw_string_literal
        (string_content) @string.regexp))))

(call_expression
  function: (scoped_identifier
    path: (scoped_identifier
      (identifier) @_regex
      (#any-of? @_regex "RegexSet" "RegexSetBuilder") .)
    name: (identifier) @_new
    (#eq? @_new "new"))
  arguments: (arguments
    (array_expression
      (raw_string_literal
        (string_content) @string.regexp))))

