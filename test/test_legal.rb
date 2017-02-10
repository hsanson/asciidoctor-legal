require "test/unit"
require "asciidoctor"
require "stringio"
require "nokogiri"
require "asciidoctor-legal"

DOC_BASIC = <<-eos
= Hello PlantUML!

This is a test paragraph without anchor.

legal:s1p1[sec1-p1%05d] This is a test paragraph with anchor.

legal:s2p2[] This is a test paragraph with anchor.

legal:p3[] This is a test paragraph with anchor.

this is a link to the p1 <<s1p1>> paragraph.
eos

DOC_RESULT = <<-EOS
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<html><body>
<div class="paragraph">
<p>This is a test paragraph without anchor.</p>
</div>
<div class="paragraph">
<p><span id="s1p1"><b>[sec1-p100001]</b></span> This is a test paragraph with anchor.</p>
</div>
<div class="paragraph">
<p><span id="s2p2"><b>[0002]</b></span> This is a test paragraph with anchor.</p>
</div>
<div class="paragraph">
<p><span id="p3"><b>[0003]</b></span> This is a test paragraph with anchor.</p>
</div>
<div class="paragraph">
<p>this is a link to the p1 <a href="#s1p1">[sec1-p100001]</a> paragraph.</p>
</div>
</body></html>
EOS

class LegalTest < Test::Unit::TestCase

  def test_paragraph_anchors_inline_processor
    html = ::Asciidoctor.convert(StringIO.new(DOC_BASIC), backend: "html5")
    page = Nokogiri::HTML(html)
    assert_equal page.to_s, DOC_RESULT
  end

end
