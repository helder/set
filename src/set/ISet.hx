package set;

interface ISet<V> {
  var length(get, never): Int;
  function add(value: V): Void;
  function remove(value: V): Bool;
  function exists(value: V): Bool;
  function iterator(): Iterator<V>;
  function copy(): ISet<V>;
  function toArray(): Array<V>;
  function toString(): String;
  function clear(): Void;
}
