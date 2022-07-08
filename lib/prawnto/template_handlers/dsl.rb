module Prawnto
  module TemplateHandlers
    class Dsl < Base
      def self.call(template, _source = nil)
        <<-RUBY
          _prawnto_compile_setup(true)
          pdf = Prawn::Document.new(@prawnto_options[:prawn])
          pdf.instance_eval do
            #{template.source}
          end
          pdf.render
        RUBY
      end
    end
  end
end
