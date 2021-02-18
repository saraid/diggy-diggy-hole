class Object
  private def ensure_getters_for_ivars!
    instance_variables.map { |ivar| [ivar, ivar.to_s[1..-1]] }.to_h.each do |ivar, mname|
      next if respond_to?(ivar)
      singleton_class.class_eval do
        define_method(mname) { instance_variable_get(ivar) }
      end
    end
  end

  def dig(*path)
    return self if path.empty?
    ensure_getters_for_ivars!
    send(path.first).dig(*path[1..-1])
  end
end

class NilClass
  def dig(*path)
    self
  end
end

class Hash
  private def ensure_getters_for_ivars!
    super
    keys.each do |key|
      next if respond_to?(key)
      singleton_class.class_eval do
        define_method(key) { fetch(key) }
      end
    end
  end
end
