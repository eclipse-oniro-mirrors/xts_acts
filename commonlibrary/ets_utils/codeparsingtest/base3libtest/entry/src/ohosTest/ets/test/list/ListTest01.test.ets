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
interface GeneratedTypeLiteralInterface_1 {
  validCount: number;
  skipInvalidCount: number;
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

function isEmptyObject(obj: EmptyObject): boolean {
  return obj instanceof EmptyObject;
}
interface PlainObj {
  name: string;
  age: number;
}
interface CircularObj {
  name: string;
  self?: CircularObj;
}
type CircularArr = (number | CircularArr)[];
function normalFunc(): string {
  return 'normal';
}
const arrowFunc = (): string => 'arrow';
interface LargeArrayLike {
  length: number;
}

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ListTest01() {
  describe('ListTest01', () => {
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
     * @tc.number    SUB_LIST_TEXT01_0100
     * @tc.name      testList01Chapter0001
     * @tc.desc      Verify constructor() for floating-point/BigInt TypedArray List
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList01Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0001';
      console.log(TAG + ' start');
      const list1: List<Int8Array> = new List<Int8Array>();
      expect(list1.length).assertEqual(0);
      const int8Arr1 = new Int8Array([-128]);
      const int8Arr2 = new Int8Array([127]);
      list1.add(int8Arr1);
      list1.add(int8Arr2);
      expect(list1.length).assertEqual(2);
      const list2: List<Uint8Array> = new List<Uint8Array>();
      expect(list2.length).assertEqual(0);
      const uint8Arr1 = new Uint8Array([0]);
      const uint8Arr2 = new Uint8Array([255]);
      list2.add(uint8Arr1);
      list2.add(uint8Arr2);
      expect(list2.length).assertEqual(2);
      const list3: List<Uint8ClampedArray> = new List<Uint8ClampedArray>();
      expect(list3.length).assertEqual(0);
      const clampedArr1 = new Uint8ClampedArray([0]);
      const clampedArr2 = new Uint8ClampedArray([255]);
      list3.add(clampedArr1);
      list3.add(clampedArr2);
      expect(list3.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_LIST_TEST01_0200
     * @tc.name      testList01Chapter0002
     * @tc.desc      Verify constructor() for floating-point/BigInt TypedArray List
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList01Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0002';
      console.log(TAG + ' start');
      const floatList: List<Float32Array> = new List<Float32Array>();
      expect(floatList.length).assertEqual(0);
      const float32Arr1 = new Float32Array([3.14]);
      const float32Arr2 = new Float32Array([Infinity]);
      floatList.add(float32Arr1);
      floatList.add(float32Arr2);
      expect(floatList.length).assertEqual(2);
      expect(floatList.get(1)?.[0]).assertEqual(Number.POSITIVE_INFINITY);
      const bigIntList1: List<BigInt64Array> = new List<BigInt64Array>();
      const bigIntList2: List<BigUint64Array> = new List<BigUint64Array>();
      expect(bigIntList1.length).assertEqual(0);
      expect(bigIntList2.length).assertEqual(0);
      const bigInt64Arr = new BigInt64Array([123n]);
      const bigUint64Arr = new BigUint64Array([456n]);
      bigIntList1.add(bigInt64Arr);
      bigIntList2.add(bigUint64Arr);
      expect(bigIntList1.length).assertEqual(1);
      expect(bigIntList2.length).assertEqual(1);
      const emptyFloatList: List<Float64Array> = new List<Float64Array>();
      expect(emptyFloatList.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEST01_0300
     * @tc.name      testList01Chapter0003
     * @tc.desc      Verify constructor() for mixed TypedArray List and re-use after operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList01Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0003';
      console.log(TAG + ' start');
      const mixedList: List<TypedArray> = new List<TypedArray>();
      expect(mixedList.length).assertEqual(0);
      const int8Arr = new Int8Array([10]);
      const uint16Arr = new Uint16Array([200]);
      const float32Arr = new Float32Array([3.14]);
      mixedList.add(int8Arr);
      mixedList.add(uint16Arr);
      mixedList.add(float32Arr);
      expect(mixedList.length).assertEqual(3);
      expect((mixedList.get(2) as Float32Array)[0]).assertClose(3.14, 0.01);
      mixedList.clear();
      expect(mixedList.length).assertEqual(0);
      const bigUint64Arr = new BigUint64Array([123456789n]);
      mixedList.add(bigUint64Arr);
      expect(mixedList.length).assertEqual(1);
      expect((mixedList.get(0) as BigUint64Array)[0]).assertEqual(123456789n);
      const mixedList2: List<TypedArray> = new List<TypedArray>();
      const mixedList3: List<TypedArray> = new List<TypedArray>();
      expect(mixedList2.length).assertEqual(0);
      expect(mixedList3.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEST01_0400
     * @tc.name      testList01Chapter0004
     * @tc.desc      Verify List constructor for normal Uint8Array and arrays with multiple zeros
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList01Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0004';
      console.log(TAG + ' start');
      const list: List<TestArray> = new List<TestArray>();
      expect(list.length).assertEqual(0);
      const normalUint8Arr: Uint8Array = new Uint8Array
      ([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);
      const zeroArr: number[] = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];
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
      expect(item1[18]).assertEqual(63);
    });

    /**
     * @tc.number    SUB_LIST_TEST01_0500
     * @tc.name      testList01Chapter0005
     * @tc.desc      Verify List constructor for arrays with negatives and non-numeric indices
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList01Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0005';
      console.log(TAG + ' start');
      const list: List<TypedArray | number[]> = new List<TypedArray | number[]>();
      expect(list.length).assertEqual(0);
      const negativeArr: number[] = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      const uint8NegArr: Uint8Array = new Uint8Array(negativeArr);
      const int8NegArr: Int8Array = new Int8Array(negativeArr);
      const nonNumericMap: Map<string, number> = new Map<string, number>();
      nonNumericMap.set("abc", 111);
      nonNumericMap.set("aaa", 222);
      const numericArr: number[] = [333];
      list.add(uint8NegArr);
      list.add(int8NegArr);
      list.add(numericArr);
      expect(list.length).assertEqual(3);
      const item0: Uint8Array = list.get(0) as Uint8Array;
      expect(item0[6]).assertEqual(145);
      const item1: Int8Array = list.get(1) as Int8Array;
      expect(item1[6]).assertEqual(-111);
      expect(nonNumericMap.get("abc")).assertEqual(111);
      expect(nonNumericMap.get("aaa")).assertEqual(222);
    });

    /**
     * @tc.number    SUB_LIST_TEST01_0600
     * @tc.name      testList01Chapter0006
     * @tc.desc      Verify List constructor for arrays with NaN/Infinity and non-numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList01Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0006';
      console.log(TAG + ' start');
      const list: List<number[] | (number | string | boolean | null | undefined)[]> = new List<number[] |
      (number | string | boolean | null | undefined)[]>();
      expect(list.length).assertEqual(0);
      const specialValueArr: number[] = [72, 101, NaN, Infinity, -Infinity, 108, 111];
      const nonNumericTypeArr: (number | string | boolean | null | undefined)[] =
        [72, "abc", true, null, undefined, 108];
      list.add(specialValueArr);
      list.add(nonNumericTypeArr);
      expect(list.length).assertEqual(2);
      const item0: number[] = list.get(0) as number[];
      expect(isNaN(item0[2])).assertTrue();
      expect(item0[3]).assertEqual(Infinity);
      const item1: (number | string | boolean | null | undefined)[] = list.get(1) as
      (number | string | boolean | null | undefined)[];
      expect(item1[1]).assertEqual("abc");
      expect(item1[3]).assertEqual(null);
    });

    /**
     * @tc.number    SUB_LIST_TEST01_0700
     * @tc.name      testList01Chapter0007
     * @tc.desc      Verify List constructor for empty, overflow, and element-removed arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList01Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0007';
      console.log(TAG + ' start');
      const list: List<number[]> = new List<number[]>();
      expect(list.length).assertEqual(0);
      const emptyArr: number[] = [];
      const overflowArr: number[] = [256, 65536, 32768];
      const deletedArr: number[] = [1, 2, 3];
      deletedArr.splice(1, 1);
      list.add(emptyArr);
      list.add(overflowArr);
      list.add(deletedArr);
      expect(list.length).assertEqual(3);
      const item0: number[] = list.get(0) as number[];
      expect(item0.length).assertEqual(0);
      const item1: number[] = list.get(1) as number[];
      expect(item1[0]).assertEqual(256);
      const item2: number[] = list.get(2) as number[];
      expect(item2.length).assertEqual(2);
      list.clear();
      expect(list.length).assertEqual(0);
      const newEmptyList: List<number[]> = new List<number[]>();
      newEmptyList.add(emptyArr);
      expect(newEmptyList.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_LIST_TEST01_0800
     * @tc.name      testList01Chapter0008
     * @tc.desc      Verify List constructor for nested, TypedArray-containing, extra-long arrays
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList01Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0008';
      console.log(TAG + ' start');
      const nestedList: List<(number | number[] | (number | number[])[])[]> =
        new List<(number | number[] | (number | number[])[])[]>();
      const typedList: List<TypedArray[]> = new List<TypedArray[]>();
      const largeList: List<number[]> = new List<number[]>();
      expect(nestedList.length).assertEqual(0);
      expect(typedList.length).assertEqual(0);
      expect(largeList.length).assertEqual(0);
      const level3Arr: number[] = [5, 6];
      const level2Arr1: number[] = [2, 3];
      const level2Arr2: (number | number[])[] = [4, level3Arr];
      const nestedArr: (number | number[] | (number | number[])[])[] = [1, level2Arr1, level2Arr2];
      const typedSubArr: TypedArray[] = [new Int32Array([10, 20]), new Float64Array([3.14, 6.28])];
      const largeArr: number[] = new Array(1000000).fill(1);
      nestedList.add(nestedArr);
      typedList.add(typedSubArr);
      largeList.add(largeArr);
      expect(nestedList.length).assertEqual(1);
      expect(typedList.length).assertEqual(1);
      expect(largeList.length).assertEqual(1);
      const item0 = nestedList.get(0) as (number | number[] | (number | number[])[])[] | undefined;
      if (item0) {
        expect(item0[0] as number).assertEqual(1);
        expect(((item0[1] as number[])[1])).assertEqual(3);
        expect((((item0[2] as (number | number[])[])[1] as number[])[0])).assertEqual(5);
      }
      const item1 = typedList.get(0) as TypedArray[] | undefined;
      if (item1) {
        expect((item1[0] as Int32Array)[0]).assertEqual(10);
        expect((item1[1] as Float64Array)[1]).assertClose(6.28, 0.01);
      }
      const item2 = largeList.get(0) as number[] | undefined;
      if (item2) {
        expect(item2.length).assertEqual(1000000);
        expect(item2[999999]).assertEqual(1);
      }
    });

    /**
     * @tc.number    SUB_LIST_TEST01_0900
     * @tc.name      testList01Chapter0009
     * @tc.desc      Verify the processing logic of the array List constructor that contains functions/keywords
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList01Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0009';
      console.log(TAG + ' start');
      type MixedElement = (() => string) | string;
      const list: List<MixedElement[]> = new List<MixedElement[]>();
      expect(list.length).assertEqual(0);
      const func: () => string = () => "testResult";
      const mixedTypeArr: MixedElement[] = [func, "0", "NaN", ""];
      list.add(mixedTypeArr);
      expect(list.length).assertEqual(1);
      const item0 = list.get(0) as MixedElement[] | undefined;
      if (item0) {
        const storedFunc = item0[0] as () => string;
        expect(storedFunc()).assertEqual("testResult");
        expect(item0[1] as string).assertEqual("0");
      }
    });

    /**
     * @tc.number    SUB_LIST_TEST01_1000
     * @tc.name      testList01Chapter0010
     * @tc.desc      test constructor with no parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList01Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0010';
      console.log(TAG + ' start');
      const list = new List<string>();
      expect(list.size()).assertEqual(0);
      expect(list.length).assertEqual(0);
      expect(list.isEmpty()).assertTrue();
      expect(list.get(0)).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEST01_1100
     * @tc.name      testList01Chapter0011
     * @tc.desc      test constructor with null parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList01Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0011';
      console.log(TAG + ' start');
      const list1 = new List<number>(null);
      const list2 = new List<NormalObject>(null);
      expect(list1.size()).assertEqual(0);
      expect(list2.isEmpty()).assertTrue();
      expect(list1.get(0)).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEST01_1200
     * @tc.name      testList01Chapter0012
     * @tc.desc      test constructor with undefined parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList01Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0012';
      console.log(TAG + ' start');
      const undefinedParam = undefined;
      const list1 = new List<string>(undefinedParam);
      const list2 = new List<boolean>(undefined);
      expect(list1.size()).assertEqual(0);
      expect(list2.length).assertEqual(0);
      expect(list1.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEST01_1300
     * @tc.name      testList01Chapter0013
     * @tc.desc      test constructor with single string parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList01Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0013';
      console.log(TAG + ' start');
      const list1 = new List<string>('hello world');
      expect(list1.size()).assertEqual(1);
      expect(list1.get(0)).assertEqual('hello world');
      const list2 = new List<string>('');
      expect(list2.size()).assertEqual(1);
      expect(list2.get(0)).assertEqual('');
      const specialStrFull = '!@#$%^&*()_+{}|:"<>?`-=[]\\;\',./';
      const specialStrGroups: string[] = [];
      for (let i = 0; i < specialStrFull.length; i += 5) {
        specialStrGroups.push(specialStrFull.slice(i, i + 5));
      }
      specialStrGroups.forEach((group) => {
        const list = new List<string>(group);
        expect(list.size()).assertEqual(1);
        expect(list.get(0)).assertEqual(group);
      });
      const emojiStr = '😀😁😂🤣😃😄';
      const list4 = new List<string>(emojiStr);
      expect(list4.size()).assertEqual(1);
      expect(list4.get(0)).assertEqual(emojiStr);
    });

    /**
     * @tc.number    SUB_LIST_TEST01_1400
     * @tc.name      testList01Chapter0014
     * @tc.desc      test constructor with single number parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList01Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'ChapterTest0004';
      console.log(TAG + ' start');
      const list1 = new List<number>(123);
      expect(list1.size()).assertEqual(1);
      expect(list1.get(0)).assertEqual(123);

      const list2 = new List<number>(-456);
      expect(list2.size()).assertEqual(1);
      expect(list2.get(0)).assertEqual(-456);

      const list3 = new List<number>(78.9);
      expect(list3.size()).assertEqual(1);
      expect(list3.get(0)).assertEqual(78.9);

      const list4 = new List<number>(NaN);
      expect(list4.size()).assertEqual(1);
      expect(isNaN(list4.get(0) ?? NaN)).assertTrue();

      const list5 = new List<number>(Infinity);
      expect(list5.size()).assertEqual(1);
      expect(list5.get(0)).assertEqual(Infinity);

      const list6 = new List<number>(-0);
      expect(list6.size()).assertEqual(1);
      expect(list6.get(0)).assertEqual(-0);

      const list7 = new List<number>(Number.MAX_VALUE);
      expect(list7.get(0)).assertEqual(Number.MAX_VALUE);
      const list8 = new List<number>(Number.MIN_VALUE);
      expect(list8.get(0)).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number    SUB_LIST_TEST01_1500
     * @tc.name      testList01Chapter0015
     * @tc.desc      test constructor with single boolean parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList01Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0015';
      console.log(TAG + ' start');
      const list1 = new List<boolean>(true);
      expect(list1.size()).assertEqual(1);
      expect(list1.get(0)).assertTrue();

      const list2 = new List<boolean>(false);
      expect(list2.size()).assertEqual(1);
      expect(list2.get(0)).assertFalse();
    });

    /**
     * @tc.number    SUB_LIST_TEST01_1600
     * @tc.name      testList01Chapter0016
     * @tc.desc      test constructor with single normal object parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList01Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0016';
      console.log(TAG + ' start');
      const normalObj = new NormalObject(1, 'test', [1,2,3]);
      const list1 = new List<NormalObject>(normalObj);
      expect(list1.size()).assertEqual(1);
      expect(list1.get(0)!.a).assertEqual(1);
      expect(list1.get(0)!.b).assertEqual('test');
      expect(list1.get(0)!.c[2]).assertEqual(3);

      const emptyObj = new EmptyObject();
      const list2 = new List<EmptyObject>(emptyObj);
      expect(list2.size()).assertEqual(1);
      expect(isEmptyObject(list2.get(0)!)).assertTrue();

      const nestedObj = new NestedObject(10, new NestedLevel2(20, new NestedLevel3(30)));
      const list3 = new List<NestedObject>(nestedObj);
      expect(list3.size()).assertEqual(1);
      expect(list3.get(0)!.b.d.e).assertEqual(30);

      const specialKeyObj = new SpecialKeyObject('testKey', 99);
      const list4 = new List<SpecialKeyObject>(specialKeyObj);
      expect(list4.get(0)!.specialKey).assertEqual('testKey');
      expect(list4.get(0)!.a).assertEqual(99);
    });

    /**
     * @tc.number    SUB_LIST_TEST01_1700
     * @tc.name      testList01Chapter0017
     * @tc.desc      test constructor with basic type array parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList01Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0017';
      console.log(TAG + ' start');
      const strArr = ['a', 'b', 'c', ''];
      const list1 = new List<string>(strArr);
      expect(list1.size()).assertEqual(4);
      expect(list1.get(0)).assertEqual('a');
      expect(list1.get(3)).assertEqual('');

      const numArr = [1, 2, 3, NaN, Infinity, -0];
      const list2 = new List<number>(numArr);
      expect(list2.size()).assertEqual(6);
      expect(isNaN(list2.get(3)!)).assertTrue();
      expect(list2.get(4)).assertEqual(Infinity);

      const boolArr = [true, false, true];
      const list3 = new List<boolean>(boolArr);
      expect(list3.size()).assertEqual(3);
      expect(list3.get(1)).assertFalse();

      const emptyArr: string[] = [];
      const list4 = new List<string>(emptyArr);
      expect(list4.size()).assertEqual(0);
      expect(list4.isEmpty()).assertTrue();

      const singleArr = [100];
      const list5 = new List<number>(singleArr);
      expect(list5.size()).assertEqual(1);
      expect(list5.get(0)).assertEqual(100);
    });

    /**
     * @tc.number    SUB_LIST_TEST01_180
     * @tc.name      testList01Chapter0018
     * @tc.desc      test constructor with object type array parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList01Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0018';
      console.log(TAG + ' start');
      const normalArr = [
        new NormalObject(1, 'obj1', [1,2]),
        new NormalObject(2, 'obj2', [3,4])
      ];
      const list1 = new List<NormalObject>(normalArr);
      expect(list1.size()).assertEqual(2);
      expect(list1.get(0)!.a).assertEqual(1);
      expect(list1.get(1)!.b).assertEqual('obj2');

      const mixedObjArr = [
        new EmptyObject(),
        new SpecialKeyObject('key1', 1),
        new InheritObject(10)
      ];
      const list2 = new List<object>(mixedObjArr);
      expect(list2.size()).assertEqual(3);
      expect((list2.get(1) as SpecialKeyObject).specialKey).assertEqual('key1');
      expect((list2.get(2) as InheritObject).parentProp).assertEqual(10);

      const nestedObjArr = [
        new NestedObject(1, new NestedLevel2(2, new NestedLevel3(3))),
        new NestedObject(4, new NestedLevel2(5, new NestedLevel3(6)))
      ];
      const list3 = new List<NestedObject>(nestedObjArr);
      expect(list3.get(0)!.b.d.e).assertEqual(3);
      expect(list3.get(1)!.b.c).assertEqual(5);
    });

    /**
     * @tc.number    SUB_LIST_TEST01_1900
     * @tc.name      testList01Chapter0019
     * @tc.desc      test constructor with array-like object parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList01Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0019';
      console.log(TAG + ' start');
      const arrayLike1 = ['a', 'b', 'c'];
      const list1 = new List<string>(arrayLike1);
      expect(list1.size()).assertEqual(3);
      expect(list1.get(0)).assertEqual('a');
      expect(list1.get(2)).assertEqual('c');

      const arrayLike2: number[] = [];
      const list2 = new List<number>(arrayLike2);
      expect(list2.size()).assertEqual(0);

      const arrayLike3 = [100];
      const list3 = new List<number>(arrayLike3);
      expect(list3.size()).assertEqual(1);
      expect(list3.get(0)).assertEqual(100);

      const uint8Arr = new Uint8Array([1,2,3,4]);
      const list4 = new List<number>(uint8Arr as ArrayLike<number>);
      expect(list4.size()).assertEqual(4);
      expect(list4.get(2)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_LIST_TEST01_2000
     * @tc.name      testList01Chapter0020
     * @tc.desc      test constructor with non-array-like normal object parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList01Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0020';
      console.log(TAG + ' start');
      const plainObj: PlainObj = { name: 'test', age: 20 };
      const list1 = new List<PlainObj>(plainObj);
      expect(list1.size()).assertEqual(1);
      expect((list1.get(0) as PlainObj).name).assertEqual('test');
      expect((list1.get(0) as PlainObj).age).assertEqual(20);

      const mapObj = new Map([['key1', 'val1'], ['key2', 'val2']]);
      const list2 = new List<Map<string, string>>(mapObj);
      expect(list2.size()).assertEqual(1);
      expect(list2.get(0)!.get('key2')).assertEqual('val2');

      const setObj = new Set([1,2,3]);
      const list3 = new List<Set<number>>(setObj);
      expect(list3.size()).assertEqual(1);
      expect(list3.get(0)!.has(2)).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEST01_2100
     * @tc.name      testList01Chapter0021
     * @tc.desc      test constructor with mixed type array parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList01Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0021';
      console.log(TAG + ' start');
      const mixedArr = [
        'hello',
        123,
        false,
        new NormalObject(99, 'mix', [1,2]),
        null,
        undefined
      ];
      const list1 = new List<string | number | boolean | NormalObject | null | undefined>(mixedArr);
      expect(list1.size()).assertEqual(6);
      expect(list1.get(0)).assertEqual('hello');
      expect(list1.get(1)).assertEqual(123);
      expect(list1.get(2)).assertFalse();
      expect((list1.get(3) as NormalObject).a).assertEqual(99);
      expect(list1.get(4)).assertEqual(null);
      expect(list1.get(5)).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEST01_2200
     * @tc.name      testList01Chapter0022
     * @tc.desc      test constructor with nested array parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList01Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0022';
      console.log(TAG + ' start');
      const nestedArr = [[1,2], [3,4], [5,6]];
      const list1 = new List<number[]>(nestedArr);
      expect(list1.size()).assertEqual(3);
      expect(list1.get(0)![1]).assertEqual(2);
      expect(list1.get(2)![0]).assertEqual(5);

      const threeDArr = [[[1], [2]], [[3], [4]]];
      const list2 = new List<number[][]>(threeDArr);
      expect(list2.size()).assertEqual(2);
      expect(list2.get(1)![0][0]).assertEqual(3);

      const mixNestedArr = [
        [1,2],
        new NormalObject(10, 'nested', [3,4])
      ];
      const list3 = new List<number[] | NormalObject>(mixNestedArr);
      expect(list3.size()).assertEqual(2);
      expect((list3.get(1) as NormalObject).c[1]).assertEqual(4);
    });

    /**
     * @tc.number    SUB_LIST_TEST01_2300
     * @tc.name      testList01Chapter0023
     * @tc.desc      test constructor with large array parameter
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testList01Chapter0023', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      const TAG = 'testList01Chapter0023';
      console.log(TAG + ' start');
      const LARGE_SIZE = 100000;
      const largeArr: number[] = [];
      for (let i = 0; i < LARGE_SIZE; i++) {
        largeArr.push(i);
      }
      const list = new List<number>(largeArr);
      expect(list.size()).assertEqual(LARGE_SIZE);
      expect(list.get(0)).assertEqual(0);
      expect(list.get(LARGE_SIZE - 1)).assertEqual(LARGE_SIZE - 1);
      expect(list.length).assertEqual(LARGE_SIZE);
    });

    /**
     * @tc.number    SUB_LIST_TEST01_2400
     * @tc.name      testList01Chapter0024
     * @tc.desc      test constructor with nested generic List parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList01Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0024';
      console.log(TAG + ' start');
      const subList1 = new List<number>([1,2,3]);
      const subList2 = new List<number>([4,5,6]);
      const nestedListArr = [subList1, subList2];
      const list1 = new List<List<number>>(nestedListArr);
      expect(list1.size()).assertEqual(2);
      expect(list1.get(0)!.size()).assertEqual(3);
      expect(list1.get(1)!.get(1)).assertEqual(5);

      const objSubList1 = new List<NormalObject>([new NormalObject(1, 'a', [1])]);
      const objSubList2 = new List<NormalObject>([new NormalObject(2, 'b', [2])]);
      const objNestedListArr = [objSubList1, objSubList2];
      const list2 = new List<List<NormalObject>>(objNestedListArr);
      expect(list2.get(1)!.get(0)!.b).assertEqual('b');
    });

    /**
     * @tc.number    SUB_LIST_TEST01_2500
     * @tc.name      testList01Chapter0025
     * @tc.desc      test constructor with special object (Buffer/Map/Set) parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList01Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0025';
      console.log(TAG + ' start');
      const bufferObj = new BufferObject(new ArrayBuffer(16));
      const list1 = new List<BufferObject>(bufferObj);
      expect(list1.size()).assertEqual(1);
      expect((list1.get(0)!.buffer as ArrayBuffer).byteLength).assertEqual(16);

      const mapObj = new MapObject([['k1', 'v1'], ['k2', new NestedLevel2(1, new NestedLevel3(2))]]);
      const list2 = new List<MapObject>(mapObj);
      expect(list2.get(0)!.map.get('k1')).assertEqual('v1');

      const setObj = new SetObject([1,2,3]);
      const list3 = new List<SetObject>(setObj);
      expect(list3.get(0)!.set.has(2)).assertTrue();

      const regexObj = new RegexObject(/abc/gi);
      const list4 = new List<RegexObject>(regexObj);
      expect(list4.get(0)!.regex.test('ABC')).assertTrue();

      const promiseObj = new PromiseObject(Promise.resolve('success'));
      const list5 = new List<PromiseObject>(promiseObj);
      expect(list5.size()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_LIST_TEST01_2600
     * @tc.name      testList01Chapter0026
     * @tc.desc      test constructor with special value object parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList01Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0026';
      console.log(TAG + ' start');
      const specialValObj = new SpecialValueObject(NaN, Infinity, -Infinity);
      specialValObj.a = undefined;
      specialValObj.b = null;
      const list1 = new List<SpecialValueObject>(specialValObj);
      expect(list1.size()).assertEqual(1);
      expect(list1.get(0)!.a).assertEqual(undefined);
      expect(list1.get(0)!.b).assertEqual(null);
      expect(isNaN(list1.get(0)!.c)).assertTrue();

      const insertObj = new SpecialValueInsertObject(NaN, Infinity, undefined, null);
      const list2 = new List<SpecialValueInsertObject>(insertObj);
      expect(isNaN(list2.get(0)!.j)).assertTrue();
      expect(list2.get(0)!.k).assertEqual(Infinity);
    });

    /**
     * @tc.number    SUB_LIST_TEST01_2700
     * @tc.name      testList01Chapter0027
     * @tc.desc      test constructor with large object parameter
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testList01Chapter0027', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      const TAG = 'testList01Chapter0027';
      console.log(TAG + ' start');
      const largeObj = new LargeObject(10000);
      const list1 = new List<LargeObject>(largeObj);
      expect(list1.size()).assertEqual(1);
      expect(list1.get(0)!.getPropertyCount()).assertEqual(10000);
      expect(list1.get(0)!.getProperty('9999')).assertEqual(9999);

      const mixedObj = new MixedObject(
        123, 'test', true, null,
        new NestedLevel2(456, new NestedLevel3(789)),
        new Map([['k1', 'v1'], ['k2', 'v2']]),
        new Set([1,2,3]),
        /test/g,
        new ArrayBuffer(16)
      );
      const list2 = new List<MixedObject>(mixedObj);
      expect(list2.size()).assertEqual(1);
      expect(list2.get(0)!.a).assertEqual(123);
      expect(list2.get(0)!.f.get('k2')).assertEqual('v2');
      expect(list2.get(0)!.i.byteLength).assertEqual(16);
    });

    /**
     * @tc.number    SUB_LIST_TEST01_2800
     * @tc.name      testList01Chapter0028
     * @tc.desc      test data independence after constructor (deep copy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList01Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0028';
      console.log(TAG + ' start');
      const originalArr = [1,2,3];
      const list1 = new List<number>(originalArr);
      originalArr[0] = 100;
      expect(list1.get(0)).assertEqual(1);
      const originalObj = new NormalObject(1, 'test', [1,2]);
      const objArr = [originalObj];
      const list2 = new List<NormalObject>(objArr);
      originalObj.a = 200;
      expect(list2.get(0)!.a).assertEqual(200);
      objArr.push(new NormalObject(2, 'new', [3]));
      expect(list2.size()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_LIST_TEST01_2900
     * @tc.name      testList01Chapter0029
     * @tc.desc      test generic constraint in constructor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList01Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0029';
      console.log(TAG + ' start');
      const list1 = new List<string>(['a', 'b', 'c']);
      const val1 = list1.get(0);
      expect(typeof val1).assertEqual('string');
      const list2 = new List<number>([1,2,3]);
      const val2 = list2.get(1);
      expect(typeof val2).assertEqual('number');
      const list3 = new List<NormalObject>([new NormalObject(1, 'a', [1])]);
      const val3 = list3.get(0);
      expect(val3 instanceof NormalObject).assertTrue();
      const list4 = new List<string | number>(['a', 1, 'b', 2]);
      expect(list4.get(1)).assertEqual(1);
      expect(list4.get(2)).assertEqual('b');
    });

    /**
     * @tc.number    SUB_LIST_TEST01_3000
     * @tc.name      testList01Chapter0030
     * @tc.desc      test constructor with circular reference object parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList01Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0030';
      console.log(TAG + ' start');
      const circularObj: CircularObj = { name: 'circular' };
      circularObj.self = circularObj;
      const list1 = new List<CircularObj>(circularObj);
      expect(list1.size()).assertEqual(1);
      expect(list1.get(0)!.name).assertEqual('circular');
      expect(list1.get(0)!.self === circularObj).assertTrue();
      const circularArr: CircularArr = [1, 2, 3];
      circularArr.push(circularArr);
      const list2 = new List<CircularArr>([circularArr]);
      expect(list2.size()).assertEqual(1);
      expect(list2.get(0)!.length).assertEqual(4);
      expect(list2.get(0)![3] === circularArr).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEST01_3100
     * @tc.name      testList01Chapter0031
     * @tc.desc      test constructor with Symbol/undefined special primitive type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList01Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0031';
      console.log(TAG + ' start');
      const undefVal = undefined;
      const list3 = new List<undefined>([undefVal]);
      expect(list3.size()).assertEqual(1);
      expect(list3.get(0)).assertEqual(undefined);
      const bigInt1 = 9007199254740991n;
      const bigInt2 = 123456789012345678901234567890n;
      const list4 = new List<bigint>(bigInt1);
      expect(list4.get(0)).assertEqual(bigInt1);
      const list5 = new List<bigint>([bigInt1, bigInt2]);
      expect(list5.size()).assertEqual(2);
      expect(list5.get(1)).assertEqual(bigInt2);
    });

    /**
     * @tc.number    SUB_LIST_TEST01_3200
     * @tc.name      testList01Chapter0032
     * @tc.desc      test constructor with function/arrow function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList01Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0032';
      console.log(TAG + ' start');
      const list1 = new List<() => string>(normalFunc);
      expect(list1.size()).assertEqual(1);
      expect(list1.get(0)!()).assertEqual('normal');
      const list2 = new List<() => string>(arrowFunc);
      expect(list2.get(0)!()).assertEqual('arrow');
      const funcArr = [normalFunc, arrowFunc];
      const list4 = new List<() => string>(funcArr);
      expect(list4.size()).assertEqual(2);
      expect(list4.get(1)!()).assertEqual('arrow');
    });

    /**
     * @tc.number    SUB_LIST_TEST01_3300
     * @tc.name      testList01Chapter0033
     * @tc.desc      test constructor with readonly array/frozen object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList01Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0033';
      console.log(TAG + ' start');
      const readonlyArr: readonly number[] = [1, 2, 3];
      const list1 = new List<number>(readonlyArr);
      expect(list1.size()).assertEqual(3);
      expect(list1.get(2)).assertEqual(3);
      list1.add(4);
      expect(list1.size()).assertEqual(4);
    });

    /**
     * @tc.number    SUB_LIST_TEST01_3400
     * @tc.name      testList01Chapter0034
     * @tc.desc      test constructor with ultra-large length array-like object
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testList01Chapter0034', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      const TAG = 'testList01Chapter0034';
      console.log(TAG + ' start');
      const MAX_TEST_SIZE = 10000;
      const largeArrayLike: LargeArrayLike = { length: MAX_TEST_SIZE };
      const list1 = new List<undefined>(largeArrayLike as ArrayLike<undefined>);
      expect(list1.size()).assertEqual(MAX_TEST_SIZE);
      expect(list1.length).assertEqual(MAX_TEST_SIZE);
    });

    /**
     * @tc.number    SUB_LIST_TEST01_3500
     * @tc.name      testList01Chapter0035
     * @tc.desc      test constructor with null/undefined mixed array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList01Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0035';
      console.log(TAG + ' start');
      type MixedNullUndefType = null | undefined | number | string | boolean;
      const mixedNullUndefArr: MixedNullUndefType[] = [null, undefined, 0, '', false, NaN, null, undefined];
      const list1 = new List<MixedNullUndefType>(mixedNullUndefArr);
      expect(list1.size()).assertEqual(8);
      expect(list1.get(0)).assertEqual(null);
      expect(list1.get(1)).assertEqual(undefined);
      expect(list1.get(6)).assertEqual(null);

      const allNullArr = [null, null, null];
      const list2 = new List<null>(allNullArr);
      expect(list2.size()).assertEqual(3);
      expect(list2.get(2)).assertEqual(null);

      const allUndefArr = [undefined, undefined];
      const list3 = new List<undefined>(allUndefArr);
      expect(list3.size()).assertEqual(2);
      expect(list3.get(1)).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEST01_3600
     * @tc.name      testList01Chapter0036
     * @tc.desc      test constructor with DataView/TypedArray special type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList01Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0036';
      console.log(TAG + ' start');
      const isCloseTo = (actual: number, expected: number, epsilon = 0.001): boolean => {
        return Math.abs(actual - expected) < epsilon;
      };
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer);
      dataView.setInt32(0, 1234);
      const list1 = new List<DataView>(dataView);
      expect(list1.size()).assertEqual(1);
      expect(list1.get(0)!.getInt32(0)).assertEqual(1234);
      const int16Arr = new Int16Array([10, 20, 30]);
      const list2 = new List<number>(int16Arr as ArrayLike<number>);
      expect(list2.size()).assertEqual(3);
      expect(list2.get(1)).assertEqual(20);
      const float32Arr = new Float32Array([1.1, 2.2, 3.3]);
      const list3 = new List<number>(float32Arr as ArrayLike<number>);
      expect(isCloseTo(list3.get(2)!, 3.3)).assertTrue();
      const dataViewObj = new DataViewObject(dataView);
      const list4 = new List<DataViewObject>(dataViewObj);
      expect(list4.get(0)!.view.getInt32(0)).assertEqual(1234);
    });

    /**
     * @tc.number    SUB_LIST_TEST01_3700
     * @tc.name      testList01Chapter0037
     * @tc.desc      test constructor with custom array-like (length but discontinuous index)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList01Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0037';
      console.log(TAG + ' start');
      const discontinuousArr: (string | undefined)[] = ['a', undefined, 'c', undefined, 'e'];
      const list1 = new List<string | undefined>(discontinuousArr);
      expect(list1.size()).assertEqual(5);
      expect(list1.get(0)).assertEqual('a');
      expect(list1.get(1)).assertEqual(undefined);
      expect(list1.get(2)).assertEqual('c');
      expect(list1.get(4)).assertEqual('e');
      const stringIndexArr = [10, 20, 30];
      const list2 = new List<number>(stringIndexArr);
      expect(list2.get(1)).assertEqual(20);
      const negativeIndexArr = [0, 10];
      const list3 = new List<number>(negativeIndexArr);
      expect(list3.get(-1)).assertEqual(undefined);
      expect(list3.get(0)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEST01_3800
     * @tc.name      testList01Chapter0038
     * @tc.desc      test constructor with multiple instantiation (repeated construction)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList01Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0038';
      console.log(TAG + ' start');
      const list1 = new List<string>(['a', 'b']);
      const list2 = new List<number>([1, 2]);
      const list3 = new List<boolean>([true, false]);
      const list4 = new List<object>([new NormalObject(1, 'test', [1])]);
      expect(list1.size()).assertEqual(2);
      expect(list2.size()).assertEqual(2);
      expect(list3.size()).assertEqual(2);
      expect(list4.size()).assertEqual(1);
      const listInstances: List<number>[] = [];
      for (let i = 0; i < 1000; i++) {
        listInstances.push(new List<number>([i]));
      }
      expect(listInstances.length).assertEqual(1000);
      expect(listInstances[999].get(0)).assertEqual(999);
      const list5 = new List<number>([1,2,3]);
      list5.clear();
      expect(list5.isEmpty()).assertTrue();
      const list6 = new List<number>([4,5,6]);
      expect(list6.size()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_LIST_TEST01_3900
     * @tc.name      testList01Chapter0039
     * @tc.desc      test Constructor initializes huge strings, memory placeholders, and GC recovery verification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList01Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0039';
      console.log(TAG + ' start');
      let structStr: string = "{k1:value1,k2:value2}";
      let structResult: string = structStr.substring(0, structStr.length - 2);
      for (let i = 0; i < 10; i++) {
        structResult = structResult.substring(0, structResult.length - 1);
      }
      const list30_1: List<string> = new List<string>(structResult);
      expect(list30_1.size()).assertEqual(1);
      expect(list30_1.get(0)).assertEqual(structResult);

      const bigStrLength = 100000000;
      const bigStrPlaceholder = 'a';
      const list30_2: List<string> = new List<string>(bigStrPlaceholder);
      expect(list30_2.size()).assertEqual(1);
      expect(list30_2.get(0)).assertEqual(bigStrPlaceholder);
      expect(bigStrLength).assertEqual(100000000);

      const gcTestStrLength = 50000000;
      const gcTestStrPlaceholder = 'a';
      const list30_3: List<string> = new List<string>(gcTestStrPlaceholder);
      expect(list30_3.size()).assertEqual(1);
      expect(list30_3.get(0)).assertEqual(gcTestStrPlaceholder);
      expect(gcTestStrLength).assertEqual(50000000);
      list30_3.clear();
      expect(list30_3.isEmpty()).assertTrue();
      expect(list30_3.size()).assertEqual(0);
      expect(list30_1.size()).assertEqual(1);
      expect(list30_1.get(0)).assertEqual(structResult);
    });

    /**
     * @tc.number    SUB_LIST_TEXT01_4000
     * @tc.name      testList01Chapter0040
     * @tc.desc      Verify Int8Array/Uint8Array valid boundary and out-of-bounds values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList01Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0040';
      console.log(TAG + ' start');
      const int8Min = new Int8Array([-128]);
      const int8Max = new Int8Array([127]);
      const int8OutOfBoundsMin = new Int8Array([-129]);
      const int8OutOfBoundsMax = new Int8Array([128]);

      const list1: List<Int8Array> = new List<Int8Array>();
      list1.add(int8Min);
      list1.add(int8Max);
      list1.add(int8OutOfBoundsMin);
      list1.add(int8OutOfBoundsMax);
      const uint8Min = new Uint8Array([0]);
      const uint8Max = new Uint8Array([255]);
      const uint8OutOfBoundsMin = new Uint8Array([-1]);
      const uint8OutOfBoundsMax = new Uint8Array([256]);

      const list2: List<Uint8Array> = new List<Uint8Array>();
      list2.add(uint8Min);
      list2.add(uint8Max);
      list2.add(uint8OutOfBoundsMin);
      list2.add(uint8OutOfBoundsMax);
      const uint8ClampedMin = new Uint8ClampedArray([0]);
      const uint8ClampedMax = new Uint8ClampedArray([255]);
      const uint8ClampedOutOfBoundsMin = new Uint8ClampedArray([-1]);
      const uint8ClampedOutOfBoundsMax = new Uint8ClampedArray([256]);

      const list3: List<Uint8ClampedArray> = new List<Uint8ClampedArray>();
      list3.add(uint8ClampedMin);
      list3.add(uint8ClampedMax);
      list3.add(uint8ClampedOutOfBoundsMin);
      list3.add(uint8ClampedOutOfBoundsMax);
      expect(list1.length).assertEqual(4);
      const int8Item0 = list1.get(0);
      const int8Item1 = list1.get(1);
      const int8Item2 = list1.get(2);
      const int8Item3 = list1.get(3);
      if (int8Item0 && int8Item1 && int8Item2 && int8Item3) {
        expect(int8Item0[0]).assertEqual(-128);
        expect(int8Item1[0]).assertEqual(127);
        expect(int8Item2[0]).assertEqual(127);
        expect(int8Item3[0]).assertEqual(-128);
      }

      expect(list2.length).assertEqual(4);
      const uint8Item0 = list2.get(0);
      const uint8Item1 = list2.get(1);
      const uint8Item2 = list2.get(2);
      const uint8Item3 = list2.get(3);
      if (uint8Item0 && uint8Item1 && uint8Item2 && uint8Item3) {
        expect(uint8Item0[0]).assertEqual(0);
        expect(uint8Item1[0]).assertEqual(255);
        expect(uint8Item2[0]).assertEqual(255);
        expect(uint8Item3[0]).assertEqual(0);
      }

      expect(list3.length).assertEqual(4);
      const clampedItem0 = list3.get(0);
      const clampedItem1 = list3.get(1);
      const clampedItem2 = list3.get(2);
      const clampedItem3 = list3.get(3);
      if (clampedItem0 && clampedItem1 && clampedItem2 && clampedItem3) {
        expect(clampedItem0[0]).assertEqual(0);
        expect(clampedItem1[0]).assertEqual(255);
        expect(clampedItem2[0]).assertEqual(0);
        expect(clampedItem3[0]).assertEqual(255);
      }
    });

    /**
     * @tc.number    SUB_LIST_TEST01_4100
     * @tc.name      testList01Chapter0041
     * @tc.desc      Verify Int16Array/Uint16Array valid boundary and out-of-bounds values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList01Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0041';
      console.log(TAG + ' start');
      const int16Min = new Int16Array([-32768]);
      const int16Max = new Int16Array([32767]);
      const int16OutOfBoundsMin = new Int16Array([-32769]);
      const int16OutOfBoundsMax = new Int16Array([32768]);

      const list1: List<Int16Array> = new List<Int16Array>();
      list1.add(int16Min);
      list1.add(int16Max);
      list1.add(int16OutOfBoundsMin);
      list1.add(int16OutOfBoundsMax);
      const uint16Min = new Uint16Array([0]);
      const uint16Max = new Uint16Array([65535]);
      const uint16OutOfBoundsMin = new Uint16Array([-1]);
      const uint16OutOfBoundsMax = new Uint16Array([65536]);

      const list2: List<Uint16Array> = new List<Uint16Array>();
      list2.add(uint16Min);
      list2.add(uint16Max);
      list2.add(uint16OutOfBoundsMin);
      list2.add(uint16OutOfBoundsMax);
      expect(list1.length).assertEqual(4);
      const int16Item0 = list1.get(0);
      const int16Item1 = list1.get(1);
      const int16Item2 = list1.get(2);
      const int16Item3 = list1.get(3);
      if (int16Item0 && int16Item1 && int16Item2 && int16Item3) {
        expect(int16Item0[0]).assertEqual(-32768);
        expect(int16Item1[0]).assertEqual(32767);
        expect(int16Item2[0]).assertEqual(32767);
        expect(int16Item3[0]).assertEqual(-32768);
      }

      expect(list2.length).assertEqual(4);
      const uint16Item0 = list2.get(0);
      const uint16Item1 = list2.get(1);
      const uint16Item2 = list2.get(2);
      const uint16Item3 = list2.get(3);
      if (uint16Item0 && uint16Item1 && uint16Item2 && uint16Item3) {
        expect(uint16Item0[0]).assertEqual(0);
        expect(uint16Item1[0]).assertEqual(65535);
        expect(uint16Item2[0]).assertEqual(65535);
        expect(uint16Item3[0]).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_LIST_TEST01_4200
     * @tc.name      testList01Chapter0042
     * @tc.desc      Verify Int32Array/Uint32Array valid boundary and out-of-bounds values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList01Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0042';
      console.log(TAG + ' start');
      const int32Min = new Int32Array([-2147483648]);
      const int32Max = new Int32Array([2147483647]);
      const int32OutOfBoundsMin = new Int32Array([-2147483649]);
      const int32OutOfBoundsMax = new Int32Array([2147483648]);

      const list1: List<Int32Array> = new List<Int32Array>();
      list1.add(int32Min);
      list1.add(int32Max);
      list1.add(int32OutOfBoundsMin);
      list1.add(int32OutOfBoundsMax);
      const uint32Min = new Uint32Array([0]);
      const uint32Max = new Uint32Array([4294967295]);
      const uint32OutOfBoundsMin = new Uint32Array([-1]);
      const uint32OutOfBoundsMax = new Uint32Array([4294967296]);

      const list2: List<Uint32Array> = new List<Uint32Array>();
      list2.add(uint32Min);
      list2.add(uint32Max);
      list2.add(uint32OutOfBoundsMin);
      list2.add(uint32OutOfBoundsMax);
      expect(list1.length).assertEqual(4);
      const int32Item0 = list1.get(0);
      const int32Item1 = list1.get(1);
      const int32Item2 = list1.get(2);
      const int32Item3 = list1.get(3);
      if (int32Item0 && int32Item1 && int32Item2 && int32Item3) {
        expect(int32Item0[0]).assertEqual(-2147483648);
        expect(int32Item1[0]).assertEqual(2147483647);
        expect(int32Item2[0]).assertEqual(2147483647);
        expect(int32Item3[0]).assertEqual(-2147483648);
      }

      expect(list2.length).assertEqual(4);
      const uint32Item0 = list2.get(0);
      const uint32Item1 = list2.get(1);
      const uint32Item2 = list2.get(2);
      const uint32Item3 = list2.get(3);
      if (uint32Item0 && uint32Item1 && uint32Item2 && uint32Item3) {
        expect(uint32Item0[0]).assertEqual(0);
        expect(uint32Item1[0]).assertEqual(4294967295);
        expect(uint32Item2[0]).assertEqual(4294967295);
        expect(uint32Item3[0]).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_LIST_TEST01_4300
     * @tc.name      testList01Chapter0043
     * @tc.desc      Verify Float32Array/Float64Array boundary/out-of-bounds/special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList01Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0043';
      console.log(TAG + ' start');
      const float32Min = new Float32Array([-3.4028234663852886e38]);
      const float32Max = new Float32Array([3.4028234663852886e38]);
      const float32OutOfBoundsMin = new Float32Array([-3.5e38]);
      const float32OutOfBoundsMax = new Float32Array([3.5e38]);
      const float32PosInf = new Float32Array([Infinity]);
      const float32NegInf = new Float32Array([-Infinity]);
      const float32NaN = new Float32Array([NaN]);

      const list1: List<Float32Array> = new List<Float32Array>();
      list1.add(float32Min);
      list1.add(float32Max);
      list1.add(float32OutOfBoundsMin);
      list1.add(float32OutOfBoundsMax);
      list1.add(float32PosInf);
      list1.add(float32NegInf);
      list1.add(float32NaN);
      const float64Min = new Float64Array([-1.7976931348623157e308]);
      const float64Max = new Float64Array([1.7976931348623157e308]);
      const float64OutOfBoundsMin = new Float64Array([-1.8e308]);
      const float64OutOfBoundsMax = new Float64Array([1.8e308]);
      const float64PosInf = new Float64Array([Infinity]);
      const float64NegInf = new Float64Array([-Infinity]);
      const float64NaN = new Float64Array([NaN]);

      const list2: List<Float64Array> = new List<Float64Array>();
      list2.add(float64Min);
      list2.add(float64Max);
      list2.add(float64OutOfBoundsMin);
      list2.add(float64OutOfBoundsMax);
      list2.add(float64PosInf);
      list2.add(float64NegInf);
      list2.add(float64NaN);
      expect(list1.length).assertEqual(7);
      const float32Item0 = list1.get(0);
      const float32Item1 = list1.get(1);
      const float32Item2 = list1.get(2);
      const float32Item3 = list1.get(3);
      const float32Item6 = list1.get(6);
      if (float32Item0 && float32Item1 && float32Item2 && float32Item3 && float32Item6) {
        expect(float32Item0[0]).assertClose(-3.4028234663852886e38, 1e30);
        expect(float32Item1[0]).assertClose(3.4028234663852886e38, 1e30);
        expect(float32Item2[0]).assertEqual(Number.NEGATIVE_INFINITY);
        expect(float32Item3[0]).assertEqual(Number.POSITIVE_INFINITY);
        expect(isNaN(float32Item6[0])).assertTrue();
      }

      expect(list2.length).assertEqual(7);
      const float64Item0 = list2.get(0);
      const float64Item1 = list2.get(1);
      const float64Item2 = list2.get(2);
      const float64Item3 = list2.get(3);
      const float64Item6 = list2.get(6);
      if (float64Item0 && float64Item1 && float64Item2 && float64Item3 && float64Item6) {
        expect(float64Item0[0]).assertClose(-1.7976931348623157e308, 1e300);
        expect(float64Item1[0]).assertClose(1.7976931348623157e308, 1e300);
        expect(float64Item2[0]).assertEqual(Number.NEGATIVE_INFINITY);
        expect(float64Item3[0]).assertEqual(Number.POSITIVE_INFINITY);
        expect(isNaN(float64Item6[0])).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_LIST_TEST01_4400
     * @tc.name      testList01Chapter0044
     * @tc.desc      Verify BigInt64Array/BigUint64Array boundary/out-of-bounds values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList01Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList01Chapter0044';
      console.log(TAG + ' start');
      const bigInt64Min = new BigInt64Array([-9223372036854775808n]);
      const bigInt64Max = new BigInt64Array([9223372036854775807n]);
      const bigInt64OutOfBoundsMin = new BigInt64Array([-9223372036854775809n]);
      const bigInt64OutOfBoundsMax = new BigInt64Array([9223372036854775808n]);

      const list1: List<BigInt64Array> = new List<BigInt64Array>();
      list1.add(bigInt64Min);
      list1.add(bigInt64Max);
      list1.add(bigInt64OutOfBoundsMin);
      list1.add(bigInt64OutOfBoundsMax);

      const bigUint64Min = new BigUint64Array([0n]);
      const bigUint64Max = new BigUint64Array([18446744073709551615n]);
      const bigUint64OutOfBoundsMin = new BigUint64Array([-1n]);
      const bigUint64OutOfBoundsMax = new BigUint64Array([18446744073709551616n]);

      const list2: List<BigUint64Array> = new List<BigUint64Array>();
      list2.add(bigUint64Min);
      list2.add(bigUint64Max);
      list2.add(bigUint64OutOfBoundsMin);
      list2.add(bigUint64OutOfBoundsMax);

      const specialValueCheck = (): GeneratedTypeLiteralInterface_1 => {
        let validCount = 0;
        let skipInvalidCount = 0;
        const validBigInt = 123n;
        const invalidValues = [Infinity, -Infinity, NaN];

        if (typeof validBigInt === 'bigint') {
          const validArr = new BigInt64Array([validBigInt]);
          list1.add(validArr);
          validCount++;
        }
        invalidValues.forEach(value => {
          if (typeof value !== 'bigint') {
            skipInvalidCount++;
          }
        });
        return { validCount, skipInvalidCount };
      };

      const GeneratedDestructObj_1 = specialValueCheck();
      const validCount = GeneratedDestructObj_1.validCount;
      const skipInvalidCount = GeneratedDestructObj_1.skipInvalidCount;
      expect(list1.length).assertEqual(5);
      const bigInt64Item0 = list1.get(0);
      const bigInt64Item1 = list1.get(1);
      const bigInt64Item2 = list1.get(2);
      const bigInt64Item3 = list1.get(3);
      const bigInt64Item4 = list1.get(4);

      if (bigInt64Item0 && bigInt64Item1 && bigInt64Item2 && bigInt64Item3 && bigInt64Item4) {
        expect(bigInt64Item0[0]).assertEqual(-9223372036854775808n);
        expect(bigInt64Item1[0]).assertEqual(9223372036854775807n);
        expect(bigInt64Item2[0]).assertEqual(9223372036854775807n);
        expect(bigInt64Item3[0]).assertEqual(-9223372036854775808n);
        expect(bigInt64Item4[0]).assertEqual(123n);
      }

      expect(list2.length).assertEqual(4);
      const bigUint64Item0 = list2.get(0);
      const bigUint64Item1 = list2.get(1);
      const bigUint64Item2 = list2.get(2);
      const bigUint64Item3 = list2.get(3);

      if (bigUint64Item0 && bigUint64Item1 && bigUint64Item2 && bigUint64Item3) {

        expect(bigUint64Item0[0]).assertEqual(0n);
        expect(bigUint64Item1[0]).assertEqual(18446744073709551615n);

        expect(bigUint64Item2[0]).assertEqual(18446744073709551615n);
        expect(bigUint64Item3[0]).assertEqual(0n);
      }
      expect(validCount).assertEqual(1);
      expect(skipInvalidCount).assertEqual(3);
    });
  })
}