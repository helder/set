package set;

class IntSet implements ISet<Int> {
  public var length(get, never): Int;

  var map: Map<Int, Bool>;
  var _length(default, null): Int;

  public inline function new(?values: Iterable<Int>) {
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

  public inline function add(v: Int): Void {
    if (exists(v))
      return;
    _length++;
    map.set(v, true);
  }

  public inline function exists(v: Int): Bool
    return map.exists(v);

  public inline function remove(v: Int): Bool {
    if (!exists(v))
      return false;
    _length--;
    return map.remove(v);
  }

  public inline function iterator(): Iterator<Int>
    return map.keys();

  public inline function clear(): Void {
    map.clear();
    _length = 0;
  }

  public inline function copy(): IntSet {
    final copy = new IntSet();
    copy._length = _length;
    copy.map = map.copy();
    return copy;
  }

  public inline function toArray(): Array<Int>
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
