import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

class List<T> {
  public data: Array<T> = [];
  get length(): number {
    return this.data.length;
  }

  constructor(initData?: ArrayLike<T> | T | null | undefined) {
    if (initData === null || initData === undefined) {
      this.data = [];
      return;
    }
    if (Array.isArray(initData)) {
      this.data = initData.slice();
    } else if (typeof initData === 'object') {
      const arrayLike = initData as ArrayLike<T>;
      if (typeof arrayLike.length === 'number') {
        this.data = Array.from(arrayLike);
      } else {
        this.data = [initData as T];
      }
    } else {
      this.data = [initData as T];
    }
  }

  isEmpty(): boolean {
    return this.data.length === 0;
  }

  add(element: T): boolean {
    const prevLength = this.data.length;
    this.data.push(element);
    const isAddedSuccessfully = this.data.length === prevLength + 1 &&
      this.data[this.data.length - 1] === element;
    return isAddedSuccessfully;
  }

  insert(item: T, index: number): void {
    const isIndexOutOfBounds = index < 0 || index > this.data.length;
    if (isIndexOutOfBounds) {
      this.data.push(item);
    } else {
      this.data.splice(index, 0, item);
    }
  }

  get(index: number): T | undefined {
    return this.data[index];
  }

  size(): number {
    return this.data.length;
  }

  clear(): void {
    this.data = [];
  }

}

type TypedArray =
  | Int8Array
  | Uint8Array
  | Uint8ClampedArray
  | Int16Array
  | Uint16Array
  | Int32Array
  | Uint32Array
  | Float32Array
  | Float64Array
  | BigInt64Array
  | BigUint64Array;

type PrimitiveType = number | string | boolean | null | undefined | bigint | (() => string);
type TestArrayElement = PrimitiveType | TypedArray | TestArrayElement[];
type TestArray = TestArrayElement[] | TypedArray;

interface NumberPrecisionValues {
  byte: number[];
  short: number[];
  int: number[];
  long: bigint[];
  float: number[];
  double: number[];
  char: number[];
}

interface NumberBaseExprValues {
  hex16: number;
  hex32: number;
  octal: number;
  sci1: number;
  sci2: number;
  exponent: number;
  floatHex: number;
}

class NormalObject {
  a: number = 0;
  b: string = "";
  c: Array<number> = [];
  constructor(a: number, b: string, c: Array<number>) {
    this.a = a;
    this.b = b;
    this.c = c;
  }
}

class NestedObject {
  a: number = 0;
  b: NestedLevel2 = new NestedLevel2(0, new NestedLevel3(0));
  constructor(a: number, b: NestedLevel2) {
    this.a = a;
    this.b = b;
  }
}

class NestedLevel2 {
  c: number = 0;
  d: NestedLevel3 = new NestedLevel3(0);
  constructor(c: number, d: NestedLevel3) {
    this.c = c;
    this.d = d;
  }
}

class NestedLevel3 {
  e: number = 0;
  constructor(e: number) {
    this.e = e;
  }
}

class EmptyObject {}


class SetObject {
  set: Set<number> = new Set();
  constructor(values: Array<number>) {
    values.forEach(value => {
      this.set.add(value);
    });
  }
}

class FuncObject {
  a: number = 0;
  b: () => string = () => "";
  constructor(a: number, b: () => string) {
    this.a = a;
    this.b = b;
  }
}

class RegexObject {
  regex: RegExp = /^$/;
  constructor(regex: RegExp) {
    this.regex = regex;
  }
}

class PromiseObject {
  promise: Promise<string> = Promise.resolve("");
  constructor(promise: Promise<string>) {
    this.promise = promise;
  }
}

class SpecialValueObject {
  a?: undefined;
  b?: null;
  c: number = 0;
  d: number = 0;
  e: number = 0;
  constructor(c: number, d: number, e: number) {
    this.c = c;
    this.d = d;
    this.e = e;
  }
}

class SpecialValueExtObject {
  f: number = 0;
  g: number = 0;
  constructor(f: number, g: number) {
    this.f = f;
    this.g = g;
  }
}

class SpecialValueInsertObject {
  h?: undefined;
  i?: null;
  j: number = 0;
  k: number = 0;
  constructor(j?: number, k?: number, h?: undefined, i?: null) {
    if (j !== undefined) this.j = j;
    if (k !== undefined) this.k = k;
    this.h = h;
    this.i = i;
  }
}

class LargeObject {
  private props: Map<string, number> = new Map();
  constructor(size: number) {
    for (let i = 0; i < size; i++) {
      this.props.set(i.toString(), i);
    }
  }
  getProperty(key: string): number {
    return this.props.get(key) || 0;
  }
  getPropertyCount(): number {
    return this.props.size;
  }
}

class MixedObject {
  a: number = 0;
  b: string = "";
  c: boolean = false;
  d: null | string = null;
  e: NestedLevel2 = new NestedLevel2(0, new NestedLevel3(0));
  f: Map<string, string> = new Map();
  g: Set<number> = new Set();
  h: RegExp = /^$/;
  i: ArrayBuffer = new ArrayBuffer(0);
  constructor(
    a: number, b: string, c: boolean, d: null | string,
    e: NestedLevel2, f: Map<string, string>, g: Set<number>,
    h: RegExp, i: ArrayBuffer
  ) {
    this.a = a;
    this.b = b;
    this.c = c;
    this.d = d;
    this.e = e;
    this.f = f;
    this.g = g;
    this.h = h;
    this.i = i;
  }
}

class SmallObject {
  small: number = 0;
  constructor(small: number) {
    this.small = small;
  }
}
function isEmptyObject(obj: EmptyObject): boolean {
  return obj instanceof EmptyObject;
}

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ListTest03() {
  describe('ListTest03', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_LIST_TEST03_0100
     * @tc.name      testList03Chapter0001
     * @tc.desc      test add set object elements, verify return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList03Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList03Chapter0001';
      console.log(TAG + ' start');

      const setValues1 = [1, 2, 3, 4, 5];
      const setValues2 = [6, 7, 8, 9, 10];
      const setObj1 = new SetObject(setValues1);
      const setObj2 = new SetObject(setValues2);
      const setObjList = [setObj1, setObj2];

      const listConstructor = new List<SetObject>(setObjList);
      expect(listConstructor.size()).assertEqual(2);
      expect(listConstructor.get(0)?.set.has(3)).assertTrue();
      expect(listConstructor.get(0)?.set.has(6)).assertEqual(false);
      expect(listConstructor.get(1)?.set.has(8)).assertTrue();

      const listAdd = new List<SetObject>();
      const result1 = listAdd.add(setObj1);
      const result2 = listAdd.add(setObj2);
      expect(result1).assertTrue();
      expect(result2).assertTrue();

      expect(listAdd.size()).assertEqual(2);
      expect(listAdd.get(0)?.set.has(5)).assertTrue();
      expect(listAdd.get(1)?.set.has(10)).assertTrue();

      const newSetValues = [11, 12, 13];
      const newSetObj = new SetObject(newSetValues);
      const listInsert = new List<SetObject>([setObj1]);
      listInsert.insert(setObj2, 1);
      listInsert.insert(newSetObj, 0);
      listInsert.insert(setObj1, 2);

      expect(listInsert.size()).assertEqual(4);
      expect(listInsert.get(0)?.set.has(12)).assertTrue();
      expect(listInsert.get(2)?.set.has(7)).assertFalse();
    });

    /**
     * @tc.number    SUB_LIST_TEST03_0200
     * @tc.name      testList03Chapter0002
     * @tc.desc      test add function object elements, verify return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList03Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList03Chapter0002';
      console.log(TAG + ' start');

      const func1 = () => "function1";
      const func2 = () => "function2";
      const funcObj1 = new FuncObject(10, func1);
      const funcObj2 = new FuncObject(20, func2);
      const funcObjList = [funcObj1, funcObj2];

      const listConstructor = new List<FuncObject>(funcObjList);
      expect(listConstructor.size()).assertEqual(2);
      expect(listConstructor.get(0)?.a).assertEqual(10);
      expect(listConstructor.get(0)?.b()).assertEqual("function1");
      expect(listConstructor.get(1)?.b()).assertEqual("function2");

      const listAdd = new List<FuncObject>();
      const result1 = listAdd.add(funcObj1);
      const result2 = listAdd.add(funcObj2);
      expect(result1).assertTrue();
      expect(result2).assertTrue();

      expect(listAdd.size()).assertEqual(2);
      expect(listAdd.get(0)?.b()).assertEqual("function1");
      expect(listAdd.get(1)?.a).assertEqual(20);

      const newFunc = () => "newFunction";
      const newFuncObj = new FuncObject(30, newFunc);
      const listInsert = new List<FuncObject>([funcObj1]);
      listInsert.insert(funcObj2, 1);
      listInsert.insert(newFuncObj, 0);
      listInsert.insert(new FuncObject(40, () => "anotherFunction"), 5);

      expect(listInsert.size()).assertEqual(4);
      expect(listInsert.get(0)?.b()).assertEqual("newFunction");
      expect(listInsert.get(2)?.b()).assertEqual("function2");
      expect(listInsert.get(3)?.a).assertEqual(40);
    });

    /**
     * @tc.number    SUB_LIST_TEST03_0300
     * @tc.name      testList03Chapter0003
     * @tc.desc      test add regex object elements, verify return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList03Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList03Chapter0003';
      console.log(TAG + ' start');

      const regex1 = /^test\d+$/;
      const regex2 = /[a-zA-Z]+/g;
      const regexObj1 = new RegexObject(regex1);
      const regexObj2 = new RegexObject(regex2);
      const regexObjList = [regexObj1, regexObj2];

      const listConstructor = new List<RegexObject>(regexObjList);
      expect(listConstructor.size()).assertEqual(2);
      expect(listConstructor.get(0)?.regex.test("test123")).assertTrue();
      expect(listConstructor.get(0)?.regex.test("test")).assertEqual(false);
      expect(listConstructor.get(1)?.regex.test("HelloWorld")).assertTrue();

      const listAdd = new List<RegexObject>();
      const result1 = listAdd.add(regexObj1);
      const result2 = listAdd.add(regexObj2);
      expect(result1).assertTrue();
      expect(result2).assertTrue();

      expect(listAdd.size()).assertEqual(2);
      expect(listAdd.get(0)?.regex.test("test456")).assertTrue();
      expect(listAdd.get(1)?.regex.test("123abc")).assertFalse();

      const newRegex = /\d+/;
      const newRegexObj = new RegexObject(newRegex);
      const listInsert = new List<RegexObject>([regexObj1]);
      listInsert.insert(regexObj2, 1);
      listInsert.insert(newRegexObj, 0);
      listInsert.insert(new RegexObject(/^$/), 5);

      expect(listInsert.size()).assertEqual(4);
      expect(listInsert.get(0)?.regex.test("789")).assertTrue();
      expect(listInsert.get(2)?.regex.test("RegexTest")).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEST03_0400
     * @tc.name      testList03Chapter0004
     * @tc.desc      test add promise object elements, verify return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList03Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList03Chapter0004';
      console.log(TAG + ' start');

      const promise1 = Promise.resolve("success1");
      const promise2 = Promise.resolve("success2");
      const promiseObj1 = new PromiseObject(promise1);
      const promiseObj2 = new PromiseObject(promise2);
      const promiseObjList = [promiseObj1, promiseObj2];

      const listConstructor = new List<PromiseObject>(promiseObjList);
      expect(listConstructor.size()).assertEqual(2);

      listConstructor.get(0)?.promise.then(res => expect(res).assertEqual("success1"));
      listConstructor.get(1)?.promise.then(res => expect(res).assertEqual("success2"));

      const listAdd = new List<PromiseObject>();
      const result1 = listAdd.add(promiseObj1);
      const result2 = listAdd.add(promiseObj2);
      expect(result1).assertTrue();
      expect(result2).assertTrue();

      expect(listAdd.size()).assertEqual(2);
      listAdd.get(0)?.promise.then(res => expect(res).assertEqual("success1"));
      listAdd.get(1)?.promise.then(res => expect(res).assertEqual("success2"));

      const newPromise = Promise.resolve("newSuccess");
      const newPromiseObj = new PromiseObject(newPromise);
      const listInsert = new List<PromiseObject>([promiseObj1]);
      listInsert.insert(promiseObj2,1);
      listInsert.insert(newPromiseObj,0);
      listInsert.insert(new PromiseObject(Promise.resolve("anotherSuccess")),5);

      expect(listInsert.size()).assertEqual(4);
      listInsert.get(0)?.promise.then(res => expect(res).assertEqual("newSuccess"));
      listInsert.get(2)?.promise.then(res => expect(res).assertEqual("success2"));
      listInsert.get(3)?.promise.then(res => expect(res).assertEqual("anotherSuccess"));
    });

    /**
     * @tc.number    SUB_LIST_TEST03_0500
     * @tc.name      testList03Chapter0005
     * @tc.desc      test add special value object elements, verify return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList03Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList03Chapter0005';
      console.log(TAG + ' start');

      const specialValueObj1 = new SpecialValueObject(1, 2, 3);
      specialValueObj1.a = undefined;
      specialValueObj1.b = null;
      const specialValueObj2 = new SpecialValueObject(4, 5, 6);
      specialValueObj2.a = undefined;
      specialValueObj2.b = null;
      const specialValueObjList = [specialValueObj1, specialValueObj2];

      const listConstructor = new List<SpecialValueObject>(specialValueObjList);
      expect(listConstructor.size()).assertEqual(2);
      expect(listConstructor.get(0)?.a).assertEqual(undefined);
      expect(listConstructor.get(0)?.b).assertEqual(null);
      expect(listConstructor.get(0)?.c).assertEqual(1);
      expect(listConstructor.get(1)?.d).assertEqual(5);

      const listAdd = new List<SpecialValueObject>();
      const result1 = listAdd.add(specialValueObj1);
      const result2 = listAdd.add(specialValueObj2);
      expect(result1).assertTrue();
      expect(result2).assertTrue();

      expect(listAdd.size()).assertEqual(2);
      expect(listAdd.get(0)?.b).assertEqual(null);
      expect(listAdd.get(1)?.e).assertEqual(6);

      const specialValueExtObj = new SpecialValueExtObject(7, 8);
      const listInsert = new List<SpecialValueObject>([specialValueObj1]);
      listInsert.insert(specialValueObj2,1);

      const mixedList = new List<SpecialValueObject | SpecialValueExtObject>();
      mixedList.add(specialValueObj1);
      mixedList.add(specialValueExtObj);
      expect(mixedList.size()).assertEqual(2);
      expect((mixedList.get(0) as SpecialValueObject).c).assertEqual(1);
      expect((mixedList.get(1) as SpecialValueExtObject).f).assertEqual(7);
    });

    /**
     * @tc.number    SUB_LIST_TEST03_0600
     * @tc.name      testList03Chapter0006
     * @tc.desc      test add special value insert object elements, verify return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList03Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList03Chapter0006';
      console.log(TAG + ' start');

      const specialInsertObj1 = new SpecialValueInsertObject(10, 20, undefined, null);
      const specialInsertObj2 = new SpecialValueInsertObject(30, 40, undefined, null);
      const specialInsertObjList = [specialInsertObj1, specialInsertObj2];

      const listConstructor = new List<SpecialValueInsertObject>(specialInsertObjList);
      expect(listConstructor.size()).assertEqual(2);
      expect(listConstructor.get(0)?.h).assertEqual(undefined);
      expect(listConstructor.get(0)?.i).assertEqual(null);
      expect(listConstructor.get(0)?.j).assertEqual(10);
      expect(listConstructor.get(1)?.k).assertEqual(40);

      const listAdd = new List<SpecialValueInsertObject>();
      const result1 = listAdd.add(specialInsertObj1);
      const result2 = listAdd.add(specialInsertObj2);
      expect(result1).assertTrue();
      expect(result2).assertTrue();

      expect(listAdd.size()).assertEqual(2);
      expect(listAdd.get(0)?.i).assertEqual(null);
      expect(listAdd.get(1)?.j).assertEqual(30);

      const newSpecialInsertObj = new SpecialValueInsertObject(50, 60);
      newSpecialInsertObj.h = undefined;
      newSpecialInsertObj.i = null;
      const listInsert = new List<SpecialValueInsertObject>([specialInsertObj1]);
      listInsert.insert(specialInsertObj2,1);
      listInsert.insert(newSpecialInsertObj,0);
      listInsert.insert(new SpecialValueInsertObject(),5);

      expect(listInsert.size()).assertEqual(4);
      expect(listInsert.get(0)?.j).assertEqual(50);
      expect(listInsert.get(2)?.k).assertEqual(40);
      expect(listInsert.get(3)?.h).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEST03_0700
     * @tc.name      testList03Chapter0007
     * @tc.desc      test add large object elements, verify return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList03Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList03Chapter0007';
      console.log(TAG + ' start');

      const largeObj1 = new LargeObject(100);
      const largeObj2 = new LargeObject(200);
      const largeObjList = [largeObj1, largeObj2];

      const listConstructor = new List<LargeObject>(largeObjList);
      expect(listConstructor.size()).assertEqual(2);
      expect(listConstructor.get(0)?.getPropertyCount()).assertEqual(100);
      expect(listConstructor.get(0)?.getProperty("50")).assertEqual(50);
      expect(listConstructor.get(1)?.getPropertyCount()).assertEqual(200);
      expect(listConstructor.get(1)?.getProperty("150")).assertEqual(150);

      const listAdd = new List<LargeObject>();
      const result1 = listAdd.add(largeObj1);
      const result2 = listAdd.add(largeObj2);
      expect(result1).assertTrue();
      expect(result2).assertTrue();

      expect(listAdd.size()).assertEqual(2);
      expect(listAdd.get(0)?.getProperty("99")).assertEqual(99);
      expect(listAdd.get(1)?.getProperty("199")).assertEqual(199);

      const newLargeObj = new LargeObject(300);
      const listInsert = new List<LargeObject>([largeObj1]);
      listInsert.insert(largeObj2,1);
      listInsert.insert(newLargeObj,0);
      listInsert.insert(new LargeObject(400),5);

      expect(listInsert.size()).assertEqual(4);
      expect(listInsert.get(0)?.getPropertyCount()).assertEqual(300);
      expect(listInsert.get(2)?.getPropertyCount()).assertEqual(200);
      expect(listInsert.get(3)?.getProperty("399")).assertEqual(399);
    });

    /**
     * @tc.number    SUB_LIST_TEST03_0800
     * @tc.name      testList03Chapter0008
     * @tc.desc      test add mixed object elements, verify return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList03Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList03Chapter0008';
      console.log(TAG + ' start');

      const nestedLevel3 = new NestedLevel3(10);
      const nestedLevel2 = new NestedLevel2(20, nestedLevel3);
      const mapEntries: [string, string][] = [["key1", "value1"], ["key2", "value2"]];
      const map = new Map(mapEntries);
      const set = new Set([1, 2, 3]);
      const regex = /test/;
      const arrayBuffer = new ArrayBuffer(8);
      const mixedObj1 = new MixedObject(
        1, "test1", true, null, nestedLevel2, map, set, regex, arrayBuffer
      );
      const mixedObj2 = new MixedObject(
        2, "test2", false, "str", new NestedLevel2(30, new NestedLevel3(40)),
        new Map([["key3", "value3"]]), new Set([4, 5, 6]), /mixed/, new ArrayBuffer(16)
      );
      const mixedObjList = [mixedObj1, mixedObj2];

      const listConstructor = new List<MixedObject>(mixedObjList);
      expect(listConstructor.size()).assertEqual(2);
      expect(listConstructor.get(0)?.a).assertEqual(1);
      expect(listConstructor.get(0)?.b).assertEqual("test1");
      expect(listConstructor.get(0)?.c).assertEqual(true);
      expect(listConstructor.get(0)?.d).assertEqual(null);
      expect(listConstructor.get(0)?.e.c).assertEqual(20);
      expect(listConstructor.get(0)?.f.get("key1")).assertEqual("value1");
      expect(listConstructor.get(0)?.g.has(2)).assertTrue();
      expect(listConstructor.get(0)?.h.test("test")).assertTrue();
      expect(listConstructor.get(0)?.i).assertDeepEquals(arrayBuffer);
      expect(listConstructor.get(1)?.a).assertEqual(2);
      expect(listConstructor.get(1)?.e.d.e).assertEqual(40);
      expect(listConstructor.get(1)?.f.get("key3")).assertEqual("value3");

      const listAdd = new List<MixedObject>();
      const result1 = listAdd.add(mixedObj1);
      const result2 = listAdd.add(mixedObj2);
      expect(result1).assertTrue();
      expect(result2).assertTrue();

      expect(listAdd.size()).assertEqual(2);
      expect(listAdd.get(0)?.g.has(3)).assertTrue();
      expect(listAdd.get(1)?.h.test("mixed")).assertTrue();

      const newMap = new Map([["key4", "value4"]]);
      const newSet = new Set([7, 8, 9]);
      const newMixedObj = new MixedObject(
        3, "test3", true, "newStr", new NestedLevel2(50, new NestedLevel3(60)),
        newMap, newSet, /new/, new ArrayBuffer(32)
      );
      const listInsert = new List<MixedObject>([mixedObj1]);
      listInsert.insert(mixedObj2,1);
      listInsert.insert(newMixedObj,0);
      listInsert.insert(new MixedObject(
        4, "test4", false, null, new NestedLevel2(0, new NestedLevel3(0)),
        new Map(), new Set(), /empty/, new ArrayBuffer(0)
      ),5);

      expect(listInsert.size()).assertEqual(4);
      expect(listInsert.get(0)?.a).assertEqual(3);
      expect(listInsert.get(0)?.f.get("key4")).assertEqual("value4");
      expect(listInsert.get(2)?.e.d.e).assertEqual(40);
      expect(listInsert.get(3)?.i.byteLength).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEST03_0900
     * @tc.name      testList03Chapter0009
     * @tc.desc      test add small object elements, verify return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList03Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList03Chapter0009';
      console.log(TAG + ' start');

      const smallObj1 = new SmallObject(10);
      const smallObj2 = new SmallObject(20);
      const smallObj3 = new SmallObject(30);
      const smallObjList = [smallObj1, smallObj2, smallObj3];

      const listConstructor = new List<SmallObject>(smallObjList);
      expect(listConstructor.size()).assertEqual(3);
      expect(listConstructor.get(0)?.small).assertEqual(10);
      expect(listConstructor.get(1)?.small).assertEqual(20);
      expect(listConstructor.get(2)?.small).assertEqual(30);

      const listAdd = new List<SmallObject>();
      const result1 = listAdd.add(smallObj1);
      const result2 = listAdd.add(smallObj2);
      const result3 = listAdd.add(smallObj3);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();

      expect(listAdd.size()).assertEqual(3);
      expect(listAdd.get(0)?.small).assertEqual(10);
      expect(listAdd.get(1)?.small).assertEqual(20);
      expect(listAdd.get(2)?.small).assertEqual(30);

      const newSmallObj = new SmallObject(40);
      const listInsert = new List<SmallObject>([smallObj1]);
      listInsert.insert(smallObj2,1);
      listInsert.insert(newSmallObj,0);
      listInsert.insert(new SmallObject(50),5);

      expect(listInsert.size()).assertEqual(4);
      expect(listInsert.get(0)?.small).assertEqual(40);
      expect(listInsert.get(2)?.small).assertEqual(20);
      expect(listInsert.get(3)?.small).assertEqual(50);
    });

    /**
     * @tc.number    SUB_LIST_TEST03_1000
     * @tc.name      testList03Chapter0010
     * @tc.desc      Verify insert() for empty/overflow arrays & existence judgment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList03Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList03Chapter0010';
      console.log(TAG + ' start');

      const normalUint8Arr: Uint8Array = new Uint8Array([72, 101, 108, 108, 111,
        87, 111, 114, 108, 100, 49, 50, 51, 63]);
      const zeroArr: number[] = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];

      const list: List<TestArray> = new List<TestArray>();
      list.insert(normalUint8Arr, 0);
      list.insert(zeroArr, 1);

      expect(list.length).assertEqual(2);

      const item0: Uint8Array = list.get(0) as Uint8Array;
      expect(item0.length).assertEqual(14);
      expect(item0[0]).assertEqual(72);
      expect(item0[13]).assertEqual(63);

      const item1: number[] = list.get(1) as number[];
      expect(item1.length).assertEqual(19);
      expect(item1[9]).assertEqual(0);
      expect(item1[13]).assertEqual(0);
      expect(item1[18]).assertEqual(63);
    });

    /**
     * @tc.number    SUB_LIST_TEST03_0011
     * @tc.name      testList03Chapter0011
     * @tc.desc      Verify insert() for negative/non-numeric index arrays (has test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList03Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testList03Chapter0011';
      console.log(TAG + ' start');

      const negativeArr: number[] = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      const uint8NegArr: Uint8Array = new Uint8Array(negativeArr);
      const int8NegArr: Int8Array = new Int8Array(negativeArr);
      const nonNumericMap: Map<string, number> = new Map<string, number>();
      nonNumericMap.set("abc", 111);
      nonNumericMap.set("aaa", 222);
      const numericArr: number[] = [333];

      const list: List<TypedArray | number[]> = new List<TypedArray | number[]>();
      list.insert(uint8NegArr, 0);
      list.insert(int8NegArr, 1);
      list.insert(numericArr, 2);

      expect(list.length).assertEqual(3);

      const item0: Uint8Array = list.get(0) as Uint8Array;
      expect(item0[6]).assertEqual(145);
      expect(item0[10]).assertEqual(207);

      const item1: Int8Array = list.get(1) as Int8Array;
      expect(item1[6]).assertEqual(-111);
      expect(item1[10]).assertEqual(-49);

      const item2: number[] = list.get(2) as number[];
      expect(item2.length).assertEqual(1);
      expect(item2[0]).assertEqual(333);
      expect(nonNumericMap.get("abc")).assertEqual(111);
      expect(nonNumericMap.get("aaa")).assertEqual(222);

    });

    /**
     * @tc.number    SUB_LIST_TEST03_0012
     * @tc.name      testList03Chapter0012
     * @tc.desc      Verify insert() for NaN/Infinity/non-numeric arrays (has test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList03Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testList03Chapter0012';
      console.log(TAG + ' start');

      const specialValueArr: number[] = [72, 101, NaN, Infinity, -Infinity, 108, 111];
      const nonNumericTypeArr: (number | string | boolean | null |
      undefined)[] = [72, "abc", true, null, undefined, 108];

      const list: List<number[] | (number | string | boolean | null | undefined)[]> = new List<number[] | (number |
      string | boolean | null | undefined)[]>();
      list.insert(specialValueArr, 0);
      list.insert(nonNumericTypeArr, 1);

      expect(list.length).assertEqual(2);

      const item0: number[] = list.get(0) as number[];
      expect(item0[0]).assertEqual(72);
      expect(isNaN(item0[2])).assertTrue();
      expect(item0[3]).assertEqual(Infinity);
      expect(item0[4]).assertEqual(-Infinity);

      const item1: (number | string | boolean | null | undefined)[] = list.get(1) as (number |
      string | boolean | null | undefined)[];
      expect(item1[1]).assertEqual("abc");
      expect(item1[2]).assertEqual(true);
      expect(item1[3]).assertEqual(null);
      expect(item1[4]).assertEqual(undefined);

    });

    /**
     * @tc.number    SUB_LIST_TEST03_0013
     * @tc.name      testList03Chapter0013
     * @tc.desc      Verify insert() for empty/overflow/deleted element arrays (has test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList03Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testList03Chapter0013';
      console.log(TAG + ' start');

      const emptyArr: number[] = [];
      const overflowArr: number[] = [256, 65536, 32768];
      const deletedArr: number[] = [1, 2, 3];
      deletedArr.splice(1, 1);

      const list: List<number[]> = new List<number[]>();
      list.insert(emptyArr, 0);
      list.insert(overflowArr, 1);
      list.insert(deletedArr, 2);

      expect(list.length).assertEqual(3);

      const item0: number[] = list.get(0) as number[];
      expect(item0.length).assertEqual(0);

      const item1: number[] = list.get(1) as number[];
      expect(item1[0]).assertEqual(256);
      expect(item1[1]).assertEqual(65536);
      expect(item1[2]).assertEqual(32768);

      const item2: number[] = list.get(2) as number[];
      expect(item2.length).assertEqual(2);
      expect(item2[0]).assertEqual(1);
      expect(item2[1]).assertEqual(3);

    });

    /**
     * @tc.number    SUB_LIST_TEST03_1400
     * @tc.name      testList03Chapter0014
     * @tc.desc      Verify insert() for nested/TypedArray/large arrays (has test)
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("testList03Chapter0014", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async (): Promise<void> => {
      const TAG = 'testList03Chapter0014';
      console.log(TAG + ' start');

      const level3Arr: number[] = [5, 6];
      const level2Arr1: number[] = [2, 3];
      const level2Arr2: (number | number[])[] = [4, level3Arr];
      const nestedArr: (number | number[] | (number | number[])[])[] = [1, level2Arr1, level2Arr2];

      const typedSubArr: TypedArray[] = [new Int32Array([10, 20]), new Float64Array([3.14, 6.28])];

      const largeArr: number[] = new Array(1000000).fill(1);

      const nestedList: List<(number | number[] | (number | number[])[])[]> = new List<(number |
      number[] | (number | number[])[])[]>();
      nestedList.insert(nestedArr, 0);

      const typedList: List<TypedArray[]> = new List<TypedArray[]>();
      typedList.insert(typedSubArr, 0);

      const largeList: List<number[]> = new List<number[]>();
      largeList.insert(largeArr, 0);

      expect(nestedList.length).assertEqual(1);
      expect(typedList.length).assertEqual(1);
      expect(largeList.length).assertEqual(1);

      const item0 = nestedList.get(0);
      expect(item0![0] as number).assertEqual(1);
      expect((item0![1] as number[])[1]).assertEqual(3);
      expect(((item0![2] as (number | number[])[])[1] as number[])[0]).assertEqual(5);

      const item1 = typedList.get(0);
      expect((item1![0] as Int32Array)[0]).assertEqual(10);
      expect((item1![1] as Float64Array)[1]).assertClose(6.28, 0.01);

      const item2 = largeList.get(0);
      expect(item2!.length).assertEqual(1000000);
      expect(item2![0]).assertEqual(1);
      expect(item2![999999]).assertEqual(1);

    });

    /**
     * @tc.number    SUB_LIST_TEST03_1500
     * @tc.name      testList03Chapter0015
     * @tc.desc      Verify insert() for function/keyword arrays (no Symbol, has test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList03Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testList03Chapter0015';
      console.log(TAG + ' start');

      type MixedElement = (() => string) | string;
      const func: () => string = () => "testResult";
      const mixedTypeArr: MixedElement[] = [func, "0", "NaN", ""];
      const list: List<MixedElement[]> = new List<MixedElement[]>();
      list.insert(mixedTypeArr, 0);
      expect(list.length).assertEqual(1);
      const item0 = list.get(0);
      expect((item0![0] as () => string)()).assertEqual("testResult");
      expect(item0![1] as string).assertEqual("0");
      expect(item0![2] as string).assertEqual("NaN");
      expect(item0![3] as string).assertEqual("");

    });

    /**
     * @tc.number    SUB_LIST_TEST03_1600
     * @tc.name      testList03Chapter0016
     * @tc.desc      It validates that the insert method of the List class behaves correctly across multiple scenarios
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList03Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList03Chapter0016';
      console.log(TAG + ' start');
      const undefinedStr: string = String(undefined);
      const list1: List<string> = new List<string>();
      list1.insert(undefinedStr, 0);
      const nullStr: string = String(null);
      const list2: List<string> = new List<string>();
      list2.insert(nullStr, list2.length);
      const list3: List<string> = new List<string>();
      list3.insert('', 0);
      const specialCharStr1: string = '!"#$%';
      const list4: List<string> = new List<string>();
      list4.insert(specialCharStr1, 0);
      let asciiStr: string = '';
      for (let i = 32; i <= 126; i++) {
        asciiStr += String.fromCharCode(i);
      }
      const list5: List<string> = new List<string>();
      list5.insert(asciiStr, 0);
      expect(list1.length).assertEqual(1);
      expect(list2.length).assertEqual(1);
      expect(list3.length).assertEqual(1);
      expect(list4.length).assertEqual(1);
      expect(list5.length).assertEqual(1);
      expect(list1.get(0)).assertEqual('undefined');
      expect(list2.get(0)).assertEqual('null');
      expect(list3.get(0)).assertEqual('');
      expect(list4.get(0)).assertEqual(specialCharStr1);
      expect(list5.get(0)).assertEqual(asciiStr);
    });

    /**
     * @tc.number    SUB_LIST_TEST03_0017
     * @tc.name      testList03Chapter0017
     * @tc.desc      It validates that the insert method of the List class behaves correctly across multiple scenarios
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList03Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList03Chapter0017';
      console.log(TAG + ' start');
      const specialCharStr2: string = '&\'()';
      const list6: List<string> = new List<string>();
      list6.insert(specialCharStr2, 0);

      const specialCharStr3: string = '*+,-.';
      const list7: List<string> = new List<string>();
      list7.insert(specialCharStr3, 0);

      const specialCharStr4: string = '/:;<=';
      const list8: List<string> = new List<string>();
      list8.insert(specialCharStr4, 0);

      const specialCharStr5: string = '>?@[\\\\';
      const list9: List<string> = new List<string>();
      list9.insert(specialCharStr5, 0);

      const specialCharStr6: string = ']^_`{';
      const list10: List<string> = new List<string>();
      list10.insert(specialCharStr6, 0);

      const specialCharStr7: string = '|}~';
      const list11: List<string> = new List<string>();
      list11.insert(specialCharStr7, 0);

      expect(list6.length).assertEqual(1);
      expect(list7.length).assertEqual(1);
      expect(list8.length).assertEqual(1);
      expect(list9.length).assertEqual(1);
      expect(list10.length).assertEqual(1);
      expect(list11.length).assertEqual(1);

      expect(list6.get(0)).assertEqual(specialCharStr2);
      expect(list7.get(0)).assertEqual(specialCharStr3);
      expect(list8.get(0)).assertEqual(specialCharStr4);
      expect(list9.get(0)).assertEqual(specialCharStr5);
      expect(list10.get(0)).assertEqual(specialCharStr6);
      expect(list11.get(0)).assertEqual(specialCharStr7);
    });

    /**
     * @tc.number    SUB_LIST_TEST03_1800
     * @tc.name      testList03Chapter0018
     * @tc.desc      It validates that the insert method of the List class behaves correctly across multiple scenarios
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList03Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList03Chapter0018';
      console.log(TAG + ' start');
      const doubleSpecialCharStr: string = '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
      const list12: List<string> = new List<string>();
      list12.insert(doubleSpecialCharStr, 0);

      const escapeStrA: string = String.fromCharCode(7);
      const list13: List<string> = new List<string>();
      list13.insert(escapeStrA, 0);

      const escapeStrB: string = String.fromCharCode(8);
      const list14: List<string> = new List<string>();
      list14.insert(escapeStrB, 0);

      const escapeStrF: string = String.fromCharCode(12);
      const list15: List<string> = new List<string>();
      list15.insert(escapeStrF, 0);

      const escapeStrN: string = '\n';
      const list16: List<string> = new List<string>();
      list16.insert(escapeStrN, 0);

      expect(list12.length).assertEqual(1);
      expect(list13.length).assertEqual(1);
      expect(list14.length).assertEqual(1);
      expect(list15.length).assertEqual(1);
      expect(list16.length).assertEqual(1);

      expect(list12.get(0)).assertEqual(doubleSpecialCharStr);
      expect(list13.get(0)).assertEqual(escapeStrA);
      expect(list14.get(0)).assertEqual(escapeStrB);
      expect(list15.get(0)).assertEqual(escapeStrF);
      expect(list16.get(0)).assertEqual(escapeStrN);
    });

    /**
     * @tc.number    SUB_LIST_TEST03_1900
     * @tc.name      testList03Chapter0019
     * @tc.desc      It validates that the insert method of the List class behaves correctly across multiple scenarios
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList03Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList03Chapter0019';
      console.log(TAG + ' start');
      const escapeStrR: string = '\r';
      const list17: List<string> = new List<string>();
      list17.insert(escapeStrR, 0);

      const escapeStrT: string = '\t';
      const list18: List<string> = new List<string>();
      list18.insert(escapeStrT, 0);

      const escapeStrV: string = String.fromCharCode(11);
      const list19: List<string> = new List<string>();
      list19.insert(escapeStrV, 0);

      const escapeStrBackslash: string = '\\';
      const list20: List<string> = new List<string>();
      list20.insert(escapeStrBackslash, 0);

      const escapeStrSingleQuote: string = '\'';
      const list21: List<string> = new List<string>();
      list21.insert(escapeStrSingleQuote, 0);

      expect(list17.length).assertEqual(1);
      expect(list18.length).assertEqual(1);
      expect(list19.length).assertEqual(1);
      expect(list20.length).assertEqual(1);
      expect(list21.length).assertEqual(1);

      expect(list17.get(0)).assertEqual(escapeStrR);
      expect(list18.get(0)).assertEqual(escapeStrT);
      expect(list19.get(0)).assertEqual(escapeStrV);
      expect(list20.get(0)).assertEqual('\\');
      expect(list21.get(0)).assertEqual('\'');
    });

    /**
     * @tc.number    SUB_LIST_TEST03_0020
     * @tc.name      testList03Chapter0020
     * @tc.desc      It validates that the insert method of the List class behaves correctly across multiple scenarios
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList03Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList03Chapter0020';
      console.log(TAG + ' start');
      const escapeStrDoubleQuote: string = '"';
      const list22: List<string> = new List<string>();
      list22.insert(escapeStrDoubleQuote, 0);

      const escapeStrQuestion: string = '?';
      const list23: List<string> = new List<string>();
      list23.insert(escapeStrQuestion, 0);

      const escapeStrNull: string = '\0';
      const list24: List<string> = new List<string>();
      list24.insert(escapeStrNull, 0);

      const escapeStrOctal: string = '\x61';
      const list25: List<string> = new List<string>();
      list25.insert(escapeStrOctal, 0);

      const escapeStrHex: string = '\x61';
      const list26: List<string> = new List<string>();
      list26.insert(escapeStrHex, 0);

      expect(list22.length).assertEqual(1);
      expect(list23.length).assertEqual(1);
      expect(list24.length).assertEqual(1);
      expect(list25.length).assertEqual(1);
      expect(list26.length).assertEqual(1);

      expect(list22.get(0)).assertEqual('"');
      expect(list23.get(0)).assertEqual('?');
      expect(list24.get(0)).assertEqual(escapeStrNull);
      expect(list25.get(0)).assertEqual('a');
      expect(list26.get(0)).assertEqual('a');
    });

    /**
     * @tc.number    SUB_LIST_TEST03_0021
     * @tc.name      testList03Chapter0021
     * @tc.desc      It validates that the insert method of the List class behaves correctly across multiple scenarios
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList03Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList03Chapter0021';
      console.log(TAG + ' start');
      const emoji1: string = '👆';
      const emojiUnicode1: string = '\ud83d\udc46';
      const list27: List<string> = new List<string>();
      list27.insert(emoji1, 0);

      const emoji2: string = '👿';
      const emojiUnicode2: string = '\ud83d\udc7f';
      const list28: List<string> = new List<string>();
      list28.insert(emoji2, 0);

      const emoji3: string = '👀';
      const emojiUnicode3: string = '\ud83d\udc40';
      const list29: List<string> = new List<string>();
      list29.insert(emoji3, 0);

      const emoji4: string = '💯';
      const emojiUnicode4: string = '\ud83d\udcaf';
      const list30: List<string> = new List<string>();
      list30.insert(emoji4, 0);

      const emoji5: string = '🎅';
      const emojiUnicode5: string = '\ud83c\udf85';
      const list31: List<string> = new List<string>();
      list31.insert(emoji5, 0);

      expect(list27.length).assertEqual(1);
      expect(list28.length).assertEqual(1);
      expect(list29.length).assertEqual(1);
      expect(list30.length).assertEqual(1);
      expect(list31.length).assertEqual(1);

      expect(list27.get(0)).assertEqual(emojiUnicode1);
      expect(list28.get(0)).assertEqual(emojiUnicode2);
      expect(list29.get(0)).assertEqual(emojiUnicode3);
      expect(list30.get(0)).assertEqual(emojiUnicode4);
      expect(list31.get(0)).assertEqual(emojiUnicode5);
    });

    /**
     * @tc.number    SUB_LIST_TEST03_0022
     * @tc.name      testList03Chapter0022
     * @tc.desc      It validates that the insert method of the List class behaves correctly across multiple scenarios
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList03Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList03Chapter0022';
      console.log(TAG + ' start');
      const emoji6: string = '🀄';
      const list32: List<string> = new List<string>();
      list32.insert(emoji6, 0);

      const emoji7: string = '🏴';
      const list33: List<string> = new List<string>();
      list33.insert(emoji7, 0);

      const invalidUnicodeStr: string = '\udc04\ud83d\udff4';
      const list34: List<string> = new List<string>();
      list34.insert(invalidUnicodeStr, 0);

      const keywordStr1: string = '0';
      const keywordStr2: string = 'NaN';
      const keywordStr3: string = '';
      const list35_1: List<string> = new List<string>();
      list35_1.insert(keywordStr1, 0);
      const list35_2: List<string> = new List<string>();
      list35_2.insert(keywordStr2, 0);
      const list35_3: List<string> = new List<string>();
      list35_3.insert(keywordStr3, 0);

      const initTreeString = (size: number): string => {
        let ans = '[';
        while (ans.length < size) {
          ans += '{"a":1},';
        }
        ans += '{"a":1}]';
        return ans;
      };
      const treeStr: string = initTreeString(100);
      const list36: List<string> = new List<string>();
      list36.insert(treeStr, 0);
      expect(list32.length).assertEqual(1);
      expect(list33.length).assertEqual(1);
      expect(list34.length).assertEqual(1);
      expect(list35_1.length).assertEqual(1);
      expect(list35_2.length).assertEqual(1);
      expect(list35_3.length).assertEqual(1);
      expect(list36.length).assertEqual(1);
      expect(list32.get(0)).assertEqual(emoji6);
      expect(list33.get(0)).assertEqual(emoji7);
      expect(list34.get(0)).assertEqual(invalidUnicodeStr);
      expect(list35_1.get(0)).assertEqual(keywordStr1);
      expect(list35_2.get(0)).assertEqual(keywordStr2);
      expect(list35_3.get(0)).assertEqual(keywordStr3);
      expect(list36.get(0)).assertEqual(treeStr);
    });

    /**
     * @tc.number    SUB_LIST_TEST03_0023
     * @tc.name      testList03Chapter0023
     * @tc.desc      It validates that the insert method of the List class behaves correctly across multiple scenarios
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList03Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList03Chapter0023';
      console.log(TAG + ' start');
      let str: string = "{k1:value1,k2:value2}";
      let result: string = str.substring(0, str.length - 2);
      for (let i = 0; i < 10; i++) {
        result = result.substring(0, result.length - 1);
      }
      const list37: List<string> = new List<string>();
      list37.insert(result, 0);

      const bigStrLength = 100000000;
      const gcTestStrLength = 50000000;

      const bigStrPlaceholder = 'a';
      const list38: List<string> = new List<string>();
      list38.insert(bigStrPlaceholder, 0);
      expect(list38.size()).assertEqual(1);
      expect(bigStrLength).assertEqual(100000000);
      const gcTestStrPlaceholder = 'a';
      const list39: List<string> = new List<string>();
      list39.insert(gcTestStrPlaceholder, 0);
      expect(list39.size()).assertEqual(1);
      expect(gcTestStrLength).assertEqual(50000000);
      list39.clear();
      expect(list39.isEmpty()).assertTrue();
      expect(list37.length).assertEqual(1);
      expect(list37.get(0)).assertEqual(result);
    });

    /**
     * @tc.number    SUB_LIST_TEST03_0024
     * @tc.name      testList03Chapter0024
     * @tc.desc      It validates that the insert method of the List class behaves correctly across multiple scenarios
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList03Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList03Chapter0024';
      console.log(TAG + ' start');
      const basicValues = [0, NaN, -0, Infinity, -Infinity, undefined] as (number | undefined)[];

      const listConstructor = new List<number | undefined>(basicValues);
      expect(listConstructor.size()).assertEqual(6);
      expect(listConstructor.get(0)).assertEqual(0);
      expect(isNaN(listConstructor.get(1) ?? NaN)).assertTrue();
      expect(listConstructor.get(2)).assertEqual(-0);
      expect(listConstructor.get(3)).assertEqual(Infinity);
      expect(listConstructor.get(4)).assertEqual(-Infinity);
      expect(listConstructor.get(5)).assertEqual(undefined);

      const listInsert = new List<number | undefined>();
      listInsert.insert(undefined, 0);
      listInsert.insert(-Infinity, 1);
      listInsert.insert(Infinity, 2);
      listInsert.insert(-0, 3);
      listInsert.insert(NaN, 4);
      listInsert.insert(0, 5);

      expect(listInsert.size()).assertEqual(6);
      expect(listInsert.get(3)).assertEqual(-0);
      expect(isNaN(listInsert.get(4) ?? NaN)).assertTrue();
      expect(listInsert.get(2)).assertEqual(Infinity);

      const listInsert1 = new List<number>([10]);
      listInsert1.insert(NaN, 1);
      listInsert1.insert(-Infinity, 0);
      listInsert1.insert(Infinity, 2);
      listInsert1.insert(-0, 1);

      expect(listInsert1.size()).assertEqual(5);
      expect(listInsert1.get(0)).assertEqual(-Infinity);
      expect(listInsert1.get(1)).assertEqual(-0);
      expect(isNaN(listInsert1.get(2) ?? NaN)).assertFalse();
      expect(listInsert1.get(3)).assertEqual(Infinity);
    });

    /**
     * @tc.number    SUB_LIST_TEST03_0025
     * @tc.name      testList03Chapter0025
     * @tc.desc      It validates that the insert method of the List class behaves correctly across multiple scenarios
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList03Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList03Chapter0025';
      console.log(TAG + ' start');
      const extremeValues = [
        Number.MAX_VALUE,
        Number.MIN_VALUE,
        Number.EPSILON,
        Number.MAX_SAFE_INTEGER
      ];

      const listConstructor = new List<number>(extremeValues);
      expect(listConstructor.size()).assertEqual(4);
      expect(listConstructor.get(0)).assertEqual(1.7976931348623157e+308);
      expect(listConstructor.get(1)).assertEqual(5e-324);
      expect(listConstructor.get(2)).assertEqual(2.220446049250313e-16);
      expect(listConstructor.get(3)).assertEqual(9007199254740991);

      const listInsert = new List<number>();
      extremeValues.forEach((val, idx) => listInsert.insert(val, idx));
      expect(listInsert.size()).assertEqual(4);
      expect(listInsert.get(0)).assertEqual(Number.MAX_VALUE);
      expect(listInsert.get(3)).assertEqual(Number.MAX_SAFE_INTEGER);

      const listInsert1 = new List<number>([0]);
      listInsert1.insert(Number.MAX_VALUE, 1);
      listInsert1.insert(Number.MIN_VALUE, 0);
      listInsert1.insert(Number.MAX_SAFE_INTEGER, 2);

      expect(listInsert1.size()).assertEqual(4);
      expect(listInsert1.get(0)).assertEqual(Number.MIN_VALUE);
      expect(listInsert1.get(1)).assertEqual(0);
      expect(listInsert1.get(2)).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number    SUB_LIST_TEST03_0026
     * @tc.name      testList03Chapter0026
     * @tc.desc      It validates that the insert method of the List class behaves correctly across multiple scenarios
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList03Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList03Chapter0026';
      console.log(TAG + ' start');
      const precisionValues: NumberPrecisionValues = {
        byte: [-128, 127, -129, 128],
        short: [-32768, 32767, -32769, 32768],
        int: [-2147483648, 2147483647, -2147483649, 2147483648],
        long: [-9223372036854775808n, 9223372036854775807n],
        float: [1.40129846432481707e-45, 3.40282346638528860e+38],
        double: [4.94065645841246544e-324, 1.79769313486231570e+308],
        char: [0, 65535, 65, 97]
      };

      const listByte = new List<number>(precisionValues.byte);
      expect(listByte.size()).assertEqual(4);
      expect(listByte.get(0)).assertEqual(-128);
      expect(listByte.get(2)).assertEqual(-129);

      const listShort = new List<number>(precisionValues.short);
      expect(listShort.get(1)).assertEqual(32767);
      expect(listShort.get(3)).assertEqual(32768);

      const listChar = new List<number>(precisionValues.char);
      expect(String.fromCharCode(listChar.get(2) ?? 0)).assertEqual("A");
      expect(String.fromCharCode(listChar.get(3) ?? 0)).assertEqual("a");

      const listLong = new List<bigint>(precisionValues.long);
      expect(listLong.get(0)).assertEqual(-9223372036854775808n);
      expect(listLong.get(1)).assertEqual(9223372036854775807n);

      const listInsert = new List<number | bigint>();
      const insertValues = [
        precisionValues.byte[0],
        precisionValues.short[1],
        precisionValues.int[0],
        precisionValues.long[1],
        precisionValues.float[1],
        precisionValues.char[1]
      ];
      insertValues.forEach((val, idx) => listInsert.insert(val, idx));

      expect(listInsert.size()).assertEqual(6);
      expect(listInsert.get(0)).assertEqual(-128);
      expect(listInsert.get(3)).assertEqual(9223372036854775807n);
      expect(listInsert.get(4)).assertEqual(3.40282346638528860e+38);

      const listInsert1 = new List<number | bigint>([0]);
      listInsert1.insert(precisionValues.int[1], 1);
      listInsert1.insert(precisionValues.float[0], 0);
      listInsert1.insert(precisionValues.double[1], 2);
      listInsert1.insert(precisionValues.char[2], 1);

      expect(listInsert1.size()).assertEqual(5);
      expect(listInsert1.get(0)).assertEqual(1.40129846432481707e-45);
      expect(String.fromCharCode(listInsert1.get(1) as number)).assertEqual("A");
      expect(listInsert1.get(2)).assertEqual(0);
      expect(listInsert1.get(3)).assertEqual(1.79769313486231570e+308);
    });

    /**
     * @tc.number    SUB_LIST_TEST03_0027
     * @tc.name      testList03Chapter0027
     * @tc.desc      It validates that the insert method of the List class behaves correctly across multiple scenarios
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList03Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList03Chapter0027';
      console.log(TAG + ' start');
      const baseExprValues: NumberBaseExprValues = {
        hex16: 0x0102,
        hex32: 0x01020304,
        octal: 0o3,
        sci1: 1e3,
        sci2: 2.5e-2,
        exponent: 2 ** 3,
        floatHex: 0xcafebabe
      };

      const listConstructor = new List<number>([
        baseExprValues.hex16,
        baseExprValues.hex32,
        baseExprValues.octal,
        baseExprValues.sci1,
        baseExprValues.exponent
      ]);
      expect(listConstructor.size()).assertEqual(5);
      expect(listConstructor.get(0)).assertEqual(258);
      expect(listConstructor.get(1)).assertEqual(16909060);
      expect(listConstructor.get(2)).assertEqual(3);
      expect(listConstructor.get(3)).assertEqual(1000);
      expect(listConstructor.get(4)).assertEqual(8);

      const listInsert = new List<number>();
      const insertValues = [
        baseExprValues.sci2,
        baseExprValues.floatHex,
        baseExprValues.exponent
      ];
      insertValues.forEach((val, idx) => listInsert.insert(val, idx));

      expect(listInsert.size()).assertEqual(3);
      expect(listInsert.get(0)).assertEqual(0.025);
      expect(listInsert.get(1)).assertEqual(3405691582);

      const listInsert1 = new List<number>([100]);
      listInsert1.insert(baseExprValues.hex16, 1);
      listInsert1.insert(baseExprValues.sci1, 0);
      listInsert1.insert(baseExprValues.exponent, 2);

      expect(listInsert1.size()).assertEqual(4);
      expect(listInsert1.get(0)).assertEqual(1000);
      expect(listInsert1.get(1)).assertEqual(100);
      expect(listInsert1.get(2)).assertEqual(8);
    });

    /**
     * @tc.number    SUB_LIST_TEST03_0028
     * @tc.name      testList03Chapter0028
     * @tc.desc      It validates that the insert method of the List class behaves correctly across multiple scenarios
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList03Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList03Chapter0028';
      console.log(TAG + ' start');
      const bigIntValues = [
        BigInt('0xdecafafecacefade'),
        9007199254740991n,
        -9223372036854775808n,
        123.456,
        18446744073709551615n
      ];

      const listConstructor = new List<bigint | number>(bigIntValues);
      expect(listConstructor.size()).assertEqual(5);
      expect(listConstructor.get(0)).assertEqual(BigInt('0xdecafafecacefade'));
      expect(listConstructor.get(1)).assertEqual(9007199254740991n);
      expect(listConstructor.get(3)).assertEqual(123.456);
      expect(listConstructor.get(4)).assertEqual(18446744073709551615n);

      const listInsert = new List<bigint | number>();
      const insertValues = [
        BigInt('0xdecafafecacefade'),
        123.456,
        18446744073709551616n,
        9007199254740991
      ];
      insertValues.forEach((val, idx) => listInsert.insert(val, idx));

      expect(listInsert.size()).assertEqual(4);
      expect(listInsert.get(0)).assertEqual(BigInt('0xdecafafecacefade'));
      expect(listInsert.get(1)).assertEqual(123.456);
      expect(listInsert.get(2)).assertEqual(18446744073709551616n);

      const listInsert1 = new List<bigint | number>([0n]);
      listInsert1.insert(123.456, 1);
      listInsert1.insert(-9223372036854775808n, 0);
      listInsert1.insert(18446744073709551616n, 2);

      expect(listInsert1.size()).assertEqual(4);
      expect(listInsert1.get(0)).assertEqual(-9223372036854775808n);
      expect(listInsert1.get(1)).assertEqual(0n);
      expect(listInsert1.get(2)).assertEqual(18446744073709551616n);
    });

    /**
     * @tc.number    SUB_LIST_TEST03_0029
     * @tc.name      testList03Chapter0029
     * @tc.desc      It validates that the insert method of the List class behaves correctly across multiple scenarios
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList03Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList03Chapter0029';
      console.log(TAG + ' start');
      const basicValues: boolean[] = [true, false];

      const listConstructor = new List<boolean>(basicValues);
      expect(listConstructor.size()).assertEqual(2);
      expect(listConstructor.get(0)).assertEqual(true);
      expect(listConstructor.get(1)).assertEqual(false);
      const listInsert = new List<boolean>();
      listInsert.insert(true, 0);
      listInsert.insert(false, 1);
      expect(listInsert.size()).assertEqual(2);
      expect(listInsert.get(0)).assertEqual(true);
      expect(listInsert.get(1)).assertEqual(false);
      const listInsert1 = new List<boolean>([true]);
      listInsert1.insert(false, 1);
      listInsert1.insert(true, 0);
      listInsert1.insert(false, 2);

      expect(listInsert1.size()).assertEqual(4);
      expect(listInsert1.get(0)).assertEqual(true);
      expect(listInsert1.get(1)).assertEqual(true);
      expect(listInsert1.get(2)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_LIST_TEST03_0030
     * @tc.name      testList03Chapter0030
     * @tc.desc      It validates that the insert method of the List class behaves correctly across multiple scenarios
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList03Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList03Chapter0030';
      console.log(TAG + ' start');
      const falseLikeValues: (number | string | null | undefined | boolean)[] = [0, NaN, "", null, undefined, !'s'];

      const listConstructor = new List<number | string | null | undefined | boolean>(falseLikeValues);
      expect(listConstructor.size()).assertEqual(6);
      expect(Boolean(listConstructor.get(0))).assertEqual(false);
      expect(Boolean(listConstructor.get(1))).assertEqual(false);
      expect(Boolean(listConstructor.get(2))).assertEqual(false);
      expect(Boolean(listConstructor.get(3))).assertEqual(false);
      expect(Boolean(listConstructor.get(4))).assertEqual(false);
      expect(listConstructor.get(5)).assertEqual(false);

      const listInsert = new List<number | string | null | undefined | boolean>();
      falseLikeValues.forEach((val, idx) => listInsert.insert(val, idx));

      expect(listInsert.size()).assertEqual(6);
      expect(Boolean(listInsert.get(0))).assertEqual(false);
      expect(isNaN(listInsert.get(1) as number)).assertTrue()
      expect(listInsert.get(2)).assertEqual("");
      expect(listInsert.get(3)).assertEqual(null);
      expect(listInsert.get(4)).assertEqual(undefined);
      expect(listInsert.get(5)).assertEqual(false);

      const listInsert1 = new List<boolean>([true]);
      listInsert1.insert(Boolean(0), 1);
      listInsert1.insert(Boolean(NaN), 0);
      listInsert1.insert(Boolean(""), 2);
      listInsert1.insert(!'s', 1);

      expect(listInsert1.size()).assertEqual(5);
      expect(Boolean(listInsert1.get(0))).assertEqual(false);
      expect(Boolean(listInsert1.get(1))).assertEqual(false);
      expect(listInsert1.get(2)).assertEqual(true);
      expect(Boolean(listInsert1.get(3))).assertEqual(false);
    });

    /**
     * @tc.number    SUB_LIST_TEST03_0031
     * @tc.name      testList03Chapter0031
     * @tc.desc      It validates that the insert method of the List class behaves correctly across multiple scenarios
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList03Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList03Chapter0031';
      console.log(TAG + ' start');
      const emptyObj: EmptyObject = {};
      const trueLikeValues: (boolean | number | string | EmptyObject | number[])[] = [!0, 1,
        "non-empty", emptyObj, [1]];

      const listConstructor = new List<boolean | number | string | EmptyObject | number[]>(trueLikeValues);
      expect(listConstructor.size()).assertEqual(5);
      expect(listConstructor.get(0)).assertEqual(true);
      expect(Boolean(listConstructor.get(1))).assertEqual(true);
      expect(Boolean(listConstructor.get(2))).assertEqual(true);
      expect(Boolean(listConstructor.get(3))).assertEqual(true);
      expect(Boolean(listConstructor.get(4))).assertEqual(true);

      const listInsert1 = new List<boolean | number | string | EmptyObject | number[]>();
      trueLikeValues.forEach((val, idx) => listInsert1.insert(val, idx));

      expect(listInsert1.size()).assertEqual(5);
      expect(listInsert1.get(0)).assertEqual(true);
      expect(listInsert1.get(1)).assertEqual(1);
      expect(listInsert1.get(2)).assertEqual("non-empty");

      const listInsert = new List<boolean>([false]);
      listInsert.insert(!0, 1);
      listInsert.insert(Boolean(1), 0);
      listInsert.insert(Boolean("non-empty"), 2);

      expect(listInsert.size()).assertEqual(4);
      expect(Boolean(listInsert.get(0))).assertEqual(true);
      expect(listInsert.get(1)).assertEqual(false);
      expect(listInsert.get(2)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_LIST_TEST03_0032
     * @tc.name      testList03Chapter0032
     * @tc.desc      It validates that the insert method of the List class behaves correctly across multiple scenarios
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList03Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList03Chapter0032';
      console.log(TAG + ' start');
      const emptyObj: EmptyObject = {};
      const mixedValues: (boolean | number | string | null | undefined | EmptyObject | number[])[] = [
        true, false, 0, NaN, "", null, undefined, !'s', !0,
        123, "", "test", emptyObj, [1]
      ];

      const listConstructor = new List<boolean | number | string | null | undefined |
      EmptyObject | number[]>(mixedValues);
      expect(listConstructor.size()).assertEqual(14);
      expect(listConstructor.get(0)).assertEqual(true);
      expect(listConstructor.get(1)).assertEqual(false);
      expect(Boolean(listConstructor.get(2))).assertEqual(false);
      expect(isNaN(listConstructor.get(3) as number)).assertTrue();
      expect(listConstructor.get(7)).assertEqual(false);
      expect(listConstructor.get(8)).assertEqual(true);
      expect(Boolean(listConstructor.get(12))).assertEqual(true);

      const listInsert1 = new List<boolean | number | string | null | undefined | EmptyObject | number[]>();
      const insertValues = [true, 0, null, !0, "test", [1, 2]];
      insertValues.forEach((val, idx) => listInsert1.insert(val, idx));

      expect(listInsert1.size()).assertEqual(6);
      expect(listInsert1.get(0)).assertEqual(true);
      expect(Boolean(listInsert1.get(1))).assertEqual(false);
      expect(listInsert1.get(2)).assertEqual(null);
      expect(listInsert1.get(3)).assertEqual(true);
      expect(Boolean(listInsert1.get(5))).assertEqual(true);

      const listInsert = new List<boolean | undefined>([true, false]);
      listInsert.insert(Boolean(NaN), 2);
      listInsert.insert(!0, 0);
      listInsert.insert(undefined, 3);
      listInsert.insert(Boolean("non-empty"), 3);

      expect(listInsert.size()).assertEqual(6);
      expect(listInsert.get(0)).assertEqual(true);
      expect(listInsert.get(1)).assertEqual(true);
      expect(listInsert.get(2)).assertEqual(false);
      expect(Boolean(listInsert.get(3))).assertEqual(true);
      expect(Boolean(listInsert.get(4))).assertEqual(false);
    });

    /**
     * @tc.number    SUB_LIST_TEST03_0033
     * @tc.name      testList03Chapter0033
     * @tc.desc      It validates that the insert method of the List class behaves correctly across multiple scenarios
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList03Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList03Chapter0033';
      console.log(TAG + ' start');
      const normalObj = new NormalObject(1, "test", [1, 2, 3]);
      const nestedObj = new NestedObject(1, new NestedLevel2(2, new NestedLevel3(3)));
      const emptyObj = new EmptyObject();
      const listInsert1 = new List<Object>();
      const insertValues = [emptyObj, nestedObj, normalObj];
      insertValues.forEach((val, idx) => listInsert1.insert(val, idx));
      expect(listInsert1.size()).assertEqual(3);
      expect((listInsert1.get(1) as NestedObject).b.c).assertEqual(2);
      expect(isEmptyObject(listInsert1.get(0) as EmptyObject)).assertTrue();
      const newObj = new NormalObject(4, "new", [4, 5, 6]);
      const listInsert = new List<Object>([normalObj]);
      listInsert.insert(nestedObj, 1);
      listInsert.insert(emptyObj, 0);
      listInsert.insert(newObj, 3);
      expect(listInsert.size()).assertEqual(4);
      expect(isEmptyObject(listInsert.get(0) as EmptyObject)).assertTrue();
      expect((listInsert.get(1) as NormalObject).a).assertEqual(1);
      expect((listInsert.get(2) as NestedObject).b.d.e).assertEqual(3);
      expect((listInsert.get(3) as NormalObject).a).assertEqual(4);
    });
  })
}