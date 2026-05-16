class Utils {
  static identity<T>(value: T): T {
    return value;
  }

  static reverse<T>(array: T[]): T[] {
    return array.reverse();
  }

  static findIndex<T>(array: T[], predicate: (item: T) => boolean): number {
    return array.findIndex(predicate);
  }

  static filterArray<T>(array: T[], predicate: (item: T) => boolean): T[] {
    return array.filter(predicate);
  }
}

interface GeneratedObjectLiteralInterface_1 {
  theme: string;
  version: number;
}
interface GeneratedObjectLiteralInterface_2 {
  name: string;
  settings: GeneratedObjectLiteralInterface_1;
}

interface Wrapper<T> {
  value: T;
}

function wrapValue<T>(value: T): Wrapper<T> {
  return { value };
}

function getFirstElement<T>(arr: T[]): T | undefined {
  return arr.length > 0 ? arr[0] : undefined;
}

interface HasLength {
  length: number;
}

function logLength<T extends HasLength>(arg: T): number {
  console.log(`Length: ${arg.length}`);
  return arg.length;
}

function identity<T>(arg: T): T {
  return arg;
}

function reverseArray<T>(arr: T[]): T[] {
  return arr.reverse();
}

function pair<T1, T2>(value1: T1, value2: T2): [T1, T2] {
  return [value1, value2];
}

function filterArray<T>(array: T[], predicate: (item: T) => boolean): T[] {
  return array.filter(predicate);
}

// -----------------------------------------------------------
// 1. 泛型类                 → SUB_BUILTINS_GENERICS_ACT_TEST_0100
// -----------------------------------------------------------
@Concurrent
export function testGenericClass() {
  const TAG = 'testGenericClass';
  try {
    const caseName = 'builtinsGenericsActTest0100';
    console.info(`${caseName} test start`);

    class Container<T> {
      private items: T[] = [];
      addItem(item: T): void { this.items.push(item); }
      getItems(): T[] { return this.items; }
      findItem<U extends T>(predicate: (item: T) => boolean): U | undefined {
        const result = this.items.find(predicate);
        return result as U | undefined;
      }
    }

    const numberContainer = new Container<number>();
    numberContainer.addItem(10);
    numberContainer.addItem(20);
    numberContainer.addItem(30);
    const evenNumber = numberContainer.findItem<number>((item) => item % 2 === 0);

    if (evenNumber !== 10) {
      throw new Error(`${TAG} expect 10, got ${evenNumber}`);
    }
    console.info(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error`);
  }
}

// -----------------------------------------------------------
// 2. 泛型接口               → SUB_BUILTINS_GENERICS_ACT_TEST_0200
// -----------------------------------------------------------
@Concurrent
export function testGenericInterface() {
  const TAG = 'testGenericInterface';
  try {
    const caseName = 'builtinsGenericsActTest0200';
    console.info(`${caseName} test start`);

    interface Config<T> {
      name: string;
      settings: T;
    }

    class Application<T> {
      private config: Config<T>;
      constructor(config: Config<T>) { this.config = config; }
      getConfig(): Config<T> { return this.config; }
    }

    const appConfig: GeneratedObjectLiteralInterface_2 = { name: 'MyApp', settings: { theme: 'dark', version: 1.0 } };
    const app = new Application(appConfig);
    const config = app.getConfig();

    if (config.name !== 'MyApp') {
      throw new Error(`${TAG} expect 'MyApp'`);
    }
    console.info(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error`);
  }
}

// -----------------------------------------------------------
// 5. 多泛型参数             → SUB_BUILTINS_GENERICS_ACT_TEST_1000
// -----------------------------------------------------------
@Concurrent
export function testMultiGeneric() {
  const TAG = 'testMultiGeneric';
  try {
    const caseName = 'builtinsGenericsActTest1000';
    console.info(`${caseName} test start`);

    class Pair<T1, T2> {
      private v1: T1; private v2: T2;
      constructor(v1: T1, v2: T2) { this.v1 = v1; this.v2 = v2; }
      getValue1(): T1 { return this.v1; }
      getValue2(): T2 { return this.v2; }
    }

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
@Concurrent
export function testGenericConstraint() {
  const TAG = 'testGenericConstraint';
  try {
    const caseName = 'builtinsGenericsActTest1100';
    console.info(`${caseName} test start`);

    interface Animal { name: string; }
    class Dog implements Animal { public name: string; constructor(n: string) { this.name = n; } }

    class Box<T extends Animal> {
      private value: T;
      constructor(v: T) { this.value = v; }
      getValue(): T { return this.value; }
    }

    const dogBox = new Box(new Dog('Buddy'));
    if (dogBox.getValue().name !== 'Buddy') {
      throw new Error(`${TAG} name`);
    }
    console.info(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error`);
  }
}

@Concurrent
export function testGenericDefaultClass() {
  const TAG = 'testGenericDefaultClass';
  try {
    const caseName = 'builtinsGenericsDefaultTest0100';
    console.info(`${caseName} test start`);

    class DataStorage<T = string> {
      private data: T;
      constructor(initialData: T) { this.data = initialData; }
      getData(): T { return this.data; }
      setData(newData: T): void { this.data = newData; }
    }

    const stringStorage = new DataStorage('Hello, world!');
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

@Concurrent
export function builtinsGenericsFormatTest() {
  const TAG = 'builtinsGenericsFormatTest';
  try {
    const caseName = 'builtinsGenericsFormatTest';
    class G<T = string[]> {
      public value: T;

      constructor(value: T) {
        this.value = value;
      }

      indexOf(item: string): number {
        return (this.value as string).indexOf(item);
      }
    }
    const stringArrayWrapper = new G(['a', 'b', 'c']);
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

@Concurrent
export function builtinsGenericsRestraintTest() {
  const TAG = 'builtinsGenericsRestraintTest';
  try {
    const caseName = 'builtinsGenericsRestraintTest';
    interface HasName {
      name: string;
    }

    interface Person {
      name: string;
      age: number;
    }

    class G<T extends HasName> {
      private value: T;

      constructor(value: T) {
        this.value = value;
      }

      getValue(): T {
        return this.value;
      }

      printName(): string {
        console.log(`Name: ${this.value.name}`);
        return this.value.name;
      }
    }

    const obj = new G<Person>({
      name: 'Alice', age: 25
    });
    let a = obj.printName();
    if (a !== a) {
      throw new Error(`${TAG} string init`);
    }
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error`);
  }
}

