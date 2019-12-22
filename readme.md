# set

[![Build Status](https://travis-ci.com/benmerckx/set.svg?branch=master)](https://travis-ci.com/benmerckx/set)

`Set<V>` using a `Map<V, Bool>` implementation.

```haxe
interface ISet<V> {
  var length(default, null): Int;
  function add(value: V): Void;
  function remove(value: V): Bool;
  function exists(value: V): Bool;
  function iterator(): Iterator<V>;
  function copy(): ISet<V>;
  function toArray(): Array<V>;
  function toString(): String;
  function clear(): Void;
}
```
