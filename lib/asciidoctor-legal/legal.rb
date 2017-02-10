require "nokogiri"

module Asciidoctor
  module Legal

    class InlineMacro < Asciidoctor::Extensions::InlineMacroProcessor

      use_dsl
      named :legal
      content_model :simple

      def process(parent, target, attrs)
        counter_name = "legalparagraphcounter"
        counter_format = attrs['text'].empty? ? "%04d" : attrs['text']
        counter = counter_format%parent.document.counter(counter_name)
        parent.document.register(:ids, [target, "[#{counter}]"])
        %(<span id="#{target}"><b>[#{counter}]</b></span>)
      end

    end

  end
end
