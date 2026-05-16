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
  convertToArray(): Array<T> {
    return this.data.slice();
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
  set(index: number, element: T): T {
    const oldValue = this.data[index];
    this.data[index] = element;
    return oldValue;
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
  forEach(
    callbackFn: (value: T, index: number, list: List<T>, context?: Object) => void,
    context?: Object
  ): void {
    const len: number = this.data.length;
    for (let i: number = 0; i < len; i++) {
      const val: T = this.data[i];
      callbackFn(val, i, this, context);
    }
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

interface ChildObj {
  parent: NestedCycleObj;
}
interface NestedCycleObj {
  b: number;
  child: ChildObj;
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
interface VerifyResult {
  index0: boolean;
  index1: boolean;
  index2: boolean;
}

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ListTest10() {
  describe('ListTest10', () => {
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
     * @tc.number    SUB_LIST_TEXT10_0100
     * @tc.name      testList10Chapter0001
     * @tc.desc      List.replaceAllElements: special value objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList10Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList10Chapter0001';
      console.log(TAG + ' start');
      const specialValObj = new SpecialValueObject(NaN, Infinity, -Infinity);
      specialValObj.a = undefined;
      specialValObj.b = null;
      const specialValExtObj = new SpecialValueExtObject(NaN, -Infinity);
      const insertObj1 = new SpecialValueInsertObject(undefined, undefined, undefined, null);
      const insertObj2 = new SpecialValueInsertObject(NaN);
      const insertObj3 = new SpecialValueInsertObject(undefined, Infinity);

      const listSpecialVal = new List<SpecialValueObject>();
      listSpecialVal.add(specialValObj);
      listSpecialVal.replaceAllElements((value) => value);

      expect(listSpecialVal.get(0)!.a).assertEqual(undefined);
      expect(listSpecialVal.get(0)!.b).assertEqual(null);
      expect(isNaN(listSpecialVal.get(0)!.c)).assertTrue();
      expect(listSpecialVal.get(0)!.d).assertEqual(Infinity);

      const listAdd = new List<Object>();
      listAdd.add(specialValObj);
      listAdd.add(specialValExtObj);
      expect(listAdd.size()).assertEqual(2);
      expect(isNaN((listAdd.get(1) as SpecialValueExtObject).f)).assertTrue();
      expect((listAdd.get(1) as SpecialValueExtObject).g).assertEqual(-Infinity);

      const listInsert = new List<Object>();
      listInsert.add(specialValObj);
      listInsert.replaceAllElements((value) => value);

      listInsert.insert(1, insertObj1);
      listInsert.insert(0, insertObj2);
      listInsert.insert(5, insertObj3);
      expect(listInsert.size()).assertEqual(4);
      expect(isNaN((listInsert.get(0) as SpecialValueInsertObject).j)).assertTrue();
      expect((listInsert.get(2) as SpecialValueInsertObject).h).assertEqual(undefined);
      expect((listInsert.get(3) as SpecialValueInsertObject).k).assertEqual(Infinity);
    });

    /**
     * @tc.number    SUB_LIST_TEXT10_0200
     * @tc.name      testList10Chapter0002
     * @tc.desc      List.replaceAllElements: large/mixed/small/newKey objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList10Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList10Chapter0002';
      console.log(TAG + ' start');
      const largeObj = new LargeObject(10000);
      const mixedObj = new MixedObject(
        123, "test", true, null,
        new NestedLevel2(456, new NestedLevel3(0)),
        new Map([['key', 'val']]),
        new Set([1, 2, 3]),
        /abc/,
        new ArrayBuffer(8)
      );
      const smallObj = new SmallObject(1);
      const newKeyObj = new NewKeyObject("newVal");
      const listLarge = new List<LargeObject>();
      listLarge.add(largeObj);
      listLarge.replaceAllElements((value) => value);

      expect(listLarge.get(0)!.getPropertyCount()).assertEqual(10000);
      expect(listLarge.get(0)!.getProperty("9999")).assertEqual(9999);
      const listMixed = new List<MixedObject>();
      listMixed.add(mixedObj);
      listMixed.replaceAllElements((value) => value);

      expect(listMixed.get(0)!.a).assertEqual(123);
      expect(listMixed.get(0)!.f.get('key')).assertEqual('val');
      expect(listMixed.get(0)!.i.byteLength).assertEqual(8);

      const listAdd = new List<Object>();
      listAdd.add(largeObj);
      listAdd.add(mixedObj);
      expect(listAdd.size()).assertEqual(2);
      expect((listAdd.get(0) as LargeObject).getPropertyCount()).assertEqual(10000);
      expect((listAdd.get(1) as MixedObject).g.size).assertEqual(3);

      const listInsert = new List<Object>();
      listInsert.add(largeObj);
      listInsert.replaceAllElements((value) => value);

      listInsert.insert(1, mixedObj);
      listInsert.insert(0, smallObj);
      listInsert.insert(5, newKeyObj);
      expect(listInsert.size()).assertEqual(4);
      expect((listInsert.get(0) as SmallObject).small).assertEqual(1);
      expect((listInsert.get(2) as MixedObject).g.has(2)).assertTrue();
      expect((listInsert.get(3) as NewKeyObject).newKey).assertEqual("newVal");
    });

    /**
     * @tc.number    SUB_LIST_TEXT10_0300
     * @tc.name      testList10Chapter0003
     * @tc.desc      List.forEach: normal and zero-filled Uint8Array/number arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList10Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList10Chapter0003';
      console.log(TAG + ' start');
      const normalUint8Arr: Uint8Array =
        new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);
      const zeroArr: number[] = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];

      const list: List<TestArray> = new List<TestArray>();
      list.add(normalUint8Arr);
      list.add(zeroArr);

      expect(list.length).assertEqual(2);

      list.forEach((value: TestArray, index: number, currentList: List<TestArray> | undefined) => {
        switch (index) {
          case 0:
            const uint8Item = value as Uint8Array;
            expect(uint8Item.length).assertEqual(14);
            expect(uint8Item[0]).assertEqual(72);
            expect(uint8Item[13]).assertEqual(63);
            expect(currentList!).assertEqual(list);
            break;
          case 1:
            const numberItem = value as number[];
            expect(numberItem.length).assertEqual(19);
            expect(numberItem[9]).assertEqual(0);
            expect(numberItem[13]).assertEqual(0);
            expect(numberItem[18]).assertEqual(63);
            expect(currentList!.length).assertEqual(list.length);
            break;
        }
      });
    });

    /**
     * @tc.number    SUB_LIST_TEXT10_0400
     * @tc.name      testList10Chapter0004
     * @tc.desc      List.forEach: negative number and typed arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList10Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testList10Chapter0004';
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

      list.forEach((value: TypedArray | number[], index: number,
        currentList: List<TypedArray | number[]> | undefined) => {
        switch (index) {
          case 0:
            const uint8Item = value as Uint8Array;
            expect(uint8Item[6]).assertEqual(145);
            expect(uint8Item[10]).assertEqual(207);
            break;
          case 1:
            const int8Item = value as Int8Array;
            expect(int8Item[6]).assertEqual(-111);
            expect(int8Item[10]).assertEqual(-49);
            break;
          case 2:
            const numberItem = value as number[];
            expect(numberItem.length).assertEqual(1);
            expect(numberItem[0]).assertEqual(333);
            break;
        }

        expect(currentList!).assertEqual(list);
      });

      expect(nonNumericMap.get("abc")).assertEqual(111);
      expect(nonNumericMap.get("aaa")).assertEqual(222);
    });

    /**
     * @tc.number    SUB_LIST_TEXT10_0500
     * @tc.name      testList10Chapter0005
     * @tc.desc      List.forEach: NaN/Infinity and non-numeric type arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList10Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testList10Chapter0005';
      console.log(TAG + ' start');

      const specialValueArr: number[] = [72, 101, NaN, Infinity, -Infinity, 108, 111];
      const nonNumericTypeArr: (number | string | boolean | null | undefined)[] =
        [72, "abc", true, null, undefined, 108];

      const list: List<number[] | (number | string | boolean | null | undefined)[]> =
        new List<number[] | (number | string | boolean | null | undefined)[]>();
      list.add(specialValueArr);
      list.add(nonNumericTypeArr);

      expect(list.length).assertEqual(2);

      list.forEach((value, index, currentList) => {
        switch (index) {
          case 0:
            const specialItem = value as number[];
            expect(specialItem[0]).assertEqual(72);
            expect(isNaN(specialItem[2])).assertTrue();
            expect(specialItem[3]).assertEqual(Infinity);
            expect(specialItem[4]).assertEqual(-Infinity);
            break;
          case 1:
            const nonNumericItem = value as (number | string | boolean | null | undefined)[];
            expect(nonNumericItem[1]).assertEqual("abc");
            expect(nonNumericItem[2]).assertEqual(true);
            expect(nonNumericItem[3]).assertEqual(null);
            expect(nonNumericItem[4]).assertEqual(undefined);
            break;
        }

        expect(currentList!.get(index)).assertEqual(value);
      });
    });

    /**
     * @tc.number    SUB_LIST_TEXT10_0600
     * @tc.name      testList10Chapter0006
     * @tc.desc      List.forEach: empty/overflow/deleted element arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList10Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testList10Chapter0006';
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

      const verifyResults: VerifyResult = {
        index0: false,
        index1: false,
        index2: false
      };

      list.forEach((value: number[], index: number, currentList: List<number[]> | undefined) => {
        switch (index) {
          case 0:
            expect(value.length).assertEqual(0);
            verifyResults.index0 = true;
            break;
          case 1:
            expect(value[0]).assertEqual(256);
            expect(value[1]).assertEqual(65536);
            expect(value[2]).assertEqual(32768);
            verifyResults.index1 = true;
            break;
          case 2:
            expect(value.length).assertEqual(2);
            expect(value[0]).assertEqual(1);
            expect(value[1]).assertEqual(3);
            verifyResults.index2 = true;
            break;
        }

        expect(currentList!.length).assertEqual(3);
      });

      expect(verifyResults.index0).assertTrue();
      expect(verifyResults.index1).assertTrue();
      expect(verifyResults.index2).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEXT10_0700
     * @tc.name      testList10Chapter0007
     * @tc.desc      List.forEach: nested/typed/ultra-long arrays
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("testList10Chapter0007", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async (): Promise<void> => {
      const TAG = 'testList10Chapter0007';
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

      nestedList.forEach((value, index, currentList) => {
        expect(index).assertEqual(0);
        const nestedItem = value as (number | number[] | (number | number[])[])[];
        expect(nestedItem[0] as number).assertEqual(1);
        expect((nestedItem[1] as number[])[1]).assertEqual(3);
        expect(((nestedItem[2] as (number | number[])[])[1] as number[])[0]).assertEqual(5);
        expect(currentList!).assertEqual(nestedList);
      });

      typedList.forEach((value, index, currentList) => {
        expect(index).assertEqual(0);
        const typedItem = value as TypedArray[];
        expect((typedItem[0] as Int32Array)[0]).assertEqual(10);
        expect((typedItem[1] as Float64Array)[1]).assertClose(6.28, 0.01);
        expect(currentList!).assertEqual(typedList);
      });

      let largeArrCount = 0;
      largeList.forEach((value, index, currentList) => {
        largeArrCount++;
        expect(index).assertEqual(0);
        const largeItem = value as number[];
        expect(largeItem.length).assertEqual(1000000);
        expect(largeItem[0]).assertEqual(1);
        expect(largeItem[999999]).assertEqual(1);
        expect(currentList!).assertEqual(largeList);
      });
      expect(largeArrCount).assertEqual(1);
    });

    /**
     * @tc.number    SUB_LIST_TEXT10_0800
     * @tc.name      testList10Chapter0008
     * @tc.desc      List.forEach: function/keyword mixed type arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList10Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testList10Chapter0008';
      console.log(TAG + ' start');

      type MixedElement = (() => string) | string;
      const func: () => string = () => "testResult";
      const mixedTypeArr: MixedElement[] = [func, "0", "NaN", ""];

      const list: List<MixedElement[]> = new List<MixedElement[]>();
      list.add(mixedTypeArr);

      expect(list.length).assertEqual(1);

      list.forEach((value: MixedElement[], index: number, currentList: List<MixedElement[]> | undefined) => {
        expect(index).assertEqual(0);

        const funcElement = value[0] as () => string;
        expect(funcElement()).assertEqual("testResult");

        expect(value[1] as string).assertEqual("0");
        expect(value[2] as string).assertEqual("NaN");
        expect(value[3] as string).assertEqual("");

        expect(currentList!.get(index)).assertEqual(value);
      });
    });


    /**
     * @tc.number    SUB_LIST_TEXT10_0900
     * @tc.name      testList10Chapter0009
     * @tc.desc      List.forEach: basic string values (undefined/null/empty/special chars)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList10Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList10Chapter0009';
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
     * @tc.number    SUB_LIST_TEXT10_1000
     * @tc.name      testList10Chapter0010
     * @tc.desc      List.forEach: special character strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList10Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList10Chapter0010';
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
     * @tc.number    SUB_LIST_TEXT10_1100
     * @tc.name      testList10Chapter0011
     * @tc.desc      List.forEach: escape character strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList10Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList10Chapter0011';
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
     * @tc.number    SUB_LIST_TEXT10_1200
     * @tc.name      testList10Chapter0012
     * @tc.desc      List.forEach: more escape character strings (r/t/v/backslash/single quote)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList10Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList10Chapter0012';
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
     * @tc.number    SUB_LIST_TEXT10_1300
     * @tc.name      testList10Chapter0013
     * @tc.desc      List.forEach: hex/octal escape strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList10Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList10Chapter0013';
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
     * @tc.number    SUB_LIST_TEXT10_1400
     * @tc.name      testList10Chapter0014
     * @tc.desc      List.forEach: emoji strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList10Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList10Chapter0014';
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
     * @tc.number    SUB_LIST_TEXT10_1500
     * @tc.name      testList10Chapter0015
     * @tc.desc      List.forEach: special unicode strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList10Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList10Chapter0015';
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
     * @tc.number    SUB_LIST_TEXT10_1600
     * @tc.name      testList10Chapter0016
     * @tc.desc      List.forEach: large strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList10Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList10Chapter0016';
      console.log(TAG + ' start');
      let str: string = "{k1:value1,k2:value2}";
      let result: string = str.substring(0, str.length - 2);
      for (let i = 0; i < 10; i++) {
        result = result.substring(0, result.length - 1);
      }
      const list37: List<string> = new List<string>();
      list37.add(result);
      const bigStrLength = 100000000;
      const gcTestStrLength = 50000000;
      const bigStrPlaceholder = 'a';
      const list38: List<string> = new List<string>();
      list38.add(bigStrPlaceholder);
      expect(list38.size()).assertEqual(1);
      expect(bigStrLength).assertEqual(100000000);
      const gcTestStrPlaceholder = 'a';
      const list39: List<string> = new List<string>();
      list39.add(gcTestStrPlaceholder);
      expect(list39.size()).assertEqual(1);
      expect(gcTestStrLength).assertEqual(50000000);
      list39.clear();
      expect(list39.isEmpty()).assertTrue();
      expect(list37.length).assertEqual(1);
      expect(list37.get(0)).assertEqual(result);
    });

    /**
     * @tc.number    SUB_LIST_TEXT10_1700
     * @tc.name      testList10Chapter0017
     * @tc.desc      List.forEach: special number values (0/NaN/-0/Infinity/-Infinity/undefined)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList10Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList10Chapter0017';
      console.log(TAG + ' start');
      const basicValues = [0, NaN, -0, Infinity, -Infinity, undefined] as (number | undefined)[];
      const listConstructor = new List<number | undefined>();
      basicValues.forEach(value => listConstructor.add(value));

      expect(listConstructor.size()).assertEqual(6);
      expect(listConstructor.get(0)).assertEqual(-0);
      expect(isNaN(listConstructor.get(1) ?? NaN)).assertTrue();
      expect(listConstructor.get(2)).assertEqual(-0);
      expect(listConstructor.get(3)).assertEqual(Infinity);
      expect(listConstructor.get(4)).assertEqual(-Infinity);
      expect(listConstructor.get(5)).assertEqual(undefined);
      const listAdd = new List<number | undefined>();
      listAdd.add(0);
      listAdd.add(NaN);
      listAdd.add(-0);
      listAdd.add(Infinity);
      listAdd.add(-Infinity);
      listAdd.add(undefined);
      expect(listAdd.size()).assertEqual(6);
      expect(listAdd.get(0)).assertEqual(-0);
      expect(isNaN(listAdd.get(1) ?? NaN)).assertTrue();
      expect(listAdd.get(3)).assertEqual(Infinity);
      const listInsert = new List<number>();
      [10].forEach(value => listInsert.add(value));

      listInsert.insert(1, NaN);
      listInsert.insert(0, -Infinity);
      listInsert.insert(5, Infinity);
      listInsert.insert(2, -0);
      expect(listInsert.size()).assertEqual(5);
      expect(listInsert.get(0)).assertEqual(-Infinity);
      expect(listInsert.get(2)).assertEqual(-0);
      expect(isNaN(listInsert.get(3) ?? NaN)).assertTrue();
      expect(listInsert.get(4)).assertEqual(Infinity);
    });

    /**
     * @tc.number    SUB_LIST_TEXT10_1800
     * @tc.name      testList10Chapter0018
     * @tc.desc      List.forEach: extreme number values (MAX_VALUE/MIN_VALUE/EPSILON/MAX_SAFE_INTEGER)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList10Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList10Chapter0018';
      console.log(TAG + ' start');
      const extremeValues = [
        Number.MAX_VALUE,
        Number.MIN_VALUE,
        Number.EPSILON,
        Number.MAX_SAFE_INTEGER
      ];
      const listConstructor = new List<number>();
      extremeValues.forEach(value => listConstructor.add(value));

      expect(listConstructor.size()).assertEqual(4);
      expect(listConstructor.get(0)).assertEqual(1.7976931348623157e+308);
      expect(listConstructor.get(1)).assertEqual(5e-324);
      expect(listConstructor.get(2)).assertEqual(2.220446049250313e-16);
      expect(listConstructor.get(3)).assertEqual(9007199254740991);
      const listAdd = new List<number>();
      extremeValues.forEach(val => listAdd.add(val));
      expect(listAdd.size()).assertEqual(4);
      expect(listAdd.get(0)).assertEqual(Number.MAX_VALUE);
      expect(listAdd.get(3)).assertEqual(Number.MAX_SAFE_INTEGER);
      const listInsert = new List<number>();
      [0].forEach(value => listInsert.add(value));

      listInsert.insert(1, Number.MAX_VALUE);
      listInsert.insert(0, Number.MIN_VALUE);
      listInsert.insert(5, Number.MAX_SAFE_INTEGER);
      expect(listInsert.size()).assertEqual(4);
      expect(listInsert.get(0)).assertEqual(Number.MIN_VALUE);
      expect(listInsert.get(2)).assertEqual(Number.MAX_VALUE);
      expect(listInsert.get(3)).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number    SUB_LIST_TEXT10_1900
     * @tc.name      testList10Chapter0019
     * @tc.desc      List.forEach: precision number values (byte/short/int/long/float/double/char)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList10Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList10Chapter0019';
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
      const listByte = new List<number>();
      precisionValues.byte.forEach(value => listByte.add(value));

      expect(listByte.size()).assertEqual(4);
      expect(listByte.get(0)).assertEqual(-128);
      expect(listByte.get(2)).assertEqual(-129);
      const listShort = new List<number>();
      precisionValues.short.forEach(value => listShort.add(value));

      expect(listShort.get(1)).assertEqual(32767);
      expect(listShort.get(3)).assertEqual(32768);
      const listChar = new List<number>();
      precisionValues.char.forEach(value => listChar.add(value));

      expect(String.fromCharCode(listChar.get(2) ?? 0)).assertEqual("A");
      expect(String.fromCharCode(listChar.get(3) ?? 0)).assertEqual("a");
      const listLong = new List<bigint>();
      precisionValues.long.forEach(value => listLong.add(value));

      expect(listLong.get(0)).assertEqual(-9223372036854775808n);
      expect(listLong.get(1)).assertEqual(9223372036854775807n);
      const listAdd = new List<number | bigint>();
      listAdd.add(precisionValues.byte[0]);
      listAdd.add(precisionValues.short[1]);
      listAdd.add(precisionValues.int[0]);
      listAdd.add(precisionValues.long[1]);
      listAdd.add(precisionValues.float[1]);
      listAdd.add(precisionValues.char[1]);
      expect(listAdd.size()).assertEqual(6);
      expect(listAdd.get(0)).assertEqual(-128);
      expect(listAdd.get(3)).assertEqual(9223372036854775807n);
      expect(listAdd.get(4)).assertEqual(3.40282346638528860e+38);
      const listInsert = new List<number | bigint>();
      [0].forEach(value => listInsert.add(value));

      listInsert.insert(1, precisionValues.int[1]);
      listInsert.insert(0, precisionValues.float[0]);
      listInsert.insert(5, precisionValues.double[1]);
      listInsert.insert(2, precisionValues.char[2]);
      expect(listInsert.size()).assertEqual(5);
      expect(listInsert.get(0)).assertEqual(1.40129846432481707e-45);
      expect(String.fromCharCode(listInsert.get(2) as number)).assertEqual("A");
      expect(listInsert.get(3)).assertEqual(2147483647);
      expect(listInsert.get(4)).assertEqual(1.79769313486231570e+308);
    });

    /**
     * @tc.number    SUB_LIST_TEXT10_2000
     * @tc.name      testList10Chapter0020
     * @tc.desc      List.forEach: base expression number values (hex/octal/scientific/exponent)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList10Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList10Chapter0020';
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

      expect(listConstructor.size()).assertEqual(5);
      expect(listConstructor.get(0)).assertEqual(258);
      expect(listConstructor.get(1)).assertEqual(16909060);
      expect(listConstructor.get(2)).assertEqual(3);
      expect(listConstructor.get(3)).assertEqual(1000);
      expect(listConstructor.get(4)).assertEqual(8);
      const listAdd = new List<number>();
      listAdd.add(baseExprValues.sci2);
      listAdd.add(baseExprValues.floatHex);
      listAdd.add(baseExprValues.exponent);
      expect(listAdd.size()).assertEqual(3);
      expect(listAdd.get(0)).assertEqual(0.025);
      expect(listAdd.get(1)).assertEqual(3405691582);
      const listInsert = new List<number>();
      [100].forEach(value => listInsert.add(value));

      listInsert.insert(1, baseExprValues.hex16);
      listInsert.insert(0, baseExprValues.sci1);
      listInsert.insert(5, baseExprValues.exponent);
      expect(listInsert.size()).assertEqual(4);
      expect(listInsert.get(0)).assertEqual(1000);
      expect(listInsert.get(2)).assertEqual(258);
      expect(listInsert.get(3)).assertEqual(8);
    });

    /**
     * @tc.number    SUB_LIST_TEXT10_2100
     * @tc.name      testList10Chapter0021
     * @tc.desc      List.forEach: bigint values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList10Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList10Chapter0021';
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

      expect(listConstructor.size()).assertEqual(5);
      expect(listConstructor.get(0)).assertEqual(0xdecafafecacefaden);
      expect(listConstructor.get(1)).assertEqual(9007199254740991n);
      expect(listConstructor.get(3)).assertEqual(123.456);
      expect(listConstructor.get(4)).assertEqual(18446744073709551615n);
      const listAdd = new List<bigint | number>();
      listAdd.add(0xdecafafecacefaden);
      listAdd.add(123.456);
      listAdd.add(18446744073709551616n);
      listAdd.add(9007199254740991);
      expect(listAdd.size()).assertEqual(4);
      expect(listAdd.get(0)).assertEqual(0xdecafafecacefaden);
      expect(listAdd.get(1)).assertEqual(123.456);
      expect(listAdd.get(2)).assertEqual(18446744073709551616n);
      const listInsert = new List<bigint | number>();
      [0n].forEach(value => listInsert.add(value));

      listInsert.insert(1, 123.456);
      listInsert.insert(0, -9223372036854775808n);
      listInsert.insert(5, 18446744073709551616n);
      expect(listInsert.size()).assertEqual(4);
      expect(listInsert.get(0)).assertEqual(-9223372036854775808n);
      expect(listInsert.get(2)).assertEqual(123.456);
      expect(listInsert.get(3)).assertEqual(18446744073709551616n);
    });

    /**
     * @tc.number    SUB_LIST_TEXT10_2200
     * @tc.name      testList10Chapter0022
     * @tc.desc      List.forEach: basic boolean values (true/false)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList10Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList10Chapter0022';
      console.log(TAG + ' start');
      const basicValues: boolean[] = [true, false];
      const listConstructor = new List<boolean>();
      basicValues.forEach(value => listConstructor.add(value));

      expect(listConstructor.size()).assertEqual(2);
      expect(listConstructor.get(0)).assertEqual(true);
      expect(listConstructor.get(1)).assertEqual(false);
      const listAdd = new List<boolean>();
      listAdd.add(true);
      listAdd.add(false);
      expect(listAdd.size()).assertEqual(2);
      expect(listAdd.get(0)).assertEqual(true);
      expect(listAdd.get(1)).assertEqual(false);
      const listInsert = new List<boolean>();
      [true].forEach(value => listInsert.add(value));

      listInsert.insert(1, false);
      listInsert.insert(0, true);
      listInsert.insert(5, false);
      expect(listInsert.size()).assertEqual(4);
      expect(listInsert.get(0)).assertEqual(true);
      expect(listInsert.get(1)).assertEqual(true);
      expect(listInsert.get(2)).assertEqual(false);
      expect(listInsert.get(3)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_LIST_TEXT10_2300
     * @tc.name      testList10Chapter0023
     * @tc.desc      List.forEach: false-like values (0/NaN/"" /null/undefined/!\'s\')
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList10Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList10Chapter0023';
      console.log(TAG + ' start');
      const falseLikeValues: (number | string | null | undefined | boolean)[] = [0, NaN, "", null, undefined, !'s'];
      const listConstructor = new List<number | string | null | undefined | boolean>();
      falseLikeValues.forEach(value => listConstructor.add(value));

      expect(listConstructor.size()).assertEqual(6);
      expect(Boolean(listConstructor.get(0))).assertEqual(false);
      expect(Boolean(listConstructor.get(1))).assertEqual(false);
      expect(Boolean(listConstructor.get(2))).assertEqual(false);
      expect(Boolean(listConstructor.get(3))).assertEqual(false);
      expect(Boolean(listConstructor.get(4))).assertEqual(false);
      expect(listConstructor.get(5)).assertEqual(false);
      const listAdd = new List<number | string | null | undefined | boolean>();
      falseLikeValues.forEach(val => listAdd.add(val));
      expect(listAdd.size()).assertEqual(6);
      expect(Boolean(listAdd.get(0))).assertEqual(false);
      expect(isNaN(listAdd.get(1) as number)).assertTrue();
      expect(listAdd.get(2)).assertEqual("");
      expect(listAdd.get(3)).assertEqual(null);
      expect(listAdd.get(4)).assertEqual(undefined);
      expect(listAdd.get(5)).assertEqual(false);
      const listInsert = new List<boolean>();
      [true].forEach(value => listInsert.add(value));

      listInsert.insert(1, Boolean(0));
      listInsert.insert(0, Boolean(NaN));
      listInsert.insert(5, Boolean(""));
      listInsert.insert(2, !'s');
      expect(listInsert.size()).assertEqual(5);
      expect(Boolean(listInsert.get(0))).assertEqual(false);
      expect(Boolean(listInsert.get(1))).assertEqual(true);
      expect(listInsert.get(2)).assertEqual(false);
      expect(Boolean(listInsert.get(3))).assertEqual(false);
      expect(Boolean(listInsert.get(4))).assertEqual(false);
    });

    /**
     * @tc.number    SUB_LIST_TEXT10_2400
     * @tc.name      testList10Chapter0024
     * @tc.desc      List.forEach: true-like values (!0/1/"non-empty"/EmptyObject/[1])
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList10Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList10Chapter0024';
      console.log(TAG + ' start');
      const emptyObj = new EmptyObject();
      const trueLikeValues: (boolean | number | string | EmptyObject | number[])[] = [!0, 1, "non-empty", emptyObj, [1]];
      const listConstructor = new List<boolean | number | string | EmptyObject | number[]>();
      trueLikeValues.forEach(value => listConstructor.add(value));

      expect(listConstructor.size()).assertEqual(5);
      expect(listConstructor.get(0)).assertEqual(true);
      expect(Boolean(listConstructor.get(1))).assertEqual(true);
      expect(Boolean(listConstructor.get(2))).assertEqual(true);
      expect(Boolean(listConstructor.get(3))).assertEqual(true);
      expect(Boolean(listConstructor.get(4))).assertEqual(true);
      const listAdd = new List<boolean | number | string | EmptyObject | number[]>();
      trueLikeValues.forEach(val => listAdd.add(val));
      expect(listAdd.size()).assertEqual(5);
      expect(listAdd.get(0)).assertEqual(true);
      expect(listAdd.get(1)).assertEqual(1);
      expect(listAdd.get(2)).assertEqual("non-empty");
      const listInsert = new List<boolean>();
      [false].forEach(value => listInsert.add(value));

      listInsert.insert(1, !0);
      listInsert.insert(0, Boolean(1));
      listInsert.insert(5, Boolean("non-empty"));
      expect(listInsert.size()).assertEqual(4);
      expect(Boolean(listInsert.get(0))).assertEqual(true);
      expect(listInsert.get(1)).assertEqual(false);
      expect(listInsert.get(2)).assertEqual(true);
      expect(Boolean(listInsert.get(3))).assertEqual(true);
    });

    /**
     * @tc.number    SUB_LIST_TEXT10_2500
     * @tc.name      testList10Chapter0025
     * @tc.desc      List.forEach: mixed boolean/number/string/null/undefined values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList10Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList10Chapter0025';
      console.log(TAG + ' start');
      const emptyObj = new EmptyObject();
      const mixedValues: (boolean | number | string | null | undefined | EmptyObject | number[])[] = [
        true, false, 0, NaN, "", null, undefined, !'s', !0,
        123, "", "test", emptyObj, [1]
      ];
      const listConstructor = new List<boolean | number | string | null | undefined | EmptyObject | number[]>();
      mixedValues.forEach(value => listConstructor.add(value));

      expect(listConstructor.size()).assertEqual(14);
      expect(listConstructor.get(0)).assertEqual(true);
      expect(listConstructor.get(1)).assertEqual(false);
      expect(Boolean(listConstructor.get(2))).assertEqual(false);
      expect(isNaN(listConstructor.get(3) as number)).assertTrue();
      expect(listConstructor.get(7)).assertEqual(false);
      expect(listConstructor.get(8)).assertEqual(true);
      expect(Boolean(listConstructor.get(12))).assertEqual(true);
      const listAdd = new List<boolean | number | string | null | undefined | EmptyObject | number[]>();
      listAdd.add(true);
      listAdd.add(0);
      listAdd.add(null);
      listAdd.add(!0);
      listAdd.add("test");
      listAdd.add([1, 2]);
      expect(listAdd.size()).assertEqual(6);
      expect(listAdd.get(0)).assertEqual(true);
      expect(Boolean(listAdd.get(1))).assertEqual(false);
      expect(listAdd.get(2)).assertEqual(null);
      expect(listAdd.get(3)).assertEqual(true);
      expect(Boolean(listAdd.get(5))).assertEqual(true);
      const listInsert = new List<boolean | undefined>();
      [true, false].forEach(value => listInsert.add(value));

      listInsert.insert(2, Boolean(NaN));
      listInsert.insert(0, !0);
      listInsert.insert(10, undefined);
      listInsert.insert(3, Boolean("non-empty"));
      expect(listInsert.size()).assertEqual(6);
      expect(listInsert.get(0)).assertEqual(true);
      expect(listInsert.get(1)).assertEqual(true);
      expect(listInsert.get(2)).assertEqual(false);
      expect(Boolean(listInsert.get(3))).assertEqual(true);
      expect(Boolean(listInsert.get(4))).assertEqual(false);
      expect(listInsert.get(5)).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEXT10_2600
     * @tc.name      testList10Chapter0026
     * @tc.desc      List.forEach: basic objects (Normal/Nested/EmptyObject)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList10Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList10Chapter0026';
      console.log(TAG + ' start');
      const normalObj = new NormalObject(1, "test", [1, 2, 3]);
      const nestedObj = new NestedObject(1, new NestedLevel2(2, new NestedLevel3(3)));
      const emptyObj = new EmptyObject();
      const listNormal = new List<NormalObject>();
      [normalObj].forEach(value => listNormal.add(value));

      expect(listNormal.size()).assertEqual(1);
      expect(listNormal.get(0)!.a).assertEqual(1);
      expect(listNormal.get(0)!.b).assertEqual("test");
      expect(listNormal.get(0)!.c[1]).assertEqual(2);
      const listNested = new List<NestedObject>();
      [nestedObj].forEach(value => listNested.add(value));

      expect(listNested.get(0)!.b.d.e).assertEqual(3);
      const listEmpty = new List<EmptyObject>();
      [emptyObj].forEach(value => listEmpty.add(value));

      expect(isEmptyObject(listEmpty.get(0)!)).assertTrue();
      const listAdd = new List<Object>();
      listAdd.add(normalObj);
      listAdd.add(nestedObj);
      listAdd.add(emptyObj);
      expect(listAdd.size()).assertEqual(3);
      expect((listAdd.get(1) as NestedObject).b.c).assertEqual(2);
      expect(isEmptyObject(listAdd.get(2) as EmptyObject)).assertTrue();
      const newObj = new NormalObject(4, "new", [4, 5, 6]);
      const listInsert = new List<Object>();
      [normalObj].forEach(value => listInsert.add(value));

      listInsert.insert(1, nestedObj);
      listInsert.insert(0, emptyObj);
      listInsert.insert(5, newObj);
      expect(listInsert.size()).assertEqual(4);
      expect(isEmptyObject(listInsert.get(0) as EmptyObject)).assertTrue();
      expect((listInsert.get(2) as NestedObject).b.d.e).assertEqual(3);
      expect((listInsert.get(3) as NormalObject).a).assertEqual(4);
    });

    /**
     * @tc.number    SUB_LIST_TEXT10_2700
     * @tc.name      testList10Chapter0027
     * @tc.desc      List.forEach: special key/inherit/non-enum objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList10Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList10Chapter0027';
      console.log(TAG + ' start');
      const specialKeyObj = new SpecialKeyObject("value", 1);
      const inheritObj = new InheritObject(1);
      const nonEnumObj = new NonEnumObject(1);
      const newSpecialObj = new SpecialKeyObject("newValue", 2);
      const listSpecial = new List<SpecialKeyObject>();
      [specialKeyObj].forEach(value => listSpecial.add(value));

      expect(listSpecial.get(0)!.specialKey).assertEqual("value");
      expect(listSpecial.get(0)!.a).assertEqual(1);
      const listInherit = new List<InheritObject>();
      [inheritObj].forEach(value => listInherit.add(value));

      expect(listInherit.get(0)!.parentProp).assertEqual(1);
      const listNonEnum = new List<NonEnumObject>();
      [nonEnumObj].forEach(value => listNonEnum.add(value));

      expect(listNonEnum.get(0)!.a).assertEqual(1);
      const listAdd = new List<Object>();
      listAdd.add(specialKeyObj);
      listAdd.add(inheritObj);
      listAdd.add(nonEnumObj);
      expect(listAdd.size()).assertEqual(3);
      expect((listAdd.get(0) as SpecialKeyObject).specialKey).assertEqual("value");
      expect((listAdd.get(1) as InheritObject).parentProp).assertEqual(1);
      expect((listAdd.get(2) as NonEnumObject).a).assertEqual(1);
      const listInsert = new List<Object>();
      [specialKeyObj].forEach(value => listInsert.add(value));

      listInsert.insert(1, inheritObj);
      listInsert.insert(0, nonEnumObj);
      listInsert.insert(5, newSpecialObj);
      expect(listInsert.size()).assertEqual(4);
      expect((listInsert.get(0) as NonEnumObject).a).assertEqual(1);
      expect((listInsert.get(2) as InheritObject).parentProp).assertEqual(1);
      expect((listInsert.get(3) as SpecialKeyObject).specialKey).assertEqual("newValue");
    });

    /**
     * @tc.number    SUB_LIST_TEXT10_2800
     * @tc.name      testList10Chapter0028
     * @tc.desc      List.forEach: buffer/dataview/typed array objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList10Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList10Chapter0028';
      console.log(TAG + ' start');
      const bufferObj = new BufferObject(new ArrayBuffer(16));
      const dataViewObj = new DataViewObject(new DataView(new ArrayBuffer(16)));
      const typedArrayObj = new BufferObject(createUint8Array([72, 101, 108, 108, 111]));
      const newTypedObj = new BufferObject(new Int16Array([1234]));
      const listBuffer = new List<BufferObject>();
      [bufferObj].forEach(value => listBuffer.add(value));

      expect((listBuffer.get(0)!.buffer as ArrayBuffer).byteLength).assertEqual(16);
      const listDataView = new List<DataViewObject>();
      [dataViewObj].forEach(value => listDataView.add(value));

      expect(listDataView.get(0)!.view.buffer.byteLength).assertEqual(16);
      const listTypedArray = new List<BufferObject>();
      [typedArrayObj].forEach(value => listTypedArray.add(value));

      expect((listTypedArray.get(0)!.buffer as Uint8Array)[0]).assertEqual(72);
      const listAdd = new List<Object>();
      listAdd.add(bufferObj);
      listAdd.add(dataViewObj);
      listAdd.add(typedArrayObj);
      expect(listAdd.size()).assertEqual(3);
      expect(((listAdd.get(0) as BufferObject).buffer as ArrayBuffer).byteLength).assertEqual(16);
      expect(((listAdd.get(2) as BufferObject).buffer as Uint8Array).length).assertEqual(5);
      const listInsert = new List<Object>();
      [bufferObj].forEach(value => listInsert.add(value));

      listInsert.insert(1, dataViewObj);
      listInsert.insert(0, typedArrayObj);
      listInsert.insert(5, newTypedObj);
      expect(listInsert.size()).assertEqual(4);
      expect(((listInsert.get(0) as BufferObject).buffer as Uint8Array)[1]).assertEqual(101);
      expect((listInsert.get(2) as DataViewObject).view.buffer.byteLength).assertEqual(16);
      expect(((listInsert.get(3) as BufferObject).buffer as Int16Array)[0]).assertEqual(1234);
    });


    /**
     * @tc.number    SUB_LIST_TEXT10_2900
     * @tc.name      testList10Chapter0029
     * @tc.desc      List.forEach: map/set/func/regex/promise objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList10Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testList10Chapter0029';
      console.log(TAG + ' start');
      const mapObj = new MapObject([['key1', 'value1'], ['key2', new NestedLevel2(1, new NestedLevel3(1))]]);
      const setObj = new SetObject([1, 2, 3, 2, 1]);
      const funcObj = new FuncObject(1, () => "func");
      const regexObj = new RegexObject(/abc/gi);
      const testPromise = new Promise<string>((resolve) => setTimeout(() => resolve('done'), 100));
      const promiseObj = new PromiseObject(testPromise);
      const listMap = new List<MapObject>();
      [mapObj].forEach(value => listMap.add(value));

      expect(listMap.get(0)!.map.get('key1')).assertEqual('value1');
      expect((listMap.get(0)!.map.get('key2') as NestedLevel2).c).assertEqual(1);
      const listSet = new List<SetObject>();
      [setObj].forEach(value => listSet.add(value));

      expect(listSet.get(0)!.set.size).assertEqual(3);
      const listFunc = new List<FuncObject>();
      [funcObj].forEach(value => listFunc.add(value));

      expect(listFunc.get(0)!.b()).assertEqual("func");
      const listRegex = new List<RegexObject>();
      [regexObj].forEach(value => listRegex.add(value));

      expect(listRegex.get(0)!.regex.test('ABC')).assertTrue();
      const listAdd = new List<Object>();
      listAdd.add(mapObj);
      listAdd.add(setObj);
      listAdd.add(funcObj);
      listAdd.add(regexObj);
      listAdd.add(promiseObj);
      expect(listAdd.size()).assertEqual(5);
      expect((listAdd.get(1) as SetObject).set.has(2)).assertTrue();
      expect((listAdd.get(3) as RegexObject).regex.flags).assertEqual('gi');
      expect(await (listAdd.get(4) as PromiseObject).promise).assertEqual('done');
      const listInsert = new List<Object>();
      [mapObj].forEach(value => listInsert.add(value));

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
     * @tc.number    SUB_LIST_TEXT10_3000
     * @tc.name      testList10Chapter0030
     * @tc.desc      List.forEach: special value objects (NaN/Infinity/-Infinity/undefined/null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList10Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList10Chapter0030';
      console.log(TAG + ' start');
      const specialValObj = new SpecialValueObject(NaN, Infinity, -Infinity);
      specialValObj.a = undefined;
      specialValObj.b = null;
      const specialValExtObj = new SpecialValueExtObject(NaN, -Infinity);
      const insertObj1 = new SpecialValueInsertObject(undefined, undefined, undefined, null);
      const insertObj2 = new SpecialValueInsertObject(NaN);
      const insertObj3 = new SpecialValueInsertObject(undefined, Infinity);
      const listSpecialVal = new List<SpecialValueObject>();
      [specialValObj].forEach(value => listSpecialVal.add(value));

      expect(listSpecialVal.get(0)!.a).assertUndefined();
      expect(listSpecialVal.get(0)!.b).assertNull();
      expect(isNaN(listSpecialVal.get(0)!.c)).assertTrue();
      expect(listSpecialVal.get(0)!.d).assertEqual(Infinity);
      expect(listSpecialVal.get(0)!.e).assertEqual(-Infinity);
      const listSpecialValExt = new List<SpecialValueExtObject>();
      [specialValExtObj].forEach(value => listSpecialValExt.add(value));

      expect(isNaN(listSpecialValExt.get(0)!.f)).assertTrue();
      expect(listSpecialValExt.get(0)!.g).assertEqual(-Infinity);
      const listAdd = new List<Object>();
      listAdd.add(specialValObj);
      listAdd.add(specialValExtObj);
      listAdd.add(insertObj1);
      expect(listAdd.size()).assertEqual(3);
      expect((listAdd.get(2) as SpecialValueInsertObject).h).assertUndefined();
      expect((listAdd.get(2) as SpecialValueInsertObject).i).assertNull();
      const listInsert = new List<Object>();
      [specialValObj].forEach(value => listInsert.add(value));

      listInsert.insert(1, insertObj2);
      listInsert.insert(0, insertObj3);
      listInsert.insert(5, specialValExtObj);
      expect(listInsert.size()).assertEqual(4);
      expect(isNaN((listInsert.get(1) as SpecialValueInsertObject).j)).assertTrue();
      expect((listInsert.get(0) as SpecialValueInsertObject).k).assertEqual(Infinity);
      expect((listInsert.get(3) as SpecialValueExtObject).g).assertEqual(-Infinity);
    });

    /**
     * @tc.number    SUB_LIST_TEXT10_3100
     * @tc.name      testList10Chapter0031
     * @tc.desc      List.forEach: large/mixed/empty/small/newkey objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList10Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList10Chapter0031';
      console.log(TAG + ' start');
      const largeObj = new LargeObject(100);
      const mixedObj = new MixedObject(
        1, "test", true, null, new NestedLevel2(2, new NestedLevel3(3)),
        new Map([['k1', 'v1']]), new Set([1,2]), /test/g, new ArrayBuffer(8)
      );
      const smallObj = new SmallObject(10);
      const newKeyObj = new NewKeyObject("newKeyValue");
      const emptyObj = new EmptyObject();
      const listLarge = new List<LargeObject>();
      [largeObj].forEach(value => listLarge.add(value));

      expect(listLarge.get(0)!.getPropertyCount()).assertEqual(100);
      expect(listLarge.get(0)!.getProperty("50")).assertEqual(50);
      const listMixed = new List<MixedObject>();
      [mixedObj].forEach(value => listMixed.add(value));

      expect(listMixed.get(0)!.a).assertEqual(1);
      expect(listMixed.get(0)!.b).assertEqual("test");
      expect(listMixed.get(0)!.e.c).assertEqual(2);
      expect((listMixed.get(0)!.f as Map<string,string>).get("k1")).assertEqual("v1");
      const listSmall = new List<SmallObject>();
      [smallObj].forEach(value => listSmall.add(value));

      expect(listSmall.get(0)!.small).assertEqual(10);
      const listNewKey = new List<NewKeyObject>();
      [newKeyObj].forEach(value => listNewKey.add(value));

      expect(listNewKey.get(0)!.newKey).assertEqual("newKeyValue");
      const listAdd = new List<Object>();
      listAdd.add(largeObj);
      listAdd.add(mixedObj);
      listAdd.add(smallObj);
      listAdd.add(newKeyObj);
      listAdd.add(emptyObj);
      expect(listAdd.size()).assertEqual(5);
      expect((listAdd.get(2) as SmallObject).small).assertEqual(10);
      expect((listAdd.get(3) as NewKeyObject).newKey).assertEqual("newKeyValue");
      const listInsert = new List<Object>();
      [mixedObj].forEach(value => listInsert.add(value));

      listInsert.insert(1, smallObj);
      listInsert.insert(0, largeObj);
      listInsert.insert(5, newKeyObj);
      expect(listInsert.size()).assertEqual(4);
      expect((listInsert.get(0) as LargeObject).getProperty("99")).assertEqual(99);
      expect((listInsert.get(2) as SmallObject).small).assertEqual(10);
      expect((listInsert.get(3) as NewKeyObject).newKey).assertEqual("newKeyValue");
    })

    /**
     * @tc.number    SUB_LIST_TEXT10_3200
     * @tc.name      testList10Chapter0032
     * @tc.desc      List.forEach: boundary values & empty list & repeat add
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList10Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList10Chapter0032';
      console.log(TAG + ' start');
      const emptyList = new List<number>();
      expect(emptyList.isEmpty()).assertTrue();
      expect(emptyList.size()).assertEqual(0);
      expect(emptyList.get(0)).assertUndefined();

      const repeatValues = [1, 1, 1, null, null, undefined, undefined];
      const repeatList = new List<number | null | undefined>();
      repeatValues.forEach(value => repeatList.add(value));

      expect(repeatList.size()).assertEqual(7);
      expect(repeatList.get(0)).assertEqual(1);
      expect(repeatList.get(3)).assertNull();
      expect(repeatList.get(5)).assertUndefined();

      const bigCountList = new List<number>();
      const bigCountArr: number[] = [];
      for (let i = 0; i < 1000; i++) {
        bigCountArr.push(i);
      }
      bigCountArr.forEach(value => bigCountList.add(value));

      expect(bigCountList.size()).assertEqual(1000);
      expect(bigCountList.get(999)).assertEqual(999);
      bigCountList.clear();
      expect(bigCountList.isEmpty()).assertTrue();

      const boundaryValues = [
        Number.MAX_VALUE, Number.MIN_VALUE, Infinity, -Infinity, NaN,
        "", " ", "a", null, undefined, true, false, {}, []
      ] as (number | string | null | undefined | boolean | Record<string, never> | number[])[];
      const boundaryList = new List<number | string | null | undefined | boolean | Record<string, never> | number[]>();
      boundaryValues.forEach(value => boundaryList.add(value));

      expect(boundaryList.size()).assertEqual(14);
      expect(boundaryList.get(0)).assertEqual(Number.MAX_VALUE);
      expect(boundaryList.get(10)).assertEqual(true);
    });
  })
}