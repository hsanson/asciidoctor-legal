require 'asciidoctor'
require 'asciidoctor/extensions'
require_relative 'asciidoctor-legal/legal'

Asciidoctor::Extensions.register do
  inline_macro Asciidoctor::Legal::InlineMacro
end
