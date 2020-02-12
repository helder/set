import set.Set;

enum TestEnum {
  A;
  B(value: Int);
  C(value: String);
}

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
    asserts.assert(set.toArray()[0] == 'b');
    final setCopy = set.copy();
    set.clear();
    asserts.assert(set.length == 0);
    asserts.assert(setCopy.exists('b'));
    asserts.assert(setCopy.length == 1);
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
    asserts.assert(set.toArray()[0] == 2);
    final setCopy = set.copy();
    set.clear();
    asserts.assert(set.length == 0);
    asserts.assert(setCopy.exists(2));
    asserts.assert(setCopy.length == 1);
    return asserts.done();
  }

  public function testEnumValueSet() {
    final set: Set<TestEnum> = new Set();
    set.add(A);
    set.add(B(1));
    set.add(C('c'));
    asserts.assert(set.exists(A));
    asserts.assert(set.exists(B(1)));
    asserts.assert(!set.exists(B(2)));
    asserts.assert(set.exists(C('c')));
    asserts.assert(set.length == 3);
    set.remove(C('c'));
    asserts.assert(set.length == 2);
    set.remove(B(1));
    asserts.assert(set.length == 1);
    asserts.assert(set.toArray()[0] == A);
    final setCopy = set.copy();
    set.clear();
    asserts.assert(set.length == 0);
    asserts.assert(setCopy.exists(A));
    asserts.assert(setCopy.length == 1);
    return asserts.done();
  }

  public function testObjectSet() {
    final set: Set<{}> = new Set();
    final a = {}
    final b = {}
    set.add(a);
    set.add(b);
    asserts.assert(set.exists(a));
    asserts.assert(set.exists(b));
    asserts.assert(!set.exists({}));
    asserts.assert(set.length == 2);
    set.remove(a);
    asserts.assert(set.length == 1);
    asserts.assert(set.toArray()[0] == b);
    final setCopy = set.copy();
    set.clear();
    asserts.assert(set.length == 0);
    asserts.assert(setCopy.exists(b));
    asserts.assert(setCopy.length == 1);
    return asserts.done();
  }

  public function testConstructorValues() {
    final set = new Set([1, 2]);
    asserts.assert(set.exists(1));
    asserts.assert(set.exists(2));
    return asserts.done();
  }
}
