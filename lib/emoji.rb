require 'oj'

class Emoji

  EMOJI_MAP = Oj.load_file 'lib/vendor/emoji-data/emoji.json'

  def self.chars
    @chars ||= self.codepoints.map { |cp| Emoji.codepoint_to_char(cp) }
  end

  def self.codepoints
    @codepoints ||= EMOJI_MAP.map { |es| es['unified'] }
  end

  def self.char_to_codepoint(char)
    char.unpack('U'*char.length).collect {|x| x.to_s 16}.join.upcase
  end

  def self.codepoint_to_char(cp)
    [ cp.hex ].pack("U")
  end

  def self.codepoint_to_obj(cp)
    EMOJI_MAP.detect { |emoji_symbol| emoji_symbol['unified'] == cp}
  end

end

class EmojiChar
  attr_reader :name, :unified, :short_name

  def initialize(emoji_hash)
    @name = emoji_hash['name']
    @unified = emoji_hash['unified']
    @docomo = emoji_hash['docomo']
    @au = emoji_hash['au']
    @softbank = emoji_hash['softbank']
    @google = emoji_hash['google']
    @image = emoji_hash['image']
    @sheet_x = emoji_hash['sheet_x']
    @sheet_y = emoji_hash['sheet_y']
    @short_name = emoji_hash['short_name']
    @text = emoji_hash['text']
  end

end