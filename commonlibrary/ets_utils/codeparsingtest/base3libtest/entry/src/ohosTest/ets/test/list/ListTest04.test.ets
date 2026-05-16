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
  isEmpty(): boolean {
    return this.data.length === 0;
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
  getLastIndexOf(element: T): number {
    for (let i = this.data.length - 1; i >= 0; i--) {
      if (this.data[i] === element) {
        return i;
      }
    }
    return -1;
  }

  forEach(
    callbackFn: (value: T, index?: number, list?: List<T>, thisArg?: Object) => void,
    thisArg?: Object
  ): void {
    this.data.forEach((value, index) => {
      callbackFn(value, index, this, thisArg);
    });
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

interface SpecialValueOptions {
  c?: number;
  d?: number;
  e?: number;
  value?: number | undefined | null;
}

class SpecialValueObject {
  a?: undefined;
  b?: null;
  c: number = 0;
  d: number = 0;
  e: number = 0;
  value: number | undefined | null = 0;
  constructor(
    param1: number | undefined | null | SpecialValueOptions,
    d?: number,
    e?: number
  ) {
    if (typeof param1 === 'number' && d !== undefined && e !== undefined) {
      this.c = param1;
      this.d = d;
      this.e = e;
    }
    else if (typeof param1 === 'number' || param1 === undefined || param1 === null) {
      this.value = param1 as number | undefined | null;
    }
    else if (typeof param1 === 'object' && param1 !== null) {

      const options = param1 as SpecialValueOptions;
      this.c = options.c ?? this.c;
      this.d = options.d ?? this.d;
      this.e = options.e ?? this.e;
      this.value = options.value ?? this.value;
    }
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

function createUint8Array(values: Array<number>): Uint8Array {
  const arr = new Uint8Array(values.length);
  values.forEach((val, idx) => {
    arr[idx] = val;
  });
  return arr;
}

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ListTest04() {
  describe('ListTest04', () => {
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
     * @tc.number    SUB_LIST_TEST04_0100
     * @tc.name      testList04Chapter0001
     * @tc.desc      It validates that the insert method of the List class behaves correctly across multiple scenarios
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList04Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList04Chapter0001';
      console.log(TAG + ' start');

      const bufferObj = new BufferObject(new ArrayBuffer(16));
      const dataViewObj = new DataViewObject(new DataView(new ArrayBuffer(16)));
      const typedArrayObj = new BufferObject(createUint8Array([72, 101, 108, 108, 111]));
      const newTypedObj = new BufferObject(new Int16Array([1234]));
      const listBuffer = new List<BufferObject>([bufferObj]);
      expect((listBuffer.get(0)!.buffer as ArrayBuffer).byteLength).assertEqual(16);

      const listDataView = new List<DataViewObject>([dataViewObj]);
      expect(listDataView.get(0)!.view.buffer.byteLength).assertEqual(16);

      const listTypedArray = new List<BufferObject>([typedArrayObj]);
      expect((listTypedArray.get(0)!.buffer as Uint8Array)[0]).assertEqual(72);

      const listInsert1 = new List<Object>();
      const insertValues = [typedArrayObj, dataViewObj, bufferObj];
      insertValues.forEach((val, idx) => listInsert1.insert(idx,val));

      expect(listInsert1.size()).assertEqual(3);
      expect(((listInsert1.get(2) as BufferObject).buffer as ArrayBuffer).byteLength).assertEqual(16);
      expect(((listInsert1.get(0) as BufferObject).buffer as Uint8Array).length).assertEqual(5);

      const listInsert = new List<Object>([bufferObj]);
      listInsert.insert(1,dataViewObj);
      listInsert.insert(0,typedArrayObj);
      listInsert.insert(3,newTypedObj);
      expect(listInsert.size()).assertEqual(4);
      expect(((listInsert.get(0) as BufferObject).buffer as Uint8Array)[1]).assertEqual(101);
      expect((listInsert.get(1) as BufferObject).buffer.byteLength).assertEqual(16);
      expect((listInsert.get(2) as DataViewObject).view.buffer.byteLength).assertEqual(16);
      expect(((listInsert.get(3) as BufferObject).buffer as Int16Array)[0]).assertEqual(1234);
    });

    /**
     * @tc.number    SUB_LIST_TEST04_0200
     * @tc.name      testList04Chapter0002
     * @tc.desc      Verify has interface logic for negative-number arrays & non-numeric index arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList04Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testList04Chapter0002';
      console.log(TAG + ' start');
      const negativeArr: number[] = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      const uint8NegArr: Uint8Array = new Uint8Array(negativeArr);
      const int8NegArr: Int8Array = new Int8Array(negativeArr);
      const numericArr: number[] = [333];
      const nonNumericMap: Map<string, number> = new Map<string, number>();
      nonNumericMap.set("abc", 111);
      nonNumericMap.set("aaa", 222);
      const fakeUint8Arr: Uint8Array = new Uint8Array([4, 5, 6]);

      const list: List<TypedArray | number[]> = new List<TypedArray | number[]>();
      list.add(uint8NegArr);
      list.add(int8NegArr);
      list.add(numericArr);
      expect(list.length).assertEqual(3);
      expect(list.has(uint8NegArr)).assertTrue();
      expect(list.has(int8NegArr)).assertTrue();
      expect(list.has(numericArr)).assertTrue();
      expect(list.has(fakeUint8Arr)).assertFalse();
      if (list.has(uint8NegArr)) {
        const item0: Uint8Array = list.get(0) as Uint8Array;
        expect(item0[6]).assertEqual(145);
        expect(item0[10]).assertEqual(207);
      }
      if (list.has(int8NegArr)) {
        const item1: Int8Array = list.get(1) as Int8Array;
        expect(item1[6]).assertEqual(-111);
        expect(item1[10]).assertEqual(-49);
      }

      if (list.has(numericArr)) {
        const item2: number[] = list.get(2) as number[];
        expect(item2[0]).assertEqual(333);
      }
      expect(nonNumericMap.get("abc")).assertEqual(111);
      expect(nonNumericMap.get("aaa")).assertEqual(222);
    });

    /**
     * @tc.number    SUB_LIST_TEST04_0300
     * @tc.name      testList04Chapter0003
     * @tc.desc      Verify has() for NaN/Infinity/non-numeric type arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList04Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testList04Chapter0003';
      console.log(TAG + ' start');
      const specialValueArr: number[] = [72, 101, NaN, Infinity, -Infinity, 108, 111];
      const nonNumericTypeArr: (number | string | boolean | null | undefined)[] = [72, "abc",
        true, null, undefined, 108];
      const fakeSpecialArr: number[] = [100, 200, NaN];
      const list: List<number[] | (number | string | boolean | null | undefined)[]> = new List<number[] | (number |
      string | boolean | null | undefined)[]>();
      list.add(specialValueArr);
      list.add(nonNumericTypeArr);
      expect(list.length).assertEqual(2);
      expect(list.has(specialValueArr)).assertTrue();
      expect(list.has(nonNumericTypeArr)).assertTrue();
      expect(list.has(fakeSpecialArr)).assertFalse();
      if (list.has(specialValueArr)) {
        const item0: number[] = list.get(0) as number[];
        expect(item0[0]).assertEqual(72);
        expect(isNaN(item0[2])).assertTrue();
        expect(item0[3]).assertEqual(Infinity);
        expect(item0[4]).assertEqual(-Infinity);
      }
      if (list.has(nonNumericTypeArr)) {
        const item1: (number | string | boolean | null | undefined)[] = list.get(1) as (number | string
          | boolean | null | undefined)[];
        expect(item1[1]).assertEqual("abc");
        expect(item1[2]).assertEqual(true);
        expect(item1[3]).assertEqual(null);
        expect(item1[4]).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_LIST_TEST04_0400
     * @tc.name      testList04Chapter0004
     * @tc.desc      Verify has() for empty/overflow/deleted element arrays (has test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList04Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testList04Chapter0004';
      console.log(TAG + ' start');
      const emptyArr: number[] = [];
      const overflowArr: number[] = [256, 65536, 32768];
      const deletedArr: number[] = [1, 2, 3];
      const fakeEmptyArr: number[] = [];
      const list: List<number[]> = new List<number[]>();
      list.add(emptyArr);
      list.add(overflowArr);
      list.add(deletedArr);
      expect(list.length).assertEqual(3);
      expect(list.has(emptyArr)).assertTrue();
      expect(list.has(overflowArr)).assertTrue();
      expect(list.has(deletedArr)).assertTrue();
      expect(list.has(fakeEmptyArr)).assertFalse();
      if (list.has(emptyArr)) {
        const item0: number[] = list.get(0) as number[];
        expect(item0.length).assertEqual(0);
      }
      if (list.has(overflowArr)) {
        const item1: number[] = list.get(1) as number[];
        expect(item1[0]).assertEqual(256);
        expect(item1[1]).assertEqual(65536);
        expect(item1[2]).assertEqual(32768);
      }
      if (list.has(deletedArr)) {
        const item2: number[] = list.get(2) as number[];
        expect(item2.length).assertEqual(3);
        expect(item2[0]).assertEqual(1);
        expect(item2[1]).assertEqual(2);
      }
    });

    /**
     * @tc.number    SUB_LIST_TEST04_0500
     * @tc.name      testList04Chapter0005
     * @tc.desc      Verify has() for nested/TypedArray/ultra-long arrays (has test)
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList04Chapter0005", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async (): Promise<void> => {
      const TAG = 'testList04Chapter0005';
      console.log(TAG + ' start');
      const level3Arr: number[] = [5, 6];
      const level2Arr1: number[] = [2, 3];
      const level2Arr2: (number | number[])[] = [4, level3Arr];
      const nestedArr: (number | number[] | (number | number[])[])[] = [1, level2Arr1, level2Arr2];
      const typedSubArr: TypedArray[] = [new Int32Array([10, 20]), new Float64Array([3.14, 6.28])];
      const largeArr: number[] = new Array(1000000).fill(1)
      const fakeNestedArr: (number | number[] | (number | number[])[])[] = [10, [20, 30]];
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
      expect(nestedList.has(nestedArr)).assertTrue();
      expect(typedList.has(typedSubArr)).assertTrue();
      expect(largeList.has(largeArr)).assertTrue();
      expect(nestedList.has(fakeNestedArr)).assertFalse();
      const nestedItem = nestedList.get(0);
      if (nestedList.has(nestedArr) && nestedItem !== undefined) {
        const item0 = nestedItem;
        expect(item0[0] as number).assertEqual(1);
        expect((item0[1] as number[])[1]).assertEqual(3);
        expect(((item0[2] as (number | number[])[])[1] as number[])[0]).assertEqual(5);
      }
      const typedItem = typedList.get(0);
      if (typedList.has(typedSubArr) && typedItem !== undefined) {
        const item1 = typedItem;
        expect((item1[0] as Int32Array)[0]).assertEqual(10);
        expect((item1[1] as Float64Array)[1]).assertClose(6.28, 0.01);
      }
      const largeItem = largeList.get(0);
      if (largeList.has(largeArr) && largeItem !== undefined) {
        const item2 = largeItem;
        expect(item2.length).assertEqual(1000000);
        expect(item2[0]).assertEqual(1);
        expect(item2[999999]).assertEqual(1);
      }
    });

    /**
     * @tc.number    SUB_LIST_TEST04_0600
     * @tc.name      testList04Chapter0006
     * @tc.desc      Verify has() for function/keyword arrays (no Symbol, has test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList04Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testList04Chapter0006';
      console.log(TAG + ' start');

      type MixedElement = (() => string) | string;
      const func: () => string = () => "testResult";
      const mixedTypeArr: MixedElement[] = [func, "0", "NaN", ""];
      const fakeFunc: () => string = () => "fake";
      const fakeMixedArr: MixedElement[] = [fakeFunc, "1", "2"];

      const list: List<MixedElement[]> = new List<MixedElement[]>();
      list.add(mixedTypeArr);
      expect(list.length).assertEqual(1);
      expect(list.has(mixedTypeArr)).assertTrue();
      expect(list.has(fakeMixedArr)).assertFalse();

      if (list.has(mixedTypeArr)) {
        const item0: MixedElement[] = list.get(0)!;
        expect((item0[0] as () => string)()).assertEqual("testResult");
        expect(item0[1] as string).assertEqual("0");
        expect(item0[2] as string).assertEqual("NaN");
        expect(item0[3] as string).assertEqual("");
      }
    });

    /**
     * @tc.number    SUB_LIST_TEST04_0700
     * @tc.name      testList04Chapter0007
     * @tc.desc      Test has interface with basic string values (undefined/null/empty/special char/ASCII)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList04Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList04Chapter0007';
      console.log(TAG + ' start');
      const undefinedStr: string = String(undefined);
      const list1: List<string> = new List<string>([undefinedStr]);
      const nullStr: string = String(null);
      const list2: List<string> = new List<string>([nullStr]);
      const list3: List<string> = new List<string>(['']);
      const specialCharStr1: string = '!"#$%';
      const list4: List<string> = new List<string>([specialCharStr1]);
      let asciiStr: string = '';
      for (let i = 32; i <= 126; i++) {
        asciiStr += String.fromCharCode(i);
      }
      const list5: List<string> = new List<string>([asciiStr]);
      expect(list1.has(undefinedStr)).assertTrue();
      expect(list1.has('test')).assertFalse();
      expect(list2.has(nullStr)).assertTrue();
      expect(list3.has('')).assertTrue();
      expect(list4.has(specialCharStr1)).assertTrue();
      expect(list5.has(asciiStr)).assertTrue();
      expect(list5.has('abc')).assertFalse();
    });

    /**
     * @tc.number    SUB_LIST_TEST04_0800
     * @tc.name      testList04Chapter0008
     * @tc.desc      Test has interface with special character strings (split full special chars)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList04Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList04Chapter0008';
      console.log(TAG + ' start');
      const specialCharStr2: string = '&\'()';
      const list6: List<string> = new List<string>([specialCharStr2]);
      const specialCharStr3: string = '*+,-.';
      const list7: List<string> = new List<string>([specialCharStr3]);
      const specialCharStr4: string = '/:;<=';
      const list8: List<string> = new List<string>([specialCharStr4]);
      const specialCharStr5: string = '>?@[\\\\';
      const list9: List<string> = new List<string>([specialCharStr5]);
      const specialCharStr6: string = ']^_`{';
      const list10: List<string> = new List<string>([specialCharStr6]);
      const specialCharStr7: string = '|}~';
      const list11: List<string> = new List<string>([specialCharStr7]);
      expect(list6.has(specialCharStr2)).assertTrue();
      expect(list7.has(specialCharStr3)).assertTrue();
      expect(list8.has(specialCharStr4)).assertTrue();
      expect(list9.has(specialCharStr5)).assertTrue();
      expect(list10.has(specialCharStr6)).assertTrue();
      expect(list11.has(specialCharStr7)).assertTrue();
      expect(list11.has('~')).assertFalse();
    });

    /**
     * @tc.number    SUB_LIST_TEST04_0900
     * @tc.name      testList04Chapter0009
     * @tc.desc      Test has interface with escape character strings (double special chars/\a/\b/\f/\n)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList04Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList04Chapter0009';
      console.log(TAG + ' start');
      const doubleSpecialCharStr: string = '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
      const list12: List<string> = new List<string>([doubleSpecialCharStr]);
      const escapeStrA: string = String.fromCharCode(7);
      const list13: List<string> = new List<string>([escapeStrA]);
      const escapeStrB: string = String.fromCharCode(8);
      const list14: List<string> = new List<string>([escapeStrB]);
      const escapeStrF: string = String.fromCharCode(12);
      const list15: List<string> = new List<string>([escapeStrF]);
      const escapeStrN: string = '\n';
      const list16: List<string> = new List<string>([escapeStrN]);
      expect(list12.has(doubleSpecialCharStr)).assertTrue();
      expect(list13.has(escapeStrA)).assertTrue();
      expect(list14.has(escapeStrB)).assertTrue();
      expect(list15.has(escapeStrF)).assertTrue();
      expect(list16.has(escapeStrN)).assertTrue();
      expect(list16.has('\r')).assertFalse();
    });

    /**
     * @tc.number    SUB_LIST_TEST04_1000
     * @tc.name      testList04Chapter0010
     * @tc.desc      Test has interface with more escape character strings (\r/\t/\v/\\/')
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList04Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList04Chapter0010';
      console.log(TAG + ' start');
      const escapeStrR: string = '\r';
      const list17: List<string> = new List<string>([escapeStrR]);
      const escapeStrT: string = '\t';
      const list18: List<string> = new List<string>([escapeStrT]);
      const escapeStrV: string = String.fromCharCode(11);
      const list19: List<string> = new List<string>([escapeStrV]);
      const escapeStrBackslash: string = '\\';
      const list20: List<string> = new List<string>([escapeStrBackslash]);
      const escapeStrSingleQuote: string = '\'';
      const list21: List<string> = new List<string>([escapeStrSingleQuote]);
      expect(list17.has(escapeStrR)).assertTrue();
      expect(list18.has(escapeStrT)).assertTrue();
      expect(list19.has(escapeStrV)).assertTrue();
      expect(list20.has('\\')).assertTrue();
      expect(list21.has('\'')).assertTrue();
      expect(list21.has('"')).assertFalse();
    });

    /**
     * @tc.number    SUB_LIST_TEST04_1100
     * @tc.name      testList04Chapter0011
     * @tc.desc      Test has interface with hex/octal escape strings ("/?/\0/\x61)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList04Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList04Chapter0011';
      console.log(TAG + ' start');
      const escapeStrDoubleQuote: string = '"';
      const list22: List<string> = new List<string>([escapeStrDoubleQuote]);
      const escapeStrQuestion: string = '?';
      const list23: List<string> = new List<string>([escapeStrQuestion]);
      const escapeStrNull: string = '\0';
      const list24: List<string> = new List<string>([escapeStrNull]);
      const escapeStrOctal: string = '\x61';
      const list25: List<string> = new List<string>([escapeStrOctal]);
      const escapeStrHex: string = '\x61';
      const list26: List<string> = new List<string>([escapeStrHex]);
      expect(list22.has('"')).assertTrue();
      expect(list23.has('?')).assertTrue();
      expect(list24.has(escapeStrNull)).assertTrue();
      expect(list25.has('a')).assertTrue();
      expect(list26.has('a')).assertTrue();
      expect(list26.has('b')).assertFalse();
    });

    /**
     * @tc.number    SUB_LIST_TEST04_1200
     * @tc.name      testList04Chapter0012
     * @tc.desc      Test has interface with emoji strings (verify emoji vs Unicode consistency)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList04Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList04Chapter0012';
      console.log(TAG + ' start');
      const emoji1: string = '👆';
      const emojiUnicode1: string = '\ud83d\udc46';
      const list27: List<string> = new List<string>([emoji1]);
      const emoji2: string = '👿';
      const emojiUnicode2: string = '\ud83d\udc7f';
      const list28: List<string> = new List<string>([emoji2]);
      const emoji3: string = '👀';
      const emojiUnicode3: string = '\ud83d\udc40';
      const list29: List<string> = new List<string>([emoji3]);
      const emoji4: string = '💯';
      const emojiUnicode4: string = '\ud83d\udcaf';
      const list30: List<string> = new List<string>([emoji4]);
      const emoji5: string = '🎅';
      const emojiUnicode5: string = '\ud83c\udf85';
      const list31: List<string> = new List<string>([emoji5]);
      expect(list27.has(emojiUnicode1)).assertTrue();
      expect(list28.has(emojiUnicode2)).assertTrue();
      expect(list29.has(emojiUnicode3)).assertTrue();
      expect(list30.has(emojiUnicode4)).assertTrue();
      expect(list31.has(emojiUnicode5)).assertTrue();
      expect(list31.has('🎄')).assertFalse();
    });

    /**
     * @tc.number    SUB_LIST_TEST04_1300
     * @tc.name      testList04Chapter0013
     * @tc.desc      Test has interface with special unicode strings (invalid Unicode/keywords/treeString)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList04Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList04Chapter0013';
      console.log(TAG + ' start');
      const emoji6: string = '🀄';
      const list32: List<string> = new List<string>([emoji6]);
      const emoji7: string = '🏴';
      const list33: List<string> = new List<string>([emoji7]);
      const invalidUnicodeStr: string = '\udc04\ud83d\udff4';
      const list34: List<string> = new List<string>([invalidUnicodeStr]);
      const keywordStr1: string = '0';
      const keywordStr2: string = 'NaN';
      const keywordStr3: string = '';
      const list35_1: List<string> = new List<string>([keywordStr1]);
      const list35_2: List<string> = new List<string>([keywordStr2]);
      const list35_3: List<string> = new List<string>([keywordStr3]);
      const initTreeString = (size: number): string => {
        let ans = '[';
        while (ans.length < size) {
          ans += '{"a":1},';
        }
        ans += '{"a":1}]';
        return ans;
      };
      const treeStr: string = initTreeString(100);
      const list36: List<string> = new List<string>([treeStr]);
      expect(list32.has(emoji6)).assertTrue();
      expect(list33.has(emoji7)).assertTrue();
      expect(list34.has(invalidUnicodeStr)).assertTrue();
      expect(list35_1.has(keywordStr1)).assertTrue();
      expect(list35_2.has(keywordStr2)).assertTrue();
      expect(list35_3.has(keywordStr3)).assertTrue();
      expect(list36.has(treeStr)).assertTrue();
      expect(list36.has('[]')).assertFalse();
    });

    /**
     * @tc.number    SUB_LIST_TEST04_1400
     * @tc.name      testList04Chapter0014
     * @tc.desc      Test has interface with sliceString/large string/GC (avoid OOM with logic verification)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList04Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList04Chapter0014';
      console.log(TAG + ' start');
      let str: string = "{k1:value1,k2:value2}";
      let result: string = str.substring(0, str.length - 2);
      for (let i = 0; i < 10; i++) {
        result = result.substring(0, result.length - 1);
      }
      const list37: List<string> = new List<string>([result]);
      const bigStr: string = 'a';
      const list38: List<string> = new List<string>([bigStr]);
      let gcTestStr: string = 'a';
      const list39: List<string> = new List<string>([gcTestStr]);
      expect(list37.has(result)).assertTrue();
      expect(list38.has(bigStr)).assertTrue();
      expect(list39.has(gcTestStr)).assertTrue();
      expect(list39.has('b')).assertFalse();
      gcTestStr = '';
      list39.clear();
      expect(list39.has('a')).assertFalse();
    });

    /**
     * @tc.number    SUB_LIST_TEST04_1500
     * @tc.name      testList04Chapter0015
     * @tc.desc      Test has interface with special number values (0/NaN/-0/Infinity/-Infinity/undefined)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList04Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList04Chapter0015';
      console.log(TAG + ' start');
      const basicValues = [0, NaN, -0, Infinity, -Infinity, undefined] as (number | undefined)[];
      const listConstructor = new List<number | undefined>(basicValues);
      expect(listConstructor.has(-0)).assertTrue();
      expect(listConstructor.has(NaN)).assertTrue();
      expect(listConstructor.has(Infinity)).assertTrue();
      expect(listConstructor.has(-Infinity)).assertTrue();
      expect(listConstructor.has(undefined)).assertTrue();
      expect(listConstructor.has(1)).assertFalse();
      const listAdd = new List<number | undefined>();
      listAdd.add(0);
      listAdd.add(NaN);
      listAdd.add(-0);
      listAdd.add(Infinity);
      listAdd.add(-Infinity);
      listAdd.add(undefined);
      expect(listAdd.has(NaN)).assertTrue();
      expect(listAdd.has(-0)).assertTrue();
      expect(listAdd.has(100)).assertFalse();
      const listInsert = new List<number>([10]);
      listInsert.insert(1, NaN);
      listInsert.insert(0, -Infinity);
      listInsert.insert(5, Infinity);
      listInsert.insert(2, -0);
      expect(listInsert.has(-Infinity)).assertTrue();
      expect(listInsert.has(NaN)).assertTrue();
      expect(listInsert.has(10)).assertTrue();
      expect(listInsert.has(20)).assertFalse();
    });

    /**
     * @tc.number    SUB_LIST_TEST04_1600
     * @tc.name      testList04Chapter0016
     * @tc.desc      Test has interface with extreme number values (MAX_VALUE/MIN_VALUE/EPSILON/MAX_SAFE_INTEGER)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList04Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList04Chapter0016';
      console.log(TAG + ' start');
      const extremeValues = [
        Number.MAX_VALUE,
        Number.MIN_VALUE,
        Number.EPSILON,
        Number.MAX_SAFE_INTEGER
      ];
      const listConstructor = new List<number>(extremeValues);
      expect(listConstructor.has(Number.MAX_VALUE)).assertTrue();
      expect(listConstructor.has(Number.MIN_VALUE)).assertTrue();
      expect(listConstructor.has(Number.EPSILON)).assertTrue();
      expect(listConstructor.has(Number.MAX_SAFE_INTEGER)).assertTrue();
      expect(listConstructor.has(1)).assertFalse();
      const listAdd = new List<number>();
      extremeValues.forEach(val => listAdd.add(val));
      expect(listAdd.has(Number.MAX_VALUE)).assertTrue();
      expect(listAdd.has(Number.MAX_SAFE_INTEGER)).assertTrue();
      expect(listAdd.has(Number.MIN_SAFE_INTEGER)).assertFalse();
      const listInsert = new List<number>([0]);
      listInsert.insert(1, Number.MAX_VALUE);
      listInsert.insert(0, Number.MIN_VALUE);
      listInsert.insert(5, Number.MAX_SAFE_INTEGER);
      expect(listInsert.has(Number.MIN_VALUE)).assertTrue();
      expect(listInsert.has(Number.MAX_VALUE)).assertTrue();
      expect(listInsert.has(Number.MAX_SAFE_INTEGER)).assertTrue();
      expect(listInsert.has(0)).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEST04_1700
     * @tc.name      testList04Chapter0017
     * @tc.desc      Test has interface with precision number values (byte/short/int/long/float/double/char)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList04Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList04Chapter0017';
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
      expect(listByte.has(-128)).assertTrue();
      expect(listByte.has(127)).assertTrue();
      expect(listByte.has(0)).assertFalse();
      const listShort = new List<number>(precisionValues.short);
      expect(listShort.has(32767)).assertTrue();
      expect(listShort.has(32768)).assertTrue();
      const listChar = new List<number>(precisionValues.char);
      expect(listChar.has(65)).assertTrue();
      expect(listChar.has(97)).assertTrue();
      const listLong = new List<bigint>(precisionValues.long);
      expect(listLong.has(-9223372036854775808n)).assertTrue();
      expect(listLong.has(9223372036854775807n)).assertTrue();
      const listAdd = new List<number | bigint>();
      listAdd.add(precisionValues.byte[0]);
      listAdd.add(precisionValues.short[1]);
      listAdd.add(precisionValues.int[0]);
      listAdd.add(precisionValues.long[1]);
      listAdd.add(precisionValues.float[1]);
      listAdd.add(precisionValues.char[1]);
      expect(listAdd.has(-128)).assertTrue();
      expect(listAdd.has(9223372036854775807n)).assertTrue();
      expect(listAdd.has(3.40282346638528860e+38)).assertTrue();
      const listInsert = new List<number | bigint>([0]);
      listInsert.insert(1, precisionValues.int[1]);
      listInsert.insert(0, precisionValues.float[0]);
      listInsert.insert(5, precisionValues.double[1]);
      listInsert.insert(2, precisionValues.char[2]);
      expect(listInsert.has(1.40129846432481707e-45)).assertTrue();
      expect(listInsert.has(65)).assertTrue();
      expect(listInsert.has(2147483647)).assertTrue();
      expect(listInsert.has(1.79769313486231570e+308)).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEST04_1800
     * @tc.name      testList04Chapter0018
     * @tc.desc      Test has interface with base expression number values (hex/octal/sci/exponent)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList04Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList04Chapter0018';
      console.log(TAG + ' start');
      const baseExprValues: NumberBaseExprValues = {
        hex16: 0x0102,
        hex32: 0x01020304,
        octal: 0o3,
        sci1: 1e3,
        sci2: 2.5e-2,
        exponent: 2**3,
        floatHex: 0xcafebabe
      };
      const listConstructor = new List<number>([
        baseExprValues.hex16,
        baseExprValues.hex32,
        baseExprValues.octal,
        baseExprValues.sci1,
        baseExprValues.exponent
      ]);
      expect(listConstructor.has(258)).assertTrue();
      expect(listConstructor.has(16909060)).assertTrue();
      expect(listConstructor.has(3)).assertTrue();
      expect(listConstructor.has(1000)).assertTrue();
      expect(listConstructor.has(8)).assertTrue();
      expect(listConstructor.has(9)).assertFalse();
      const listAdd = new List<number>();
      listAdd.add(baseExprValues.sci2);
      listAdd.add(baseExprValues.floatHex);
      listAdd.add(baseExprValues.exponent);
      expect(listAdd.has(0.025)).assertTrue();
      expect(listAdd.has(3405691582)).assertTrue();
      expect(listAdd.has(8)).assertTrue();
      const listInsert = new List<number>([100]);
      listInsert.insert(1, baseExprValues.hex16);
      listInsert.insert(0, baseExprValues.sci1);
      listInsert.insert(5, baseExprValues.exponent);
      expect(listInsert.has(1000)).assertTrue();
      expect(listInsert.has(258)).assertTrue();
      expect(listInsert.has(8)).assertTrue();
      expect(listInsert.has(100)).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEST04_1900
     * @tc.name      testList04Chapter0019
     * @tc.desc      Test has interface with bigint values (remove redundant BigInt wrapper)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList04Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList04Chapter0019';
      console.log(TAG + ' start');

      const bigIntValues = [
        0xdecafafecacefaden,
        9007199254740991n,
        -9223372036854775808n,
        123.456,
        18446744073709551615n
      ];
      const listConstructor = new List<bigint | number>(bigIntValues);
      expect(listConstructor.has(0xdecafafecacefaden)).assertTrue();
      expect(listConstructor.has(9007199254740991n)).assertTrue();
      expect(listConstructor.has(123.456)).assertTrue();
      expect(listConstructor.has(18446744073709551615n)).assertTrue();
      const listAdd = new List<bigint | number>();
      listAdd.add(0xdecafafecacefaden);
      listAdd.add(123.456);
      listAdd.add(18446744073709551616n);
      listAdd.add(9007199254740991);
      expect(listAdd.has(0xdecafafecacefaden)).assertTrue();
      expect(listAdd.has(123.456)).assertTrue();
      expect(listAdd.has(18446744073709551616n)).assertTrue();
      const listInsert = new List<bigint | number>([0n]);
      listInsert.insert(1, 123.456);
      listInsert.insert(0, -9223372036854775808n);
      listInsert.insert(5, 18446744073709551616n);
      expect(listInsert.has(-9223372036854775808n)).assertTrue();
      expect(listInsert.has(123.456)).assertTrue();
      expect(listInsert.has(18446744073709551616n)).assertTrue();
      expect(listInsert.has(0n)).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEST04_2000
     * @tc.name      testList04Chapter0020
     * @tc.desc      Test has interface with basic boolean values (true/false via constructor/add/insert)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList04Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList04Chapter0020';
      console.log(TAG + ' start');
      const basicValues: boolean[] = [true, false];
      const listConstructor = new List<boolean>(basicValues);
      expect(listConstructor.has(true)).assertTrue();
      expect(listConstructor.has(false)).assertTrue();
      const listAdd = new List<boolean>();
      listAdd.add(true);
      listAdd.add(false);
      expect(listAdd.has(true)).assertTrue();
      expect(listAdd.has(false)).assertTrue();
      const listInsert = new List<boolean>([true]);
      listInsert.insert(1, false);
      listInsert.insert(0, true);
      listInsert.insert(5, false);
      expect(listInsert.has(true)).assertTrue();
      expect(listInsert.has(false)).assertTrue();
      expect(listInsert.has(Boolean(0))).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEST04_2100
     * @tc.name      testList04Chapter0021
     * @tc.desc      Test has interface with false-like values (0/NaN/""//null/undefined/!'s')
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList04Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList04Chapter0021';
      console.log(TAG + ' start');
      const falseLikeValues: (number | string | null | undefined | boolean)[] = [0, NaN, "", null, undefined, !'s'];
      const listConstructor = new List<number | string | null | undefined | boolean>(falseLikeValues);
      expect(listConstructor.has(0)).assertTrue();
      expect(listConstructor.has(NaN)).assertTrue();
      expect(listConstructor.has("")).assertTrue();
      expect(listConstructor.has(null)).assertTrue();
      expect(listConstructor.has(undefined)).assertTrue();
      expect(listConstructor.has(false)).assertTrue();
      const listAdd = new List<number | string | null | undefined | boolean>();
      falseLikeValues.forEach(val => listAdd.add(val));
      expect(listAdd.has(0)).assertTrue();
      expect(listAdd.has(NaN)).assertTrue();
      expect(listAdd.has("")).assertTrue();
      expect(listAdd.has(null)).assertTrue();
      expect(listAdd.has(undefined)).assertTrue();
      expect(listAdd.has(false)).assertTrue();
      const listInsert = new List<boolean>([true]);
      listInsert.insert(1, Boolean(0));
      listInsert.insert(0, Boolean(NaN));
      listInsert.insert(5, Boolean(""));
      listInsert.insert(2, !'s');
      expect(listInsert.has(false)).assertTrue();
      expect(listInsert.has(true)).assertTrue();
      expect(listInsert.has(Boolean(1))).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEST04_2200
     * @tc.name      testList04Chapter0022
     * @tc.desc      Test has interface with true-like values (!0/1/non-empty str/EmptyObject/array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList04Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList04Chapter0022';
      console.log(TAG + ' start');

      const emptyObj = new EmptyObject();
      const trueLikeValues: (boolean | number | string | EmptyObject | number[])[] =
        [!0, 1, "non-empty", emptyObj, [1]];
      const listConstructor = new List<boolean | number | string | EmptyObject | number[]>(trueLikeValues);
      expect(listConstructor.has(true)).assertTrue();
      expect(listConstructor.has(1)).assertTrue();
      expect(listConstructor.has("non-empty")).assertTrue();
      expect(listConstructor.has(emptyObj)).assertTrue();
      expect(listConstructor.has([1])).assertFalse();
      const listAdd = new List<boolean | number | string | EmptyObject | number[]>();
      trueLikeValues.forEach(val => listAdd.add(val));
      expect(listAdd.has(true)).assertTrue();
      expect(listAdd.has(1)).assertTrue();
      expect(listAdd.has("non-empty")).assertTrue();
      const listInsert = new List<boolean>([false]);
      listInsert.insert(1, !0);
      listInsert.insert(0, Boolean(1));
      listInsert.insert(5, Boolean("non-empty"));
      expect(listInsert.has(true)).assertTrue();
      expect(listInsert.has(false)).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEST04_2300
     * @tc.name      testList04Chapter0023
     * @tc.desc      Test has interface with mixed values (boolean/number/string/null/undefined/EmptyObject/array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList04Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList04Chapter0023';
      console.log(TAG + ' start');
      const emptyObj = new EmptyObject();
      const mixedValues: (boolean | number | string | null | undefined | EmptyObject | number[])[] = [
        true, false, 0, NaN, "", null, undefined, !'s', !0,
        123, "", "test", emptyObj, [1]
      ];
      const listConstructor =
        new List<boolean | number | string | null | undefined | EmptyObject | number[]>(mixedValues);
      expect(listConstructor.has(true)).assertTrue();
      expect(listConstructor.has(false)).assertTrue();
      expect(listConstructor.has(0)).assertTrue();
      expect(listConstructor.has(NaN)).assertTrue();
      expect(listConstructor.has("")).assertTrue();
      expect(listConstructor.has(null)).assertTrue();
      expect(listConstructor.has(undefined)).assertTrue();
      expect(listConstructor.has(123)).assertTrue();
      expect(listConstructor.has("test")).assertTrue();
      expect(listConstructor.has(emptyObj)).assertTrue();
      const listAdd = new List<boolean | number | string | null | undefined | EmptyObject | number[]>();
      listAdd.add(true);
      listAdd.add(0);
      listAdd.add(null);
      listAdd.add(!0);
      listAdd.add("test");
      listAdd.add([1, 2]);
      expect(listAdd.has(true)).assertTrue();
      expect(listAdd.has(0)).assertTrue();
      expect(listAdd.has(null)).assertTrue();
      expect(listAdd.has("test")).assertTrue();
      const listInsert = new List<boolean | undefined>([true, false]);
      listInsert.insert(2, Boolean(NaN));
      listInsert.insert(0, !0);
      listInsert.insert(10, undefined);
      listInsert.insert(3, Boolean("non-empty"));
      expect(listInsert.has(true)).assertTrue();
      expect(listInsert.has(false)).assertTrue();
      expect(listInsert.has(undefined)).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEST04_2400
     * @tc.name      testList04Chapter0024
     * @tc.desc      Test has interface with basic objects (NormalObject/NestedObject/EmptyObject)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList04Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList04Chapter0024';
      console.log(TAG + ' start');
      const normalObj = new NormalObject(1, "test", [1, 2, 3]);
      const nestedObj = new NestedObject(1, new NestedLevel2(2, new NestedLevel3(3)));
      const emptyObj = new EmptyObject();
      const listNormal = new List<NormalObject>([normalObj]);
      expect(listNormal.has(normalObj)).assertTrue();
      expect(listNormal.has(new NormalObject(1, "test", [1, 2, 3]))).assertFalse();
      const listNested = new List<NestedObject>([nestedObj]);
      expect(listNested.has(nestedObj)).assertTrue();
      const listEmpty = new List<EmptyObject>([emptyObj]);
      expect(listEmpty.has(emptyObj)).assertTrue();
      const listAdd = new List<Object>();
      listAdd.add(normalObj);
      listAdd.add(nestedObj);
      listAdd.add(emptyObj);
      expect(listAdd.has(normalObj)).assertTrue();
      expect(listAdd.has(nestedObj)).assertTrue();
      expect(listAdd.has(emptyObj)).assertTrue();
      const newObj = new NormalObject(4, "new", [4, 5, 6]);
      const listInsert = new List<Object>([normalObj]);
      listInsert.insert(1, nestedObj);
      listInsert.insert(0, emptyObj);
      listInsert.insert(5, newObj);
      expect(listInsert.has(emptyObj)).assertTrue();
      expect(listInsert.has(nestedObj)).assertTrue();
      expect(listInsert.has(newObj)).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEST04_2500
     * @tc.name      testList04Chapter0025
     * @tc.desc      Test has interface with special objects (SpecialKeyObject/InheritObject/NonEnumObject)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList04Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList04Chapter0025';
      console.log(TAG + ' start');
      const specialKeyObj = new SpecialKeyObject("value", 1);
      const inheritObj = new InheritObject(1);
      const nonEnumObj = new NonEnumObject(1);
      const newSpecialObj = new SpecialKeyObject("newValue", 2);
      const listSpecial = new List<SpecialKeyObject>([specialKeyObj]);
      expect(listSpecial.has(specialKeyObj)).assertTrue();
      expect(listSpecial.has(newSpecialObj)).assertFalse();
      const listInherit = new List<InheritObject>([inheritObj]);
      expect(listInherit.has(inheritObj)).assertTrue();
      const listNonEnum = new List<NonEnumObject>([nonEnumObj]);
      expect(listNonEnum.has(nonEnumObj)).assertTrue();
      const listAdd = new List<Object>();
      listAdd.add(specialKeyObj);
      listAdd.add(inheritObj);
      listAdd.add(nonEnumObj);
      expect(listAdd.has(specialKeyObj)).assertTrue();
      expect(listAdd.has(inheritObj)).assertTrue();
      expect(listAdd.has(nonEnumObj)).assertTrue();
      const listInsert = new List<Object>([specialKeyObj]);
      listInsert.insert(1, inheritObj);
      listInsert.insert(0, nonEnumObj);
      listInsert.insert(5, newSpecialObj);
      expect(listInsert.has(nonEnumObj)).assertTrue();
      expect(listInsert.has(inheritObj)).assertTrue();
      expect(listInsert.has(newSpecialObj)).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEST04_2600
     * @tc.name      testList04Chapter0026
     * @tc.desc      Test has interface with binary objects (BufferObject/DataViewObject/TypedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList04Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList04Chapter0026';
      console.log(TAG + ' start');
      const bufferObj = new BufferObject(new ArrayBuffer(16));
      const dataViewObj = new DataViewObject(new DataView(new ArrayBuffer(16)));
      const typedArrayObj = new BufferObject(createUint8Array([72, 101, 108, 108, 111]));
      const newTypedObj = new BufferObject(new Int16Array([1234]));
      const listBuffer = new List<BufferObject>([bufferObj]);
      expect(listBuffer.has(bufferObj)).assertTrue();
      expect(listBuffer.has(typedArrayObj)).assertFalse();
      const listDataView = new List<DataViewObject>([dataViewObj]);
      expect(listDataView.has(dataViewObj)).assertTrue();
      const listTypedArray = new List<BufferObject>([typedArrayObj]);
      expect(listTypedArray.has(typedArrayObj)).assertTrue();
      const listAdd = new List<Object>();
      listAdd.add(bufferObj);
      listAdd.add(dataViewObj);
      listAdd.add(typedArrayObj);
      expect(listAdd.has(bufferObj)).assertTrue();
      expect(listAdd.has(dataViewObj)).assertTrue();
      expect(listAdd.has(typedArrayObj)).assertTrue();
      const listInsert = new List<Object>([bufferObj]);
      listInsert.insert(1, dataViewObj);
      listInsert.insert(0, typedArrayObj);
      listInsert.insert(5, newTypedObj);
      expect(listInsert.has(typedArrayObj)).assertTrue();
      expect(listInsert.has(dataViewObj)).assertTrue();
      expect(listInsert.has(newTypedObj)).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEST04_2700
     * @tc.name      testList04Chapter0027
     * @tc.desc      Test has interface with collection objects (map/set/func/regex/promise)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList04Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testList04Chapter0027';
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

      const listMap = new List<MapObject>([mapObj]);
      expect(listMap.has(mapObj)).assertTrue();
      const listSet = new List<SetObject>([setObj]);
      expect(listSet.has(setObj)).assertTrue();
      const listFunc = new List<FuncObject>([funcObj]);
      expect(listFunc.has(funcObj)).assertTrue();
      const listRegex = new List<RegexObject>([regexObj]);
      expect(listRegex.has(regexObj)).assertTrue();
      const listAdd = new List<Object>();
      listAdd.add(mapObj);
      listAdd.add(setObj);
      listAdd.add(funcObj);
      listAdd.add(regexObj);
      listAdd.add(promiseObj);
      expect(listAdd.has(mapObj)).assertTrue();
      expect(listAdd.has(setObj)).assertTrue();
      expect(listAdd.has(funcObj)).assertTrue();
      expect(listAdd.has(regexObj)).assertTrue();
      expect(listAdd.has(promiseObj)).assertTrue();
      const listInsert = new List<Object>([mapObj]);
      listInsert.insert(1, setObj);
      listInsert.insert(0, funcObj);
      listInsert.insert(5, regexObj);
      listInsert.insert(3, promiseObj);
      expect(listInsert.has(funcObj)).assertTrue();
      expect(listInsert.has(mapObj)).assertTrue();
      expect(listInsert.has(setObj)).assertTrue();
      expect(listInsert.has(promiseObj)).assertTrue();
      expect(listInsert.has(regexObj)).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEST04_2800
     * @tc.name      testList04Chapter0028
     * @tc.desc      Test has interface with special value objects (undefined/null/NaN/Infinity)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList04Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList04Chapter0028';
      console.log(TAG + ' start');

      const specialValObj = new SpecialValueObject(NaN, Infinity, -Infinity);
      specialValObj.a = undefined;
      specialValObj.b = null;

      const specialValExtObj = new SpecialValueExtObject(NaN, -Infinity);

      const insertObj1 = new SpecialValueInsertObject(undefined, undefined, undefined, null);
      const insertObj2 = new SpecialValueInsertObject(NaN);
      const insertObj3 = new SpecialValueInsertObject(undefined, Infinity);

      const listSpecialVal = new List<SpecialValueObject>([specialValObj]);
      expect(listSpecialVal.has(specialValObj)).assertTrue();
      const listAdd = new List<Object>();
      listAdd.add(specialValObj);
      listAdd.add(specialValExtObj);
      expect(listAdd.has(specialValObj)).assertTrue();
      expect(listAdd.has(specialValExtObj)).assertTrue();
      const listInsert = new List<Object>([specialValObj]);
      listInsert.insert(1, insertObj1);
      listInsert.insert(0, insertObj2);
      listInsert.insert(5, insertObj3);
      expect(listInsert.has(insertObj2)).assertTrue();
      expect(listInsert.has(specialValObj)).assertTrue();
      expect(listInsert.has(insertObj1)).assertTrue();
      expect(listInsert.has(insertObj3)).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEST04_2900
     * @tc.name      testList04Chapter0029
     * @tc.desc      Test has interface with large object, mixed-type object, small object and new key object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList04Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList04Chapter0029'; // 修正错误的TAG值
      console.log(TAG + ' start');

      const largeObj = new LargeObject(10000);
      const mixedObj = new MixedObject(
        123,
        "test",
        true,
        null,
        new NestedLevel2(456, new NestedLevel3(0)),
        new Map([['key', 'val']]),
        new Set([1, 2, 3]),
        /abc/,
        new ArrayBuffer(8)
      );
      const smallObj = new SmallObject(1);
      const newKeyObj = new NewKeyObject("newVal");

      const listLarge = new List<LargeObject>([largeObj]);
      expect(listLarge.has(largeObj)).assertTrue();
      const listMixed = new List<MixedObject>([mixedObj]);
      expect(listMixed.has(mixedObj)).assertTrue();
      const listAdd = new List<Object>();
      listAdd.add(largeObj);
      listAdd.add(mixedObj);
      expect(listAdd.has(largeObj)).assertTrue();
      expect(listAdd.has(mixedObj)).assertTrue();
      const listInsert = new List<Object>([largeObj]);
      listInsert.insert(1, mixedObj);
      listInsert.insert(0, smallObj);
      listInsert.insert(5, newKeyObj);
      expect(listInsert.has(smallObj)).assertTrue();
      expect(listInsert.has(largeObj)).assertTrue();
      expect(listInsert.has(mixedObj)).assertTrue();
      expect(listInsert.has(newKeyObj)).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEST04_3000
     * @tc.name      testList04Chapter0030
     * @tc.desc      Test has interface with different base BigInt and IEEE 754 unsafe integers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList04Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList04Chapter0030';
      console.log(TAG + ' start');

      const binaryBigInt = 0b1111011n;
      const octalBigInt = 0o173n;
      const hexBigInt = 0x7Bn;
      const ultraBigInt = 1234567890123456789012345678901234567890n;

      const safeIntMax = Number.MAX_SAFE_INTEGER;
      const unsafeInt1 = safeIntMax + 1;
      const unsafeInt2 = safeIntMax + 2;
      const epsValue = 0.1 + Number.EPSILON;

      const list = new List<bigint | number>();
      list.add(binaryBigInt);
      list.add(octalBigInt);
      list.add(hexBigInt);
      list.add(ultraBigInt);
      list.add(safeIntMax);
      list.add(unsafeInt1);
      list.add(unsafeInt2);
      list.add(epsValue);
      expect(list.has(123n)).assertTrue();
      expect(list.has(ultraBigInt)).assertTrue();
      expect(list.has(safeIntMax)).assertTrue();
      expect(list.has(unsafeInt1)).assertTrue();
      expect(list.has(epsValue)).assertTrue();
      expect(list.has(0.1)).assertFalse();
    });
  })
}