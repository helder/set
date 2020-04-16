package helder.set;

class StringSet implements ISet<String> {
  public var length(get, never): Int;

  var map: Map<String, Bool>;
  var _length(default, null): Int;

  public inline function new(?values: Iterable<String>) {
    map = new Map();
    _length = 0;
    switch values {
      case null:
      case it:
        for (v in it)
          add(v);
    }
  }

  public inline function get_length(): Int
    return _length;

  public inline function add(v: String): Void {
    if (exists(v))
      return;
    _length++;
    map.set(v, true);
  }

  public inline function exists(v: String): Bool
    return map.exists(v);

  public inline function remove(v: String): Bool {
    if (!exists(v))
      return false;
    _length--;
    return map.remove(v);
  }

  public inline function iterator(): Iterator<String>
    return map.keys();

  public inline function clear(): Void {
    map.clear();
    _length = 0;
  }

  public inline function copy(): StringSet {
    final copy = new StringSet();
    copy._length = _length;
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
