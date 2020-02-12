package set;

@:multiType(@:followWithAbstracts V)
abstract Set<V>(ISet<V>) {
  public function new(?values: Iterable<V>);

  public var length(get, never): Int;

  public inline function get_length(): Int
    return this.length;

  public inline function add(v: V): Void
    return this.add(v);

  public inline function exists(v: V): Bool
    return this.exists(v);

  public inline function remove(v: V): Bool
    return this.remove(v);

  public inline function iterator(): Iterator<V>
    return this.iterator();

  public inline function copy(): Set<V>
    return cast this.copy();

  public inline function toString(): String
    return this.toString();

  public inline function clear(): Void
    this.clear();

  public inline function toArray<V>(): Array<V>
    return this.toArray();

  @:to static inline function toStringSet<V: String>(t: ISet<V>,
      ?values: Iterable<String>): StringSet
    return new StringSet(values);

  @:to static inline function toIntSet<V: Int>(t: ISet<V>,
      ?values: Iterable<Int>): IntSet
    return new IntSet(values);

  @:to static inline function toEnumValueSet<V: EnumValue>(t: ISet<V>,
      ?values: Iterable<V>): EnumValueSet<V>
    return new EnumValueSet<V>(values);

  @:to static inline function toObjectSet<V: {}>(t: ISet<V>,
      ?values: Iterable<V>): ObjectSet<V>
    return new ObjectSet<V>(values);

  @:from static inline function fromStringSet<V>(set: StringSet): Set<String>
    return set;

  @:from static inline function fromIntSet<V>(set: IntSet): Set<Int>
    return set;

  @:from static inline function fromObjectSet<V: {}>(set: ObjectSet<V>): Set<V>
    return set;
}
