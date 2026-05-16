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
  getLast(): T | undefined {
    return this.data.length > 0 ? this.data[this.data.length - 1] : undefined;
  }
  getLastIndexOf(element: T): number {
    for (let i = this.data.length - 1; i >= 0; i--) {
      if (this.data[i] === element) {
        return i;
      }
    }
    return -1;
  }
  getSubList(fromIndex: number, toIndex: number): List<T> {
    if (typeof fromIndex !== 'number' || typeof toIndex !== 'number') {
      throw new Error('401');
    }
    if (fromIndex < 0 || toIndex > this.data.length || fromIndex > toIndex) {
      throw new Error('10200001');
    }
    const subData = this.data.slice(fromIndex, toIndex);
    return new List<T>(subData);
  }
  convertToArray(): T[] {
    return [...this.data];
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
class EmptyObject {}

class InheritObject {
  parentProp: number = 0;
  extraProp: undefined;

  constructor(parentProp: number) {
    this.parentProp = parentProp;
  }
}
class NonEnumObject {
  a: number = 0;
  nonEnumProp: number = 999;
  constructor(a: number) {
    this.a = a;
  }
}

class DataViewObject {
  view: DataView = new DataView(new ArrayBuffer(0));
  constructor(view: DataView) {
    this.view = view;
  }
}

class SpecialValueObject {
  value: number | undefined | null = 0;
  constructor(value: number | undefined | null) {
    this.value = value;
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
class SymbolKeyObject {
  getSymbolValue(): Object | null | undefined {
    return "symbolVal";
  }
  normalKey: number = 0;
  constructor(normalVal: number) {
    this.normalKey = normalVal;
  }
}
class MixedCollectionObject {
  map: Map<string, number> = new Map();
  set: Set<string> = new Set();
  promise: Promise<string> = Promise.resolve("");
  regex: RegExp = /test/;
  constructor() {
    this.map.set('key1', 1);
    this.set.add('val1');
    this.promise = new Promise(resolve => setTimeout(() => resolve('resolved'), 100));
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

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ListTest12() {
  describe('ListTest12', () => {
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
     * @tc.number    SUB_LIST_TEXT12_0100
     * @tc.name      testList12Chapter0001
     * @tc.desc      Verify getSubList interface correctness with different start/end indices
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0001';
      console.log(TAG + ' start');
      const normalUint8Arr: Uint8Array =
        new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);
      const zeroArr: number[] = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];
      const list: List<TestArray> = new List<TestArray>();
      list.add(normalUint8Arr);
      list.add(zeroArr);
      expect(list.length).assertEqual(2);

      const subList1: List<TestArray> = list.getSubList(0, 1);
      expect(subList1.length).assertEqual(1);
      const item0: Uint8Array = subList1.get(0) as Uint8Array;
      expect(item0.length).assertEqual(14);
      expect(item0[0]).assertEqual(72);
      expect(item0[13]).assertEqual(63);

      const subList2: List<TestArray> = list.getSubList(1, 2);
      expect(subList2.length).assertEqual(1);
      const item1: number[] = subList2.get(0) as number[];
      expect(item1.length).assertEqual(19);
      expect(item1[9]).assertEqual(0);
      expect(item1[13]).assertEqual(0);
      expect(item1[18]).assertEqual(63);
      const subList3: List<TestArray> = list.getSubList(0, 2);
      expect(subList3.length).assertEqual(2);
      expect(subList3.get(0) as Uint8Array).assertEqual(normalUint8Arr);
      expect(subList3.get(1) as number[]).assertEqual(zeroArr);
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_0200
     * @tc.name      testList12Chapter0002
     * @tc.desc      Test getSubList with negative/non-numeric index arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0002';
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

      const subList1: List<TypedArray | number[]> = list.getSubList(0, 2);
      expect(subList1.length).assertEqual(2);
      const item0: Uint8Array = subList1.get(0) as Uint8Array;
      expect(item0[6]).assertEqual(145);
      expect(item0[10]).assertEqual(207);
      const item1: Int8Array = subList1.get(1) as Int8Array;
      expect(item1[6]).assertEqual(-111);
      expect(item1[10]).assertEqual(-49);

      const subList2: List<TypedArray | number[]> = list.getSubList(2, 3);
      expect(subList2.length).assertEqual(1);
      const item2: number[] = subList2.get(0) as number[];
      expect(item2[0]).assertEqual(333);

      expect(nonNumericMap.get("abc")).assertEqual(111);
      expect(nonNumericMap.get("aaa")).assertEqual(222);
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_0300
     * @tc.name      testList12Chapter0003
     * @tc.desc      Test getSubList with NaN/Infinity/non-numeric type arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0003';
      console.log(TAG + ' start');

      const specialValueArr: number[] = [72, 101, NaN, Infinity, -Infinity, 108, 111];
      const nonNumericTypeArr: (number | string | boolean | null | undefined)[] =
        [72, "abc", true, null, undefined, 108];

      const list: List<number[] | (number | string | boolean | null | undefined)[]> =
        new List<number[] | (number | string | boolean | null | undefined)[]>();
      list.add(specialValueArr);
      list.add(nonNumericTypeArr);
      expect(list.length).assertEqual(2);

      const subList1: List<number[] | (number | string | boolean | null | undefined)[]> = list.getSubList(0, 1);
      expect(subList1.length).assertEqual(1);
      const item0: number[] = subList1.get(0) as number[];
      expect(item0[0]).assertEqual(72);
      expect(isNaN(item0[2])).assertTrue();
      expect(item0[3]).assertEqual(Infinity);
      expect(item0[4]).assertEqual(-Infinity);

      const subList2: List<number[] | (number | string | boolean | null | undefined)[]> = list.getSubList(1, 2);
      expect(subList2.length).assertEqual(1);
      const item1: (number | string | boolean | null | undefined)[] =
        subList2.get(0) as (number | string | boolean | null | undefined)[];
      expect(item1[1]).assertEqual("abc");
      expect(item1[2]).assertEqual(true);
      expect(item1[3]).assertEqual(null);
      expect(item1[4]).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_0400
     * @tc.name      testList12Chapter0004
     * @tc.desc      Test getSubList with empty/overflow value arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0004';
      console.log(TAG + ' start');

      const emptyArr: number[] = [];
      const overflowArr: number[] = [256, 65536, 32768];
      const deletedArr: number[] = [1, 2, 3];

      const list: List<number[]> = new List<number[]>();
      list.add(emptyArr);
      list.add(overflowArr);
      list.add(deletedArr);
      expect(list.length).assertEqual(3);

      const subList1: List<number[]> = list.getSubList(0, 1);
      expect(subList1.length).assertEqual(1);
      const item0: number[] = subList1.get(0) as number[];
      expect(item0.length).assertEqual(0);

      const subList2: List<number[]> = list.getSubList(1, 3);
      expect(subList2.length).assertEqual(2);
      const item1: number[] = subList2.get(0) as number[];
      expect(item1[0]).assertEqual(256);
      expect(item1[1]).assertEqual(65536);
      expect(item1[2]).assertEqual(32768);
      const item2: number[] = subList2.get(1) as number[];
      expect(item2.length).assertEqual(3);
      expect(item2[0]).assertEqual(1);
      expect(item2[1]).assertEqual(2);
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_0500
     * @tc.name      testList12Chapter0005
     * @tc.desc      Test getSubList with nested/TypedArray/large length arrays
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testList12Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0005';
      console.log(TAG + ' start');

      const level3Arr: number[] = [5, 6];
      const level2Arr1: number[] = [2, 3];
      const level2Arr2: (number | number[])[] = [4, level3Arr];
      const nestedArr: (number | number[] | (number | number[])[])[] = [1, level2Arr1, level2Arr2];
      const typedSubArr: TypedArray[] = [new Int32Array([10, 20]), new Float64Array([3.14, 6.28])];
      const largeArr: number[] = new Array(1000000).fill(1);

      const list: List<TestArray> = new List<TestArray>();
      list.add(nestedArr);
      list.add(typedSubArr);
      list.add(largeArr);
      expect(list.length).assertEqual(3);

      const subList1: List<TestArray> = list.getSubList(0, 1);
      expect(subList1.length).assertEqual(1);
      const item0: (number | number[] | (number | number[])[])[] =
        subList1.get(0) as (number | number[] | (number | number[])[])[];
      expect(item0[0] as number).assertEqual(1);
      expect((item0[1] as number[])[1]).assertEqual(3);
      expect(((item0[2] as (number | number[])[])[1] as number[])[0]).assertEqual(5);

      const subList2: List<TestArray> = list.getSubList(1, 2);
      expect(subList2.length).assertEqual(1);
      const item1: TypedArray[] = subList2.get(0) as TypedArray[];
      expect((item1[0] as Int32Array)[0]).assertEqual(10);
      expect((item1[1] as Float64Array)[1]).assertClose(6.28, 0.01);

      const subList3: List<TestArray> = list.getSubList(2, 3);
      expect(subList3.length).assertEqual(1);
      const item2: number[] = subList3.get(0) as number[];
      expect(item2.length).assertEqual(1000000);
      expect(item2[0]).assertEqual(1);
      expect(item2[999999]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_0600
     * @tc.name      testList12Chapter0006
     * @tc.desc      Test getSubList with function/keyword-containing arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0006';
      console.log(TAG + ' start');

      type MixedElement = (() => string) | string;
      const func: () => string = () => "testResult";
      const mixedTypeArr: MixedElement[] = [func, "0", "NaN", ""];

      const list: List<MixedElement[]> = new List<MixedElement[]>();
      list.add(mixedTypeArr);
      list.add(mixedTypeArr);
      expect(list.length).assertEqual(2);

      const subList: List<MixedElement[]> = list.getSubList(0, 2);
      expect(subList.length).assertEqual(2);
      const item0: MixedElement[] = subList.get(0)!;
      expect((item0[0] as () => string)()).assertEqual("testResult");
      expect(item0[1] as string).assertEqual("0");
      expect(item0[2] as string).assertEqual("NaN");
      expect(item0[3] as string).assertEqual("");

      const itemSub1: MixedElement[] = subList.get(1)!;
      expect((itemSub1[0] as () => string)()).assertEqual("testResult");
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_0700
     * @tc.name      testList12Chapter0007
     * @tc.desc      Test getSubList with undefined/null/empty/special char strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0007';
      console.log(TAG + ' start');

      const str1: string = String(undefined);
      const list1: List<string> = new List<string>([str1, 'a', 'b']);
      const sub1 = list1.getSubList(0, 1);
      expect(sub1.size()).assertEqual(1);
      expect(sub1.get(0)).assertEqual('undefined');

      const str2: string = String(null);
      const list2: List<string> = new List<string>(['x', str2, 'y']);
      const sub2 = list2.getSubList(1, 2);
      expect(sub2.size()).assertEqual(1);
      expect(sub2.get(0)).assertEqual('null');

      const str3: string = '';
      const list3: List<string> = new List<string>(['m', 'n', str3]);
      const sub3 = list3.getSubList(2, 3);
      expect(sub3.size()).assertEqual(1);
      expect(sub3.get(0)).assertEqual('');

      const str4: string = '!"#$%';
      const list4: List<string> = new List<string>([str4, 'p', 'q']);
      const sub4 = list4.getSubList(0, 2);
      expect(sub4.size()).assertEqual(2);
      expect(sub4.get(0)).assertEqual(str4);

      const str5: string = '&\'()*';
      const list5: List<string> = new List<string>(['r', str5, 's']);
      const sub5 = list5.getSubList(1, 3);
      expect(sub5.size()).assertEqual(2);
      expect(sub5.get(0)).assertEqual(str5);
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_0800
     * @tc.name      testList12Chapter0008
     * @tc.desc      Test getSubList with control/escape character strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0008';
      console.log(TAG + ' start');

      const str1: string = String.fromCharCode(7);
      const list1: List<string> = new List<string>([str1, 'a', 'b']);
      const sub1 = list1.getSubList(0, 1);
      expect(sub1.size()).assertEqual(1);
      expect(sub1.get(0)?.charCodeAt(0)).assertEqual(7);

      const str2: string = String.fromCharCode(8);
      const list2: List<string> = new List<string>(['c', str2, 'd']);
      const sub2 = list2.getSubList(1, 2);
      expect(sub2.size()).assertEqual(1);
      expect(sub2.get(0)?.charCodeAt(0)).assertEqual(8);

      const str3: string = '\n';
      const list3: List<string> = new List<string>(['e', 'f', str3]);
      const sub3 = list3.getSubList(2, 3);
      expect(sub3.size()).assertEqual(1);
      expect(sub3.get(0)?.charCodeAt(0)).assertEqual(10);

      const str4: string = '\r';
      const list4: List<string> = new List<string>([str4, 'g', 'h']);
      const sub4 = list4.getSubList(0, 2);
      expect(sub4.size()).assertEqual(2);
      expect(sub4.get(0)?.charCodeAt(0)).assertEqual(13);

      const str5: string = '\t';
      const list5: List<string> = new List<string>(['i', str5, 'j']);
      const sub5 = list5.getSubList(1, 3);
      expect(sub5.size()).assertEqual(2);
      expect(sub5.get(0)?.charCodeAt(0)).assertEqual(9);
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_0900
     * @tc.name      testList12Chapter0009
     * @tc.desc      Test getSubList with emoji character strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0009';
      console.log(TAG + ' start');

      const emoji1: string = '👆';
      const list1: List<string> = new List<string>([emoji1, 'a', 'b']);
      const sub1 = list1.getSubList(0, 1);
      expect(sub1.size()).assertEqual(1);
      expect(sub1.get(0)).assertEqual('\ud83d\udc46');

      const emoji2: string = '👿';
      const list2: List<string> = new List<string>(['c', emoji2, 'd']);
      const sub2 = list2.getSubList(1, 2);
      expect(sub2.size()).assertEqual(1);
      expect(sub2.get(0)).assertEqual('\ud83d\udc7f');

      const emoji3: string = '👀';
      const list3: List<string> = new List<string>([emoji3, 'e', 'f']);
      const sub3 = list3.getSubList(0, 2);
      expect(sub3.size()).assertEqual(2);
      expect(sub3.get(0)).assertEqual('\ud83d\udc40');

      const emoji4: string = '💯';
      const list4: List<string> = new List<string>(['g', emoji4, 'h']);
      const sub4 = list4.getSubList(1, 3);
      expect(sub4.size()).assertEqual(2);
      expect(sub4.get(0)).assertEqual('\ud83d\udcaf');

      const emoji5: string = '🎅';
      const list5: List<string> = new List<string>([emoji5, 'i', 'j']);
      const sub5 = list5.getSubList(0, 3);
      expect(sub5.size()).assertEqual(3);
      expect(sub5.get(0)).assertEqual('\ud83c\udf85');
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_1000
     * @tc.name      testList12Chapter0010
     * @tc.desc      Test getSubList with large/big/invalid unicode strings
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0010';
      console.log(TAG + ' start');

      const initTreeString = (size: number): string => {
        let ans = '[';
        while (ans.length < size) {
          ans += '{"a":1},';
        }
        ans += '{"a":1}]';
        return ans;
      };
      const treeStr: string = initTreeString(100);
      const list1: List<string> = new List<string>([treeStr, 'x', 'y']);
      const sub1 = list1.getSubList(0, 1);
      expect(sub1.size()).assertEqual(1);
      expect(sub1.get(0)).assertEqual(treeStr);

      let sliceStr: string = "{k1:value1,k2:value2}";
      let result: string = sliceStr.substring(0, sliceStr.length - 2);
      for (let i = 0; i < 10; i++) {
        result = result.substring(0, result.length - 1);
      }
      const list2: List<string> = new List<string>(['m', result, 'n']);
      const sub2 = list2.getSubList(1, 2);
      expect(sub2.size()).assertEqual(1);
      expect(sub2.get(0)).assertEqual(result);

      const bigStr: string = 'a'.repeat(100000);
      const list3: List<string> = new List<string>([bigStr, 'p', 'q']);
      const sub3 = list3.getSubList(0, 2);
      expect(sub3.size()).assertEqual(2);
      expect(sub3.get(0)?.length).assertEqual(100000);

      let gcTestStr: string = 'a'.repeat(50000);
      const list4: List<string> = new List<string>([gcTestStr, 'r', 's']);
      const sub4 = list4.getSubList(0, 3);
      expect(sub4.size()).assertEqual(3);
      gcTestStr = '';
      list4.clear();
      expect(list4.isEmpty()).assertTrue();

      const invalidUnicodeStr: string = '\udc04\ud83d\udff4';
      const list5: List<string> = new List<string>([invalidUnicodeStr, 't', 'u']);
      const sub5 = list5.getSubList(0, 1);
      expect(sub5.size()).assertEqual(1);
      expect(sub5.get(0)).assertEqual(invalidUnicodeStr);
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_1100
     * @tc.name      testList12Chapter0011
     * @tc.desc      Test getSubList with basic numeric values (0/NaN/Infinity)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0011';
      console.log(TAG + ' start');

      const num1: number = 0;
      const list1: List<number> = new List<number>([num1, 1, 2]);
      const sub1 = list1.getSubList(0, 2);
      expect(sub1.size()).assertEqual(2);
      expect(sub1.get(0)).assertEqual(0);

      const num2: number = NaN;
      const list2: List<number> = new List<number>([3, num2, 4]);
      const sub2 = list2.getSubList(1, 2);
      expect(sub2.size()).assertEqual(1);
      expect(isNaN(sub2.get(0) ?? NaN)).assertTrue();

      const num3: number = -0;
      const list3: List<number> = new List<number>([num3, 5, 6]);
      const sub3 = list3.getSubList(0, 1);
      expect(sub3.size()).assertEqual(1);
      expect(sub3.get(0)).assertEqual(-0);

      const num4: number = Infinity;
      const list4: List<number> = new List<number>([7, num4, 8]);
      const sub4 = list4.getSubList(1, 3);
      expect(sub4.size()).assertEqual(2);
      expect(sub4.get(0)).assertEqual(Infinity);

      const num5: number = -Infinity;
      const list5: List<number> = new List<number>([num5, 9, 10]);
      const sub5 = list5.getSubList(0, 2);
      expect(sub5.size()).assertEqual(2);
      expect(sub5.get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_1200
     * @tc.name      testList12Chapter0012
     * @tc.desc      Test getSubList with extreme/precision numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0012';
      console.log(TAG + ' start');

      const num1: number = Number.MAX_VALUE;
      const list1: List<number> = new List<number>([num1, 11, 12]);
      const sub1 = list1.getSubList(0, 1);
      expect(sub1.size()).assertEqual(1);
      expect(sub1.get(0)).assertEqual(1.7976931348623157e+308);

      const num2: number = Number.MIN_VALUE;
      const list2: List<number> = new List<number>([13, num2, 14]);
      const sub2 = list2.getSubList(1, 2);
      expect(sub2.size()).assertEqual(1);
      expect(sub2.get(0)).assertEqual(5e-324);

      const num3: number = Number.EPSILON;
      const list3: List<number> = new List<number>([num3, 15, 16]);
      const sub3 = list3.getSubList(0, 2);
      expect(sub3.size()).assertEqual(2);
      expect(sub3.get(0)).assertEqual(2.220446049250313e-16);

      const num4: number = Number.MAX_SAFE_INTEGER;
      const list4: List<number> = new List<number>([17, num4, 18]);
      const sub4 = list4.getSubList(1, 3);
      expect(sub4.size()).assertEqual(2);
      expect(sub4.get(0)).assertEqual(9007199254740991);

      const num5: number = 123.456;
      const list5: List<number> = new List<number>([num5, 19, 20]);
      const sub5 = list5.getSubList(0, 3);
      expect(sub5.size()).assertEqual(3);
      expect(sub5.get(0)).assertEqual(123.456);
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_1300
     * @tc.name      testList12Chapter0013
     * @tc.desc      Test getSubList with hex/octal/scientific numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0013';
      console.log(TAG + ' start');

      const num1: number = 0x0102;
      const list1: List<number> = new List<number>([num1, 21, 22]);
      const sub1 = list1.getSubList(0, 1);
      expect(sub1.size()).assertEqual(1);
      expect(sub1.get(0)).assertEqual(258);

      const num2: number = 0o3;
      const list2: List<number> = new List<number>([23, num2, 24]);
      const sub2 = list2.getSubList(1, 2);
      expect(sub2.size()).assertEqual(1);
      expect(sub2.get(0)).assertEqual(3);

      const num3: number = 1e3;
      const list3: List<number> = new List<number>([num3, 25, 26]);
      const sub3 = list3.getSubList(0, 2);
      expect(sub3.size()).assertEqual(2);
      expect(sub3.get(0)).assertEqual(1000);

      const num4: number = 2 ** 3;
      const list4: List<number> = new List<number>([27, num4, 28]);
      const sub4 = list4.getSubList(1, 3);
      expect(sub4.size()).assertEqual(2);
      expect(sub4.get(0)).assertEqual(8);

      const num5: number = -128;
      const list5: List<number> = new List<number>([num5, 29, 30]);
      const sub5 = list5.getSubList(0, 3);
      expect(sub5.size()).assertEqual(3);
      expect(sub5.get(0)).assertEqual(-128);
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_1400
     * @tc.name      testList12Chapter0014
     * @tc.desc      Test getSubList with BigInt values (max/min/hex)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0014';
      console.log(TAG + ' start');

      const bigInt1: bigint = 9007199254740991n;
      const list1: List<bigint> = new List<bigint>([bigInt1, 123n, 456n]);
      const sub1 = list1.getSubList(0, 2);
      expect(sub1.size()).assertEqual(2);
      expect(sub1.get(0)).assertEqual(9007199254740991n);

      const bigInt2: bigint = -9223372036854775808n;
      const list2: List<bigint> = new List<bigint>([789n, bigInt2, 1011n]);
      const sub2 = list2.getSubList(1, 2);
      expect(sub2.size()).assertEqual(1);
      expect(sub2.get(0)).assertEqual(-9223372036854775808n);

      const bigInt3: bigint = 18446744073709551615n;
      const list3: List<bigint> = new List<bigint>([bigInt3, 1213n, 1415n]);
      const sub3 = list3.getSubList(0, 1);
      expect(sub3.size()).assertEqual(1);
      expect(sub3.get(0)).assertEqual(18446744073709551615n);

      const bigInt4: bigint = 0xdecafafecacefaden;
      const list4: List<bigint> = new List<bigint>([1617n, bigInt4, 1819n]);
      const sub4 = list4.getSubList(1, 3);
      expect(sub4.size()).assertEqual(2);
      expect(sub4.get(0)).assertEqual(0xdecafafecacefaden);

      const bigInt5: bigint = 0n;
      const list5: List<bigint> = new List<bigint>([bigInt5, 2021n, 2223n]);
      const sub5 = list5.getSubList(0, 3);
      expect(sub5.size()).assertEqual(3);
      expect(sub5.get(0)).assertEqual(0n);
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_1500
     * @tc.name      testList12Chapter0015
     * @tc.desc      Test getSubList with boolean values (true/false/!0/!str)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0015';
      console.log(TAG + ' start');

      const bool1: boolean = true;
      const list1: List<boolean> = new List<boolean>([bool1, false, true]);
      const sub1 = list1.getSubList(0, 2);
      expect(sub1.size()).assertEqual(2);
      expect(sub1.get(0)).assertEqual(true);

      const bool2: boolean = false;
      const list2: List<boolean> = new List<boolean>([true, bool2, false]);
      const sub2 = list2.getSubList(1, 3);
      expect(sub2.size()).assertEqual(2);
      expect(sub2.get(0)).assertEqual(false);

      const bool3: boolean = !0;
      const list3: List<boolean> = new List<boolean>([bool3, true, false]);
      const sub3 = list3.getSubList(0, 1);
      expect(sub3.size()).assertEqual(1);
      expect(sub3.get(0)).assertEqual(true);

      const bool4: boolean = !'s';
      const list4: List<boolean> = new List<boolean>([true, bool4, true]);
      const sub4 = list4.getSubList(1, 2);
      expect(sub4.size()).assertEqual(1);
      expect(sub4.get(0)).assertEqual(false);

      const bool5: boolean = Boolean(1);
      const list5: List<boolean> = new List<boolean>([bool5, false, true]);
      const sub5 = list5.getSubList(0, 3);
      expect(sub5.size()).assertEqual(3);
      expect(sub5.get(0)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_1600
     * @tc.name      testList12Chapter0016
     * @tc.desc      Test getSubList with falsy values (0/"" null/undefined/NaN)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0016';
      console.log(TAG + ' start');

      const val1: number = 0;
      const list1: List<number> = new List<number>([val1, 1, 2]);
      const sub1 = list1.getSubList(0, 1);
      expect(sub1.size()).assertEqual(1);
      expect(Boolean(sub1.get(0))).assertEqual(false);

      const val2: string = "";
      const list2: List<string> = new List<string>([val2, 'a', 'b']);
      const sub2 = list2.getSubList(0, 2);
      expect(sub2.size()).assertEqual(2);
      expect(Boolean(sub2.get(0))).assertEqual(false);

      const val3: null = null;
      const list3: List<null> = new List<null>([val3, null, null]);
      const sub3 = list3.getSubList(1, 2);
      expect(sub3.size()).assertEqual(1);
      expect(Boolean(sub3.get(0))).assertEqual(false);

      const val4: undefined = undefined;
      const list4: List<undefined> = new List<undefined>([undefined, val4, undefined]);
      const sub4 = list4.getSubList(1, 3);
      expect(sub4.size()).assertEqual(2);
      expect(Boolean(sub4.get(0))).assertEqual(false);

      const val5: number = NaN;
      const list5: List<number> = new List<number>([val5, 3, 4]);
      const sub5 = list5.getSubList(0, 3);
      expect(sub5.size()).assertEqual(3);
      expect(Boolean(sub5.get(0))).assertEqual(false);
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_1700
     * @tc.name      testList12Chapter0017
     * @tc.desc      Test getSubList with normal/zero/negative/empty arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0017';
      console.log(TAG + ' start');

      const arr1: number[] = [72, 101, 108, 108, 111];
      const list1: List<number[]> = new List<number[]>([arr1, [1, 2], [3, 4]]);
      const sub1 = list1.getSubList(0, 1);
      expect(sub1.size()).assertEqual(1);
      expect(sub1.get(0)).assertEqual(arr1);

      const arr2: number[] = [72, 101, 0, 0, 111];
      const list2: List<number[]> = new List<number[]>([[5, 6], arr2, [7, 8]]);
      const sub2 = list2.getSubList(1, 2);
      expect(sub2.size()).assertEqual(1);
      expect(sub2.get(0)?.[2]).assertEqual(0);

      const arr3: number[] = [72, -111, 108, 108, 111];
      const list3: List<number[]> = new List<number[]>([arr3, [9, 10], [11, 12]]);
      const sub3 = list3.getSubList(0, 2);
      expect(sub3.size()).assertEqual(2);
      expect(sub3.get(0)?.[1]).assertEqual(-111);

      const arr4: number[] = [];
      const list4: List<number[]> = new List<number[]>([[13, 14], arr4, [15, 16]]);
      const sub4 = list4.getSubList(1, 3);
      expect(sub4.size()).assertEqual(2);
      expect(sub4.get(0)?.length).assertEqual(0);

      const arr5: (number | string)[] = [72, 'a', 108, 108, 111];
      const list5: List<(number | string)[]> = new List<(number | string)[]>([arr5, [17, 18], [19, 20]]);
      const sub5 = list5.getSubList(0, 3);
      expect(sub5.size()).assertEqual(3);
      expect(sub5.get(0)?.[1]).assertEqual('a');
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_1800
     * @tc.name      testList12Chapter0018
     * @tc.desc      Test getSubList with modified/typed/special value arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0018';
      console.log(TAG + ' start');

      const arr1: number[] = [];
      arr1.push(333);
      const list1: List<number[]> = new List<number[]>([arr1, [1, 2]]);
      const sub1 = list1.getSubList(0, 1);
      expect(sub1.size()).assertEqual(1);
      expect(sub1.get(0)?.[0]).assertEqual(333);

      const arr2: (number | undefined)[] = [1, 2, 3, 4, 5];
      arr2.splice(2, 1, undefined);
      const list2: List<(number | undefined)[]> = new List<(number | undefined)[]>([arr2, [6, 7]]);
      const sub2 = list2.getSubList(0, 1);
      expect(sub2.size()).assertEqual(1);
      expect(sub2.get(0)?.[2]).assertUndefined();

      const arr3: (number | string | boolean)[] = [72, 'abc', true, 108];
      const typedArr3 = new Uint8Array(arr3.filter(item => typeof item === 'number') as number[]);
      const list3: List<Uint8Array> = new List<Uint8Array>([typedArr3, new Uint8Array([109, 110])]);
      const sub3 = list3.getSubList(0, 2);
      expect(sub3.size()).assertEqual(2);
      expect(sub3.get(0)?.length).assertEqual(2);

      const arr4: number[] = [256, 65536, 32768];
      const typedArr4 = new Uint8Array(arr4);
      const list4: List<Uint8Array> = new List<Uint8Array>([typedArr4, new Uint8Array([128])]);
      const sub4 = list4.getSubList(0, 1);
      expect(sub4.size()).assertEqual(1);
      expect(sub4.get(0)?.[0]).assertEqual(0);

      const arr5: number[] = [72, NaN, Infinity, 108];
      const typedArr5 = new Float32Array(arr5);
      const list5: List<Float32Array> = new List<Float32Array>([typedArr5, new Float32Array([111])]);
      const sub5 = list5.getSubList(0, 2);
      expect(sub5.size()).assertEqual(2);
      expect(isNaN(sub5.get(0)?.[1] ?? NaN)).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_1900
     * @tc.name      testList12Chapter0019
     * @tc.desc      Test getSubList with basic TypedArray (Uint8/Int8/Uint16/Int16)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0019';
      console.log(TAG + ' start');

      const arr1: Uint8Array = createUint8Array([72, 101, 108, 108, 111]);
      const list1: List<Uint8Array> = new List<Uint8Array>([arr1, createUint8Array([109, 110])]);
      const sub1 = list1.getSubList(0, 1);
      expect(sub1.size()).assertEqual(1);
      expect(sub1.get(0)![0]).assertEqual(72);

      const arr2: Int8Array = new Int8Array([-128, 127, 0]);
      const list2: List<Int8Array> = new List<Int8Array>([new Int8Array([1, 2]), arr2]);
      const sub2 = list2.getSubList(1, 2);
      expect(sub2.size()).assertEqual(1);
      expect(sub2.get(0)![0]).assertEqual(-128);

      const arr3: Uint16Array = new Uint16Array([0, 65535]);
      const list3: List<Uint16Array> = new List<Uint16Array>([arr3, new Uint16Array([123, 456])]);
      const sub3 = list3.getSubList(0, 1);
      expect(sub3.size()).assertEqual(1);
      expect(sub3.get(0)?.[1]).assertEqual(65535);

      const arr4: Int16Array = new Int16Array([-32768, 32767]);
      const list4: List<Int16Array> = new List<Int16Array>([new Int16Array([1213]), arr4]);
      const sub4 = list4.getSubList(1, 2);
      expect(sub4.size()).assertEqual(1);
      expect(sub4.get(0)?.[0]).assertEqual(-32768);

      const arr5: Float32Array = new Float32Array([-3.4e38, 3.4e38]);
      const list5: List<Float32Array> = new List<Float32Array>([arr5, new Float32Array([1.2e-38])]);
      const sub5 = list5.getSubList(0, 1);
      expect(sub5.size()).assertEqual(1);
      expect(Math.abs(sub5.get(0)![0] + 3.4e38) < 1e34).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_2000
     * @tc.name      testList12Chapter0020
     * @tc.desc      Test getSubList with advanced TypedArray/DataView/BigInt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0020';
      console.log(TAG + ' start');

      const arr1: Uint8ClampedArray = new Uint8ClampedArray([-1, 256, 100]);
      const list1: List<Uint8ClampedArray> = new List<Uint8ClampedArray>([arr1, new Uint8ClampedArray([200])]);
      const sub1 = list1.getSubList(0, 1);
      expect(sub1.size()).assertEqual(1);
      expect(sub1.get(0)?.[0]).assertEqual(0);
      expect(sub1.get(0)?.[1]).assertEqual(255);
      const list2: List<BigInt64Array> = new List<BigInt64Array>([new BigInt64Array([1n, 2n])]);
      const sub2 = list2.getSubList(0, 1);
      expect(sub2.get(0)?.[0]).assertEqual(1n);

      const arr3: Uint8Array = new Uint8Array([1, 2]);
      const arr4: Int16Array = new Int16Array([3, 4]);
      const arr5: DataView = new DataView(new ArrayBuffer(8));
      const list3: List<Uint8Array | Int16Array | DataView> =
        new List<Uint8Array | Int16Array | DataView>([arr3, arr4, arr5]);
      const sub3 = list3.getSubList(0, 3);
      expect(sub3.size()).assertEqual(3);
      expect((sub3.get(0) as Uint8Array)[0]).assertEqual(1);
      expect((sub3.get(1) as Int16Array)[0]).assertEqual(3);
      expect((sub3.get(2) as DataView).buffer.byteLength).assertEqual(8);

      const arr6: Float64Array = new Float64Array([Infinity, -Infinity, NaN]);
      const list4: List<Float64Array> = new List<Float64Array>([arr6, new Float64Array([1.23])]);
      const sub4 = list4.getSubList(0, 1);
      expect(sub4.get(0)?.[0]).assertEqual(Infinity);
      expect(isNaN(sub4.get(0)?.[2] ?? NaN)).assertTrue();

      const arr7: BigUint64Array = new BigUint64Array([0n, 18446744073709551615n]);
      const list5: List<BigUint64Array> = new List<BigUint64Array>([arr7, new BigUint64Array([1n])]);
      const sub5 = list5.getSubList(0, 1);
      expect(sub5.get(0)?.[1]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_2100
     * @tc.name      testList12Chapter0021
     * @tc.desc      Test getSubList with normal/empty/special/nested objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0021';
      console.log(TAG + ' start');

      const obj1: NormalObject = new NormalObject(1, "test1", [1, 2, 3]);
      const list1: List<NormalObject> = new List<NormalObject>([obj1, new NormalObject(2, "test2", [4, 5])]);
      const sub1 = list1.getSubList(0, 1);
      expect(sub1.size()).assertEqual(1);
      expect(sub1.get(0)!.a).assertEqual(1);

      const emptyObj: EmptyObject = new EmptyObject();
      const list2: List<EmptyObject> = new List<EmptyObject>([emptyObj, new EmptyObject()]);
      const sub2 = list2.getSubList(1, 2);
      expect(sub2.size()).assertEqual(1);
      expect(isEmptyObject(sub2.get(0)!)).assertTrue();

      const specObj1: SpecialValueObject = new SpecialValueObject(null);
      const list3: List<SpecialValueObject> = new List<SpecialValueObject>([specObj1,
        new SpecialValueObject(undefined)]);
      const sub3 = list3.getSubList(0, 2);
      expect(sub3.size()).assertEqual(2);
      expect(sub3.get(0)!.value).assertEqual(null);

      const inheritObj: InheritObject = new InheritObject(10);
      const list4: List<InheritObject> = new List<InheritObject>([new InheritObject(20), inheritObj]);
      const sub4 = list4.getSubList(1, 2);
      expect(sub4.size()).assertEqual(1);
      expect(sub4.get(0)!.parentProp).assertEqual(10);

      const nestedObj: NestedObject = new NestedObject(1, new NestedLevel2(2, new NestedLevel3(3)));
      const list5: List<NestedObject> =
        new List<NestedObject>([nestedObj, new NestedObject(4, new NestedLevel2(5, new NestedLevel3(6)))]);
      const sub5 = list5.getSubList(0, 1);
      expect(sub5.size()).assertEqual(1);
      expect(sub5.get(0)!.b.d.e).assertEqual(3);
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_2200
     * @tc.name      testList12Chapter0022
     * @tc.desc      Test getSubList with symbol/large/mixed collection objects
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testList12Chapter0022';
      console.log(TAG + ' start');

      const symbolObj: SymbolKeyObject = new SymbolKeyObject(123);
      const list1: List<SymbolKeyObject> = new List<SymbolKeyObject>([symbolObj, new SymbolKeyObject(456)]);
      const sub1 = list1.getSubList(0, 1);
      expect(sub1.size()).assertEqual(1);
      expect(sub1.get(0)!.getSymbolValue()).assertEqual("symbolVal");
      expect(sub1.get(0)!.normalKey).assertEqual(123);

      const nonEnumObj: NonEnumObject = new NonEnumObject(789);
      const list2: List<NonEnumObject> = new List<NonEnumObject>([nonEnumObj, new NonEnumObject(321)]);
      const sub2 = list2.getSubList(0, 1);
      expect(sub2.size()).assertEqual(1);
      expect(sub2.get(0)!.a).assertEqual(789);
      expect(sub2.get(0)!.nonEnumProp).assertEqual(999);

      const largeObj: LargeObject = new LargeObject(1000);
      const list3: List<LargeObject> = new List<LargeObject>([largeObj, new LargeObject(2000)]);
      const sub3 = list3.getSubList(0, 1);
      expect(sub3.size()).assertEqual(1);
      expect(sub3.get(0)!.getPropertyCount()).assertEqual(1000);
      expect(sub3.get(0)!.getProperty("999")).assertEqual(999);

      const mixedCollObj: MixedCollectionObject = new MixedCollectionObject();
      const list4: List<MixedCollectionObject> = new List<MixedCollectionObject>([mixedCollObj]);
      const sub4 = list4.getSubList(0, 1);
      expect(sub4.size()).assertEqual(1);
      expect(sub4.get(0)!.map.get('key1')).assertEqual(1);
      expect(sub4.get(0)!.set.has('val1')).assertTrue();
      expect(await sub4.get(0)!.promise).assertEqual('resolved');
      expect(sub4.get(0)!.regex.test('test')).assertTrue();

      const dataViewObj: DataViewObject = new DataViewObject(new DataView(new ArrayBuffer(16)));
      const list5: List<DataViewObject> = new List<DataViewObject>([dataViewObj]);
      const sub5 = list5.getSubList(0, 1);
      expect(sub5.size()).assertEqual(1);
      expect(sub5.get(0)!.view.buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_2300
     * @tc.name      testList12Chapter0023
     * @tc.desc      Test getSubList with Reflect modified objects/arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0023';
      console.log(TAG + ' start');

      const obj1 = new NormalObject(1, "test1", [1,2,3]);
      Reflect.set(obj1, 'b', undefined);
      const list1: List<NormalObject> = new List<NormalObject>([obj1, new NormalObject(2, "test2", [4,5])]);
      const sub1 = list1.getSubList(0, 1);
      expect(sub1.size()).assertEqual(1);
      expect(sub1.get(0)!.b).assertUndefined();

      const arr1: (number | undefined)[] = [1, 2, 3, 4, 5];
      arr1.splice(2, 1, undefined);
      const list2: List<(number | undefined)[]> = new List<(number | undefined)[]>([arr1, [6,7]]);
      const sub2 = list2.getSubList(0, 1);
      expect(sub2.size()).assertEqual(1);
      expect(sub2.get(0)![2]).assertUndefined();

      const obj2 = new NormalObject(3, "test3", [8,9]);
      const list3: List<NormalObject> = new List<NormalObject>([obj2]);
      const sub3 = list3.getSubList(0, 1);
      expect(sub3.size()).assertEqual(1);
      expect(sub3.get(0)!.b).assertEqual("test3");
      const obj3 = new InheritObject(200);
      Reflect.set(obj3, 'extraProp', undefined);
      const list4: List<InheritObject> = new List<InheritObject>([obj3]);
      const sub4 = list4.getSubList(0, 1);
      expect(sub4.size()).assertEqual(1);
      expect(sub4.get(0)!.extraProp).assertUndefined();

      const obj4 = new NormalObject(4, "test4", [10,11]);
      const list5: List<NormalObject> = new List<NormalObject>([obj4]);
      const sub5 = list5.getSubList(0, 1);
      expect(sub5.size()).assertEqual(1);
      expect(JSON.stringify(sub5.get(0)!.c)).assertEqual(JSON.stringify([10,11]));
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_2400
     * @tc.name      testList12Chapter0024
     * @tc.desc      Test getSubList with valid/invalid range/empty List
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0024';
      console.log(TAG + ' start');
      const list1: List<number> = new List<number>();
      list1.add(1);
      list1.add(2);
      list1.add(3);
      list1.add(4);
      list1.add(5);

      const arr1 = list1.getSubList(0, 2).convertToArray();
      expect(arr1.length).assertEqual(2);
      expect(arr1[0]).assertEqual(1);
      expect(arr1[1]).assertEqual(2);

      const arr2 = list1.getSubList(2, 2).convertToArray();
      expect(arr2.length).assertEqual(0);

      const emptyList: List<number> = new List<number>();
      const arr3 = emptyList.getSubList(0, 0).convertToArray();
      expect(arr3.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_2500
     * @tc.name      testList12Chapter0025
     * @tc.desc      Test clear() for List with Int8/Uint8/Uint8Clamped TypedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0025';
      console.log(TAG + ' start');
      const int8Arr1 = new Int8Array([-128]);
      const int8Arr2 = new Int8Array([127]);
      const list1: List<Int8Array> = new List<Int8Array>();
      list1.add(int8Arr1);
      list1.add(int8Arr2);
      expect(list1.length).assertEqual(2);

      list1.clear();

      expect(list1.length).assertEqual(0);
      const int8ItemAfterClear = list1.get(0);
      expect(int8ItemAfterClear).assertEqual(undefined);

      const uint8Arr1 = new Uint8Array([0]);
      const uint8Arr2 = new Uint8Array([255]);
      const list2: List<Uint8Array> = new List<Uint8Array>();
      list2.add(uint8Arr1);
      list2.add(uint8Arr2);
      expect(list2.length).assertEqual(2);
      list2.clear();
      expect(list2.length).assertEqual(0);
      expect(list2.get(0)).assertEqual(undefined);

      const clampedArr1 = new Uint8ClampedArray([0]);
      const clampedArr2 = new Uint8ClampedArray([255]);
      const list3: List<Uint8ClampedArray> = new List<Uint8ClampedArray>();
      list3.add(clampedArr1);
      list3.add(clampedArr2);
      expect(list3.length).assertEqual(2);
      list3.clear();
      expect(list3.length).assertEqual(0);
      expect(list3.get(0)).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_2600
     * @tc.name      testList12Chapter0026
     * @tc.desc      Test clear() for floating-point/BigInt TypedArray List
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0026';
      console.log(TAG + ' start');

      const float32Arr1 = new Float32Array([3.14]);
      const float32Arr2 = new Float32Array([Infinity]);
      const floatList: List<Float32Array> = new List<Float32Array>();
      floatList.add(float32Arr1);
      floatList.add(float32Arr2);
      expect(floatList.length).assertEqual(2);
      expect(floatList.get(1)?.[0]).assertEqual(Number.POSITIVE_INFINITY);

      floatList.clear();

      expect(floatList.length).assertEqual(0);
      expect(floatList.get(0)).assertEqual(undefined);

      const bigInt64Arr = new BigInt64Array([123n]);
      const bigUint64Arr = new BigUint64Array([456n]);
      const bigIntList1: List<BigInt64Array> = new List<BigInt64Array>();
      const bigIntList2: List<BigUint64Array> = new List<BigUint64Array>();

      bigIntList1.add(bigInt64Arr);
      bigIntList2.add(bigUint64Arr);
      expect(bigIntList1.length).assertEqual(1);
      expect(bigIntList2.length).assertEqual(1);

      bigIntList1.clear();
      bigIntList2.clear();
      expect(bigIntList1.length).assertEqual(0);
      expect(bigIntList2.length).assertEqual(0);
      expect(bigIntList1.get(0)).assertEqual(undefined);
      expect(bigIntList2.get(0)).assertEqual(undefined);

      const emptyFloatList: List<Float64Array> = new List<Float64Array>();
      emptyFloatList.clear();
      expect(emptyFloatList.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_2700
     * @tc.name      testList12Chapter0027
     * @tc.desc      Test clear() for mixed TypedArray List and re-add after clear
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0027';
      console.log(TAG + ' start');

      const int8Arr = new Int8Array([10]);
      const uint16Arr = new Uint16Array([200]);
      const float32Arr = new Float32Array([3.14]);
      const mixedList: List<TypedArray> = new List<TypedArray>();
      mixedList.add(int8Arr);
      mixedList.add(uint16Arr);
      mixedList.add(float32Arr);

      expect(mixedList.length).assertEqual(3);
      expect((mixedList.get(2) as Float32Array)[0]).assertClose(3.14, 0.01);

      mixedList.clear();

      expect(mixedList.length).assertEqual(0);
      expect(mixedList.get(0)).assertEqual(undefined);
      expect(mixedList.get(2)).assertEqual(undefined);

      const bigUint64Arr = new BigUint64Array([123456789n]);
      mixedList.add(bigUint64Arr);
      expect(mixedList.length).assertEqual(1);
      expect((mixedList.get(0) as BigUint64Array)[0]).assertEqual(123456789n);

      mixedList.clear();
      mixedList.clear();
      mixedList.clear();
      expect(mixedList.length).assertEqual(0);
      expect(mixedList.get(0)).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_2800
     * @tc.name      testList12Chapter0028
     * @tc.desc      Test clear() with normal Uint8Array and multi-zero number arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0028';
      console.log(TAG + ' start');
      const normalUint8Arr: Uint8Array = new Uint8Array
      ([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);
      const zeroArr: number[] = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];

      const list: List<TestArray> = new List<TestArray>();
      list.add(normalUint8Arr);
      list.add(zeroArr);

      expect(list.length).assertEqual(2);

      list.clear();
      expect(list.length).assertEqual(0);
      const item0AfterClear = list.get(0) as Uint8Array | undefined;
      const item1AfterClear = list.get(1) as number[] | undefined;
      expect(item0AfterClear).assertEqual(undefined);
      expect(item1AfterClear).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_2900
     * @tc.name      testList12Chapter0029
     * @tc.desc      Test clear() with negative/typed/non-numeric index arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0029';
      console.log(TAG + ' start');

      const negativeArr: number[] = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      const uint8NegArr: Uint8Array = new Uint8Array(negativeArr);
      const int8NegArr: Int8Array = new Int8Array(negativeArr);

      const nonNumericMap: Map<string, number> = new Map<string, number>();
      nonNumericMap.set("abc", 111);
      nonNumericMap.set("aaa", 222);
      const numericArr: number[] = [333];
      const list: List<TypedArray | number[]> = new List<TypedArray | number[]>();
      list.add(uint8NegArr);
      list.add(int8NegArr);
      list.add(numericArr);
      expect(list.length).assertEqual(3);
      list.clear();
      expect(list.length).assertEqual(0);
      expect(list.get(0)).assertEqual(undefined);
      expect(list.get(2)).assertEqual(undefined);
      expect(nonNumericMap.get("abc")).assertEqual(111);
      expect(nonNumericMap.get("aaa")).assertEqual(222);
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_3000
     * @tc.name      testList12Chapter0030
     * @tc.desc      Test clear() with NaN/Infinity/mixed type value arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0030';
      console.log(TAG + ' start');
      const specialValueArr: number[] = [72, 101, NaN, Infinity, -Infinity, 108, 111];
      const nonNumericTypeArr: (number | string | boolean | null | undefined)[] =
        [72, "abc", true, null, undefined, 108];
      const list: List<number[] | (number | string | boolean | null | undefined)[]> = new List<number[] |
      (number | string | boolean | null | undefined)[]>();
      list.add(specialValueArr);
      list.add(nonNumericTypeArr);
      expect(list.length).assertEqual(2);
      list.clear();
      expect(list.length).assertEqual(0);
      const item0AfterClear = list.get(0) as number[] | undefined;
      const item1AfterClear = list.get(1) as (number | string | boolean | null | undefined)[] | undefined;
      expect(item0AfterClear).assertEqual(undefined);
      expect(item1AfterClear).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_3100
     * @tc.name      testList12Chapter0031
     * @tc.desc      Test clear() with empty/overflow/deleted element arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0031';
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
      list.clear();
      expect(list.length).assertEqual(0);
      expect(list.get(0)).assertEqual(undefined);
      expect(list.get(2)).assertEqual(undefined);
      list.clear();
      expect(list.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_3200
     * @tc.name      testList12Chapter0032
     * @tc.desc      Test clear() with nested/typed/large length arrays
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testList12Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0032';
      console.log(TAG + ' start');
      const level3Arr: number[] = [5, 6];
      const level2Arr1: number[] = [2, 3];
      const level2Arr2: (number | number[])[] = [4, level3Arr];
      const nestedArr: (number | number[] | (number | number[])[])[] = [1, level2Arr1, level2Arr2];
      const typedSubArr: TypedArray[] = [new Int32Array([10, 20]), new Float64Array([3.14, 6.28])];
      const largeArr: number[] = new Array(1000000).fill(1);
      const nestedList: List<(number | number[] | (number | number[])[])[]> =
        new List<(number | number[] | (number | number[])[])[]>();
      nestedList.add(nestedArr);
      const typedList: List<TypedArray[]> = new List<TypedArray[]>();
      typedList.add(typedSubArr);
      const largeList: List<number[]> = new List<number[]>();
      largeList.add(largeArr);

      expect(nestedList.length).assertEqual(1);
      expect(typedList.length).assertEqual(1);
      expect(largeList.length).assertEqual(1);
      nestedList.clear();
      typedList.clear();
      largeList.clear();

      expect(nestedList.length).assertEqual(0);
      expect(typedList.length).assertEqual(0);
      expect(largeList.length).assertEqual(0);

      expect(nestedList.get(0)).assertEqual(undefined);
      expect(typedList.get(0)).assertEqual(undefined);
      expect(largeList.get(0)).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_3300
     * @tc.name      testList12Chapter0033
     * @tc.desc      Test clear() with nested/typed/large length arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0033';
      console.log(TAG + ' start');
      type MixedElement = (() => string) | string;
      const func: () => string = () => "testResult";
      const mixedTypeArr: MixedElement[] = [func, "0", "NaN", ""];

      const list: List<MixedElement[]> = new List<MixedElement[]>();
      list.add(mixedTypeArr);
      expect(list.length).assertEqual(1);
      list.clear();
      expect(list.length).assertEqual(0);
      const item0AfterClear = list.get(0) as MixedElement[] | undefined;
      expect(item0AfterClear).assertEqual(undefined);
      expect(func()).assertEqual("testResult");
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_3400
     * @tc.name      testList12Chapter0034
     * @tc.desc      Test clear empty list, verify length and isEmpty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0034';
      console.log(TAG + ' start');
      const emptyList = new List<number>();
      emptyList.clear();
      expect(emptyList.size()).assertEqual(0);
      expect(emptyList.isEmpty()).assertTrue();
      expect(emptyList.get(0)).assertEqual(undefined);
      expect(emptyList.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_3500
     * @tc.name      testList12Chapter0035
     * @tc.desc      Test clear list with basic number elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0035';
      console.log(TAG + ' start');
      const numberList = new List<number>();
      numberList.add(2);
      numberList.add(4);
      numberList.add(5);
      numberList.add(4);
      expect(numberList.size()).assertEqual(4);
      expect(numberList.isEmpty()).assertFalse();
      expect(numberList.get(2)).assertEqual(5);
      expect(numberList.length).assertEqual(4);
      numberList.clear();
      expect(numberList.size()).assertEqual(0);
      expect(numberList.isEmpty()).assertTrue();
      expect(numberList.get(0)).assertEqual(undefined);
      expect(numberList.length).assertEqual(0);
      numberList.add(10);
      expect(numberList.size()).assertEqual(1);
      expect(numberList.get(0)).assertEqual(10);
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_3600
     * @tc.name      testList12Chapter0036
     * @tc.desc      Test clear list with string elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0036';
      console.log(TAG + ' start');
      const stringList = new List<string>();
      stringList.add("test1");
      stringList.add("");
      stringList.add("!@#$%^&*()");
      stringList.add(String(undefined));
      stringList.add(String(null));
      stringList.add("👆👿👀💯🎅");
      stringList.add("\n\r\t\\'\"");
      expect(stringList.size()).assertEqual(7);
      expect(stringList.isEmpty()).assertFalse();
      expect(stringList.get(2)).assertEqual("!@#$%^&*()");
      stringList.clear();
      expect(stringList.size()).assertEqual(0);
      expect(stringList.isEmpty()).assertTrue();
      expect(stringList.get(5)).assertEqual(undefined);
      expect(stringList.length).assertEqual(0);
      stringList.add("new test");
      expect(stringList.size()).assertEqual(1);
      expect(stringList.get(0)).assertEqual("new test");
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_3700
     * @tc.name      testList12Chapter0037
     * @tc.desc      Test clear list with boolean elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0037';
      console.log(TAG + ' start');
      const booleanList = new List<boolean>();
      booleanList.add(true);
      booleanList.add(false);
      booleanList.add(Boolean(0));
      booleanList.add(Boolean(""));
      booleanList.add(Boolean(1));
      expect(booleanList.size()).assertEqual(5);
      expect(booleanList.get(1)).assertEqual(false);
      expect(booleanList.get(3)).assertEqual(false);
      booleanList.clear();
      expect(booleanList.size()).assertEqual(0);
      expect(booleanList.isEmpty()).assertTrue();
      expect(booleanList.get(0)).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEXT12_3800
     * @tc.name      testList12Chapter0038
     * @tc.desc      Test clear list with special number elements (NaN/Infinity)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList12Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList12Chapter0038';
      console.log(TAG + ' start');
      const specialNumList = new List<number | undefined | null>();
      specialNumList.add(NaN);
      specialNumList.add(Infinity);
      specialNumList.add(-Infinity);
      specialNumList.add(-0);
      specialNumList.add(undefined);
      specialNumList.add(null);
      specialNumList.add(Number.MAX_VALUE);
      specialNumList.add(Number.MIN_VALUE);
      expect(specialNumList.size()).assertEqual(8);
      expect(isNaN(specialNumList.get(0) as number)).assertTrue();
      expect(specialNumList.get(2)).assertEqual(-Infinity);
      specialNumList.clear();
      expect(specialNumList.size()).assertEqual(0);
      expect(specialNumList.isEmpty()).assertTrue();
      expect(specialNumList.get(7)).assertEqual(undefined);
    });
  })
}