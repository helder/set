package helder.set;

import js.lib.Set;

class ObjectSet<V:{}> implements ISet<V> {
  final set: Set<V>;

  public var length(get, never): Int;

  public inline function new(?values: Iterable<V>) {
    set = new Set(switch values {
      case null: null;
      case it: [for (v in it) v];
    });
  }

  public inline function get_length(): Int
    return set.size;

  public inline function add(v: V): Void
    set.add(v);

  public inline function exists(v: V): Bool
    return set.has(v);

  public inline function remove(v: V): Bool
    return set.delete(v);

  public inline function iterator(): Iterator<V>
    return new js.lib.HaxeIterator(set.values());

  public inline function clear(): Void
    set.clear();

  public inline function copy(): ObjectSet<V>
    return new ObjectSet(this);

  public inline function toArray(): Array<V>
    return [for (v in this) v];

  public inline function toString(): String
    return '$set';
}
