package helder.set;

import js.lib.Set;

class IntSet implements ISet<Int> {
  final set: Set<Int>;

  public var length(get, never): Int;

  public inline function new(?values: Iterable<Int>) {
    set = new Set(switch values {
      case null: null;
      case it: [for (v in it) v];
    });
  }

  public inline function get_length(): Int
    return set.size;

  public inline function add(v: Int): Void
    set.add(v);

  public inline function exists(v: Int): Bool
    return set.has(v);

  public inline function remove(v: Int): Bool
    return set.delete(v);

  public inline function iterator(): Iterator<Int>
    return new js.lib.HaxeIterator(set.values());

  public inline function clear(): Void
    set.clear();

  public inline function copy(): IntSet
    return new IntSet(this);

  public inline function toArray(): Array<Int>
    return [for (v in this) v];

  public inline function toString(): String
    return '$set';
}
