module Docs
  class Octave < UrlScraper
    self.name = 'Octave'
    self.type = 'octave'
    self.root_path = 'index.html'
    self.links = {
      home: 'https://www.octave.org/',
      code: 'https://www.octave.org/hg/octave'
    }

    html_filters.push 'octave/clean_html', 'octave/entries', 'title'

    options[:skip] = %w(
      Copying.html
      Preface.html
      Acknowledgements.html
      Citing-Octave-in-Publications.html
      How-You-Can-Contribute-to-Octave.html
      Distribution.html)

    options[:title] = false

    options[:root_title] = 'GNU Octave'

    options[:attribution] = <<-HTML
      &copy; 1996–2025 The Octave Project Developers<br>
      Permission is granted to make and distribute verbatim copies of this manual provided the copyright notice and this permission notice are preserved on all copies.<br/>
      Permission is granted to copy and distribute modified versions of this manual under the conditions for verbatim copying, provided that the entire resulting derived work is distributed under the terms of a permission notice identical to this one.</br>
      Permission is granted to copy and distribute translations of this manual into another language, under the above conditions for modified versions.
    HTML

    version '10' do
      self.release = '10.1.0'
      self.base_url = "https://docs.octave.org/v#{self.release}/"
    end

    version '9' do
      self.release = '9.2.0'
      self.base_url = "https://docs.octave.org/v#{self.release}/"
    end

    version '8' do
      self.release = '8.1.0'
      self.base_url = "https://docs.octave.org/v#{self.release}/"
    end

    version '7' do
      self.release = '7.2.0'
      self.base_url = "https://docs.octave.org/v#{self.release}/"
    end

    version '6' do
      self.release = '6.4.0'
      self.base_url = "https://docs.octave.org/v#{self.release}/"
    end

    version '5' do
      self.release = '5.2.0'
      self.base_url = "https://docs.octave.org/v#{self.release}/"
    end

    def get_latest_version(opts)
      doc = fetch_doc('https://octave.org/doc/interpreter/', opts)
      doc.at_css('#SEC_Top + p').content.scan(/([0-9.]+)/)[1][0][0..-2]
    end

  end
end
