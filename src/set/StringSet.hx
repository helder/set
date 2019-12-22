package set;

class StringSet implements ISet<String> {
  public var length(default, null): Int;

  var map: Map<String, Bool>;

  public inline function new() {
    map = new Map();
    length = 0;
  }

  public inline function add(v: String): Void {
    if (exists(v))
      return;
    length++;
    map.set(v, true);
  }

  public inline function exists(v: String): Bool
    return map.exists(v);

  public inline function remove(v: String): Bool {
    if (!exists(v))
      return false;
    length--;
    return map.remove(v);
  }

  public inline function iterator(): Iterator<String>
    return map.keys();

  public inline function clear(): Void
    map.clear();

  public inline function copy(): StringSet {
    final copy = new StringSet();
    copy.length = length;
    copy.map = map.copy();
    return copy;
  }

  public inline function toArray(): Array<String>
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
