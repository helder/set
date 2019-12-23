package set;

import python.Set;

class IntSet implements ISet<Int> {
  final set: Set<Int>;

  public var length(get, never): Int;

  public inline function new(?values: Iterable<Int>) {
    set = switch values {
      case null: new Set();
      case it: new Set([for (v in it) v]);
    }
  }

  public inline function get_length(): Int
    return set.length;

  public inline function add(v: Int): Void
    set.add(v);

  public inline function exists(v: Int): Bool
    return set.has(v);

  public inline function remove(v: Int): Bool {
    if (!exists(v))
      return false;
    set.remove(v);
    return true;
  }

  public inline function iterator(): Iterator<Int>
    return set.iterator();

  public inline function clear(): Void
    set.clear();

  public inline function copy(): IntSet
    return new IntSet(this);

  public inline function toArray(): Array<Int>
    return [for (v in this) v];

  public inline function toString(): String
    return '$set';
}
