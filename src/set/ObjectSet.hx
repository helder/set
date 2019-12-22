package set;

class ObjectSet<V:{}> implements ISet<V> {
  public var length(default, null): Int;

  var map: Map<V, Bool>;

  public inline function new() {
    map = new Map();
    length = 0;
  }

  public inline function add(v: V): Void {
    if (exists(v))
      return;
    length++;
    map.set(v, true);
  }

  public inline function exists(v: V): Bool
    return map.exists(v);

  public inline function remove(v: V): Bool {
    if (!exists(v))
      return false;
    length--;
    return map.remove(v);
  }

  public inline function iterator(): Iterator<V>
    return map.keys();

  public inline function clear(): Void
    map.clear();

  public inline function copy(): ObjectSet<V> {
    final copy = new ObjectSet();
    copy.length = length;
    copy.map = map.copy();
    return copy;
  }

  public inline function toArray(): Array<V>
    return [for (v in map.keys()) v];

  public inline function toString(): String {
    final buf = new StringBuf();
    buf.add('{');
    for (v in this)
      buf.add('$v,');
    buf.add('}');
    return buf.toString();
  }
}
