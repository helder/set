package set;

import python.Set;

class StringSet implements ISet<String> {
  final set: Set<String>;

  public var length(get, never): Int;

  public inline function new(?values: Iterable<String>) {
    set = switch values {
      case null: new Set();
      case it: new Set([for (v in it) v]);
    }
  }

  public inline function get_length(): Int
    return set.length;

  public inline function add(v: String): Void
    set.add(v);

  public inline function exists(v: String): Bool
    return set.has(v);

  public inline function remove(v: String): Bool {
    if (!exists(v))
      return false;
    set.remove(v);
    return true;
  }

  public inline function iterator(): Iterator<String>
    return set.iterator();

  public inline function clear(): Void
    set.clear();

  public inline function copy(): StringSet
    return new StringSet(this);

  public inline function toArray(): Array<String>
    return [for (v in this) v];

  public inline function toString(): String
    return '$set';
}
