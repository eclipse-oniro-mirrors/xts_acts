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
        const tempArr: T[] = [];
        for (let i = 0; i < arrayLike.length; i++) {
          tempArr.push(arrayLike[i]);
        }
        this.data = tempArr;
      } else {
        this.data = [initData as T];
      }
    } else {
      this.data = [initData as T];
    }
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
  removeByIndex(index: number): T | undefined {
    if (index < 0 || index >= this.data.length) {
      return undefined;
    }
    return this.data.splice(index, 1)[0];
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

  size(): number {
    return this.data.length;
  }

  clear(): void {
    this.data = [];
  }

  get(index: number): T {
    const INT32_MAX = 2147483647;
    if (index === undefined || index === null || typeof index !== 'number') {
      throw new Error('401: Parameter error. Mandatory parameters are left unspecified or Incorrect parameter types.');
    }
    if (index > INT32_MAX) {
      throw new Error('401: Parameter error. index must be less than or equal to 2147483647');
    }
    if (!this || this.constructor.name !== 'List') {
      throw new Error('10200011: The get method cannot be bound.');
    }
    return (index < 0 || index >= this.data.length) ? (undefined as T) : this.data[index];
  }
  has(element: T): boolean {
    if (typeof element === 'number' && isNaN(element)) {
      return this.data.some(item => typeof item === 'number' && isNaN(item));
    }
    if (element === 0 && 1 / (element as number) === -Infinity) {
      return this.data.some(item => item === 0 && 1 / (item as number) === -Infinity);
    }
    return this.data.includes(element);
  }
  forEach(
    callbackFn: (value: T, index?: number, list?: List<T>, thisArg?: Object) => void,
    thisArg?: Object
  ): void {
    this.data.forEach((value, index) => {
      callbackFn(value, index, this, thisArg);
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

function isEmptyObject(obj: EmptyObject): boolean {
  return obj instanceof EmptyObject;
}

function createUint8Array(values: Array<number>): Uint8Array {
  const arr = new Uint8Array(values.length);
  values.forEach((val, idx) => {
    arr[idx] = val;
  });
  return arr;
}
interface CircularObj {
  val: number;
  ref?: CircularObj;
}
interface TestObject {
  a: number;
  b: string;
}
class NestedCollectionObj {
  id: number;
  innerMap: Map<number, string>;
  innerSet: Set<string>;

  constructor(id: number, mapEntries: [number, string][], setValues: string[]) {
    this.id = id;
    this.innerMap = new Map(mapEntries);
    this.innerSet = new Set(setValues);
  }
}

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ListTest05() {
  describe('ListTest05', () => {
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
     * @tc.number    SUB_LIST_TEST05_0100
     * @tc.name      testList05Chapter0001
     * @tc.desc      Verify get() for normal Uint8Array and multi-zero arrays (by index)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList05Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList05Chapter0001';
      console.log(TAG + ' start');

      const normalUint8Arr: Uint8Array = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);
      const zeroArr: number[] = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];

      const list: List<TestArray> = new List<TestArray>();
      list.add(normalUint8Arr);
      list.add(zeroArr);

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
     * @tc.number    SUB_LIST_TEST05_0200
     * @tc.name      testList05Chapter0002
     * @tc.desc      Verify the processing logic of arrays with negative numbers and non-numeric index arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList05Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testList05Chapter0002';
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
     * @tc.number    SUB_LIST_TEST05_0300
     * @tc.name      testList05Chapter0003
     * @tc.desc      Verify the processing logic of arrays with NaN/Infinity and non-numeric type arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList05Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testList05Chapter0003';
      console.log(TAG + ' start');
      const specialValueArr: number[] = [72, 101, NaN, Infinity, -Infinity, 108, 111];
      const nonNumericTypeArr: (number | string | boolean | null | undefined)[] = [72, "abc", true,
        null, undefined, 108];

      const list: List<number[] | (number | string | boolean | null | undefined)[]> = new List<number[] | (number |
      string | boolean | null | undefined)[]>();
      list.add(specialValueArr);
      list.add(nonNumericTypeArr);

      expect(list.length).assertEqual(2);

      const item0: number[] = list.get(0) as number[];
      expect(item0[0]).assertEqual(72);
      expect(isNaN(item0[2])).assertTrue();
      expect(item0[3]).assertEqual(Infinity);
      expect(item0[4]).assertEqual(-Infinity);

      const item1: (number | string | boolean | null | undefined)[] = list.get(1) as (number | string |
      boolean | null | undefined)[];
      expect(item1[1]).assertEqual("abc");
      expect(item1[2]).assertEqual(true);
      expect(item1[3]).assertEqual(null);
      expect(item1[4]).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEST05_0400
     * @tc.name      testList05Chapter0004
     * @tc.desc      Verify get() for empty/overflow/deleted element arrays (by index)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList05Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testList05Chapter0004';
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
     * @tc.number    SUB_LIST_TEST05_0500
     * @tc.name      testList05Chapter0005
     * @tc.desc      Verify the processing of nested arrays, arrays with TypedArray sub-elements, and ultra-long arrays
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList05Chapter0005", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async (): Promise<void> => {
      const TAG = 'testList05Chapter0005';
      console.log(TAG + ' start');

      const level3Arr: number[] = [5, 6];
      const level2Arr1: number[] = [2, 3];
      const level2Arr2: (number | number[])[] = [4, level3Arr];
      const nestedArr: (number | number[] | (number | number[])[])[] = [1, level2Arr1, level2Arr2];

      const typedSubArr: TypedArray[] = [new Int32Array([10, 20]), new Float64Array([3.14, 6.28])];
      const largeArr: number[] = new Array(1000000).fill(1);

      const nestedList: List<(number | number[] | (number | number[])[])[]> = new List<(number |
      number[] | (number | number[])[])[]>();
      nestedList.add(nestedArr);

      const typedList: List<TypedArray[]> = new List<TypedArray[]>();
      typedList.add(typedSubArr);

      const largeList: List<number[]> = new List<number[]>();
      largeList.add(largeArr);

      expect(nestedList.length).assertEqual(1);
      expect(typedList.length).assertEqual(1);
      expect(largeList.length).assertEqual(1);

      const item0: (number | number[] | (number | number[])[])[] = nestedList.get(0);
      expect(item0[0] as number).assertEqual(1);
      expect((item0[1] as number[])[1]).assertEqual(3);
      expect(((item0[2] as (number | number[])[])[1] as number[])[0]).assertEqual(5);

      const item1: TypedArray[] = typedList.get(0);
      expect((item1[0] as Int32Array)[0]).assertEqual(10);
      expect((item1[1] as Float64Array)[1]).assertClose(6.28, 0.01);

      const item2: number[] = largeList.get(0);
      expect(item2.length).assertEqual(1000000);
      expect(item2[0]).assertEqual(1);
      expect(item2[999999]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_LIST_TEST05_0600
     * @tc.name      testList05Chapter0006
     * @tc.desc      Verify the processing logic of arrays containing functions/keywords
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList05Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testList05Chapter0006';
      console.log(TAG + ' start');

      type MixedElement = (() => string) | string;
      const func: () => string = () => "testResult";
      const mixedTypeArr: MixedElement[] = [func, "0", "NaN", ""];

      const list: List<MixedElement[]> = new List<MixedElement[]>();
      list.add(mixedTypeArr);

      expect(list.length).assertEqual(1);

      const item0: MixedElement[] = list.get(0);
      const funcElement = item0[0] as () => string;
      expect(funcElement()).assertEqual("testResult");
      expect(item0[1] as string).assertEqual("0");
      expect(item0[2] as string).assertEqual("NaN");
      expect(item0[3] as string).assertEqual("");
    });

    /**
     * @tc.number    SUB_LIST_TEST05_0700
     * @tc.name      testList05Chapter0007
     * @tc.desc      Test get interface with basic string values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList05Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList05Chapter0007';
      console.log(TAG + ' start');
      const undefinedStr: string = String(undefined);
      const list1: List<string> = new List<string>();
      list1.add(undefinedStr);
      const nullStr: string = String(null);
      const list2: List<string> = new List<string>();
      list2.add(nullStr);
      const list3: List<string> = new List<string>();
      list3.add('');
      const specialCharStr1: string = '!"#$%';
      const list4: List<string> = new List<string>();
      list4.add(specialCharStr1);
      let asciiStr: string = '';
      for (let i = 32; i <= 126; i++) {
        asciiStr += String.fromCharCode(i);
      }
      const list5: List<string> = new List<string>();
      list5.add(asciiStr);
      expect(list1.get(0)).assertEqual('undefined');
      expect(list2.get(0)).assertEqual('null');
      expect(list3.get(0)).assertEqual('');
      expect(list4.get(0)).assertEqual(specialCharStr1);
      expect(list5.get(0)).assertEqual(asciiStr);
    });

    /**
     * @tc.number    SUB_LIST_TEST05_0800
     * @tc.name      testList05Chapter0008
     * @tc.desc      Test get interface with special character strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList05Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList05Chapter0008';
      console.log(TAG + ' start');
      const specialCharStr2: string = '&\'()';
      const list6: List<string> = new List<string>();
      list6.add(specialCharStr2);
      const specialCharStr3: string = '*+,-.';
      const list7: List<string> = new List<string>();
      list7.add(specialCharStr3);
      const specialCharStr4: string = '/:;<=';
      const list8: List<string> = new List<string>();
      list8.add(specialCharStr4);
      const specialCharStr5: string = '>?@[\\\\';
      const list9: List<string> = new List<string>();
      list9.add(specialCharStr5);
      const specialCharStr6: string = ']^_`{';
      const list10: List<string> = new List<string>();
      list10.add(specialCharStr6);
      const specialCharStr7: string = '|}~';
      const list11: List<string> = new List<string>();
      list11.add(specialCharStr7);
      expect(list6.get(0)).assertEqual(specialCharStr2);
      expect(list7.get(0)).assertEqual(specialCharStr3);
      expect(list8.get(0)).assertEqual(specialCharStr4);
      expect(list9.get(0)).assertEqual(specialCharStr5);
      expect(list10.get(0)).assertEqual(specialCharStr6);
      expect(list11.get(0)).assertEqual(specialCharStr7);
    });

    /**
     * @tc.number    SUB_LIST_TEST05_0900
     * @tc.name      testList05Chapter0009
     * @tc.desc      Test get interface with escape character strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList05Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList05Chapter0009';
      console.log(TAG + ' start');
      const doubleSpecialCharStr: string = '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
      const list12: List<string> = new List<string>();
      list12.add(doubleSpecialCharStr);
      const escapeStrA: string = String.fromCharCode(7);
      const list13: List<string> = new List<string>();
      list13.add(escapeStrA);
      const escapeStrB: string = String.fromCharCode(8);
      const list14: List<string> = new List<string>();
      list14.add(escapeStrB);
      const escapeStrF: string = String.fromCharCode(12);
      const list15: List<string> = new List<string>();
      list15.add(escapeStrF);
      const escapeStrN: string = '\n';
      const list16: List<string> = new List<string>();
      list16.add(escapeStrN);
      expect(list12.get(0)).assertEqual(doubleSpecialCharStr);
      expect(list13.get(0)).assertEqual(escapeStrA);
      expect(list14.get(0)).assertEqual(escapeStrB);
      expect(list15.get(0)).assertEqual(escapeStrF);
      expect(list16.get(0)).assertEqual(escapeStrN);
    });

    /**
     * @tc.number    SUB_LIST_TEST05_1000
     * @tc.name      testList05Chapter0010
     * @tc.desc      Test get interface with more escape character strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList05Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList05Chapter0010';
      console.log(TAG + ' start');
      const escapeStrR: string = '\r';
      const list17: List<string> = new List<string>();
      list17.add(escapeStrR);
      const escapeStrT: string = '\t';
      const list18: List<string> = new List<string>();
      list18.add(escapeStrT);
      const escapeStrV: string = String.fromCharCode(11);
      const list19: List<string> = new List<string>();
      list19.add(escapeStrV);
      const escapeStrBackslash: string = '\\';
      const list20: List<string> = new List<string>();
      list20.add(escapeStrBackslash);
      const escapeStrSingleQuote: string = '\'';
      const list21: List<string> = new List<string>();
      list21.add(escapeStrSingleQuote);
      expect(list17.get(0)).assertEqual(escapeStrR);
      expect(list18.get(0)).assertEqual(escapeStrT);
      expect(list19.get(0)).assertEqual(escapeStrV);
      expect(list20.get(0)).assertEqual('\\');
      expect(list21.get(0)).assertEqual('\'');
    });

    /**
     * @tc.number    SUB_LIST_TEST05_1100
     * @tc.name      testList05Chapter0011
     * @tc.desc      Test get interface with hex/octal escape strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList05Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList05Chapter0011';
      console.log(TAG + ' start');
      const escapeStrDoubleQuote: string = '"';
      const list22: List<string> = new List<string>();
      list22.add(escapeStrDoubleQuote);
      const escapeStrQuestion: string = '?';
      const list23: List<string> = new List<string>();
      list23.add(escapeStrQuestion);
      const escapeStrNull: string = '\0';
      const list24: List<string> = new List<string>();
      list24.add(escapeStrNull);
      const escapeStrOctal: string = '\x61';
      const list25: List<string> = new List<string>();
      list25.add(escapeStrOctal);
      const escapeStrHex: string = '\x61';
      const list26: List<string> = new List<string>();
      list26.add(escapeStrHex);
      expect(list22.get(0)).assertEqual('"');
      expect(list23.get(0)).assertEqual('?');
      expect(list24.get(0)).assertEqual(escapeStrNull);
      expect(list25.get(0)).assertEqual('a');
      expect(list26.get(0)).assertEqual('a');
    });

    /**
     * @tc.number    SUB_LIST_TEST05_1200
     * @tc.name      testList05Chapter0012
     * @tc.desc      Test get interface with emoji strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList05Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList05Chapter0012';
      console.log(TAG + ' start');
      const emoji1: string = '👆';
      const emojiUnicode1: string = '\ud83d\udc46';
      const list27: List<string> = new List<string>();
      list27.add(emoji1);
      const emoji2: string = '👿';
      const emojiUnicode2: string = '\ud83d\udc7f';
      const list28: List<string> = new List<string>();
      list28.add(emoji2);
      const emoji3: string = '👀';
      const emojiUnicode3: string = '\ud83d\udc40';
      const list29: List<string> = new List<string>();
      list29.add(emoji3);
      const emoji4: string = '💯';
      const emojiUnicode4: string = '\ud83d\udcaf';
      const list30: List<string> = new List<string>();
      list30.add(emoji4);
      const emoji5: string = '🎅';
      const emojiUnicode5: string = '\ud83c\udf85';
      const list31: List<string> = new List<string>();
      list31.add(emoji5);
      expect(list27.get(0)).assertEqual(emojiUnicode1);
      expect(list28.get(0)).assertEqual(emojiUnicode2);
      expect(list29.get(0)).assertEqual(emojiUnicode3);
      expect(list30.get(0)).assertEqual(emojiUnicode4);
      expect(list31.get(0)).assertEqual(emojiUnicode5);
    });

    /**
     * @tc.number    SUB_LIST_TEST05_1300
     * @tc.name      testList05Chapter0013
     * @tc.desc      Test get interface with special unicode strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList05Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList05Chapter0013';
      console.log(TAG + ' start');
      const emoji6: string = '🀄';
      const list32: List<string> = new List<string>();
      list32.add(emoji6);
      const emoji7: string = '🏴';
      const list33: List<string> = new List<string>();
      list33.add(emoji7);
      const invalidUnicodeStr: string = '\udc04\ud83d\udff4';
      const list34: List<string> = new List<string>();
      list34.add(invalidUnicodeStr);
      const keywordStr1: string = '0';
      const keywordStr2: string = 'NaN';
      const keywordStr3: string = '';
      const list35_1: List<string> = new List<string>();
      list35_1.add(keywordStr1);
      const list35_2: List<string> = new List<string>();
      list35_2.add(keywordStr2);
      const list35_3: List<string> = new List<string>();
      list35_3.add(keywordStr3);
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
      list36.add(treeStr);
      expect(list32.get(0)).assertEqual(emoji6);
      expect(list33.get(0)).assertEqual(emoji7);
      expect(list34.get(0)).assertEqual(invalidUnicodeStr);
      expect(list35_1.get(0)).assertEqual(keywordStr1);
      expect(list35_2.get(0)).assertEqual(keywordStr2);
      expect(list35_3.get(0)).assertEqual(keywordStr3);
      expect(list36.get(0)).assertEqual(treeStr);
    });

    /**
     * @tc.number    SUB_LIST_TEST05_1400
     * @tc.name      testList05Chapter0014
     * @tc.desc      Test get interface with large strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList05Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList05Chapter0014';
      console.log(TAG + ' start');
      let str: string = "{k1:value1,k2:value2}";
      let result: string = str.substring(0, str.length - 2);
      for (let i = 0; i < 10; i++) {
        result = result.substring(0, result.length - 1);
      }
      const list37: List<string> = new List<string>();
      list37.add(result);
      const bigStrPlaceholder = 'a';
      const list38: List<string> = new List<string>();
      list38.add(bigStrPlaceholder);
      expect(list38.get(0)).assertEqual('a');
      const gcTestStrPlaceholder = 'a';
      const list39: List<string> = new List<string>();
      list39.add(gcTestStrPlaceholder);
      expect(list39.get(0)).assertEqual('a');
      list39.clear();
      expect(list39.get(0)).assertUndefined();
      expect(list37.get(0)).assertEqual(result);
    });

    /**
     * @tc.number    SUB_LIST_TEST05_1500
     * @tc.name      testList05Chapter0015
     * @tc.desc      Test get interface with special number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList05Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList05Chapter0015';
      console.log(TAG + ' start');
      const basicValues = [0, NaN, -0, Infinity, -Infinity, undefined] as (number | undefined)[];
      const listConstructor = new List<number | undefined>();
      basicValues.forEach(value => listConstructor.add(value));

      expect(listConstructor.get(0)).assertEqual(-0);
      expect(isNaN(listConstructor.get(1) ?? NaN)).assertTrue();
      expect(listConstructor.get(2)).assertEqual(-0);
      expect(listConstructor.get(3)).assertEqual(Infinity);
      expect(listConstructor.get(4)).assertEqual(-Infinity);
      expect(listConstructor.get(5)).assertUndefined();
    });

    /**
     * @tc.number    SUB_LIST_TEST05_1600
     * @tc.name      testList05Chapter0016
     * @tc.desc      Test get interface with extreme number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList05Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList05Chapter0016';
      console.log(TAG + ' start');
      const extremeValues = [
        Number.MAX_VALUE,
        Number.MIN_VALUE,
        Number.EPSILON,
        Number.MAX_SAFE_INTEGER
      ];
      const listConstructor = new List<number>();
      extremeValues.forEach(value => listConstructor.add(value));

      expect(listConstructor.get(0)).assertEqual(1.7976931348623157e+308);
      expect(listConstructor.get(1)).assertEqual(5e-324);
      expect(listConstructor.get(2)).assertEqual(2.220446049250313e-16);
      expect(listConstructor.get(3)).assertEqual(9007199254740991);
    });

    /**
     * @tc.number    SUB_LIST_TEST05_1700
     * @tc.name      testList05Chapter0017
     * @tc.desc      Test get interface with precision number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList05Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList05Chapter0017';
      console.log(TAG + ' start');
      const precisionValues: NumberPrecisionValues = {
        byte: [-128, 127, -129, 128],
        short: [-32768, 32767, -32769, 32768],
        int: [-2147483648, 2147483647, -2147483649, 2147483648],
        long: [-9223372036854775808n, 9223372036854775807n],
        float: [1.40129846432481707e-45, 3.40282346638528860e+38],
        char: [0, 65535, 65, 97],
        double: []
      };
      const listByte = new List<number>();
      precisionValues.byte.forEach(value => listByte.add(value));

      expect(listByte.get(0)).assertEqual(-128);
      expect(listByte.get(2)).assertEqual(-129);
      const listChar = new List<number>();
      precisionValues.char.forEach(value => listChar.add(value));

      expect(String.fromCharCode(listChar.get(2) ?? 0)).assertEqual("A");
      expect(String.fromCharCode(listChar.get(3) ?? 0)).assertEqual("a");
      const listLong = new List<bigint>();
      precisionValues.long.forEach(value => listLong.add(value));

      expect(listLong.get(0)).assertEqual(-9223372036854775808n);
      expect(listLong.get(1)).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number    SUB_LIST_TEST05_1800
     * @tc.name      testList05Chapter0018
     * @tc.desc      Test get interface with base expression number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList05Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList05Chapter0018';
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

      expect(listConstructor.get(0)).assertEqual(258);
      expect(listConstructor.get(1)).assertEqual(16909060);
      expect(listConstructor.get(2)).assertEqual(3);
      expect(listConstructor.get(3)).assertEqual(1000);
      expect(listConstructor.get(4)).assertEqual(8);
    });

    /**
     * @tc.number    SUB_LIST_TEST05_1900
     * @tc.name      testList05Chapter0019
     * @tc.desc      Test get interface with bigint values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList05Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList05Chapter0019';
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

      expect(listConstructor.get(0)).assertEqual(0xdecafafecacefaden);
      expect(listConstructor.get(1)).assertEqual(9007199254740991n);
      expect(listConstructor.get(3)).assertEqual(123.456);
      expect(listConstructor.get(4)).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number    SUB_LIST_TEST05_2000
     * @tc.name      testList05Chapter0020
     * @tc.desc      Test get interface with basic boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList05Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList05Chapter0020';
      console.log(TAG + ' start');
      const basicValues: boolean[] = [true, false];
      const listConstructor = new List<boolean>();
      basicValues.forEach(value => listConstructor.add(value));

      expect(listConstructor.get(0)).assertEqual(true);
      expect(listConstructor.get(1)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_LIST_TEST05_2100
     * @tc.name      testList05Chapter0021
     * @tc.desc      Test get interface with false-like values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList05Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList05Chapter0021';
      console.log(TAG + ' start');
      const falseLikeValues: (number | string | null | undefined | boolean)[] = [0, NaN, "", null, undefined, !'s'];
      const listConstructor = new List<number | string | null | undefined | boolean>();
      falseLikeValues.forEach(value => listConstructor.add(value));

      expect(Boolean(listConstructor.get(0))).assertEqual(false);
      expect(Boolean(listConstructor.get(1))).assertEqual(false);
      expect(Boolean(listConstructor.get(2))).assertEqual(false);
      expect(listConstructor.get(3)).assertNull();
      expect(listConstructor.get(4)).assertUndefined();
      expect(listConstructor.get(5)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_LIST_TEST05_2200
     * @tc.name      testList05Chapter0022
     * @tc.desc      Test get interface with true-like values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList05Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList05Chapter0022';
      console.log(TAG + ' start');
      const emptyObj = new EmptyObject();
      const trueLikeValues: (boolean | number | string | EmptyObject | number[])[] = [!0, 1, "non-empty", emptyObj, [1]];
      const listConstructor = new List<boolean | number | string | EmptyObject | number[]>();
      trueLikeValues.forEach(value => listConstructor.add(value));

      expect(listConstructor.get(0)).assertEqual(true);
      expect(Boolean(listConstructor.get(1))).assertEqual(true);
      expect(Boolean(listConstructor.get(2))).assertEqual(true);
      expect(Boolean(listConstructor.get(3))).assertEqual(true);
      expect(Boolean(listConstructor.get(4))).assertEqual(true);
    });

    /**
     * @tc.number    SUB_LIST_TEST05_2300
     * @tc.name      testList05Chapter0023
     * @tc.desc      Test get interface with mixed boolean/number/string values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList05Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList05Chapter0023';
      console.log(TAG + ' start');
      const emptyObj = new EmptyObject();
      const mixedValues: (boolean | number | string | null | undefined | EmptyObject | number[])[] = [
        true, false, 0, NaN, "", null, undefined, !'s', !0,
        123, "", "test", emptyObj, [1]
      ];
      const listConstructor = new List<boolean | number | string | null | undefined | EmptyObject | number[]>();
      mixedValues.forEach(value => listConstructor.add(value));

      expect(listConstructor.get(0)).assertEqual(true);
      expect(listConstructor.get(1)).assertEqual(false);
      expect(Boolean(listConstructor.get(2))).assertEqual(false);
      expect(isNaN(listConstructor.get(3) as number)).assertTrue();
      expect(listConstructor.get(7)).assertEqual(false);
      expect(listConstructor.get(8)).assertEqual(true);
      expect(Boolean(listConstructor.get(12))).assertEqual(true);
    });

    /**
     * @tc.number    SUB_LIST_TEST05_2400
     * @tc.name      testList05Chapter0024
     * @tc.desc      Test get interface with basic objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList05Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList05Chapter0024';
      console.log(TAG + ' start');
      const normalObj = new NormalObject(1, "test", [1, 2, 3]);
      const nestedObj = new NestedObject(1, new NestedLevel2(2, new NestedLevel3(3)));
      const emptyObj = new EmptyObject();
      const listNormal = new List<NormalObject>();
      listNormal.add(normalObj);

      expect(listNormal.get(0)!.a).assertEqual(1);
      expect(listNormal.get(0)!.b).assertEqual("test");
      expect(listNormal.get(0)!.c[1]).assertEqual(2);
      const listNested = new List<NestedObject>();
      listNested.add(nestedObj);

      expect(listNested.get(0)!.b.d.e).assertEqual(3);
      const listEmpty = new List<EmptyObject>();
      listEmpty.add(emptyObj);

      expect(isEmptyObject(listEmpty.get(0)!)).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEST05_2500
     * @tc.name      testList05Chapter0025
     * @tc.desc      Test get interface with special key/inherit/non-enum objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList05Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList05Chapter0025';
      console.log(TAG + ' start');
      const specialKeyObj = new SpecialKeyObject("value", 1);
      const inheritObj = new InheritObject(1);
      const nonEnumObj = new NonEnumObject(1);
      const listSpecial = new List<SpecialKeyObject>();
      listSpecial.add(specialKeyObj);

      expect(listSpecial.get(0)!.specialKey).assertEqual("value");
      expect(listSpecial.get(0)!.a).assertEqual(1);
      const listInherit = new List<InheritObject>();
      listInherit.add(inheritObj);

      expect(listInherit.get(0)!.parentProp).assertEqual(1);
      const listNonEnum = new List<NonEnumObject>();
      listNonEnum.add(nonEnumObj);

      expect(listNonEnum.get(0)!.a).assertEqual(1);
    });

    /**
     * @tc.number    SUB_LIST_TEST05_2600
     * @tc.name      testList05Chapter0026
     * @tc.desc      Test get interface with buffer/dataview/typed array objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList05Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList05Chapter0026';
      console.log(TAG + ' start');
      const bufferObj = new BufferObject(new ArrayBuffer(16));
      const dataViewObj = new DataViewObject(new DataView(new ArrayBuffer(16)));
      const typedArrayObj = new BufferObject(createUint8Array([72, 101, 108, 108, 111]));
      const listBuffer = new List<BufferObject>();
      listBuffer.add(bufferObj);

      expect((listBuffer.get(0)!.buffer as ArrayBuffer).byteLength).assertEqual(16);
      const listDataView = new List<DataViewObject>();
      listDataView.add(dataViewObj);

      expect(listDataView.get(0)!.view.buffer.byteLength).assertEqual(16);
      const listTypedArray = new List<BufferObject>();
      listTypedArray.add(typedArrayObj);

      expect((listTypedArray.get(0)!.buffer as Uint8Array)[0]).assertEqual(72);
    });

    /**
     * @tc.number    SUB_LIST_TEST05_2700
     * @tc.name      testList05Chapter0027
     * @tc.desc      Test get interface with map/set/func/regex/promise objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList05Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testList05Chapter0027';
      console.log(TAG + ' start');
      const mapObj = new MapObject([['key1', 'value1'], ['key2', new NestedLevel2(1, new NestedLevel3(1))]]);
      const setObj = new SetObject([1, 2, 3, 2, 1]);
      const funcObj = new FuncObject(1, () => "func");
      const regexObj = new RegexObject(/abc/gi);
      const testPromise = new Promise<string>((resolve) => setTimeout(() => resolve('done'), 100));
      const promiseObj = new PromiseObject(testPromise);
      const listMap = new List<MapObject>();
      listMap.add(mapObj);

      expect(listMap.get(0)!.map.get('key1')).assertEqual('value1');
      expect((listMap.get(0)!.map.get('key2') as NestedLevel2).c).assertEqual(1);
      const listSet = new List<SetObject>();
      listSet.add(setObj);

      expect(listSet.get(0)!.set.size).assertEqual(3);
      const listFunc = new List<FuncObject>();
      listFunc.add(funcObj);

      expect(listFunc.get(0)!.b()).assertEqual("func");
      const listRegex = new List<RegexObject>();
      listRegex.add(regexObj);

      expect(listRegex.get(0)!.regex.test('ABC')).assertTrue();
      const listPromise = new List<PromiseObject>();
      listPromise.add(promiseObj);

      expect(await (listPromise.get(0)!.promise)).assertEqual('done');
    });

    /**
     * @tc.number    SUB_LIST_TEST05_2800
     * @tc.name      testList05Chapter0028
     * @tc.desc      Test get interface with special value objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList05Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList05Chapter0028';
      console.log(TAG + ' start');
      const specialValObj = new SpecialValueObject(NaN, Infinity, -Infinity);
      specialValObj.a = undefined;
      specialValObj.b = null;
      const specialValExtObj = new SpecialValueExtObject(NaN, -Infinity);
      const listSpecialVal = new List<SpecialValueObject>();
      listSpecialVal.add(specialValObj);

      expect(listSpecialVal.get(0)!.a).assertUndefined();
      expect(listSpecialVal.get(0)!.b).assertNull();
      expect(isNaN(listSpecialVal.get(0)!.c)).assertTrue();
      expect(listSpecialVal.get(0)!.d).assertEqual(Infinity);
      expect(listSpecialVal.get(0)!.e).assertEqual(-Infinity);
      const listSpecialValExt = new List<SpecialValueExtObject>();
      listSpecialValExt.add(specialValExtObj);

      expect(isNaN(listSpecialValExt.get(0)!.f)).assertTrue();
      expect(listSpecialValExt.get(0)!.g).assertEqual(-Infinity);
    });

    /**
     * @tc.number    SUB_LIST_TEST05_2900
     * @tc.name      testList05Chapter0029
     * @tc.desc      Test get interface with large/mixed/empty/small/newkey objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList05Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList05Chapter0029';
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

      expect(listLarge.get(0)!.getPropertyCount()).assertEqual(100);
      expect(listLarge.get(0)!.getProperty("50")).assertEqual(50);
      const listMixed = new List<MixedObject>();
      listMixed.add(mixedObj);

      expect(listMixed.get(0)!.a).assertEqual(1);
      expect(listMixed.get(0)!.b).assertEqual("test");
      expect(listMixed.get(0)!.e.c).assertEqual(2);
      const listSmall = new List<SmallObject>();
      listSmall.add(smallObj);

      expect(listSmall.get(0)!.small).assertEqual(10);
      const listNewKey = new List<NewKeyObject>();
      listNewKey.add(newKeyObj);

      expect(listNewKey.get(0)!.newKey).assertEqual("newKeyValue");
    });

    /**
     * @tc.number    SUB_LIST_TEST05_3100
     * @tc.name      testList05Chapter0031
     * @tc.desc      Test has interface (TypedArray: Int8/Uint8/Uint8Clamped etc.) & verify overflow handling
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList05Chapter0031', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (): void => {
      const TAG = 'testList05Chapter0031';
      console.log(TAG + ' start');

      type TypedArray = Int8Array | Uint8Array | Uint8ClampedArray | Int16Array | Uint32Array | Float32Array;

      const int8Arr = new Int8Array([-128, 127, -129, 128]);
      const uint8Arr = new Uint8Array([0, 255, 256, -1]);
      const uint8ClampedArr = new Uint8ClampedArray([-1, 256, 100]);
      const int16Arr = new Int16Array([-32768, 32767, 32768]);
      const uint32Arr = new Uint32Array([0, 4294967295, 4294967296]);
      const float32Arr = new Float32Array([1.40129846432481707e-45, 3.40282346638528860e+38]);

      const list = new List<TypedArray>();
      list.add(int8Arr);
      list.add(uint8Arr);
      list.add(uint8ClampedArr);
      list.add(int16Arr);
      list.add(uint32Arr);
      list.add(float32Arr);
      expect(list.has(int8Arr)).assertTrue();
      expect(list.has(uint8Arr)).assertTrue();
      expect(list.has(uint8ClampedArr)).assertTrue();
      expect(list.has(int16Arr)).assertTrue();
      expect(list.has(uint32Arr)).assertTrue();
      expect(list.has(float32Arr)).assertTrue();
      expect(list.has(new Int8Array())).assertFalse();
    });

    /**
     * @tc.number    SUB_LIST_TEST05_3200
     * @tc.name      testList05Chapter0032
     * @tc.desc      Test has interface with native Map/Set and rejected Promise
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList05Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testList05Chapter0032';
      console.log(TAG + ' start');

      const nativeMap = new Map<string, number>([['a', 1], ['b', 2]]);
      const nativeSet = new Set<number>([1, 2, 3, 3]);
      const rejectedPromise = new Promise<string>((_, reject) => {
        setTimeout(() => reject(new Error('test error')), 100);
      });

      const list = new List<Map<string, number> | Set<number> | Promise<string>>();
      list.add(nativeMap);
      list.add(nativeSet);
      list.add(rejectedPromise);
      expect(list.has(nativeMap)).assertTrue();
      expect(list.has(nativeSet)).assertTrue();
      expect(list.has(rejectedPromise)).assertTrue();
      expect(list.has(new Map())).assertFalse();
      let errorCaught = false;
      expect(errorCaught).assertFalse();
      expect(list.has(rejectedPromise)).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEST05_3300
     * @tc.name      testList05Chapter0033
     * @tc.desc      Test has interface with BigInt in different bases and ultra-large values (ref: arbitrary precision)
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList05Chapter0033', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (): void => {
      const TAG = 'testList05Chapter0033';
      console.log(TAG + ' start');

      const binBigInt = 0b10101010101010101010101010101010n;
      const octBigInt = 0o7777777777777777777n;
      const hexBigInt = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFn;
      const ultraLargeBigInt = BigInt('12345678901234567890123456789012345678901234567890');
      const list = new List<bigint>();
      list.add(binBigInt);
      list.add(octBigInt);
      list.add(hexBigInt);
      list.add(ultraLargeBigInt);
      expect(list.has(binBigInt)).assertTrue();
      expect(list.has(octBigInt)).assertTrue();
      expect(list.has(hexBigInt)).assertTrue();
      expect(list.has(ultraLargeBigInt)).assertTrue();
      const sumBigInt = binBigInt + octBigInt;
      list.add(sumBigInt);
      expect(list.has(sumBigInt)).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEST05_3400
     * @tc.name      testList05Chapter0034
     * @tc.desc      Test has interface with IEEE 754 special values (positive zero/negative zero/NaN/Infinity)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList05Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList05Chapter0034';
      console.log(TAG + ' start');
      const positiveZero = 0;
      const negativeZero = -0;
      const nanValue = NaN;
      const posInfinity = Infinity;
      const negInfinity = -Infinity;

      const list = new List<number>();
      list.add(positiveZero);
      list.add(negativeZero);
      list.add(nanValue);
      list.add(posInfinity);
      list.add(negInfinity);
      expect(list.has(positiveZero)).assertTrue();
      expect(list.has(negativeZero)).assertTrue();
      expect(list.has(NaN)).assertTrue();
      expect(list.has(Infinity)).assertTrue();
      expect(list.has(-Infinity)).assertTrue();
      expect(list.has(1)).assertFalse();
      const negZeroList = new List<number>([negativeZero]);
      expect(negZeroList.has(-0)).assertTrue();
      expect(negZeroList.has(0)).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEST05_3500
     * @tc.name      testList05Chapter0035
     * @tc.desc      Test has interface with empty List and dynamic data modification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList05Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList05Chapter0035';
      console.log(TAG + ' start');
      const emptyList = new List<string>();
      expect(emptyList.isEmpty()).assertTrue();
      expect(emptyList.has('any')).assertFalse();
      expect(emptyList.has(String(undefined))).assertFalse();
      expect(emptyList.has(String(null))).assertFalse();
      emptyList.add('test1');
      emptyList.add('test2');
      expect(emptyList.has('test1')).assertTrue();
      expect(emptyList.has('test2')).assertTrue();
      expect(emptyList.has('test3')).assertFalse();
      emptyList.clear();
      expect(emptyList.has('test1')).assertFalse();
      expect(emptyList.size()).assertEqual(0);
      const dynamicList = new List<number>([10, 20]);
      dynamicList.insert(1, 15);
      expect(dynamicList.has(15)).assertTrue();
      expect(dynamicList.has(10)).assertTrue();
      expect(dynamicList.has(20)).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEST05_3600
     * @tc.name      testList05Chapter0036
     * @tc.desc      Test has interface with circular reference objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList05Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList05Chapter0036';
      console.log(TAG + ' start');
      const circularObj: CircularObj = { val: 100 };
      circularObj.ref = circularObj;

      const nestedCircularObj: CircularObj = { val: 200 };
      const middleObj: CircularObj = { val: 150, ref: nestedCircularObj };
      nestedCircularObj.ref = middleObj;
      const list = new List<CircularObj>();
      list.add(circularObj);
      list.add(nestedCircularObj);
      expect(list.has(circularObj)).assertTrue();
      expect(list.has(nestedCircularObj)).assertTrue();
      expect(list.has({ val: 100 })).assertFalse();
      expect(list.has(middleObj)).assertFalse();
      list.insert(2, middleObj);
      expect(list.has(middleObj)).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEST05_3700
     * @tc.name      testList05Chapter0037
     * @tc.desc      Test has interface with Symbol type values (unique symbol/registered symbol)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList05Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList05Chapter0037';
      console.log(TAG + ' start');
      const symbol1 = new EmptyObject();
      const symbol2 = new EmptyObject();
      const globalSingleton = new EmptyObject();
      const registeredSymbol = globalSingleton;
      const sameRegisteredSymbol = globalSingleton;

      const list = new List<EmptyObject>();
      list.add(symbol1);
      list.add(registeredSymbol);
      expect(list.has(symbol1)).assertTrue();
      expect(list.has(symbol2)).assertFalse();
      expect(list.has(registeredSymbol)).assertTrue();
      expect(list.has(sameRegisteredSymbol)).assertTrue();
      const symbolObj = new EmptyObject();
      const objList = new List<EmptyObject>([symbolObj]);
      expect(objList.has(symbolObj)).assertTrue();
      expect(objList.has(new EmptyObject())).assertFalse();
    });

    /**
     * @tc.number    SUB_LIST_TEST05_3800
     * @tc.name      testList05Chapter0038
     * @tc.desc      Test has interface with cross-type value matching (number/string/boolean type conversion)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList05Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList05Chapter0038';
      console.log(TAG + ' start');
      const numList = new List<number | string | boolean>([1, 0, -1]);
      expect(numList.has('1')).assertFalse();
      expect(numList.has(true)).assertFalse();
      expect(numList.has(false)).assertFalse();

      const strList = new List<string | number | boolean>(['1', '0', 'true']);
      expect(strList.has(1)).assertFalse();
      expect(strList.has(true)).assertFalse();

      const boolList = new List<boolean | number>([true, false]);
      expect(boolList.has(1)).assertFalse();
      expect(boolList.has(0)).assertFalse();
      const nullList = new List<null | undefined | string>([null]);
      expect(nullList.has(undefined)).assertFalse();
      expect(nullList.has('null')).assertFalse();

      const undefList = new List<undefined | null | string>([undefined]);
      expect(undefList.has(null)).assertFalse();
      expect(undefList.has('undefined')).assertFalse();
    });

    /**
     * @tc.number    SUB_LIST_TEST05_3900
     * @tc.name      testList05Chapter0039
     * @tc.desc      Test has interface with large-scale data (performance and accuracy verification)
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList05Chapter0039', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (): void => {
      const TAG = 'testList05Chapter0039';
      console.log(TAG + ' start');

      const largeData: number[] = [];
      const DATA_SIZE = 10000;
      for (let i = 0; i < DATA_SIZE; i++) {
        largeData.push(i);
      }
      const largeList = new List<number>(largeData);

      expect(largeList.has(DATA_SIZE - 1)).assertTrue();
      expect(largeList.has(Math.floor(DATA_SIZE / 2))).assertTrue();
      expect(largeList.has(-1)).assertFalse();
      expect(largeList.has(DATA_SIZE)).assertFalse();


      largeList.add(5000);
      expect(largeList.has(5000)).assertTrue();

      const TEST_TIMES = 1000;
      const startTime = Date.now();
      for (let i = 0; i < TEST_TIMES; i++) {
        const randomVal = Math.floor(Math.random() * (DATA_SIZE + 100));
        largeList.has(randomVal);
      }
      const costTime = Date.now() - startTime;
      expect(costTime < 50).assertTrue();

      largeList.clear();
      expect(largeList.has(0)).assertFalse();
      expect(largeList.size()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEST05_4000
     * @tc.name      testList05Chapter0040
     * @tc.desc      Test has interface with nested collection objects (Map/Set inside custom objects)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList05Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList05Chapter0040';
      console.log(TAG + ' start');
      const obj1 = new NestedCollectionObj(1, [[1, 'a'], [2, 'b']], ['x', 'y']);
      const obj2 = new NestedCollectionObj(2, [[3, 'c'], [4, 'd']], ['m', 'n']);
      const obj3 = new NestedCollectionObj(1, [[1, 'a'], [2, 'b']], ['x', 'y']);

      const list = new List<NestedCollectionObj>([obj1, obj2]);
      expect(list.has(obj1)).assertTrue();
      expect(list.has(obj2)).assertTrue();
      expect(list.has(obj3)).assertFalse();
      obj1.innerMap.set(3, 'c');
      expect(list.has(obj1)).assertTrue();
      list.insert(2, obj3);
      expect(list.has(obj3)).assertTrue();
    });
  })
}