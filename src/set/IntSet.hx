package set;

class IntSet implements ISet<Int> {
  public var length(default, null): Int;

  var map: Map<Int, Bool>;

  public inline function new(?values: Iterable<Int>) {
    map = new Map();
    length = 0;
    switch values {
      case null:
      case it:
        for (v in it)
          add(v);
    }
  }

  public inline function add(v: Int): Void {
    if (exists(v))
      return;
    length++;
    map.set(v, true);
  }

  public inline function exists(v: Int): Bool
    return map.exists(v);

  public inline function remove(v: Int): Bool {
    if (!exists(v))
      return false;
    length--;
    return map.remove(v);
  }

  public inline function iterator(): Iterator<Int>
    return map.keys();

  public inline function clear(): Void
    map.clear();

  public inline function copy(): IntSet {
    final copy = new IntSet();
    copy.length = length;
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
