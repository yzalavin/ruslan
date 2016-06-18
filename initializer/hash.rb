class Hash
  def deep_symbolize_keys
    inject({}) do |m, (k,v)|
      m[k.to_sym] = v.is_a?(Hash) ? v.deep_symbolize_keys : v
      m
    end
  end
end
