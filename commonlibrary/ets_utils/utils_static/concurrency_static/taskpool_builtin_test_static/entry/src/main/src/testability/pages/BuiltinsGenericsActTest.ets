'use static'

interface GeneratedObjectLiteralInterface_1 {
  theme: string;
  version: number;
}
interface GeneratedObjectLiteralInterface_2 {
  name: string;
  settings: GeneratedObjectLiteralInterface_1;
}

// -----------------------------------------------------------
// 1. 泛型类                 → SUB_BUILTINS_GENERICS_ACT_TEST_0100
// -----------------------------------------------------------

// -----------------------------------------------------------
// 2. 泛型接口               → SUB_BUILTINS_GENERICS_ACT_TEST_0200
// -----------------------------------------------------------

// -----------------------------------------------------------
// 5. 多泛型参数             → SUB_BUILTINS_GENERICS_ACT_TEST_1000
// -----------------------------------------------------------

class Pair<T1, T2> {
  private v1: T1; private v2: T2;
  constructor(v1: T1, v2: T2) { this.v1 = v1; this.v2 = v2; }
  getValue1(): T1 { return this.v1; }
  getValue2(): T2 { return this.v2; }
}
export function testMultiGeneric() {
  const TAG = 'testMultiGeneric';
  try {
    const caseName = 'builtinsGenericsActTest1000';
    console.info(`${caseName} test start`);


    const pair = new Pair<number, string>(100, 'World');
    if (pair.getValue1() !== 100) {
      throw new Error(`${TAG} v1`);
    }
    if (pair.getValue2() !== 'World'){
      throw new Error(`${TAG} v2`);
    }
    console.info(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error`);
  }
}

// -----------------------------------------------------------
// 6. 泛型约束               → SUB_BUILTINS_GENERICS_ACT_TEST_1100
// -----------------------------------------------------------

interface Animal { name: string; }
class Dog implements Animal { public name: string; constructor(n: string) { this.name = n; } }

class Box1<T extends Animal> {
  private value: T;
  constructor(v: T) { this.value = v; }
  getValue(): T { return this.value; }
}
export function testGenericConstraint() {
  const TAG = 'testGenericConstraint';
  try {
    const caseName = 'builtinsGenericsActTest1100';
    console.info(`${caseName} test start`);


    const dogBox = new Box1<Dog>(new Dog('Buddy'));
    if (dogBox.getValue().name !== 'Buddy') {
      throw new Error(`${TAG} name`);
    }
    console.info(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error`);
  }
}


class DataStorage<T = string> {
  private data: T;
  constructor(initialData: T) { this.data = initialData; }
  getData(): T { return this.data; }
  setData(newData: T): void { this.data = newData; }
}
export function testGenericDefaultClass() {
  const TAG = 'testGenericDefaultClass';
  try {
    const caseName = 'builtinsGenericsDefaultTest0100';
    console.info(`${caseName} test start`);


    const stringStorage = new DataStorage<string>('Hello, world!');
    if (stringStorage.getData() !== 'Hello, world!') {
      throw new Error(`${TAG} string init`);
    }
    stringStorage.setData('Goodbye, world!');
    if (stringStorage.getData() !== 'Goodbye, world!') {
      throw new Error(`${TAG} string set`);
    }

    const numberStorage = new DataStorage<number>(42);
    if (numberStorage.getData() !== 42) {
      throw new Error(`${TAG} number init`);
    }
    numberStorage.setData(100);
    if (numberStorage.getData() !== 100) {
      throw new Error(`${TAG} number set`);
    }

    console.info(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error`);
  }
}

class G1<T = string[]> {
  public value: T;

  constructor(value: T) {
    this.value = value;
  }

  indexOf(item: string): number {
    return (this.value as string).indexOf(item);
  }
}
export function builtinsGenericsFormatTest() {
  const TAG = 'builtinsGenericsFormatTest';
  try {
    const caseName = 'builtinsGenericsFormatTest';

    const stringArrayWrapper = new G1<string[]>(['a', 'b', 'c']);
    if (stringArrayWrapper.indexOf('b') !== 1) {
      throw new Error(`${TAG} string init`);
    }
    if (stringArrayWrapper.indexOf('d') !== -1) {
      throw new Error(`${TAG} string init`);
    }
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error`);
  }
}

