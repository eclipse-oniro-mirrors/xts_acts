class TestField {
  constructor() {
  }

  $_get(index: number): TestField {
    return this
  }

  $_set(index: number, value: boolean) {
  }

  public static new_Object(): TestField {
    return new TestField();
  }

  private age_: number = 0

  set age(x: number) {
  }

  get age(): number {
    return this.age_
  }

  stringValue: string = 'test';
  booleanValue: boolean = true;
  charValue: char = 5;
  byteValue: byte = 6;
  shortValue: short = 7;
  intValue: int = 8;
  longValue: long = 9;
  floatValue: float = 10.0f;
  doubleValue: double = 11.0;
}

class Singleton {
  constructor() {
    this.weight = 1;
  }

  weight: int;
  data: int[] = [2, 4, 6]

  $_iterator() { // Function type is inferred from its body
    return new SingletonIterator(this)
  }
}

class SingletonIterator implements Iterator<int> {
  index = 0
  age = 0
  base: Singleton

  constructor(base: Singleton) {
    this.base = base
    this.age = 1
  }

  next(): IteratorResult<int> {
    return {
      done: this.index >= this.base.data.length,
      value: this.index >= this.base.data.length ? undefined : this.base.data[this.index++]
    }
  }
}

