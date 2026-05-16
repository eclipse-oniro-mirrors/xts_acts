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
  sort(comparator: ListComparatorFn<T>): void {
    this.data.sort(comparator);
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

interface TypedArrayLike {
  buffer?: ArrayBuffer;
  byteLength?: number;
  length?: number;
}

const isTypedArray = (value: TestArrayElement): boolean => {
  if (value === null || value === undefined || typeof value !== 'object') {
    return false;
  }
  const obj = value as TypedArrayLike;
  return obj.buffer !== undefined && obj.byteLength !== undefined && obj.length !== undefined;
};

const typedArrayToNumberArray = (typedArr: TypedArray): number[] => {
  const result: number[] = [];
  for (let i = 0; i < typedArr.length; i++) {
    const val = typedArr[i];
    result.push(typeof val === 'bigint' ? Number(val) : (val as number));
  }
  return result;
};

const getFirstValidNumber = (arr: TestArray): number => {
  if (isTypedArray(arr as TestArrayElement)) {
    const numArr = typedArrayToNumberArray(arr as TypedArray);
    for (const val of numArr) {
      if (!Number.isNaN(val)) return val;
    }
    return -Infinity;
  }
  for (const item of arr) {
    if (typeof item === 'number' && !Number.isNaN(item)) {
      return item;
    }
  }
  return -Infinity;
};

const getArrayElementAt = (arr: TestArray, index: number): number => {
  if (isTypedArray(arr as TestArrayElement)) {
    const numArr = typedArrayToNumberArray(arr as TypedArray);
    return index < numArr.length && !Number.isNaN(numArr[index]) ? numArr[index] : -Infinity;
  }
  if (index >= arr.length) return -Infinity;
  const item = arr[index];
  return typeof item === 'number' && !Number.isNaN(item) ? item : -Infinity;
};

const getArrayLength = (arr: TestArray): number => {
  return arr.length;
};

const getNestedDepth = (arr: TestArrayElement[]): number => {
  let maxDepth = 1;
  for (const item of arr) {
    let currentDepth = 1;
    if (Array.isArray(item)) {
      currentDepth = getNestedDepth(item) + 1;
    } else if (isTypedArray(item)) {
      currentDepth = 2;
    }
    maxDepth = Math.max(maxDepth, currentDepth);
  }
  return maxDepth;
};

const compareSpecialValue = (val1: number, val2: number): number => {
  if (Number.isNaN(val1) && !Number.isNaN(val2)) return -1;
  if (!Number.isNaN(val1) && Number.isNaN(val2)) return 1;
  if (Number.isNaN(val1) && Number.isNaN(val2)) return 0;

  if (val1 === -Infinity && val2 !== -Infinity) return -1;
  if (val1 !== -Infinity && val2 === -Infinity) return 1;
  if (val1 === Infinity && val2 !== Infinity) return 1;
  if (val1 !== Infinity && val2 === Infinity) return -1;

  return val1 - val2;
};
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
class NewKeyObject {
  newKey: string = "";
  constructor(newKey: string) {
    this.newKey = newKey;
  }
}

function createUint8Array(values: Array<number>): Uint8Array {
  const arr = new Uint8Array(values.length);
  values.forEach((val, idx) => {
    arr[idx] = val;
  });
  return arr;
}
const UNDEFINED_PLACEHOLDER = '__UNDEFINED__';
type FalseLikeType = number | string | null | boolean;
interface EmojiItem {
  emoji: string;
  unicode: string;
  customOrder: number;
}
type ListComparatorFn<T> = (a: T, b: T) => number;

class EmptyObject {}

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ListTest11() {
  describe('ListTest11', () => {
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
     * @tc.number    SUB_LIST_TEXT11_0100
     * @tc.name      testList11Chapter0001
     * @tc.desc      List.forEach: nested List & multi-type nested data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList11Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList11Chapter0001';
      console.log(TAG + ' start');
      const numList = new List<number>();
      [1,2,3,4,5].forEach(value => numList.add(value));

      const nestedList = new List<List<number>>();
      [numList].forEach(value => nestedList.add(value));

      expect(nestedList.size()).assertEqual(1);
      expect(nestedList.get(0)!.get(2)).assertEqual(3);
      expect(nestedList.get(0)!.size()).assertEqual(5);

      const strList = new List<string>();
      ["a", "b", "c"].forEach(value => strList.add(value));

      const mixList = new List<List<number> | List<string>>();
      [numList, strList].forEach(value => mixList.add(value));

      expect(mixList.size()).assertEqual(2);
      expect((mixList.get(0) as List<number>).get(1)).assertEqual(2);
      expect((mixList.get(1) as List<string>).get(1)).assertEqual("b");

      const obj = new NormalObject(10, "nest", [10,20]);
      const complexList = new List<List<number> | List<string> | NormalObject>();
      [numList, strList, obj].forEach(value => complexList.add(value));

      expect(complexList.size()).assertEqual(3);
      expect((complexList.get(2) as NormalObject).a).assertEqual(10);
      expect((complexList.get(0) as List<number>).get(3)).assertEqual(4);
    });

    /**
     * @tc.number    SUB_LIST_TEXT11_0200
     * @tc.name      testList11Chapter0002
     * @tc.desc      List.sort: array length & first valid number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList11Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList11Chapter0002';
      console.log(TAG + ' start');
      const normalUint8Arr: Uint8Array =
        new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);
      const zeroArr: number[] = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];

      const list: List<TestArray> = new List<TestArray>();
      list.add(zeroArr);
      list.add(normalUint8Arr);
      list.sort((a: TestArray, b: TestArray): number => getArrayLength(a) - getArrayLength(b));
      expect(getArrayLength(list.get(0)!)).assertEqual(14);
      expect(getArrayLength(list.get(1)!)).assertEqual(19);
      list.sort((a: TestArray, b: TestArray): number => {
        const valA = getFirstValidNumber(a);
        const valB = getFirstValidNumber(b);
        return valA - valB;
      });
      expect(getFirstValidNumber(list.get(0)!)).assertEqual(72);
      expect(getFirstValidNumber(list.get(1)!)).assertEqual(72);
    });

    /**
     * @tc.number    SUB_LIST_TEXT11_0300
     * @tc.name      testList11Chapter0003
     * @tc.desc      List.sort: negative numbers & non-numeric index arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList11Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList11Chapter0003';
      console.log(TAG + ' start');
      const negativeArr: number[] = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      const uint8NegArr: Uint8Array = new Uint8Array(negativeArr);
      const int8NegArr: Int8Array = new Int8Array(negativeArr);
      const numericArr: number[] = [333];
      const nonNumericMap: Map<string, number> = new Map<string, number>();
      nonNumericMap.set("abc", 111);
      nonNumericMap.set("aaa", 222);

      const list: List<TypedArray | number[]> = new List<TypedArray | number[]>();
      list.add(numericArr);
      list.add(uint8NegArr);
      list.add(int8NegArr);

      list.sort((a: TypedArray | number[], b: TypedArray | number[]): number => {
        const valA = getArrayElementAt(a as TestArray, 6);
        const valB = getArrayElementAt(b as TestArray, 6);
        return compareSpecialValue(valA, valB);
      });

      expect(getArrayElementAt(list.get(0) as TestArray, 6)).assertEqual(-Infinity);
      expect(getArrayElementAt(list.get(1) as TestArray, 6)).assertEqual(-111);
      expect(getArrayElementAt(list.get(2) as TestArray, 6)).assertEqual(145);

      const sortedInt8Arr = list.get(1) as Int8Array;
      expect(sortedInt8Arr[6]).assertEqual(-111);
      expect(sortedInt8Arr[10]).assertEqual(-49);
      const sortedUint8Arr = list.get(2) as Uint8Array;
      expect(sortedUint8Arr[6]).assertEqual(145);
      expect(sortedUint8Arr[10]).assertEqual(207);
      expect(nonNumericMap.get("abc")).assertEqual(111);
      expect(nonNumericMap.get("aaa")).assertEqual(222);
    });

    /**
     * @tc.number    SUB_LIST_TEXT11_0400
     * @tc.name      testList11Chapter0004
     * @tc.desc      List.sort: NaN/Infinity & non-numeric type arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList11Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList11Chapter0004';
      console.log(TAG + ' start');
      const specialValueArr: number[] = [72, 101, NaN, Infinity, -Infinity, 108, 111];
      const nonNumericTypeArr: (number | string | boolean | null | undefined)[] =
        [72, "abc", true, null, undefined, 108];

      const list: List<number[] | (number | string | boolean | null | undefined)[]> =
        new List<number[] | (number | string | boolean | null | undefined)[]>();
      list.add(specialValueArr);
      list.add(nonNumericTypeArr);

      list.sort((a: number[] | (number | string | boolean | null | undefined)[],
        b: number[] | (number | string | boolean | null | undefined)[]): number => {
        const valA = getArrayElementAt(a as TestArray, 2);
        const valB = getArrayElementAt(b as TestArray, 2);
        return compareSpecialValue(valA, valB);
      });

      const sortedSpecialArr = list.get(0) as number[];
      expect(Number.isNaN(sortedSpecialArr[2])).assertTrue();

      expect(sortedSpecialArr[0]).assertEqual(72);
      expect(sortedSpecialArr[3]).assertEqual(Infinity);
      expect(sortedSpecialArr[4]).assertEqual(-Infinity);

      const sortedNonNumericArr = list.get(1) as (number | string | boolean | null | undefined)[];
      expect(sortedNonNumericArr[1]).assertEqual("abc");
      expect(sortedNonNumericArr[2]).assertEqual(true);
      expect(sortedNonNumericArr[3]).assertEqual(null);
      expect(sortedNonNumericArr[4]).assertEqual(undefined);

    });

    /**
     * @tc.number    SUB_LIST_TEXT11_0500
     * @tc.name      testList11Chapter0005
     * @tc.desc      List.sort: empty arrays & extreme numeric overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList11Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList11Chapter0005';
      console.log(TAG + ' start');
      const emptyArr: number[] = [];
      const overflowArr: number[] = [256, 65536, 32768];
      const deletedArr: number[] = [1, 3];

      const list: List<number[]> = new List<number[]>();
      list.add(emptyArr);
      list.add(overflowArr);
      list.add(deletedArr);

      list.sort((a: number[], b: number[]): number => {
        const valA = a.length > 0 ? a[0] : -Infinity;
        const valB = b.length > 0 ? b[0] : -Infinity;
        return valA - valB;
      });

      expect(list.get(0)!.length).assertEqual(0);
      expect(list.get(1)![0]).assertEqual(1);
      expect(list.get(2)![0]).assertEqual(256);

      expect(list.get(2)![1]).assertEqual(65536);
      expect(list.get(2)![2]).assertEqual(32768);
      expect(list.get(1)!.length).assertEqual(2);
      expect(list.get(1)![1]).assertEqual(3);

    });

    /**
     * @tc.number    SUB_LIST_TEXT11_0600
     * @tc.name      testList11Chapter0006
     * @tc.desc      List.sort: nested arrays & TypedArray sub-element
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testList11Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList11Chapter0006';
      console.log(TAG + ' start');
      const level3Arr: number[] = [5, 6];
      const level2Arr1: number[] = [2, 3];
      const level2Arr2: (number | number[])[] = [4, level3Arr];
      const nestedArr: (number | number[] | (number | number[])[])[] = [1, level2Arr1, level2Arr2];
      const typedSubArr: TypedArray[] = [new Int32Array([10, 20]), new Float64Array([3.14, 6.28])];
      const largeArr: number[] = new Array(1000000).fill(1);
      const smallLargeArr: number[] = new Array(500000).fill(2);

      const nestedList: List<(number | number[] | (number | number[])[])[]> =
        new List<(number | number[] | (number | number[])[])[]>();
      nestedList.add(nestedArr);
      nestedList.add(level2Arr1 as (number | number[] | (number | number[])[])[]);
      nestedList.add(level3Arr as (number | number[] | (number | number[])[])[]);

      nestedList.sort((a: (number | number[] | (number | number[])[])[],
        b: (number | number[] | (number | number[])[])[]): number => {
        return getNestedDepth(a as TestArrayElement[]) - getNestedDepth(b as TestArrayElement[]);
      });

      expect(getNestedDepth(nestedList.get(0) as TestArrayElement[])).assertEqual(1);
      expect(getNestedDepth(nestedList.get(1) as TestArrayElement[])).assertEqual(1);
      expect(getNestedDepth(nestedList.get(2) as TestArrayElement[])).assertEqual(3);

      const typedList: List<TypedArray[]> = new List<TypedArray[]>();
      typedList.add(typedSubArr);

      const largeList: List<number[]> = new List<number[]>();
      largeList.add(smallLargeArr);
      largeList.add(largeArr);

      largeList.sort((a: number[], b: number[]): number => b.length - a.length);
      expect(largeList.get(0)!.length).assertEqual(1000000);
      expect(largeList.get(1)!.length).assertEqual(500000);

      const typedItem = typedList.get(0);
      expect((typedItem![0] as Int32Array)[0]).assertEqual(10);
      expect((typedItem![1] as Float64Array)[1]).assertClose(6.28, 0.01);

    });

    /**
     * @tc.number    SUB_LIST_TEXT11_0700
     * @tc.name      testList11Chapter0007
     * @tc.desc      List.sort: functions/keywords (Symbol removed)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList11Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList11Chapter0007';
      console.log(TAG + ' start');
      type MixedElement = (() => string) | string;
      const func: () => string = () => "testResult";
      const mixedTypeArr1: MixedElement[] = [func, "0", "NaN", ""];
      const mixedTypeArr2: MixedElement[] = ["a", "bb", () => "ccc"];

      const list: List<MixedElement[]> = new List<MixedElement[]>();
      list.add(mixedTypeArr2);
      list.add(mixedTypeArr1);

      list.sort((a: MixedElement[], b: MixedElement[]): number => a.length - b.length);
      expect(list.get(0)!.length).assertEqual(3);
      expect(list.get(1)!.length).assertEqual(4);

      list.sort((a: MixedElement[], b: MixedElement[]): number => {
        const getStrLength = (elem: MixedElement): number => {
          return typeof elem === 'function' ? elem().length : elem.length;
        };
        const lenA = Math.max(...a.map(elem => getStrLength(elem)));
        const lenB = Math.max(...b.map(elem => getStrLength(elem)));
        return lenA - lenB;
      });

      const lenFirst = Math.max(...list.get(0)!.map(elem => typeof elem === 'function' ? elem().length : elem.length));
      const lenSecond = Math.max(...list.get(1)!.map(elem => typeof elem === 'function' ? elem().length : elem.length));
      expect(lenFirst).assertEqual(3);
      expect(lenSecond).assertEqual(10);

      const sortedFuncArr = list.get(1);
      expect((sortedFuncArr![0] as () => string)()).assertEqual("testResult");
      expect(sortedFuncArr![1] as string).assertEqual("0");

    });

    /**
     * @tc.number    SUB_LIST_TEXT11_0800
     * @tc.name      testList11Chapter0008
     * @tc.desc      List.sort: basic string values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList11Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList11Chapter0008';
      console.log(TAG + ' start');

      const undefinedStr: string = String(undefined);
      const nullStr: string = String(null);
      const emptyStr: string = '';
      const specialCharStr1: string = '!"#$%';
      let asciiStr: string = '';
      for (let i = 32; i <= 126; i++) {
        asciiStr += String.fromCharCode(i);
      }
      const testData = [undefinedStr, nullStr, emptyStr, specialCharStr1, asciiStr];

      const list = new List<string>();
      testData.forEach(str => list.add(str));

      const stableComparator: ListComparatorFn<string> = (a, b) => {
        const minLen = Math.min(a.length, b.length);
        for (let i = 0; i < minLen; i++) {
          const codeA = a.charCodeAt(i);
          const codeB = b.charCodeAt(i);
          if (codeA !== codeB) return codeA - codeB;
        }
        return a.length - b.length;
      };

      list.sort(stableComparator);
      expect(list.size()).assertEqual(5);
      expect(list.get(0)).assertEqual(emptyStr);
      expect(list.get(1)).assertEqual(asciiStr);
      expect(list.get(2)).assertEqual(specialCharStr1);
      expect(list.get(3)).assertEqual(nullStr);
      expect(list.get(4)).assertEqual(undefinedStr);
    });

    /**
     * @tc.number    SUB_LIST_TEXT11_0900
     * @tc.name      testList11Chapter0009
     * @tc.desc      List.sort: special character strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList11Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList11Chapter0009';
      console.log(TAG + ' start');
      const specialChars = [
        '|}~', ']^_`{', '>?@[\\\\', '/:;<=', '*+,-.', '&\'()'
      ];
      const expectedOrder = [
        '&\'()', '*+,-.', '/:;<=', '>?@[\\\\', ']^_`{', '|}~'
      ];

      const list = new List<string>();
      specialChars.forEach(str => list.add(str));

      list.sort((a, b) => {
        const minLength = Math.min(a.length, b.length);
        for (let i = 0; i < minLength; i++) {
          const codeA = a.charCodeAt(i);
          const codeB = b.charCodeAt(i);
          if (codeA !== codeB) {
            return codeA - codeB;
          }
        }
        return a.length - b.length;
      });

      expect(list.size()).assertEqual(6);
      expectedOrder.forEach((val, idx) => {
        expect(list.get(idx)).assertEqual(val);
      });
    });

    /**
     * @tc.number    SUB_LIST_TEXT11_1000
     * @tc.name      testList11Chapter0010
     * @tc.desc      List.sort: escape character strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList11Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList11Chapter0010';
      console.log(TAG + ' start');

      const escapeChars = [
        '\n', String.fromCharCode(12), String.fromCharCode(8), String.fromCharCode(7),
        '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~'
      ];

      const expectedOrder = [
        String.fromCharCode(7), String.fromCharCode(8), '\n', String.fromCharCode(12),
        '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~'
      ];

      const list = new List<string>();
      escapeChars.forEach(str => list.add(str));

      list.sort((a, b) => a.charCodeAt(0) - b.charCodeAt(0));

      expect(list.size()).assertEqual(5);
      expectedOrder.forEach((val, idx) => {
        expect(list.get(idx)).assertEqual(val);
      });
    });

    /**
     * @tc.number    SUB_LIST_TEXT11_1100
     * @tc.name      testList11Chapter0011
     * @tc.desc      List.sort: more escape character strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList11Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList11Chapter0011';
      console.log(TAG + ' start');
      const escapeChars = [
        '\\', '\'', '\r', String.fromCharCode(11), '\t'
      ];
      const expectedOrder = [
        '\t', String.fromCharCode(11), '\r', '\'', '\\'
      ];

      const list = new List<string>();
      escapeChars.forEach(str => list.add(str));
      list.sort((a, b) => a.localeCompare(b));

      expect(list.size()).assertEqual(5);
      expectedOrder.forEach((val, idx) => {
        expect(list.get(idx)).assertEqual(val);
      });
    });

    /**
     * @tc.number    SUB_LIST_TEXT11_1200
     * @tc.name      testList11Chapter0012
     * @tc.desc      List.sort: hex/octal escape strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList11Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList11Chapter0012';
      console.log(TAG + ' start');

      const escapeChars = ['\x61', '?', '"', '\0'];
      const expectedOrder = ['\0', '"', '?', 'a'];

      const list = new List<string>();
      escapeChars.forEach(str => list.add(str));

      list.sort((a, b) => a.charCodeAt(0) - b.charCodeAt(0));

      expect(list.size()).assertEqual(4);
      expectedOrder.forEach((val, idx) => {
        expect(list.get(idx)).assertEqual(val);
      });
    });

    /**
     * @tc.number    SUB_LIST_TEXT11_1300
     * @tc.name      testList11Chapter0013
     * @tc.desc      List.sort: emoji strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList11Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList11Chapter0013';
      console.log(TAG + ' start');

      const emojiMap: EmojiItem[] = [
        { emoji: '🎅', unicode: '\ud83c\udf85', customOrder: 0 },
        { emoji: '💯', unicode: '\ud83d\udcaf', customOrder: 1 },
        { emoji: '👀', unicode: '\ud83d\udc40', customOrder: 2 },
        { emoji: '👿', unicode: '\ud83d\udc7f', customOrder: 3 },
        { emoji: '👆', unicode: '\ud83d\udc46', customOrder: 4 }
      ];

      const emojis: string[] = ['🎅', '💯', '👀', '👿', '👆'];

      const sortedEmojis = [...emojis].sort((a, b) => {
        const aItem = emojiMap.find(item => item.emoji === a);
        const bItem = emojiMap.find(item => item.emoji === b);
        const aOrder = aItem ? aItem.customOrder : Number.MAX_SAFE_INTEGER;
        const bOrder = bItem ? bItem.customOrder : Number.MAX_SAFE_INTEGER;
        return aOrder - bOrder;
      });

      const expectedOrder: string[] = ['🎅', '💯', '👀', '👿', '👆'];

      expect(sortedEmojis.length).assertEqual(5);
      sortedEmojis.forEach((actual, idx) => {
        const expected = expectedOrder[idx];
        expect(actual).assertEqual(expected);
      });
    });

    /**
     * @tc.number    SUB_LIST_TEXT11_1400
     * @tc.name      testList11Chapter0014
     * @tc.desc      List.sort: special unicode strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList11Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList11Chapter0014';
      console.log(TAG + ' start');

      const longStr = (() => {
        let ans = '[';
        while (ans.length < 100) {
          ans += '{"a":1},';
        }
        ans += '{"a":1}]';
        return ans;
      })();

      const testData = [
        'NaN', '', '0', '🀄', '🏴', '\udc04\ud83d\udff4', longStr
      ];

      const expectedOrder = [
        '', '0', '\udc04\ud83d\udff4', '🏴', '🀄', 'NaN', longStr
      ];

      const sortWeights = new Map<string, number>();
      expectedOrder.forEach((str, idx) => {
        sortWeights.set(str, idx);
      });

      const customComparator: ListComparatorFn<string> = (a, b) => {
        const weightA = sortWeights.get(a) ?? Infinity;
        const weightB = sortWeights.get(b) ?? Infinity;
        return weightA - weightB;
      };

      const list = new List<string>();
      testData.forEach(str => list.add(str));
      list.sort(customComparator);

      expect(list.size()).assertEqual(7);
      expectedOrder.forEach((val, idx) => {
        const actual = list.get(idx) ?? '';
        expect(actual).assertEqual(val);
      });
    });

    /**
     * @tc.number    SUB_LIST_TEXT11_1500
     * @tc.name      testList11Chapter0015
     * @tc.desc      List.sort: large strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList11Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList11Chapter0015';
      console.log(TAG + ' start');
      let str1: string = "{k1:value1,k2:value2}";
      let result1: string = str1.substring(0, str1.length - 2);
      for (let i = 0; i < 10; i++) {
        result1 = result1.substring(0, result1.length - 1);
      }
      const bigStr = 'a'.repeat(1000);
      const gcTestStr = 'b'.repeat(500);

      const testData = [bigStr, result1, gcTestStr];
      const expectedOrder = [result1, gcTestStr, bigStr];

      const list = new List<string>();
      testData.forEach(str => list.add(str));
      list.sort((a, b) => a.length - b.length || a.localeCompare(b));

      expect(list.size()).assertEqual(3);
      expectedOrder.forEach((val, idx) => {
        expect(list.get(idx)).assertEqual(val);
      });

      list.clear();
      expect(list.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEXT11_1600
     * @tc.name      testList11Chapter0016
     * @tc.desc      List.sort: special number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList11Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList11Chapter0016';
      console.log(TAG + ' start');
      const basicValues = [0, NaN, -0, Infinity, -Infinity, undefined] as (number | undefined)[];

      const numberComparator: ListComparatorFn<number | undefined> = (a, b) => {
        if (a === undefined && b === undefined) return 0;
        if (a === undefined) return 1;
        if (b === undefined) return -1;
        if (isNaN(a) && isNaN(b)) return 0;
        if (isNaN(a)) return 1;
        if (isNaN(b)) return -1;
        return a - b;
      };

      const list1 = new List<number | undefined>();
      basicValues.forEach(val => list1.add(val));
      list1.sort(numberComparator);

      expect(list1.size()).assertEqual(6);
      expect(list1.get(0)).assertEqual(-Infinity);
      expect(list1.get(1)).assertEqual(-0);
      expect(list1.get(2)).assertEqual(0);
      expect(list1.get(3)).assertEqual(Infinity);
      expect(isNaN(list1.get(4) ?? NaN)).assertTrue();
      expect(list1.get(5)).assertEqual(undefined);

      const list2 = new List<number | undefined>();
      list2.add(0);
      list2.add(NaN);
      list2.add(-0);
      list2.add(Infinity);
      list2.add(-Infinity);
      list2.add(undefined);
      list2.sort(numberComparator);

      expect(list2.size()).assertEqual(6);
      expect(list2.get(0)).assertEqual(-Infinity);
      expect(list2.get(3)).assertEqual(Infinity);

      const list3 = new List<number>([10]);
      list3.insert(1, NaN);
      list3.insert(0, -Infinity);
      list3.insert(5, Infinity);
      list3.insert(2, -0);
      list3.sort((a, b) => isNaN(a) ? 1 : isNaN(b) ? -1 : a - b);

      expect(list3.size()).assertEqual(5);
      expect(list3.get(0)).assertEqual(-Infinity);
      expect(list3.get(1)).assertEqual(-0);
      expect(list3.get(2)).assertEqual(10);
      expect(list3.get(3)).assertEqual(Infinity);
      expect(isNaN(list3.get(4) ?? NaN)).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEXT11_1700
     * @tc.name      testList11Chapter0017
     * @tc.desc      List.sort: extreme number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList11Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList11Chapter0017';
      console.log(TAG + ' start');

      const extremeValues = [
        Number.MAX_VALUE,
        Number.MIN_VALUE,
        Number.EPSILON,
        Number.MAX_SAFE_INTEGER
      ];
      const expectedOrder = [
        Number.MIN_VALUE,
        Number.EPSILON,
        Number.MAX_SAFE_INTEGER,
        Number.MAX_VALUE
      ];
      const list1 = new List<number>();
      extremeValues.forEach(val => list1.add(val));
      list1.sort((a, b) => a - b);
      expect(list1.size()).assertEqual(4);
      expectedOrder.forEach((val, idx) => {
        const actual = list1.get(idx);
        expect(actual).assertEqual(val);
      });

      const list2 = new List<number>();
      extremeValues.forEach(val => list2.add(val));
      list2.sort((a, b) => a - b);
      expect(list2.size()).assertEqual(4);
      expect(list2.get(0)).assertEqual(Number.MIN_VALUE);
      expect(list2.get(3)).assertEqual(Number.MAX_VALUE);

      const list3 = new List<number>([0]);
      list3.insert(1, Number.MAX_VALUE);
      list3.insert(0, Number.MIN_VALUE);
      list3.insert(3, Number.MAX_SAFE_INTEGER);
      list3.sort((a, b) => a - b);

      expect(list3.size()).assertEqual(4);
      expect(list3.get(0)).assertEqual(0);
      expect(list3.get(1)).assertEqual(Number.MIN_VALUE);
      expect(list3.get(2)).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(list3.get(3)).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number    SUB_LIST_TEXT11_1800
     * @tc.name      testList11Chapter0018
     * @tc.desc      List.sort: precision number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList11Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList11Chapter0018';
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

      const numComparator: ListComparatorFn<number> = (a, b) => a - b;
      const bigIntComparator: ListComparatorFn<bigint> = (a, b) => a < b ? -1 : a > b ? 1 : 0;

      const listByte = new List<number>();
      precisionValues.byte.forEach(val => listByte.add(val));
      listByte.sort(numComparator);
      expect(listByte.get(0) ?? 0).assertEqual(-129);
      expect(listByte.get(1) ?? 0).assertEqual(-128);
      expect(listByte.get(2) ?? 0).assertEqual(127);
      expect(listByte.get(3) ?? 0).assertEqual(128);

      const listShort = new List<number>();
      precisionValues.short.forEach(val => listShort.add(val));
      listShort.sort(numComparator);
      expect(listShort.get(0) ?? 0).assertEqual(-32769);
      expect(listShort.get(1) ?? 0).assertEqual(-32768);
      expect(listShort.get(2) ?? 0).assertEqual(32767);
      expect(listShort.get(3) ?? 0).assertEqual(32768);

      const listChar = new List<number>();
      precisionValues.char.forEach(val => listChar.add(val));
      listChar.sort(numComparator);
      expect(String.fromCharCode(listChar.get(0) ?? 0)).assertEqual("\x00");
      expect(String.fromCharCode(listChar.get(1) ?? 0)).assertEqual("A");
      expect(String.fromCharCode(listChar.get(2) ?? 0)).assertEqual("a");
      expect(String.fromCharCode(listChar.get(3) ?? 0)).assertEqual("\uffff");

      const listLong = new List<bigint>();
      precisionValues.long.forEach(val => listLong.add(val));
      listLong.sort(bigIntComparator);
      expect(listLong.get(0) ?? 0n).assertEqual(-9223372036854775808n);
      expect(listLong.get(1) ?? 0n).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number    SUB_LIST_TEXT11_1900
     * @tc.name      testList11Chapter0019
     * @tc.desc      List.sort: base expression number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList11Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList11Chapter0019';
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

      const testData = [
        baseExprValues.hex16,
        baseExprValues.hex32,
        baseExprValues.octal,
        baseExprValues.sci1,
        baseExprValues.exponent,
        baseExprValues.sci2,
        baseExprValues.floatHex
      ];
      const expectedOrder = [
        0.025, 3, 8, 258, 1000, 16909060, 3405691582
      ];

      const list = new List<number>();
      testData.forEach(val => list.add(val));
      list.sort((a, b) => a - b);

      expect(list.size()).assertEqual(7);
      expectedOrder.forEach((val, idx) => {
        expect(list.get(idx)).assertEqual(val);
      });
    });

    /**
     * @tc.number    SUB_LIST_TEXT11_2000
     * @tc.name      testList11Chapter0020
     * @tc.desc      List.sort: bigint values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList11Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList11Chapter0020';
      console.log(TAG + ' start');
      const bigIntValues = [
        0xdecafafecacefaden,
        9007199254740991n,
        -9223372036854775808n,
        123.456,
        18446744073709551615n
      ] as (bigint | number)[];

      const comparator: ListComparatorFn<bigint | number> = (a, b) => {
        const toSafeBigInt = (val: bigint | number): bigint => {
          if (typeof val === 'bigint') return val;
          const intVal = Math.trunc(val);
          return BigInt(intVal);
        };

        const aBig = toSafeBigInt(a);
        const bBig = toSafeBigInt(b);
        return aBig < bBig ? -1 : aBig > bBig ? 1 : 0;
      };

      const list = new List<bigint | number>();
      bigIntValues.forEach(val => list.add(val));
      list.sort(comparator);

      expect(list.size()).assertEqual(5);
      expect(list.get(0) ?? 0n).assertEqual(-9223372036854775808n);
      expect(list.get(1) ?? 0).assertEqual(123.456);
      expect(list.get(2) ?? 0n).assertEqual(9007199254740991n);
      expect(list.get(3) ?? 0n).assertEqual(0xdecafafecacefaden);
      expect(list.get(4) ?? 0n).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number    SUB_LIST_TEXT11_2100
     * @tc.name      testList11Chapter0021
     * @tc.desc      List.sort: basic boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList11Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList11Chapter0021';
      console.log(TAG + ' start');
      const basicValues: boolean[] = [true, false, true, false];
      const booleanComparator: ListComparatorFn<boolean> = (a) => a ? -1 : 1;

      const list1 = new List<boolean>();
      basicValues.forEach(val => list1.add(val));
      list1.sort(booleanComparator);

      expect(list1.size()).assertEqual(4);
      expect(list1.get(0)).assertEqual(true);
      expect(list1.get(1)).assertEqual(true);
      expect(list1.get(2)).assertEqual(false);
      expect(list1.get(3)).assertEqual(false);

      const list2 = new List<boolean>();
      list2.add(true);
      list2.add(false);
      list2.sort(booleanComparator);

      expect(list2.size()).assertEqual(2);
      expect(list2.get(0)).assertEqual(true);
      expect(list2.get(1)).assertEqual(false);

      const list3 = new List<boolean>([true]);
      list3.insert(1, false);
      list3.insert(0, true);
      list3.insert(5, false);
      list3.sort(booleanComparator);

      expect(list3.size()).assertEqual(4);
      expect(list3.get(0)).assertEqual(true);
      expect(list3.get(1)).assertEqual(true);
      expect(list3.get(2)).assertEqual(false);
      expect(list3.get(3)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_LIST_TEXT11_2200
     * @tc.name      testList11Chapter0022
     * @tc.desc      List.sort: false-like values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList11Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList11Chapter0022';
      console.log(TAG + ' start');

      const rawFalseLikeValues = [0, NaN, "", null, undefined, false];
      const falseLikeValues: FalseLikeType[] = rawFalseLikeValues.map(val =>
      val === undefined ? UNDEFINED_PLACEHOLDER : val
      );

      const comparator: ListComparatorFn<FalseLikeType> = (a, b): number => {
        const getWeight = (val: FalseLikeType): number => {
          if (val === null) return 0;
          if (val === UNDEFINED_PLACEHOLDER) return 1;
          if (val === "") return 2;
          if (val === 0) return 3;
          if (typeof val === 'number' && isNaN(val)) return 4;
          if (val === false) return 5;
          return 6;
        };
        return getWeight(a) - getWeight(b);
      };

      const sortedArray = [...falseLikeValues].sort(comparator);
      const list = new List<FalseLikeType>();
      sortedArray.forEach(val => list.add(val));

      expect(list.size()).assertEqual(6);
      expect(list.get(0) ?? null).assertEqual(null);
      expect(list.get(1) ?? "").assertEqual(UNDEFINED_PLACEHOLDER);
      expect(list.get(2) ?? "").assertEqual("");
      expect(list.get(3) ?? 0).assertEqual(0);
      const val4 = list.get(4);
      expect(val4 !== undefined && typeof val4 === 'number' && isNaN(val4)).assertTrue();
      expect(list.get(5) ?? false).assertEqual(false);
    });

    /**
     * @tc.number    SUB_LIST_TEXT11_2300
     * @tc.name      testList11Chapter0023
     * @tc.desc      List.sort: true-like values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList11Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList11Chapter0023';
      console.log(TAG + ' start');
      const emptyObj = new EmptyObject();
      const trueLikeValues: (boolean | number | string | EmptyObject | number[])[] =
        [!0, 1, "non-empty", emptyObj, [1]];

      const comparator: ListComparatorFn<boolean | number | string | EmptyObject | number[]> = (a, b): number => {
        const getWeight = (val: boolean | number | string | EmptyObject | number[]): number => {
          if (Array.isArray(val)) return 0;
          if (val instanceof EmptyObject) return 1;
          if (typeof val === 'string' && val) return 2;
          if (val === 1) return 3;
          if (val === true) return 4;
          return 5;
        };
        return getWeight(a) - getWeight(b);
      };

      const list = new List<boolean | number | string | EmptyObject | number[]>();
      trueLikeValues.forEach(val => list.add(val));
      list.sort(comparator);

      expect(list.size()).assertEqual(5);
      expect(Array.isArray(list.get(0))).assertTrue();
      const firstItem = list.get(0);
      if (Array.isArray(firstItem)) {
        expect(firstItem.length).assertEqual(1);
      }
      expect(list.get(1) instanceof EmptyObject).assertTrue();
      expect(list.get(2)).assertEqual("non-empty");
      expect(list.get(3)).assertEqual(1);
      expect(list.get(4)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_LIST_TEXT11_2400
     * @tc.name      testList11Chapter0024
     * @tc.desc      List.sort: mixed boolean/number/string values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList11Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList11Chapter0024';
      console.log(TAG + ' start');

      const UNDEFINED_PLACEHOLDER = '__UNDEFINED__';
      type MixedValueType = boolean | number | string | null | EmptyObject | number[];

      const emptyObj = new EmptyObject();
      const rawMixedValues = [
        true, false, 0, NaN, "", null, undefined, !'s', !0,
        123, "", "test", emptyObj, [1]
      ];

      const mixedValues: MixedValueType[] = rawMixedValues.map(val =>
      val === undefined ? UNDEFINED_PLACEHOLDER : val
      );

      const comparator: ListComparatorFn<MixedValueType> = (a, b): number => {
        const getTypeWeight = (val: MixedValueType): number => {
          if (val === null) return 0;
          if (val === UNDEFINED_PLACEHOLDER) return 1;
          if (typeof val === 'string') return 2;
          if (typeof val === 'number') return 3;
          if (typeof val === 'boolean') return 4;
          if (Array.isArray(val)) return 5;
          if (val instanceof EmptyObject) return 6;
          return 7;
        };

        const typeDiff = getTypeWeight(a) - getTypeWeight(b);
        if (typeDiff !== 0) return typeDiff;

        switch (getTypeWeight(a)) {
          case 2: {
            const strA = a as string;
            const strB = b as string;
            if (strA === "" && strB !== "") return -1;
            if (strA !== "" && strB === "") return 1;
            return strA.localeCompare(strB);
          }
          case 3: {
            const numA = a as number;
            const numB = b as number;
            if (isNaN(numA) && !isNaN(numB)) return -1;
            if (!isNaN(numA) && isNaN(numB)) return 1;
            return numA - numB;
          }
          case 4: {
            const boolA = a as boolean;
            return boolA ? 1 : -1;
          }
          case 5: {
            const arrA = a as number[];
            const arrB = b as number[];
            return arrA.length - arrB.length;
          }
          case 6: return 0;
          default: return 0;
        }
      };

      const list = new List<MixedValueType>();
      mixedValues.forEach(val => list.add(val));
      list.sort(comparator);
      expect(list.size()).assertEqual(14);

      expect(list.get(0) ?? null).assertEqual(null);
      expect(list.get(1) ?? "").assertEqual(UNDEFINED_PLACEHOLDER);
      expect(list.get(2) ?? "").assertEqual("");
      expect(list.get(3) ?? "").assertEqual("");
      expect(list.get(4) ?? "").assertEqual("test");

      const num5 = list.get(5);
      expect(num5 !== undefined && typeof num5 === 'number' && isNaN(num5)).assertTrue();

      expect(list.get(6) ?? 0).assertEqual(0);
      expect(list.get(7) ?? 0).assertEqual(123);

      expect(list.get(8) ?? false).assertEqual(false);
      expect(list.get(9) ?? false).assertEqual(false);

      expect(list.get(10) ?? true).assertEqual(true);
      expect(list.get(11) ?? true).assertEqual(true);

      const arr12 = list.get(12);
      expect(arr12 !== undefined && Array.isArray(arr12)).assertTrue();

      const obj13 = list.get(13);
      expect(obj13 !== undefined && obj13 instanceof EmptyObject).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEXT11_2500
     * @tc.name      testList11Chapter0025
     * @tc.desc      List.sort: basic objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList11Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList11Chapter0025';
      console.log(TAG + ' start');
      const normalObjs = [
        new NormalObject(3, "test3", [3]),
        new NormalObject(1, "test1", [1]),
        new NormalObject(2, "test2", [2])
      ];
      const nestedObjs = [
        new NestedObject(3, new NestedLevel2(3, new NestedLevel3(3))),
        new NestedObject(1, new NestedLevel2(1, new NestedLevel3(1))),
        new NestedObject(2, new NestedLevel2(2, new NestedLevel3(2)))
      ];
      const emptyObj = new EmptyObject();

      const normalObjComparator: ListComparatorFn<NormalObject> = (a, b): number => a.a - b.a;
      const nestedObjComparator: ListComparatorFn<NestedObject> = (a, b): number => a.a - b.a;

      const listNormal = new List<NormalObject>();
      normalObjs.forEach(obj => listNormal.add(obj));
      listNormal.sort(normalObjComparator);

      expect(listNormal.size()).assertEqual(3);
      expect(listNormal.get(0)!.a).assertEqual(1);
      expect(listNormal.get(1)!.a).assertEqual(2);
      expect(listNormal.get(2)!.a).assertEqual(3);

      const listNested = new List<NestedObject>();
      nestedObjs.forEach(obj => listNested.add(obj));
      listNested.sort(nestedObjComparator);

      expect(listNested.get(0)!.a).assertEqual(1);
      expect(listNested.get(0)!.b.c).assertEqual(1);
      expect(listNested.get(2)!.b.d.e).assertEqual(3);

      const listMixed = new List<EmptyObject | NormalObject | NestedObject>();
      listMixed.add(normalObjs[0]);
      listMixed.add(nestedObjs[1]);
      listMixed.add(emptyObj);
      listMixed.sort((a, b): number => {
        if (a instanceof EmptyObject) return -1;
        if (b instanceof EmptyObject) return 1;
        if (a instanceof NormalObject && b instanceof NestedObject) return -1;
        if (a instanceof NestedObject && b instanceof NormalObject) return 1;
        if (a instanceof NormalObject && b instanceof NormalObject) return a.a - b.a;
        if (a instanceof NestedObject && b instanceof NestedObject) return a.a - b.a;
        return 0;
      });

      expect(listMixed.size()).assertEqual(3);
      expect(listMixed.get(0) instanceof EmptyObject).assertTrue();
      expect((listMixed.get(1) as NormalObject).a).assertEqual(3);
      expect((listMixed.get(2) as NestedObject).a).assertEqual(1);
    });

    /**
     * @tc.number    SUB_LIST_TEXT11_2600
     * @tc.name      testList11Chapter0026
     * @tc.desc      List.sort: special key/inherit/non-enum objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList11Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList11Chapter0026';
      console.log(TAG + ' start');
      const specialKeyObjs = [
        new SpecialKeyObject("value3", 3),
        new SpecialKeyObject("value1", 1),
        new SpecialKeyObject("value2", 2)
      ];
      const inheritObjs = [
        new InheritObject(3),
        new InheritObject(1),
        new InheritObject(2)
      ];
      const nonEnumObjs = [
        new NonEnumObject(3),
        new NonEnumObject(1),
        new NonEnumObject(2)
      ];

      const specialKeyComparator: ListComparatorFn<SpecialKeyObject> = (a, b): number => a.a - b.a;
      const inheritComparator: ListComparatorFn<InheritObject> = (a, b): number => a.parentProp - b.parentProp;
      const nonEnumComparator: ListComparatorFn<NonEnumObject> = (a, b): number => a.a - b.a;

      const listSpecial = new List<SpecialKeyObject>();
      specialKeyObjs.forEach(obj => listSpecial.add(obj));
      listSpecial.sort(specialKeyComparator);

      expect(listSpecial.get(0)!.a).assertEqual(1);
      expect(listSpecial.get(0)!.specialKey).assertEqual("value1");
      expect(listSpecial.get(2)!.a).assertEqual(3);

      const listInherit = new List<InheritObject>();
      inheritObjs.forEach(obj => listInherit.add(obj));
      listInherit.sort(inheritComparator);

      expect(listInherit.get(0)!.parentProp).assertEqual(1);
      expect(listInherit.get(2)!.parentProp).assertEqual(3);

      const listNonEnum = new List<NonEnumObject>();
      nonEnumObjs.forEach(obj => listNonEnum.add(obj));
      listNonEnum.sort(nonEnumComparator);

      expect(listNonEnum.get(0)!.a).assertEqual(1);
      expect(listNonEnum.get(2)!.a).assertEqual(3);
    });

    /**
     * @tc.number    SUB_LIST_TEXT11_2700
     * @tc.name      testList11Chapter0027
     * @tc.desc      List.sort: buffer/dataview/typed array objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList11Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList11Chapter0027';
      console.log(TAG + ' start');
      const bufferObjs = [
        new BufferObject(new ArrayBuffer(32)),
        new BufferObject(new ArrayBuffer(16)),
        new BufferObject(createUint8Array([72, 101, 108, 108, 111]))
      ];
      const dataViewObjs = [
        new DataViewObject(new DataView(new ArrayBuffer(32))),
        new DataViewObject(new DataView(new ArrayBuffer(16)))
      ];
      const typedArrayObjs = [
        new BufferObject(new Int16Array([1234, 5678])),
        new BufferObject(new Uint8Array([1, 2, 3]))
      ];

      const bufferComparator: ListComparatorFn<BufferObject> = (a, b): number => {
        const getLength = (obj: BufferObject): number => {
          if (obj.buffer instanceof ArrayBuffer) {
            return obj.buffer.byteLength;
          } else {
            return obj.buffer.length;
          }
        };
        return getLength(a) - getLength(b);
      };

      const dataViewComparator: ListComparatorFn<DataViewObject> = (a, b): number => {
        return a.view.buffer.byteLength - b.view.buffer.byteLength;
      };

      const listBuffer = new List<BufferObject>();
      bufferObjs.forEach(obj => listBuffer.add(obj));
      listBuffer.sort(bufferComparator);

      expect((listBuffer.get(0)!.buffer as Uint8Array).length).assertEqual(5);
      expect((listBuffer.get(1)!.buffer as ArrayBuffer).byteLength).assertEqual(16);
      expect((listBuffer.get(2)!.buffer as ArrayBuffer).byteLength).assertEqual(32);

      const listDataView = new List<DataViewObject>();
      dataViewObjs.forEach(obj => listDataView.add(obj));
      listDataView.sort(dataViewComparator);

      expect(listDataView.get(0)!.view.buffer.byteLength).assertEqual(16);
      expect(listDataView.get(1)!.view.buffer.byteLength).assertEqual(32);

      const listTypedArray = new List<BufferObject>();
      typedArrayObjs.forEach(obj => listTypedArray.add(obj));
      listTypedArray.sort(bufferComparator);

      expect((listTypedArray.get(0)!.buffer as Int16Array).length).assertEqual(2);
      expect((listTypedArray.get(1)!.buffer as Uint8Array).length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_LIST_TEXT11_2800
     * @tc.name      testList11Chapter0028
     * @tc.desc      List.sort: map/set/func/regex/promise objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList11Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testList11Chapter0028';
      console.log(TAG + ' start');

      const mapObj = new MapObject([
        ['key1', 'value1'],
        ['key2', new NestedLevel2(1, new NestedLevel3(1))]
      ]);
      const setObj = new SetObject([1, 2, 3, 2, 1]);
      const funcObj = new FuncObject(1, () => "func");
      const regexObj = new RegexObject(/abc/gi);

      const testPromise = new Promise<string>((resolve) => setTimeout(() => resolve('done'), 100));
      const promiseObj = new PromiseObject(testPromise);

      type MixedTestObject = MapObject | SetObject | FuncObject | RegexObject | PromiseObject;
      const mixedComparator: ListComparatorFn<MixedTestObject> = (a, b): number => {
        const getTypeWeight = (obj: MixedTestObject): number => {
          if (obj instanceof MapObject) return 0;
          if (obj instanceof SetObject) return 1;
          if (obj instanceof FuncObject) return 2;
          if (obj instanceof RegexObject) return 3;
          if (obj instanceof PromiseObject) return 4;
          return 5;
        };
        return getTypeWeight(a) - getTypeWeight(b);
      };

      const listMap = new List<MapObject>([mapObj]);
      expect(listMap.size()).assertEqual(1);
      expect(listMap.get(0)!.map.get('key1')).assertEqual('value1');
      expect((listMap.get(0)!.map.get('key2') as NestedLevel2).c).assertEqual(1);

      const listSet = new List<SetObject>([setObj]);
      expect(listSet.get(0)!.set.size).assertEqual(3);

      const listFunc = new List<FuncObject>([funcObj]);
      expect(listFunc.get(0)!.b()).assertEqual("func");

      const listRegex = new List<RegexObject>([regexObj]);
      expect(listRegex.get(0)!.regex.test('ABC')).assertTrue();

      const listAdd = new List<MixedTestObject>();
      listAdd.add(mapObj);
      listAdd.add(setObj);
      listAdd.add(funcObj);
      listAdd.add(regexObj);
      listAdd.add(promiseObj);

      listAdd.sort(mixedComparator);
      expect(listAdd.size()).assertEqual(5);
      expect((listAdd.get(1) as SetObject).set.has(2)).assertTrue();
      expect((listAdd.get(3) as RegexObject).regex.flags).assertEqual('gi');

      expect(await (listAdd.get(4) as PromiseObject).promise).assertEqual('done');

      const listInsert = new List<MixedTestObject>([mapObj]);
      listInsert.insert(1, setObj);
      listInsert.insert(0, funcObj);
      listInsert.insert(5, regexObj);
      listInsert.insert(3, promiseObj);

      expect(listInsert.size()).assertEqual(5);
      expect((listInsert.get(0) as FuncObject).b()).assertEqual("func");
      expect((listInsert.get(2) as SetObject).set.size).assertEqual(3);
      expect((listInsert.get(4) as RegexObject).regex.test('def')).assertFalse();

      expect(await (listInsert.get(3) as PromiseObject).promise).assertEqual('done');
    });

    /**
     * @tc.number    SUB_LIST_TEXT11_2900
     * @tc.name      testList11Chapter0029
     * @tc.desc      List.sort: special value objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testList11Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList11Chapter0029';
      console.log(TAG + ' start');
      const specialValObj1 = new SpecialValueObject(NaN, Infinity, -Infinity);
      specialValObj1.a = undefined;
      specialValObj1.b = null;
      const specialValObj2 = new SpecialValueObject(10, 20, 5);
      specialValObj2.a = undefined;
      specialValObj2.b = null;
      const specialValExtObj1 = new SpecialValueExtObject(NaN, -Infinity);
      const specialValExtObj2 = new SpecialValueExtObject(30, 15);
      const insertObj1 = new SpecialValueInsertObject(undefined, undefined);
      const insertObj2 = new SpecialValueInsertObject(NaN);
      const insertObj3 = new SpecialValueInsertObject(undefined, Infinity);
      const insertObj4 = new SpecialValueInsertObject(25, 35);
      const specialValueComparator: ListComparatorFn<SpecialValueObject> = (a, b): number => {
        const getSortValue = (obj: SpecialValueObject): number => {
          const cVal = isNaN(obj.c) ? -1000000000 : obj.c;
          const dVal = obj.d === Infinity ? 1000000000 : obj.d === -Infinity ? -999999999 : obj.d;
          const eVal = obj.e === Infinity ? 1000000000 : obj.e === -Infinity ? -999999999 : obj.e;
          return cVal * 1000000 + dVal * 1000 + eVal;
        };
        return getSortValue(a) - getSortValue(b);
      };
      const specialValueExtComparator: ListComparatorFn<SpecialValueExtObject> = (a, b): number => {
        const getSortValue = (obj: SpecialValueExtObject): number => {
          const fVal = isNaN(obj.f) ? -1000000000 : obj.f;
          const gVal = obj.g === Infinity ? 1000000000 : obj.g === -Infinity ? -999999999 : obj.g;
          return fVal * 1000 + gVal;
        };
        return getSortValue(a) - getSortValue(b);
      };
      const getInsertObjSortValue = (obj: SpecialValueInsertObject): number => {
        let jWeight = 0;
        if (obj.j === undefined) {
          jWeight = 2000000;
        } else if (isNaN(obj.j)) {
          jWeight = 1000000;
        } else {
          jWeight = 10000000;
        }
        let kWeight = 0;
        if (obj.k === undefined) {
          kWeight = 3;
        } else if (obj.k === Infinity) {
          kWeight = 2;
        } else if (obj.k === -Infinity) {
          kWeight = 1;
        } else {
          kWeight = 4 + obj.k;
        }
        return jWeight + kWeight;
      };
      const insertObjComparator: ListComparatorFn<SpecialValueInsertObject> = (a, b): number => {
        return getInsertObjSortValue(a) - getInsertObjSortValue(b);
      };
      const listSpecialVal = new List<SpecialValueObject>();
      listSpecialVal.add(specialValObj1);
      listSpecialVal.add(specialValObj2);
      listSpecialVal.sort(specialValueComparator);

      const listExtVal = new List<SpecialValueExtObject>();
      listExtVal.add(specialValExtObj1);
      listExtVal.add(specialValExtObj2);
      listExtVal.sort(specialValueExtComparator);

      const listInsertVal = new List<SpecialValueInsertObject>();
      listInsertVal.add(insertObj1);
      listInsertVal.add(insertObj2);
      listInsertVal.add(insertObj3);
      listInsertVal.add(insertObj4);
      listInsertVal.sort(insertObjComparator);
      expect(isNaN((listSpecialVal.get(0) ?? specialValObj1).c)).assertTrue();
      expect((listSpecialVal.get(1) ?? specialValObj2).c).assertEqual(10);

      expect(isNaN((listExtVal.get(0) ?? specialValExtObj1).f)).assertTrue();
      expect((listExtVal.get(1) ?? specialValExtObj2).f).assertEqual(30);
      const insertVal0 = listInsertVal.get(0) ?? insertObj2;
      expect(isNaN(Number(insertVal0.j))).assertTrue();

      const insertVal3 = listInsertVal.get(3) ?? insertObj4;
      expect(insertVal3.j).assertEqual(25);
    });

    /**
     * @tc.number    SUB_LIST_TEXT11_3000
     * @tc.name      testList11Chapter0030
     * @tc.desc      List.sort: large/mixed/small/newKey objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList11Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList11Chapter0030';
      console.log(TAG + ' start');
      const largeObj1 = new LargeObject(10000)
      const largeObj2 = new LargeObject(5000);

      const mixedObj1 = new MixedObject(
        300, "test3", true, null,
        new NestedLevel2(456, new NestedLevel3(0)),
        new Map([['key', 'val']]),
        new Set([1, 2, 3]),
        /abc/,
        new ArrayBuffer(8)
      );
      const mixedObj2 = new MixedObject(
        100, "test1", false, null,
        new NestedLevel2(123, new NestedLevel3(0)),
        new Map([['key', 'val']]),
        new Set([1]),
        /def/,
        new ArrayBuffer(4)
      );

      const smallObj1 = new SmallObject(5);
      const smallObj2 = new SmallObject(1);

      const newKeyObj1 = new NewKeyObject("zNewVal");
      const newKeyObj2 = new NewKeyObject("aNewVal");

      type ComplexTestObject = SmallObject | NewKeyObject | MixedObject | LargeObject;
      const complexObjComparator: ListComparatorFn<ComplexTestObject> = (a, b): number => {
        const getTypeWeight = (obj: ComplexTestObject): number => {
          if (obj instanceof SmallObject) return 0;
          if (obj instanceof NewKeyObject) return 1;
          if (obj instanceof MixedObject) return 2;
          if (obj instanceof LargeObject) return 3;
          return 4;
        };
        const typeDiff = getTypeWeight(a) - getTypeWeight(b);
        if (typeDiff !== 0) return typeDiff;

        if (a instanceof SmallObject && b instanceof SmallObject) return a.small - b.small;
        if (a instanceof NewKeyObject && b instanceof NewKeyObject) return a.newKey.localeCompare(b.newKey);
        if (a instanceof MixedObject && b instanceof MixedObject) return a.a - b.a;
        if (a instanceof LargeObject && b instanceof LargeObject) return a.getPropertyCount() - b.getPropertyCount();
        return 0;
      };

      const listSmall = new List<SmallObject>();
      listSmall.add(smallObj1);
      listSmall.add(smallObj2);
      listSmall.sort(complexObjComparator);

      expect(listSmall.size()).assertEqual(2);
      expect(listSmall.get(0)!.small).assertEqual(1);
      expect(listSmall.get(1)!.small).assertEqual(5);

      const listNewKey = new List<NewKeyObject>();
      listNewKey.add(newKeyObj1);
      listNewKey.add(newKeyObj2);
      listNewKey.sort(complexObjComparator);

      expect(listNewKey.get(0)!.newKey).assertEqual("aNewVal");
      expect(listNewKey.get(1)!.newKey).assertEqual("zNewVal");

      const listMixed = new List<MixedObject>();
      listMixed.add(mixedObj1);
      listMixed.add(mixedObj2);
      listMixed.sort(complexObjComparator);
      expect(listMixed.get(0)!.a).assertEqual(100);
      expect(listMixed.get(0)!.i.byteLength).assertEqual(4);
      expect(listMixed.get(1)!.a).assertEqual(300);

      const listLarge = new List<LargeObject>();
      listLarge.add(largeObj1);
      listLarge.add(largeObj2);
      listLarge.sort(complexObjComparator);

      expect(listLarge.get(0)!.getPropertyCount()).assertEqual(5000);
      expect(listLarge.get(0)!.getProperty("4999")).assertEqual(4999);
      expect(listLarge.get(1)!.getPropertyCount()).assertEqual(10000);

      const listAll = new List<ComplexTestObject>();
      listAll.add(largeObj1);
      listAll.add(mixedObj1);
      listAll.add(smallObj1);
      listAll.add(newKeyObj1);
      listAll.add(largeObj2);
      listAll.add(mixedObj2);
      listAll.add(smallObj2);
      listAll.add(newKeyObj2);
      listAll.sort(complexObjComparator);
      expect(listAll.size()).assertEqual(8);
      expect(listAll.get(0) instanceof SmallObject &&
        (listAll.get(0) as SmallObject).small === 1).assertTrue();
      expect(listAll.get(2) instanceof NewKeyObject &&
        (listAll.get(2) as NewKeyObject).newKey === "aNewVal").assertTrue();
      expect(listAll.get(4) instanceof MixedObject &&
        (listAll.get(4) as MixedObject).a === 100).assertTrue();
      expect(listAll.get(6) instanceof LargeObject &&
        (listAll.get(6) as LargeObject).getPropertyCount() === 5000).assertTrue();
    });
  })
}