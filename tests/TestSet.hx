@:asserts
class TestSet {
  public function new() {}

  public function testStringSet() {
    final set: Set<String> = new Set();
    set.add('a');
    set.add('b');
    asserts.assert(set.exists('a'));
    asserts.assert(set.exists('b'));
    asserts.assert(!set.exists('c'));
    asserts.assert(set.length == 2);
    set.remove('a');
    asserts.assert(set.length == 1);
    return asserts.done();
  }

  public function testIntSet() {
    final set: Set<Int> = new Set();
    set.add(1);
    set.add(2);
    asserts.assert(set.exists(1));
    asserts.assert(set.exists(2));
    asserts.assert(!set.exists(3));
    asserts.assert(set.length == 2);
    set.remove(1);
    asserts.assert(set.length == 1);
    return asserts.done();
  }
}
