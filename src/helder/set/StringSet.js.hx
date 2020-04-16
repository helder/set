package helder.set;

import js.lib.Set;

class StringSet implements ISet<String> {
  final set: Set<String>;

  public var length(get, never): Int;

  public inline function new(?values: Iterable<String>) {
    set = new Set(switch values {
      case null: null;
      case it: [for (v in it) v];
    });
  }

  public inline function get_length(): Int
    return set.size;

  public inline function add(v: String): Void
    set.add(v);

  public inline function exists(v: String): Bool
    return set.has(v);

  public inline function remove(v: String): Bool
    return set.delete(v);

  public inline function iterator(): Iterator<String>
    return new js.lib.HaxeIterator(set.values());

  public inline function clear(): Void
    set.clear();

  public inline function copy(): StringSet
    return new StringSet(this);

  public inline function toArray(): Array<String>
    return [for (v in this) v];

  public inline function toString(): String
    return '$set';
}
