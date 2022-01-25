# set

[![Build Status](https://travis-ci.com/benmerckx/set.svg?branch=master)](https://travis-ci.com/benmerckx/set)

`Set<V>` using native Set on supported targets (python, js) or a `Map<V, Bool>` implementation when not supported.

```haxe
package helder;
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

## Usage

<pre><a href="https://github.com/lix-pm/lix.client">lix</a> +lib <a href="https://lib.haxe.org/p/helder.set">helder.set</a></pre>

Install the library and add `-lib helder.set` to your hxml.

```haxe
import helder.Set;
final set = new Set<Int>([5, 6, 5]);
set.add(7);
trace(set.toArray()); // [5, 6, 7]
```

> **Note:** An earlier version of this library was published to haxelib under the name "set" and will not receive updates.
