def kbkey(key_val)
  if (khtml = KbSpecialKeys[key_val])
    return khtml
  else
    return %Q{<span class="kbkey">#{key_val}</span>}
  end
end


def kbset(*key_vals)
  ckeys = key_vals[0].is_a?(Array) ? key_vals[0] : key_vals
  content_tag('div', :class => 'kbs') do
    s = ActiveSupport::SafeBuffer.new
    keys_html = ckeys.map{ |kval| kbkey(kval) }
    s.safe_concat keys_html.join(kb_plus)
  end
end


KbSpecialKeys = {
  "Control" => %Q{<span class="kbkey ctrl" data-value="Control">control</span>},
  "Tab" => %Q{<span class="kbkey tab" data-value="Tab">tab</span>},
  "Alt" => %Q{<span value="Alt" class="kbkey alt" data-value="Alt"><span class="symbol">alt</span>option</span>},
  "Command" => %Q(<span class="kbkey cmd" data-value="Command"><span class="symbol">⌘</span>command</span>),
  "Shift" => %Q{<span class="kbkey shift" data-value="Shift">shift</span>},
  "Right" => %Q{<span class="kbkey right" data-value="Right">►</span>},
  "Left" => %Q{<span class="kbkey left" data-value="Left">◄</span>},
  "Up" => %Q{<span class="kbkey up" data-value="Up">▲</span>},
  "Down" => %Q{<span class="kbkey down" data-value="Down">▼</span>},

  "~" => %Q{<span class="kbkey tilde" data-value="~"><span class="symbol">~</span>`</span>}


}

#


def kb_plus
  %Q{<span class="kb plus">+</span>}
end
