# set

[![Build Status](https://travis-ci.com/benmerckx/set.svg?branch=master)](https://travis-ci.com/benmerckx/set)

`Set<V>` using a `Map<V, Bool>` implementation.

```haxe
abstract Set<V> {
  final length: Int;
  function new(?values: Iterable<V>);
  function add(value: V): Void;
  function remove(value: V): Bool;
  function exists(value: V): Bool;
  function iterator(): Iterator<V>;
  function copy(): Set<V>;
  function toArray(): Array<V>;
  function toString(): String;
  function clear(): Void;
}
```

## Usage example

```haxe
final s = new set.Set<Int>([5, 6, 5]);
s.add(7);
trace(s.toArray());
```
