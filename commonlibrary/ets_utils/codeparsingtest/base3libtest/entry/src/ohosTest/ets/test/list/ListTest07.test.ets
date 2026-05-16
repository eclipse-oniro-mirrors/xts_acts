import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

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
    }
    else if (typeof initData === 'object') {
      const arrayLike = initData as ArrayLike<T>;
      if (typeof arrayLike.length === 'number') {
        this.data = Array.from(arrayLike);
      } else {
        this.data = [initData as T];
      }
    }
    else {
      this.data = [initData as T];
    }
  }

  isEmpty(): boolean {
    return this.data.length === 0;
  }

  add(item: T): void {
    this.data.push(item);
  }

  insert(index: number, item: T): void {
    if (index < 0 || index >= this.data.length) {
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

  replaceAllElements(
    callbackFn: (value: T, index?: number, list?: List<T>, thisArg?: Object) => T,
    thisArg?: Object
  ): void {
    this.data = this.data.map<T>((value: T, index: number): T => {
      return callbackFn(value, index, this, thisArg);
    });
  }
  getIndexOf(element: T): number {
    if (!this || this.constructor.name !== 'List') {
      throw new Error('10200011: The getIndexOf method cannot be bound.');
    }
    const isEqual = (a: T, b: T): boolean => {
      if (typeof a === 'number' && typeof b === 'number') {
        if (isNaN(a) && isNaN(b)) {
          return true;
        }
        if ((a === 0 && b === 0) && (1 / a !== 1 / b)) {
          return false;
        }
      }
      return a === b;
    };

    for (let i = 0; i < this.data.length; i++) {
      const current = this.data[i];
      if (isEqual(current, element)) {
        return i;
      }
    }
    return -1;
  }
  removeByIndex(index: number): T | undefined {
    if (index < 0 || index >= this.data.length) {
      return undefined;
    }
    return this.data.splice(index, 1)[0];
  }
  equal(obj: Object): boolean {
    if (!(obj instanceof List)) {
      return false;
    }
    const otherList = obj as List<T>;
    if (this.size() !== otherList.size()) {
      return false;
    }
    for (let i = 0; i < this.size(); i++) {
      const thisVal = this.get(i);
      const otherVal = otherList.get(i);
      if (typeof thisVal === 'number' && typeof otherVal === 'number') {
        if (isNaN(thisVal) && isNaN(otherVal)) {
          continue;
        }
      }
      if (thisVal === null && otherVal === null) continue;
      if (thisVal === undefined && otherVal === undefined) continue;
      if (typeof thisVal === 'object' && thisVal !== null &&
        typeof otherVal === 'object' && otherVal !== null) {
        if (Array.isArray(thisVal) && Array.isArray(otherVal)) {
          if (!this.deepEqualArrays(thisVal, otherVal)) {
            return false;
          }
          continue;
        }
        if (thisVal instanceof Date && otherVal instanceof Date) {
          if (thisVal.getTime() !== otherVal.getTime()) {
            return false;
          }
          continue;
        }
        if (thisVal instanceof RegExp && otherVal instanceof RegExp) {
          if (thisVal.source !== otherVal.source || thisVal.flags !== otherVal.flags) {
            return false;
          }
          continue;
        }
        if (thisVal instanceof Map && otherVal instanceof Map) {
          if (!this.deepEqualMaps(thisVal, otherVal)) {
            return false;
          }
          continue;
        }
        if (thisVal instanceof Set && otherVal instanceof Set) {
          if (!this.deepEqualSets(thisVal, otherVal)) {
            return false;
          }
          continue;
        }
        if (thisVal instanceof NormalObject && otherVal instanceof NormalObject) {
          if (thisVal.a !== otherVal.a || thisVal.b !== otherVal.b || !this.deepEqualArrays(thisVal.c, otherVal.c)) {
            return false;
          }
        } else if (thisVal instanceof NestedObject && otherVal instanceof NestedObject) {
          if (thisVal.a !== otherVal.a || !this.deepEqual(thisVal.b, otherVal.b)) {
            return false;
          }
        } else if (thisVal instanceof EmptyObject && otherVal instanceof EmptyObject) {
        } else {
          return false;
        }
        continue;
      }
      if (thisVal !== otherVal) {
        return false;
      }
    }
    return true;
  }

  private deepEqualArrays<T>(arr1: T[], arr2: T[]): boolean {
    if (arr1.length !== arr2.length) return false;
    for (let i = 0; i < arr1.length; i++) {
      if (!this.deepEqual(arr1[i], arr2[i])) {
        return false;
      }
    }
    return true;
  }

  private deepEqualMaps<K, V>(map1: Map<K, V>, map2: Map<K, V>): boolean {
    if (map1.size !== map2.size) return false;
    for (const entry of map1.entries()) {
      const key = entry[0];
      const val = entry[1];
      if (!map2.has(key) || !this.deepEqual(val, map2.get(key))) {
        return false;
      }
    }
    return true;
  }

  private deepEqualSets<T>(set1: Set<T>, set2: Set<T>): boolean {
    if (set1.size !== set2.size) return false;
    for (const val of set1) {
      let found = false;
      for (const val2 of set2) {
        if (this.deepEqual(val, val2)) {
          found = true;
          break;
        }
      }
      if (!found) return false;
    }
    return true;
  }

  private deepEqual<T>(a: T, b: T): boolean {
    if (typeof a === 'number' && typeof b === 'number') {
      if (isNaN(a) && isNaN(b)) return true;
      return a === b;
    }

    if (a === null && b === null) return true;
    if (a === undefined && b === undefined) return true;

    if (typeof a !== typeof b) return false;

    if (typeof a !== 'object' || a === null) {
      return a === b;
    }

    if (Array.isArray(a) && Array.isArray(b)) {
      return this.deepEqualArrays(a, b);
    }

    if (a instanceof Date && b instanceof Date) {
      return a.getTime() === b.getTime();
    }

    if (a instanceof RegExp && b instanceof RegExp) {
      return a.source === b.source && a.flags === b.flags;
    }

    if (a instanceof Map && b instanceof Map) {
      return this.deepEqualMaps(a, b);
    }

    if (a instanceof Set && b instanceof Set) {
      return this.deepEqualSets(a, b);
    }

    if (a instanceof NormalObject && b instanceof NormalObject) {
      return a.a === b.a
        && a.b === b.b
        && this.deepEqualArrays(a.c, b.c);
    }

    if (a instanceof NestedObject && b instanceof NestedObject) {
      return a.a === b.a
        && this.deepEqual(a.b, b.b);
    }

    if (a instanceof NestedLevel2 && b instanceof NestedLevel2) {
      return a.c === b.c
        && this.deepEqual(a.d, b.d);
    }

    if (a instanceof NestedLevel3 && b instanceof NestedLevel3) {
      return a.e === b.e;
    }

    if (a instanceof EmptyObject && b instanceof EmptyObject) {
      return true;
    }

    if (a instanceof SpecialKeyObject && b instanceof SpecialKeyObject) {
      return a.specialKey === b.specialKey
        && a.a === b.a;
    }
    return false;
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

class EmptyObject {
}

class SpecialKeyObject {
  specialKey: string = "";
  a: number = 0;

  constructor(specialKey: string, a: number) {
    this.specialKey = specialKey;
    this.a = a;
  }
}

class InheritObject {
  parentProp: number = 0;

  constructor(parentProp: number) {
    this.parentProp = parentProp;
  }
}

class NonEnumObject {
  a: number = 0;

  constructor(a: number) {
    this.a = a;
  }
}

class BufferObject {
  buffer: ArrayBuffer | Uint8Array | Int16Array = new ArrayBuffer(0);

  constructor(buffer: ArrayBuffer | Uint8Array | Int16Array) {
    this.buffer = buffer;
  }
}

class DataViewObject {
  view: DataView = new DataView(new ArrayBuffer(0));

  constructor(view: DataView) {
    this.view = view;
  }
}

class MapObject {
  map: Map<string, string | NestedLevel2> = new Map();

  constructor(entries: Array<[string, string | NestedLevel2]>) {
    entries.forEach(entry => {
      this.map.set(entry[0], entry[1]);
    });
  }
}

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

class NewKeyObject {
  newKey: string = "";

  constructor(newKey: string) {
    this.newKey = newKey;
  }
}
interface StrObj {
  data: string[];
}

interface GeneratedTypeLiteralInterface_1 {
  a: number;
}

interface GeneratedObjectLiteralInterface_1 {
  data: number[];
}
function createUint8Array(values: Array<number>): Uint8Array {
  const arr = new Uint8Array(values.length);
  values.forEach((val, idx) => {
    arr[idx] = val;
  });
  return arr;
}

interface GeneratedObjectLiteralInterface_2 {
  data: number[];
}

interface GeneratedTypeLiteralInterface_2 {
  a: number;
}

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ListTest07() {
  describe('ListTest07', () => {
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
     * @tc.number    SUB_LIST_TEXT07_0100
     * @tc.name      testList07Chapter0001
     * @tc.desc      List.removeByIndex: remove by index, check length/element correctness
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList07Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList07Chapter0001';
      console.log(TAG + ' start');
      const normalUint8Arr: Uint8Array =
        new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);
      const zeroArr: number[] = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];
      const list: List<TestArray> = new List<TestArray>();
      list.add(normalUint8Arr);
      list.add(zeroArr);
      expect(list.length).assertEqual(2);
      expect(list.get(0) as Uint8Array).assertEqual(normalUint8Arr);
      expect(list.get(1) as number[]).assertEqual(zeroArr);
      const removedItem1: TestArray = list.removeByIndex(0)!;
      expect(removedItem1 as Uint8Array).assertEqual(normalUint8Arr);
      expect(list.length).assertEqual(1);
      expect(list.get(0) as number[]).assertEqual(zeroArr);
      const removedItem2: TestArray = list.removeByIndex(0)!;
      expect(removedItem2 as number[]).assertEqual(zeroArr);
      expect(list.length).assertEqual(0);
      list.add(normalUint8Arr);
      list.add(zeroArr);
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
     * @tc.number    SUB_LIST_TEXT07_0200
     * @tc.name      testList07Chapter0002
     * @tc.desc      List.removeByIndex: arrays with negative numbers/non-numeric indexes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList07Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testList07Chapter0002';
      console.log(TAG + ' start');
      const negativeArr: number[] = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      const uint8NegArr: Uint8Array = new Uint8Array(negativeArr);
      const int8NegArr: Int8Array = new Int8Array(negativeArr);
      const numericArr: number[] = [333];
      const nonNumericMap: Map<string, number> = new Map<string, number>();
      nonNumericMap.set("abc", 111);
      nonNumericMap.set("aaa", 222);
      const list: List<TypedArray | number[]> = new List<TypedArray | number[]>();
      list.add(uint8NegArr);
      list.add(int8NegArr);
      list.add(numericArr);
      expect(list.length).assertEqual(3);
      expect(list.get(0) as Uint8Array).assertEqual(uint8NegArr);
      expect(list.get(1) as Int8Array).assertEqual(int8NegArr);
      expect(list.get(2) as number[]).assertEqual(numericArr);
      const removedItem1: TypedArray | number[] = list.removeByIndex(1)!;
      expect(removedItem1 as Int8Array).assertEqual(int8NegArr);
      expect(list.length).assertEqual(2);
      expect(list.get(0) as Uint8Array).assertEqual(uint8NegArr);
      expect(list.get(1) as number[]).assertEqual(numericArr);
      const removedItem2: TypedArray | number[] = list.removeByIndex(0)!;
      expect(removedItem2 as Uint8Array).assertEqual(uint8NegArr);
      expect(list.length).assertEqual(1);
      expect(list.get(0) as number[]).assertEqual(numericArr);
      const uint8Item: Uint8Array = new Uint8Array(negativeArr);
      expect(uint8Item[6]).assertEqual(145);
      expect(uint8Item[10]).assertEqual(207);
      const int8Item: Int8Array = new Int8Array(negativeArr);
      expect(int8Item[6]).assertEqual(-111);
      expect(int8Item[10]).assertEqual(-49);
      expect(numericArr[0]).assertEqual(333);
      expect(nonNumericMap.get("abc")).assertEqual(111);
      expect(nonNumericMap.get("aaa")).assertEqual(222);
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_0300
     * @tc.name      testList07Chapter0003
     * @tc.desc      List.removeByIndex: arrays with NaN/Infinity/non-numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList07Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testList07Chapter0003';
      console.log(TAG + ' start');
      const specialValueArr: number[] = [72, 101, NaN, Infinity, -Infinity, 108, 111];
      const nonNumericTypeArr: (number | string | boolean | null | undefined)[] = [72, "abc", true, null, undefined, 108];
      const list: List<number[] | (number | string | boolean | null | undefined)[]> = new List<number[] | (number
        | string | boolean | null | undefined)[]>();
      list.add(specialValueArr);
      list.add(nonNumericTypeArr);
      expect(list.length).assertEqual(2);
      const removedItem: number[] | (number | string | boolean | null | undefined)[] = list.removeByIndex(1)!;
      expect(removedItem as (number | string | boolean | null | undefined)[]).assertEqual(nonNumericTypeArr);
      expect(list.length).assertEqual(1);
      expect(list.get(0) as number[]).assertEqual(specialValueArr);
      const item0: number[] = list.get(0) as number[];
      expect(item0[0]).assertEqual(72);
      expect(isNaN(item0[2])).assertTrue();
      expect(item0[3]).assertEqual(Infinity);
      expect(item0[4]).assertEqual(-Infinity);
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_0400
     * @tc.name      testList07Chapter0004
     * @tc.desc      List.removeByIndex: empty arrays/arrays with extreme numeric overflow values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList07Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testList07Chapter0004';
      console.log(TAG + ' start');
      const emptyArr: number[] = [];
      const overflowArr: number[] = [256, 65536, 32768];
      const deletedArr: number[] = [1, 2, 3];
      deletedArr.splice(1, 1);
      const list: List<number[]> = new List<number[]>();
      list.add(emptyArr);
      list.add(overflowArr);
      list.add(deletedArr);
      expect(list.length).assertEqual(3);
      const removedItem1: number[] = list.removeByIndex(0)!;
      expect(removedItem1).assertEqual(emptyArr);
      expect(list.length).assertEqual(2);
      expect(list.get(0) as number[]).assertEqual(overflowArr);
      const removedItem2: number[] = list.removeByIndex(1)!;
      expect(removedItem2).assertEqual(deletedArr);
      expect(list.length).assertEqual(1);
      expect(list.get(0) as number[]).assertEqual(overflowArr);
      const item1: number[] = list.get(0) as number[];
      expect(item1[0]).assertEqual(256);
      expect(item1[1]).assertEqual(65536);
      expect(item1[2]).assertEqual(32768);
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_0500
     * @tc.name      testList07Chapter0005
     * @tc.desc      List.removeByIndex: nested arrays/TypedArray sub-elements/ultra-long arrays
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("testList07Chapter0005", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async (): Promise<void> => {
      const TAG = 'testList07Chapter0005';
      console.log(TAG + ' start');
      const level3Arr: number[] = [5, 6];
      const level2Arr1: number[] = [2, 3];
      const level2Arr2: (number | number[])[] = [4, level3Arr];
      const nestedArr: (number | number[] | (number | number[])[])[] = [1, level2Arr1, level2Arr2];
      const typedSubArr: TypedArray[] = [new Int32Array([10, 20]), new Float64Array([3.14, 6.28])];
      const largeArr: number[] = new Array(1000).fill(1);
      const nestedList: List<(number | number[] | (number | number[])[])[]> = new List<(number | number[] |
      (number | number[])[])[]>();
      nestedList.add(nestedArr);
      expect(nestedList.length).assertEqual(1);
      const typedList: List<TypedArray[]> = new List<TypedArray[]>();
      typedList.add(typedSubArr);
      expect(typedList.length).assertEqual(1);
      const largeList: List<number[]> = new List<number[]>();
      largeList.add(largeArr);
      expect(largeList.length).assertEqual(1);
      const removedNested: (number | number[] | (number | number[])[])[] = nestedList.removeByIndex(0)!;
      expect(removedNested).assertEqual(nestedArr);
      expect(nestedList.length).assertEqual(0);
      const removedTyped: TypedArray[] = typedList.removeByIndex(0)!;
      expect(removedTyped).assertEqual(typedSubArr);
      expect(typedList.length).assertEqual(0);
      const removedLarge: number[] = largeList.removeByIndex(0)!;
      expect(removedLarge).assertEqual(largeArr);
      expect(largeList.length).assertEqual(0);
      nestedList.add(nestedArr);
      const item0: (number | number[] | (number | number[])[])[] = nestedList.get(0)!;
      expect(item0[0] as number).assertEqual(1);
      expect((item0[1] as number[])[1]).assertEqual(3);
      expect(((item0[2] as (number | number[])[])[1] as number[])[0]).assertEqual(5);

      typedList.add(typedSubArr);
      const item1: TypedArray[] = typedList.get(0)!;
      expect((item1[0] as Int32Array)[0]).assertEqual(10);
      expect((item1[1] as Float64Array)[1]).assertClose(6.28, 0.01);

      largeList.add(largeArr);
      const item2: number[] = largeList.get(0)!;
      expect(item2.length).assertEqual(1000);
      expect(item2[0]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_0600
     * @tc.name      testList07Chapter0006
     * @tc.desc      List.removeByIndex: arrays with functions/keywords (Symbol removed)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList07Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testList07Chapter0006';
      console.log(TAG + ' start');
      type MixedElement = (() => string) | string;
      const func: () => string = () => "testResult";
      const mixedTypeArr: MixedElement[] = [func, "0", "NaN", ""];
      const list: List<MixedElement[]> = new List<MixedElement[]>();
      list.add(mixedTypeArr);
      expect(list.length).assertEqual(1);
      const item0: MixedElement[] = list.get(0)!;
      expect((item0[0] as () => string)()).assertEqual("testResult");
      expect(item0[1] as string).assertEqual("0");
      expect(item0[2] as string).assertEqual("NaN");
      expect(item0[3] as string).assertEqual("");
      const removedItem: MixedElement[] = list.removeByIndex(0)!;
      expect(removedItem).assertEqual(mixedTypeArr);
      expect(list.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_0700
     * @tc.name      testList07Chapter0007
     * @tc.desc      List.removeByIndex: remove string elements (basic/special/ASCII)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList07Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList07Chapter0007';
      console.log(TAG + ' start');
      const strList1 = new List<string>(['undefined', 'null', '', '!"#$%']);
      expect(strList1.size()).assertEqual(4);
      const removed1 = strList1.removeByIndex(1);
      expect(removed1).assertEqual('null');
      expect(strList1.size()).assertEqual(3);
      expect(strList1.get(0)).assertEqual('undefined');
      expect(strList1.get(1)).assertEqual('');
      expect(strList1.get(2)).assertEqual('!"#$%');
      const removed2 = strList1.removeByIndex(0);
      expect(removed2).assertEqual('undefined');
      expect(strList1.size()).assertEqual(2);

      const removed3 = strList1.removeByIndex(1);
      expect(removed3).assertEqual('!"#$%');
      expect(strList1.size()).assertEqual(1);
      expect(strList1.get(0)).assertEqual('');
      let asciiStr = '';
      for (let i = 32; i <= 126; i++) {
        asciiStr += String.fromCharCode(i);
      }
      const strList2 = new List<string>(['test', asciiStr, 'end']);
      const removedAscii = strList2.removeByIndex(1);
      expect(removedAscii).assertEqual(asciiStr);
      expect(strList2.get(1)).assertEqual('end');
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_0800
     * @tc.name      testList07Chapter0008
     * @tc.desc      List.removeByIndex: remove strings (special/escape/emoji)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList07Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList07Chapter0008';
      console.log(TAG + ' start');
      const specialStrs = ['&\'()', '*+,-.', '\n', '\r', '\t', '\\', '\''];
      const strList3 = new List<string>(specialStrs);
      expect(strList3.size()).assertEqual(7);
      const removedEscape = strList3.removeByIndex(2);
      expect(removedEscape).assertEqual('\n');
      expect(strList3.get(2)).assertEqual('\r');
      expect(strList3.size()).assertEqual(6);
      const emojiStrs = ['👆', '👿', '👀', '💯', '🎅'];
      const strList4 = new List<string>(emojiStrs);
      const removedEmoji = strList4.removeByIndex(3);
      expect(removedEmoji).assertEqual('💯');
      expect(strList4.get(3)).assertEqual('🎅');
      expect(strList4.size()).assertEqual(4);
      const removedInvalid = strList4.removeByIndex(10);
      expect(removedInvalid).assertEqual(undefined);
      expect(strList4.size()).assertEqual(4);
      const removedNegative = strList4.removeByIndex(-1);
      expect(removedNegative).assertEqual(undefined);
      expect(strList4.size()).assertEqual(4);
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_0900
     * @tc.name      testList07Chapter0009
     * @tc.desc      List.removeByIndex: remove number elements (basic/extreme/precision)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList07Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList07Chapter0009';
      console.log(TAG + ' start');
      const basicNumbers = [0, NaN, -0, Infinity, -Infinity, undefined];
      const numList1 = new List<number | undefined>(basicNumbers);
      expect(numList1.size()).assertEqual(6);
      const removedNaN = numList1.removeByIndex(1);
      expect(isNaN(removedNaN as number)).assertTrue();
      expect(numList1.size()).assertEqual(5);
      expect(numList1.get(1)).assertEqual(-0);
      const extremeValues = [Number.MAX_VALUE, Number.MIN_VALUE, Number.EPSILON, Number.MAX_SAFE_INTEGER];
      const numList2 = new List<number>(extremeValues);
      const removedMax = numList2.removeByIndex(0);
      expect(removedMax).assertEqual(Number.MAX_VALUE);
      expect(numList2.get(0)).assertEqual(Number.MIN_VALUE);
      expect(numList2.size()).assertEqual(3);
      const precisionValues: NumberPrecisionValues = {
        byte: [-128, 127, -129, 128],
        short: [-32768, 32767],
        int: [-2147483648, 2147483647],
        long: [-9223372036854775808n, 9223372036854775807n],
        float: [1.40129846432481707e-45, 3.40282346638528860e+38],
        double: [4.94065645841246544e-324, 1.79769313486231570e+308],
        char: [0, 65535, 65, 97]
      };
      const byteList = new List<number>(precisionValues.byte);
      const removedByte = byteList.removeByIndex(2);
      expect(removedByte).assertEqual(-129);
      expect(byteList.size()).assertEqual(3);

      const longList = new List<bigint>(precisionValues.long);
      const removedLong = longList.removeByIndex(1);
      expect(removedLong).assertEqual(9223372036854775807n);
      expect(longList.get(0)).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_1000
     * @tc.name      testList07Chapter0010
     * @tc.desc      List.removeByIndex: remove BigInt elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList07Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList07Chapter0010';
      console.log(TAG + ' start');

      const bigIntValues = [
        BigInt(0xdecafafecacefade),
        BigInt(9007199254740991n),
        BigInt(-9223372036854775808n),
        BigInt(18446744073709551615n)
      ];
      const bigIntList = new List<bigint>(bigIntValues);
      expect(bigIntList.size()).assertEqual(4);
      const removedBigInt = bigIntList.removeByIndex(2);
      expect(removedBigInt).assertEqual(-9223372036854775808n);
      expect(bigIntList.size()).assertEqual(3);
      expect(bigIntList.get(2)).assertEqual(18446744073709551615n);

      const removedFirst = bigIntList.removeByIndex(0);
      expect(removedFirst).assertEqual(BigInt(0xdecafafecacefade));
      expect(bigIntList.get(0)).assertEqual(9007199254740991n);
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_1100
     * @tc.name      testList07Chapter0011
     * @tc.desc      Test getIndexOf with base number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList07Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList07Chapter0011';
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
      const constructorData = [
        baseExprValues.hex16,
        baseExprValues.hex32,
        baseExprValues.octal,
        baseExprValues.sci1,
        baseExprValues.exponent
      ];
      const listConstructor = new List<number>();
      constructorData.forEach(value => listConstructor.add(value));

      expect(listConstructor.getIndexOf(258)).assertEqual(0);
      expect(listConstructor.getIndexOf(16909060)).assertEqual(1);
      expect(listConstructor.getIndexOf(3)).assertEqual(2);
      expect(listConstructor.getIndexOf(1000)).assertEqual(3);
      expect(listConstructor.getIndexOf(8)).assertEqual(4);
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_1200
     * @tc.name      testList07Chapter0012
     * @tc.desc      Test getIndexOf with bigint values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList07Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList07Chapter0012';
      console.log(TAG + ' start');
      const bigIntValues = [
        0xdecafafecacefaden,
        9007199254740991n,
        -9223372036854775808n,
        123.456,
        18446744073709551615n
      ];
      const listConstructor = new List<bigint | number>();
      bigIntValues.forEach(value => listConstructor.add(value));

      expect(listConstructor.getIndexOf(0xdecafafecacefaden)).assertEqual(0);
      expect(listConstructor.getIndexOf(9007199254740991n)).assertEqual(1);
      expect(listConstructor.getIndexOf(123.456)).assertEqual(3);
      expect(listConstructor.getIndexOf(18446744073709551615n)).assertEqual(4);
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_1300
     * @tc.name      testList07Chapter0013
     * @tc.desc      Test getIndexOf with basic boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList07Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList07Chapter0013';
      console.log(TAG + ' start');
      const basicValues: boolean[] = [true, false];
      const listConstructor = new List<boolean>();
      basicValues.forEach(value => listConstructor.add(value));

      expect(listConstructor.getIndexOf(true)).assertEqual(0);
      expect(listConstructor.getIndexOf(false)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_1400
     * @tc.name      testList07Chapter0014
     * @tc.desc      Test getIndexOf with false-like values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList07Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList07Chapter0014';
      console.log(TAG + ' start');
      const falseLikeValues: (number | string | null | undefined | boolean)[] = [0, NaN, "", null, undefined, !'s'];
      const listConstructor = new List<number | string | null | undefined | boolean>();
      falseLikeValues.forEach(value => listConstructor.add(value));

      expect(listConstructor.getIndexOf(0)).assertEqual(0);
      expect(listConstructor.getIndexOf(NaN)).assertEqual(1);
      expect(listConstructor.getIndexOf("")).assertEqual(2);
      expect(listConstructor.getIndexOf(null)).assertEqual(3);
      expect(listConstructor.getIndexOf(undefined)).assertEqual(4);
      expect(listConstructor.getIndexOf(false)).assertEqual(5);
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_1500
     * @tc.name      testList07Chapter0015
     * @tc.desc      Test getIndexOf with true-like values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList07Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList07Chapter0015';
      console.log(TAG + ' start');
      const emptyObj = new EmptyObject();
      const targetArr = [1];
      const trueLikeValues: (boolean | number | string | EmptyObject | number[])[] = [!0, 1, "non-empty", emptyObj,
        targetArr];
      const listConstructor = new List<boolean | number | string | EmptyObject | number[]>();
      trueLikeValues.forEach(value => listConstructor.add(value));

      expect(listConstructor.getIndexOf(true)).assertEqual(0);
      expect(listConstructor.getIndexOf(1)).assertEqual(1);
      expect(listConstructor.getIndexOf("non-empty")).assertEqual(2);
      expect(listConstructor.getIndexOf(emptyObj)).assertEqual(3);
      expect(listConstructor.getIndexOf(targetArr)).assertEqual(4);
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_1600
     * @tc.name      testList07Chapter0016
     * @tc.desc      Test getIndexOf with mixed boolean/number/string values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList07Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList07Chapter0016';
      console.log(TAG + ' start');
      const emptyObj = new EmptyObject();
      const mixedValues: (boolean | number | string | null | undefined | EmptyObject | number[])[] = [
        true, false, 0, NaN, "", null, undefined, !'s', !0,
        123, "", "test", emptyObj, [1]
      ];
      const listConstructor = new List<boolean | number | string | null | undefined | EmptyObject | number[]>();
      mixedValues.forEach(value => listConstructor.add(value));

      expect(listConstructor.getIndexOf(true)).assertEqual(0);
      expect(listConstructor.getIndexOf(false)).assertEqual(1);
      expect(listConstructor.getIndexOf(0)).assertEqual(2);
      expect(listConstructor.getIndexOf(NaN)).assertEqual(3);
      expect(listConstructor.getIndexOf("")).assertEqual(4);
      expect(listConstructor.getIndexOf(null)).assertEqual(5);
      expect(listConstructor.getIndexOf(undefined)).assertEqual(6);
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_1700
     * @tc.name      testList07Chapter0017
     * @tc.desc      Test getIndexOf with basic objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList07Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList07Chapter0017';
      console.log(TAG + ' start');
      const normalObj = new NormalObject(1, "test", [1, 2, 3]);
      const nestedObj = new NestedObject(1, new NestedLevel2(2, new NestedLevel3(3)));
      const emptyObj = new EmptyObject();
      const listNormal = new List<NormalObject>();
      listNormal.add(normalObj);

      expect(listNormal.getIndexOf(normalObj)).assertEqual(0);
      const listNested = new List<NestedObject>();
      listNested.add(nestedObj);

      expect(listNested.getIndexOf(nestedObj)).assertEqual(0);
      const listEmpty = new List<EmptyObject>();
      listEmpty.add(emptyObj);

      expect(listEmpty.getIndexOf(emptyObj)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_1800
     * @tc.name      testList07Chapter0018
     * @tc.desc      Test getIndexOf with special key/inherit/non-enum objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList07Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList07Chapter0018';
      console.log(TAG + ' start');
      const specialKeyObj = new SpecialKeyObject("value", 1);
      const inheritObj = new InheritObject(1);
      const nonEnumObj = new NonEnumObject(1);
      const listSpecial = new List<SpecialKeyObject>();
      listSpecial.add(specialKeyObj);

      expect(listSpecial.getIndexOf(specialKeyObj)).assertEqual(0);
      const listInherit = new List<InheritObject>();
      listInherit.add(inheritObj);

      expect(listInherit.getIndexOf(inheritObj)).assertEqual(0);
      const listNonEnum = new List<NonEnumObject>();
      listNonEnum.add(nonEnumObj);

      expect(listNonEnum.getIndexOf(nonEnumObj)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_1900
     * @tc.name      testList07Chapter0019
     * @tc.desc      Test getIndexOf with buffer/dataview/typed array objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList07Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList07Chapter0019';
      console.log(TAG + ' start');
      const bufferObj = new BufferObject(new ArrayBuffer(16));
      const dataViewObj = new DataViewObject(new DataView(new ArrayBuffer(16)));
      const typedArrayObj = new BufferObject(createUint8Array([72, 101, 108, 108, 111]));
      const listBuffer = new List<BufferObject>();
      listBuffer.add(bufferObj);

      expect(listBuffer.getIndexOf(bufferObj)).assertEqual(0);
      const listDataView = new List<DataViewObject>();
      listDataView.add(dataViewObj);

      expect(listDataView.getIndexOf(dataViewObj)).assertEqual(0);
      const listTypedArray = new List<BufferObject>();
      listTypedArray.add(typedArrayObj);

      expect(listTypedArray.getIndexOf(typedArrayObj)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_2000
     * @tc.name      testList07Chapter0020
     * @tc.desc      Test getIndexOf with map/set/func/regex/promise objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList07Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testList07Chapter0020';
      console.log(TAG + ' start');
      const mapObj = new MapObject([['key1', 'value1'], ['key2', new NestedLevel2(1, new NestedLevel3(1))]]);
      const setObj = new SetObject([1, 2, 3, 2, 1]);
      const funcObj = new FuncObject(1, () => "func");
      const regexObj = new RegexObject(/abc/gi);
      const testPromise = new Promise<string>((resolve) => setTimeout(() => resolve('done'), 100));
      const promiseObj = new PromiseObject(testPromise);
      const listMap = new List<MapObject>();
      listMap.add(mapObj);

      expect(listMap.getIndexOf(mapObj)).assertEqual(0);
      const listSet = new List<SetObject>();
      listSet.add(setObj);

      expect(listSet.getIndexOf(setObj)).assertEqual(0);
      const listFunc = new List<FuncObject>();
      listFunc.add(funcObj);

      expect(listFunc.getIndexOf(funcObj)).assertEqual(0);
      const listRegex = new List<RegexObject>();
      listRegex.add(regexObj);

      expect(listRegex.getIndexOf(regexObj)).assertEqual(0);
      const listPromise = new List<PromiseObject>();
      listPromise.add(promiseObj);

      expect(listPromise.getIndexOf(promiseObj)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_2100
     * @tc.name      testList07Chapter0021
     * @tc.desc      Test getIndexOf with special value objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList07Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList07Chapter0021';
      console.log(TAG + ' start');
      const specialValObj = new SpecialValueObject(NaN, Infinity, -Infinity);
      specialValObj.a = undefined;
      specialValObj.b = null;
      const specialValExtObj = new SpecialValueExtObject(NaN, -Infinity);
      const listSpecialVal = new List<SpecialValueObject>();
      listSpecialVal.add(specialValObj);

      expect(listSpecialVal.getIndexOf(specialValObj)).assertEqual(0);
      const listSpecialValExt = new List<SpecialValueExtObject>();
      listSpecialValExt.add(specialValExtObj);

      expect(listSpecialValExt.getIndexOf(specialValExtObj)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_2200
     * @tc.name      testList07Chapter0022
     * @tc.desc      Test getIndexOf with large/mixed/empty/small/newkey objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList07Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList07Chapter0022';
      console.log(TAG + ' start');
      const largeObj = new LargeObject(100);
      const mixedObj = new MixedObject(
        1, "test", true, null, new NestedLevel2(2, new NestedLevel3(3)),
        new Map([['k1', 'v1']]), new Set([1,2]), /test/g, new ArrayBuffer(8)
      );
      const smallObj = new SmallObject(10);
      const newKeyObj = new NewKeyObject("newKeyValue");
      const listLarge = new List<LargeObject>();
      listLarge.add(largeObj);

      expect(listLarge.getIndexOf(largeObj)).assertEqual(0);
      const listMixed = new List<MixedObject>();
      listMixed.add(mixedObj);

      expect(listMixed.getIndexOf(mixedObj)).assertEqual(0);
      const listSmall = new List<SmallObject>();
      listSmall.add(smallObj);

      expect(listSmall.getIndexOf(smallObj)).assertEqual(0);
      const listNewKey = new List<NewKeyObject>();
      listNewKey.add(newKeyObj);

      expect(listNewKey.getIndexOf(newKeyObj)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_2300
     * @tc.name      testList07Chapter0023
     * @tc.desc      Test getIndexOf with boundary values & empty list & repeat add
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList07Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList07Chapter0023';
      console.log(TAG + ' start');
      const emptyList = new List<number>();
      expect(emptyList.getIndexOf(0)).assertEqual(-1);
      expect(emptyList.size()).assertEqual(0);

      const repeatValues = [1, 1, 1, null, null, undefined, undefined];
      const repeatList = new List<number | null | undefined>();
      repeatValues.forEach(value => repeatList.add(value));

      expect(repeatList.getIndexOf(1)).assertEqual(0);
      expect(repeatList.getIndexOf(null)).assertEqual(3);
      expect(repeatList.getIndexOf(undefined)).assertEqual(5);

      const bigCountList = new List<number>();
      const bigCountArr: number[] = [];
      for (let i = 0; i < 1000; i++) {
        bigCountArr.push(i);
      }
      bigCountArr.forEach(value => bigCountList.add(value));

      expect(bigCountList.getIndexOf(999)).assertEqual(999);
      bigCountList.clear();
      expect(bigCountList.getIndexOf(999)).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_2400
     * @tc.name      testList07Chapter0024
     * @tc.desc      Test getIndexOf with nested List & multi-type nested data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList07Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList07Chapter0024';
      console.log(TAG + ' start');
      const numList = new List<number>();
      [1,2,3,4,5].forEach(value => numList.add(value));

      const nestedList = new List<List<number>>();
      nestedList.add(numList);

      expect(nestedList.getIndexOf(numList)).assertEqual(0);
      expect(numList.getIndexOf(3)).assertEqual(2);

      const strList = new List<string>();
      ["a", "b", "c"].forEach(value => strList.add(value));

      const mixList = new List<List<number> | List<string>>();
      mixList.add(numList);
      mixList.add(strList);

      expect(mixList.getIndexOf(numList)).assertEqual(0);
      expect(mixList.getIndexOf(strList)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_2500
     * @tc.name      testList07Chapter0025
     * @tc.desc      Verify List.equal: equality of Lists with normal/special values (NaN/Infinity/-0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList07Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList07Chapter0025';
      console.log(TAG + ' start');

      const list1 = new List<number>();
      list1.add(2);
      list1.add(4);
      list1.add(5);

      const list2 = new List<number>();
      list2.add(2);
      list2.add(4);
      list2.add(5);
      expect(list1.equal(list2)).assertTrue();

      const list3 = new List<number>();
      list3.add(2);
      list3.add(4);
      expect(list1.equal(list3)).assertFalse();

      const list4 = new List<number>();
      list4.add(2);
      list4.add(5);
      list4.add(4);
      expect(list1.equal(list4)).assertFalse();

      const list5 = new List<number>();
      list5.add(NaN);
      list5.add(Infinity);
      list5.add(-0);

      const list6 = new List<number>();
      list6.add(NaN);
      list6.add(Infinity);
      list6.add(0);
      expect(list5.equal(list6)).assertTrue();

      const list7 = new List<number>();
      list7.add(NaN);
      list7.add(-Infinity);
      list7.add(0);
      expect(list5.equal(list7)).assertFalse();
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_2600
     * @tc.name      testList07Chapter0026
     * @tc.desc      List.equal: equality of strings (special chars/emoji)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList07Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList07Chapter0026';
      console.log(TAG + ' start');
      const list1 = new List<string>();
      list1.add('test');
      list1.add('');
      list1.add('!@#$%^&*()');

      const list2 = new List<string>();
      list2.add('test');
      list2.add('');
      list2.add('!@#$%^&*()');
      expect(list1.equal(list2)).assertTrue();

      const list3 = new List<string>();
      list3.add('👆');
      list3.add('\n');
      list3.add('\x61');

      const list4 = new List<string>();
      list4.add('\ud83d\udc46');
      list4.add('\n');
      list4.add('a');
      expect(list3.equal(list4)).assertTrue();

      const list5 = new List<string>();
      list5.add('👆');
      list5.add('\r');
      list5.add('a');
      expect(list3.equal(list5)).assertFalse();

      const strObj: StrObj = { data: ['test'] };
      expect(list1.equal(strObj)).assertFalse();
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_2700
     * @tc.name      testList07Chapter0027
     * @tc.desc      List.equal: equality of boolean types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList07Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList07Chapter0027';
      console.log(TAG + ' start');
      const list1 = new List<boolean>();
      list1.add(true);
      list1.add(false);
      list1.add(!!0);
      list1.add(!!1);

      const list2 = new List<boolean>();
      list2.add(true);
      list2.add(false);
      list2.add(false);
      list2.add(true);
      expect(list1.equal(list2)).assertTrue();

      const list3 = new List<boolean>();
      list3.add(true);
      list3.add(true);
      list3.add(false);
      list3.add(true);
      expect(list1.equal(list3)).assertFalse();
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_2800
     * @tc.name      testList07Chapter0028
     * @tc.desc      List.equal: equality of regular/empty objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList07Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList07Chapter0028';
      console.log(TAG + ' start');
      const normalObj1 = new NormalObject(1, "test", [1, 2, 3]);
      const normalObj2 = new NormalObject(1, "test", [1, 2, 3]);
      const normalObj3 = new NormalObject(2, "test", [1, 2, 3]);

      const list1 = new List<NormalObject>();
      list1.add(normalObj1);

      const list2 = new List<NormalObject>();
      list2.add(normalObj2);
      expect(list1.equal(list2)).assertTrue();

      const list3 = new List<NormalObject>();
      list3.add(normalObj3);
      expect(list1.equal(list3)).assertFalse();

      const emptyObj1 = new EmptyObject();
      const emptyObj2 = new EmptyObject();
      const list4 = new List<EmptyObject>();
      list4.add(emptyObj1);

      const list5 = new List<EmptyObject>();
      list5.add(emptyObj2);
      expect(list4.equal(list5)).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_2900
     * @tc.name      testList07Chapter0029
     * @tc.desc      List.equal: equality of nested objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList07Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList07Chapter0029';
      console.log(TAG + ' start');
      const nestedObj1 = new NestedObject(1, new NestedLevel2(2, new NestedLevel3(3)));
      const nestedObj2 = new NestedObject(1, new NestedLevel2(2, new NestedLevel3(3)));
      const nestedObj3 = new NestedObject(1, new NestedLevel2(3, new NestedLevel3(3)));

      const list1 = new List<NestedObject>();
      list1.add(nestedObj1);

      const list2 = new List<NestedObject>();
      list2.add(nestedObj2);
      expect(list1.equal(list2)).assertTrue();

      const list3 = new List<NestedObject>();
      list3.add(nestedObj3);
      expect(list1.equal(list3)).assertFalse();
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_3000
     * @tc.name      testList07Chapter0030
     * @tc.desc      List.equal: equality of Map and Set types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList07Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList07Chapter0030';
      console.log(TAG + ' start');
      const mapObj1 = new MapObject([['key1', 'value1'], ['key2', new NestedLevel2(1, new NestedLevel3(1))]]);
      const mapObj2 = new MapObject([['key1', 'value1'], ['key2', new NestedLevel2(1, new NestedLevel3(1))]]);
      const mapObj3 = new MapObject([['key1', 'value2'], ['key2', new NestedLevel2(1, new NestedLevel3(1))]]);

      const list1 = new List<MapObject>();
      list1.add(mapObj1);

      const list2 = new List<MapObject>();
      list2.add(mapObj2);
      expect(list1.equal(list2)).assertFalse();

      const list3 = new List<MapObject>();
      list3.add(mapObj3);
      expect(list1.equal(list3)).assertFalse();

      const setObj1 = new SetObject([1, 2, 3]);
      const setObj2 = new SetObject([1, 2, 3]);
      const setObj3 = new SetObject([1, 2, 4]);

      const list4 = new List<SetObject>();
      list4.add(setObj1);

      const list5 = new List<SetObject>();
      list5.add(setObj2);
      expect(list4.equal(list5)).assertFalse();

      const list6 = new List<SetObject>();
      list6.add(setObj3);
      expect(list4.equal(list6)).assertFalse();
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_3100
     * @tc.name      testList07Chapter0031
     * @tc.desc      List.equal: equality of objects with undefined/null/NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList07Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList07Chapter0031';
      console.log(TAG + ' start');

      const specialObj1 = new SpecialValueObject(NaN, Infinity, -Infinity);
      specialObj1.a = undefined;
      specialObj1.b = null;

      const specialObj2 = new SpecialValueObject(NaN, Infinity, -Infinity);
      specialObj2.a = undefined;
      specialObj2.b = null;

      const specialObj3 = new SpecialValueObject(1, Infinity, -Infinity);
      specialObj3.a = undefined;
      specialObj3.b = null;

      const list1 = new List<SpecialValueObject>();
      list1.add(specialObj1);

      const list2 = new List<SpecialValueObject>();
      list2.add(specialObj2);
      expect(list1.equal(list2)).assertFalse();

      const list3 = new List<SpecialValueObject>();
      list3.add(specialObj3);
      expect(list1.equal(list3)).assertFalse();
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_3200
     * @tc.name      testList07Chapter0032
     * @tc.desc      List.equal: equality of mixed types (numbers/strings/objects/arrays)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList07Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList07Chapter0032';
      console.log(TAG + ' start');
      const mixedObj1 = new MixedObject(
        123, "test", true, null,
        new NestedLevel2(456, new NestedLevel3(0)),
        new Map([['key', 'val']]),
        new Set([1, 2, 3]),
        /abc/gi,
        new ArrayBuffer(8)
      );

      const mixedObj2 = new MixedObject(
        123, "test", true, null,
        new NestedLevel2(456, new NestedLevel3(0)),
        new Map([['key', 'val']]),
        new Set([1, 2, 3]),
        /abc/gi,
        new ArrayBuffer(8)
      );

      const mixedObj3 = new MixedObject(
        123, "test", true, null,
        new NestedLevel2(456, new NestedLevel3(0)),
        new Map([['key', 'val']]),
        new Set([1, 2, 4]),
        /abc/gi,
        new ArrayBuffer(8)
      );
      const list1 = new List<MixedObject>();
      list1.add(mixedObj1);

      const list2 = new List<MixedObject>();
      list2.add(mixedObj2);
      expect(list1.equal(list2)).assertFalse();

      const list3 = new List<MixedObject>();
      list3.add(mixedObj3);
      expect(list1.equal(list3)).assertFalse();

      type MixedItem = number | string | boolean | number[] | GeneratedTypeLiteralInterface_2;
      interface AObj { a: number }

      const list4 = new List<MixedItem>();
      list4.add(123);
      list4.add('test');
      list4.add(true);
      list4.add([1, 2, 3]);
      list4.add({ a: 1 } as AObj);

      const list5 = new List<MixedItem>();
      list5.add(123);
      list5.add('test');
      list5.add(true);
      list5.add([1, 2, 3]);
      list5.add({ a: 1 } as AObj);
      expect(list4.equal(list5)).assertFalse();

      const list6 = new List<MixedItem>();
      list6.add(123);
      list6.add('test');
      list6.add(true);
      list6.add([1, 2, 4]);
      list6.add({ a: 1 } as AObj);
      expect(list4.equal(list6)).assertFalse();
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_3300
     * @tc.name      testList07Chapter0033
     * @tc.desc      List.equal: equality of large objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList07Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList07Chapter0033';
      console.log(TAG + ' start');
      const largeObj1 = new LargeObject(100);
      const largeObj2 = new LargeObject(100);
      const largeObj3 = new LargeObject(101);

      const list1 = new List<LargeObject>();
      list1.add(largeObj1);

      const list2 = new List<LargeObject>();
      list2.add(largeObj2);
      expect(list1.equal(list2)).assertFalse();

      const list3 = new List<LargeObject>();
      list3.add(largeObj3);
      expect(list1.equal(list3)).assertFalse();
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_3400
     * @tc.name      testList07Chapter0034
     * @tc.desc      List.equal: equality of regex/function/Promise objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList07Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList07Chapter0034';
      console.log(TAG + ' start');
      const regexObj1 = new RegexObject(/abc/gi);
      const regexObj2 = new RegexObject(/abc/gi);
      const regexObj3 = new RegexObject(/def/gi);

      const list1 = new List<RegexObject>();
      list1.add(regexObj1);

      const list2 = new List<RegexObject>();
      list2.add(regexObj2);
      expect(list1.equal(list2)).assertFalse();

      const list3 = new List<RegexObject>();
      list3.add(regexObj3);
      expect(list1.equal(list3)).assertFalse();

      const func1 = () => "func1";
      const func2 = () => "func1";
      const funcObj1 = new FuncObject(1, func1);
      const funcObj2 = new FuncObject(1, func1);
      const funcObj3 = new FuncObject(1, func2);

      const list4 = new List<FuncObject>();
      list4.add(funcObj1);

      const list5 = new List<FuncObject>();
      list5.add(funcObj2);
      expect(list4.equal(list5)).assertFalse();

      const list6 = new List<FuncObject>();
      list6.add(funcObj3);
      expect(list4.equal(list6)).assertFalse();

      const promise1 = Promise.resolve("done");
      const promise2 = Promise.resolve("done");
      const promiseObj1 = new PromiseObject(promise1);
      const promiseObj2 = new PromiseObject(promise1);
      const promiseObj3 = new PromiseObject(promise2);

      const list7 = new List<PromiseObject>();
      list7.add(promiseObj1);

      const list8 = new List<PromiseObject>();
      list8.add(promiseObj2);
      expect(list7.equal(list8)).assertFalse();

      const list9 = new List<PromiseObject>();
      list9.add(promiseObj3);
      expect(list7.equal(list9)).assertFalse();
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_3500
     * @tc.name      testList07Chapter0035
     * @tc.desc      List.equal: equality of List with nested objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList07Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList07Chapter0035';
      console.log(TAG + ' start');
      const nestedLevel3_1 = new NestedLevel3(3);
      const nestedLevel2_1 = new NestedLevel2(2, nestedLevel3_1);
      const nestedObj1 = new NestedObject(1, nestedLevel2_1);

      const nestedLevel3_2 = new NestedLevel3(3);
      const nestedLevel2_2 = new NestedLevel2(2, nestedLevel3_2);
      const nestedObj2 = new NestedObject(1, nestedLevel2_2);

      const nestedLevel3_3 = new NestedLevel3(4);
      const nestedLevel2_3 = new NestedLevel2(2, nestedLevel3_3);
      const nestedObj3 = new NestedObject(1, nestedLevel2_3);

      const list1 = new List<NestedObject>();
      list1.add(nestedObj1);

      const list2 = new List<NestedObject>();
      list2.add(nestedObj2);
      expect(list1.equal(list2)).assertTrue();

      const list3 = new List<NestedObject>();
      list3.add(nestedObj3);
      expect(list1.equal(list3)).assertFalse();

      const nestedLevel3_4 = new NestedLevel3(3);
      const nestedLevel2_4 = new NestedLevel2(5, nestedLevel3_4);
      const nestedObj4 = new NestedObject(1, nestedLevel2_4);

      const list4 = new List<NestedObject>();
      list4.add(nestedObj4);
      expect(list1.equal(list4)).assertFalse();

      const emptyObj1 = new EmptyObject();
      const emptyObj2 = new EmptyObject();

      const list5 = new List<EmptyObject>();
      list5.add(emptyObj1);

      const list6 = new List<EmptyObject>();
      list6.add(emptyObj2);
      expect(list5.equal(list6)).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_3600
     * @tc.name      testList07Chapter0036
     * @tc.desc      List.equal: equality of multi-element lists
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList07Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList07Chapter0036';
      console.log(TAG + ' start');
      const list1 = new List<number>();
      list1.add(1);
      list1.add(2);
      list1.add(3);

      const list2 = new List<number>();
      list2.add(1);
      list2.add(2);
      list2.add(3);
      expect(list1.equal(list2)).assertTrue();

      const list3 = new List<number>();
      list3.add(1);
      list3.add(2);
      list3.add(4);
      expect(list1.equal(list3)).assertFalse();

      const list4 = new List<number>();
      list4.add(1);
      list4.add(2);
      expect(list1.equal(list4)).assertFalse();

      const list5 = new List<string>();
      list5.add("a");
      list5.add("b");
      list5.add("c");

      const list6 = new List<string>();
      list6.add("a");
      list6.add("b");
      list6.add("c");
      expect(list5.equal(list6)).assertTrue();

      const list7 = new List<string>();
      list7.add("a");
      list7.add("B");
      list7.add("c");
      expect(list5.equal(list7)).assertFalse();

      const normalObj1 = new NormalObject(1, "test1", [1, 2]);
      const normalObj2 = new NormalObject(2, "test2", [3, 4]);
      const normalObj3 = new NormalObject(1, "test1", [1, 2]);
      const normalObj4 = new NormalObject(2, "test2", [3, 5]);

      const list07_8 = new List<NormalObject>();
      list07_8.add(normalObj1);
      list07_8.add(normalObj2);

      const list07_9 = new List<NormalObject>();
      list07_9.add(normalObj3);
      list07_9.add(normalObj2);
      expect(list07_8.equal(list07_9)).assertTrue();

      const list10 = new List<NormalObject>();
      list10.add(normalObj1);
      list10.add(normalObj4);
      expect(list07_8.equal(list10)).assertFalse();

      const emptyList1 = new List<number>();
      const emptyList2 = new List<number>();
      const emptyList3 = new List<string>();

      expect(emptyList1.equal(emptyList2)).assertTrue();
      expect(emptyList1.equal(emptyList3)).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEXT07_3700
     * @tc.name      testList07Chapter0037
     * @tc.desc      List.equal: equality in boundary scenarios
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList07Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList07Chapter0037';
      console.log(TAG + ' start');
      const list1 = new List<number>();
      list1.add(1);
      list1.add(2);

      const normalObj = new NormalObject(1, "test", [1, 2]);
      expect(list1.equal(normalObj)).assertFalse();

      const plainObj: GeneratedObjectLiteralInterface_2 = { data: [1, 2] };
      expect(list1.equal(plainObj)).assertFalse();

      expect(list1.equal(list1)).assertTrue();

      const list2 = new List<bigint>();
      list2.add(100n);
      list2.add(200n);

      const list3 = new List<bigint>();
      list3.add(100n);
      list3.add(200n);
      expect(list2.equal(list3)).assertTrue();

      const list4 = new List<bigint>();
      list4.add(100n);
      list4.add(201n);
      expect(list2.equal(list4)).assertFalse();

      const specialNumList1 = new List<number>();
      specialNumList1.add(NaN);
      specialNumList1.add(Infinity);
      specialNumList1.add(-0);

      const specialNumList2 = new List<number>();
      specialNumList2.add(NaN);
      specialNumList2.add(Infinity);
      specialNumList2.add(-0);
      expect(specialNumList1.equal(specialNumList2)).assertTrue();

      const specialNumList3 = new List<number>();
      specialNumList3.add(NaN);
      specialNumList3.add(-Infinity);
      specialNumList3.add(-0);
      expect(specialNumList1.equal(specialNumList3)).assertFalse();

      const mixedValList1 = new List<number | null | undefined>();
      mixedValList1.add(1);
      mixedValList1.add(null);
      mixedValList1.add(undefined);

      const mixedValList2 = new List<number | null | undefined>();
      mixedValList2.add(1);
      mixedValList2.add(null);
      mixedValList2.add(undefined);
      expect(mixedValList1.equal(mixedValList2)).assertTrue();

      const mixedValList3 = new List<number | null | undefined>();
      mixedValList3.add(1);
      mixedValList3.add(undefined);
      mixedValList3.add(null);
      expect(mixedValList1.equal(mixedValList3)).assertFalse();
    });
  })
}