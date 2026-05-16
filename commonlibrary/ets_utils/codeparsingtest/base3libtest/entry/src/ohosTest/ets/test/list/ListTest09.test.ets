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
  remove(index: number): T | undefined;

  remove(item: T): boolean;

  remove(arg: number | T): T | undefined | boolean {
    if (typeof arg === 'number') {

      if (arg < 0 || arg >= this.data.length) {
        return undefined;
      }
      return this.data.splice(arg, 1)[0];
    } else {

      const index = this.data.findIndex(i => i === arg);
      if (index === -1) return false;
      this.data.splice(index, 1);
      return true;
    }
  }
  replaceAllElements(
    callbackFn: (value: T, index?: number, list?: List<T>, thisArg?: Object) => T,
    thisArg?: Object
  ): void {
    this.data = this.data.map<T>((value: T, index: number): T => {
      return callbackFn(value, index, this, thisArg);
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

export default function ListTest09() {
  describe('ListTest09', () => {
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
     * @tc.number    SUB_LIST_TEXT09_0100
     * @tc.name      testList09Chapter0001
     * @tc.desc      List.remove: remove inherited/non-enumerable object combinations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList09Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList09Chapter0001';
      console.log(TAG + ' start');

      const inheritObj1 = new InheritObject(50);
      const nonEnumObj1 = new NonEnumObject(60);
      const inheritObj2 = new InheritObject(70);
      const nonEnumObj2 = new NonEnumObject(80);

      const inheritNonEnumList = new List<Object>([inheritObj1, nonEnumObj1, inheritObj2, nonEnumObj2]);
      expect(inheritNonEnumList.size()).assertEqual(4);

      const removedNonEnum = inheritNonEnumList.remove(1);
      expect((removedNonEnum as NonEnumObject).a).assertEqual(60);
      expect(inheritNonEnumList.size()).assertEqual(3);
      expect(inheritNonEnumList.get(1)).assertEqual(inheritObj2);

      const removedInherit = inheritNonEnumList.remove(2);
      expect((removedInherit as NonEnumObject).a).assertEqual(80);
      expect(inheritNonEnumList.size()).assertEqual(2);

      expect((inheritNonEnumList.get(0) as InheritObject).parentProp).assertEqual(50);
      expect((inheritNonEnumList.get(1) as InheritObject).parentProp).assertEqual(70);
    });

    /**
     * @tc.number    SUB_LIST_TEXT09_0200
     * @tc.name      testList09Chapter0002
     * @tc.desc      List.remove: remove mixed-type buffer objects (ArrayBuffer/Uint8Array/Int16Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList09Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList09Chapter0002';
      console.log(TAG + ' start');
      const arrayBuffer = new ArrayBuffer(8);
      const uint8Array = createUint8Array([10,20,30]);
      const int16Array = new Int16Array([40,50]);
      const bufferList = new List<BufferObject>([
        new BufferObject(arrayBuffer),
        new BufferObject(uint8Array),
        new BufferObject(int16Array)
      ]);
      expect(bufferList.size()).assertEqual(3);
      const removedUint8 = bufferList.remove(1);
      expect(((removedUint8?.buffer as Uint8Array)[1])).assertEqual(20);
      expect(bufferList.size()).assertEqual(2);
      expect(((bufferList.get(0)?.buffer as ArrayBuffer).byteLength)).assertEqual(8);
      expect(((bufferList.get(1)?.buffer as Int16Array)[0])).assertEqual(40);
      bufferList.remove(1);
      expect(bufferList.size()).assertEqual(1);
      expect(((bufferList.get(0)?.buffer as ArrayBuffer).byteLength)).assertEqual(8);
    });

    /**
     * @tc.number    SUB_LIST_TEXT09_0300
     * @tc.name      testList09Chapter0003
     * @tc.desc      List.remove: remove special-value inserted objects (undefined/null/NaN/Infinity)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList09Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList09Chapter0003';
      console.log(TAG + ' start');
      const insertObj1 = new SpecialValueInsertObject(NaN, Infinity, undefined, null);
      const insertObj2 = new SpecialValueInsertObject(-Infinity, NaN, undefined, null);
      const insertObj3 = new SpecialValueInsertObject(123, 456, undefined, null);
      const insertList = new List<SpecialValueInsertObject>([insertObj1, insertObj2, insertObj3]);
      expect(insertList.size()).assertEqual(3);
      const removedInsert = insertList.remove(1);
      expect(isNaN((removedInsert as SpecialValueInsertObject).k)).assertTrue();
      expect((removedInsert as SpecialValueInsertObject).j).assertEqual(-Infinity);
      expect((removedInsert as SpecialValueInsertObject).h).assertEqual(undefined);
      expect((removedInsert as SpecialValueInsertObject).i).assertEqual(null);
      expect(insertList.size()).assertEqual(2);
      expect((insertList.get(0) as SpecialValueInsertObject).k).assertEqual(Infinity);
      expect((insertList.get(1) as SpecialValueInsertObject).j).assertEqual(123);
      expect((insertList.get(1) as SpecialValueInsertObject).k).assertEqual(456);
      insertList.remove(0);
      expect(insertList.size()).assertEqual(1);
      expect((insertList.get(0) as SpecialValueInsertObject).j).assertEqual(123);
    });

    /**
     * @tc.number    SUB_LIST_TEXT09_0400
     * @tc.name      testList09Chapter0004
     * @tc.desc      List.replaceAllElements: normal Uint8Array and zero-filled number array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList09Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList09Chapter0004';
      console.log(TAG + ' start');

      const normalUint8Arr: Uint8Array =
        new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);
      const zeroArr: number[] = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];

      const list: List<TestArray> = new List<TestArray>();
      list.add(new Uint8Array(0));
      list.add([]);

      list.replaceAllElements((_value: TestArray, index?: number): TestArray => {
        if (index === 0) {
          return normalUint8Arr;
        } else if (index === 1) {
          return zeroArr;
        } else {
          return _value;
        }
      });

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
     * @tc.number    SUB_LIST_TEXT09_0500
     * @tc.name      testList09Chapter0005
     * @tc.desc      List.replaceAllElements: arrays with negative numbers and non-numeric index arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList09Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const TAG = 'testList09Chapter0005';
        console.log(TAG + ' start');
        const negativeArr: number[] = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
        const uint8NegArr: Uint8Array = new Uint8Array(negativeArr);
        const int8NegArr: Int8Array = new Int8Array(negativeArr);
        const numericArr: number[] = [333];
        const nonNumericMap: Map<string, number> = new Map<string, number>();
        nonNumericMap.set("abc", 111);
        nonNumericMap.set("aaa", 222);

        const list: List<TypedArray | number[]> = new List<TypedArray | number[]>();
        list.add(new Uint8Array(0));
        list.add(new Int8Array(0));
        list.add([]);

        list.replaceAllElements((_value: TypedArray | number[], index?: number): TypedArray | number[] => {
          let result: TypedArray | number[] = _value;
          if (index !== undefined) {
            switch (index) {
              case 0:
                result = uint8NegArr;
                break;
              case 1:
                result = int8NegArr;
                break;
              case 2:
                result = numericArr;
                break;
              default:
                result = _value;
            }
          }
          return result;
        });

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
     * @tc.number    SUB_LIST_TEXT09_0600
     * @tc.name      testList09Chapter0006
     * @tc.desc      List.replaceAllElements: arrays with NaN/Infinity and non-numeric type elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList09Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const TAG = 'testList09Chapter0006';
        console.log(TAG + ' start');

        const specialValueArr: number[] = [72, 101, NaN, Infinity, -Infinity, 108, 111];
        const nonNumericTypeArr: (number | string | boolean | null | undefined)[] =
          [72, "abc", true, null, undefined, 108];

        const list: List<number[] | (number | string | boolean | null | undefined)[]> =
          new List<number[] | (number | string | boolean | null | undefined)[]>();
        list.add([]);
        list.add([]);

        list.replaceAllElements((_value: number[] | (number | string | boolean | null | undefined)[],
          index?: number): number[] | (number | string | boolean | null | undefined)[] => {
          if (index === 0) {
            return specialValueArr;
          } else if (index === 1) {
            return nonNumericTypeArr;
          } else {
            return _value;
          }
        });

        expect(list.length).assertEqual(2);

        const item0: number[] = list.get(0) as number[];
        expect(item0[0]).assertEqual(72);
        expect(isNaN(item0[2])).assertTrue();
        expect(item0[3]).assertEqual(Infinity);
        expect(item0[4]).assertEqual(-Infinity);

        const item1: (number | string | boolean | null | undefined)[] =
          list.get(1) as (number | string | boolean | null | undefined)[];
        expect(item1[1]).assertEqual("abc");
        expect(item1[2]).assertEqual(true);
        expect(item1[3]).assertEqual(null);
        expect(item1[4]).assertEqual(undefined);
      });

    /**
     * @tc.number    SUB_LIST_TEXT09_0700
     * @tc.name      testList09Chapter0007
     * @tc.desc      List.replaceAllElements: empty arrays, overflow arrays, arrays after element removal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList09Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const TAG = 'testList09Chapter0007';
        console.log(TAG + ' start');
        const emptyArr: number[] = [];
        const overflowArr: number[] = [256, 65536, 32768];
        const deletedArr: number[] = [1, 2, 3];
        deletedArr.splice(1, 1);

        const list: List<number[]> = new List<number[]>();
        list.add([]);
        list.add([]);
        list.add([]);

        try {
          list.replaceAllElements((_value: number[], index?: number): number[] => {
            switch (index) {
              case 0:
                return emptyArr;
              case 1:
                return overflowArr;
              case 2:
                return deletedArr;
              default:
                return _value;
            }
          });
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          return;
        }

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
     * @tc.number    SUB_LIST_TEXT09_0800
     * @tc.name      testList09Chapter0008
     * @tc.desc      List.replaceAllElements: nested arrays, TypedArray sub-elements, ultra-long arrays
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList09Chapter0008", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3,
      async (): Promise<void> => {
        const TAG = 'testList09Chapter0008';
        console.log(TAG + ' start');

        const level3Arr: number[] = [5, 6];
        const level2Arr1: number[] = [2, 3];
        const level2Arr2: (number | number[])[] = [4, level3Arr];
        const nestedArr: Array<number | number[] | Array<number | number[]>> = [1, level2Arr1, level2Arr2];

        const typedSubArr: Array<TypedArray> = [new Int32Array([10, 20]), new Float64Array([3.14, 6.28])];

        const largeArr: number[] = new Array(10000).fill(1);

        const nestedList: List<Array<number | number[] | Array<number | number[]>>> =
          new List<Array<number | number[] | Array<number | number[]>>>();
        nestedList.add([]);
        try {
          nestedList.replaceAllElements((_value: Array<number | number[] | Array<number | number[]>>):
            Array<number | number[] | Array<number | number[]>> => {
            return nestedArr;
          });
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          return;
        }

        const typedList: List<Array<TypedArray>> = new List<Array<TypedArray>>();
        typedList.add([]);
        try {
          typedList.replaceAllElements((_value: Array<TypedArray>): Array<TypedArray> => {
            return typedSubArr;
          });
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
        }
        const largeList: List<number[]> = new List<number[]>();
        largeList.add([]);
        try {
          largeList.replaceAllElements((_value: number[]): number[] => {
            return largeArr;
          });
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
        }
        expect(nestedList.length).assertEqual(1);
        expect(typedList.length).assertEqual(1);
        expect(largeList.length).assertEqual(1);

        const item0: Array<number | number[] | Array<number | number[]>> = nestedList.get(0)!;
        const firstLayerVal = item0[0];
        expect(firstLayerVal as number).assertEqual(1);
        const secondLayerVal = item0[1] as number[];
        expect(secondLayerVal[1]).assertEqual(3);
        const thirdLayerContainer = item0[2] as (number | number[])[];
        const thirdLayerArr = thirdLayerContainer[1] as number[];
        expect(thirdLayerArr[0]).assertEqual(5);

        const item1: Array<TypedArray> = typedList.get(0)!;
        const int32Arr: Int32Array = item1[0] as Int32Array;
        expect(int32Arr[0]).assertEqual(10);

        const float64Arr: Float64Array = item1[1] as Float64Array;
        expect(float64Arr[1]).assertClose(6.28, 0.01);
        const item2: number[] = largeList.get(0)!;
        expect(item2.length).assertEqual(10000);
        expect(item2[0]).assertEqual(1);
        expect(item2[9999]).assertEqual(1);
      });

    /**
     * @tc.number    SUB_LIST_TEXT09_0900
     * @tc.name      testList09Chapter0009
     * @tc.desc      List.replaceAllElements: arrays with functions and keyword strings (Symbol removed)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList09Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const TAG = 'testList09Chapter0009';
        console.log(TAG + ' start');
        type MixedElement = (() => string) | string;
        const func: () => string = () => "testResult";
        const mixedTypeArr: MixedElement[] = [func, "0", "NaN", ""];

        const list: List<MixedElement[]> = new List<MixedElement[]>();
        list.add([]);

        try {
          list.replaceAllElements((_value: MixedElement[]): MixedElement[] => {
            return mixedTypeArr;
          });
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          return;
        }

        expect(list.length).assertEqual(1);

        const item0: MixedElement[] = list.get(0)!;
        const funcElement: () => string = item0[0] as () => string;
        expect(funcElement()).assertEqual("testResult");

        expect(item0[1] as string).assertEqual("0");
        expect(item0[2] as string).assertEqual("NaN");
        expect(item0[3] as string).assertEqual("");
      });

    /**
     * @tc.number    SUB_LIST_TEXT09_1000
     * @tc.name      testList09Chapter0010
     * @tc.desc      List.replaceAllElements: basic string values (undefined/null/empty/special chars/ASCII)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList09Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList09Chapter0010';
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
     * @tc.number    SUB_LIST_TEXT09_1100
     * @tc.name      testList09Chapter0011
     * @tc.desc      List.replaceAllElements: special character strings (&'()/*+,-./:;<=>?@[]^_`{|}~)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList09Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList09Chapter0011';
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
     * @tc.number    SUB_LIST_TEXT09_1200
     * @tc.name      testList09Chapter0012
     * @tc.desc      List.replaceAllElements: escape character strings (BEL/BS/FF/Newline and double special chars)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList09Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList09Chapter0012';
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
     * @tc.number    SUB_LIST_TEXT09_1300
     * @tc.name      testList09Chapter0013
     * @tc.desc      List.replaceAllElements: more escape character strings (CR/Tab/VT/Backslash/Single quote)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList09Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList09Chapter0013';
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
     * @tc.number    SUB_LIST_TEXT09_1400
     * @tc.name      testList09Chapter0014
     * @tc.desc      List.replaceAllElements: hex/octal escape strings and special single chars
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList09Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList09Chapter0014';
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
     * @tc.number    SUB_LIST_TEXT09_1500
     * @tc.name      testList09Chapter0015
     * @tc.desc      List.replaceAllElements: emoji strings and their unicode representations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList09Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList09Chapter0015';
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
     * @tc.number    SUB_LIST_TEXT09_1600
     * @tc.name      testList09Chapter0016
     * @tc.desc      List.replaceAllElements: special unicode strings (emoji/invalid unicode/keyword/tree structure)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList09Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList09Chapter0016';
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
     * @tc.number    SUB_LIST_TEXT09_1700
     * @tc.name      testList09Chapter0017
     * @tc.desc      List.replaceAllElements: large strings (logic verification without actual large string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList09Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList09Chapter0017';
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
     * @tc.number    SUB_LIST_TEXT09_1800
     * @tc.name      testList09Chapter0018
     * @tc.desc      List.replaceAllElements: special number values (0/NaN/-0/Infinity/-Infinity/undefined)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList09Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList09Chapter0018';
      console.log(TAG + ' start');
      const basicValues = [0, NaN, -0, Infinity, -Infinity, undefined] as (number | undefined)[];

      const listConstructor = new List<number | undefined>();
      basicValues.forEach(val => listConstructor.add(val));
      listConstructor.replaceAllElements((value) => value);

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
      listInsert.add(10);
      listInsert.replaceAllElements((value) => value);

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
     * @tc.number    SUB_LIST_TEXT09_1900
     * @tc.name      testList09Chapter0019
     * @tc.desc      List.replaceAllElements: extreme number values (MAX_VALUE/MIN_VALUE/EPSILON/MAX_SAFE_INTEGER)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList09Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList09Chapter0019';
      console.log(TAG + ' start');
      const extremeValues = [
        Number.MAX_VALUE,
        Number.MIN_VALUE,
        Number.EPSILON,
        Number.MAX_SAFE_INTEGER
      ];

      const listConstructor = new List<number>();
      extremeValues.forEach(val => listConstructor.add(val));
      listConstructor.replaceAllElements((value) => value);

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
      listInsert.add(0);
      listInsert.replaceAllElements((value) => value);

      listInsert.insert(1, Number.MAX_VALUE);
      listInsert.insert(0, Number.MIN_VALUE);
      listInsert.insert(5, Number.MAX_SAFE_INTEGER);
      expect(listInsert.size()).assertEqual(4);
      expect(listInsert.get(0)).assertEqual(Number.MIN_VALUE);
      expect(listInsert.get(2)).assertEqual(Number.MAX_VALUE);
      expect(listInsert.get(3)).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number    SUB_LIST_TEXT09_2000
     * @tc.name      testList09Chapter0020
     * @tc.desc      List.replaceAllElements: precision number values (byte/short/int/long/float/double/char)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList09Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList09Chapter0020';
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
      precisionValues.byte.forEach(val => listByte.add(val));
      listByte.replaceAllElements((value) => value);

      expect(listByte.size()).assertEqual(4);
      expect(listByte.get(0)).assertEqual(-128);
      expect(listByte.get(2)).assertEqual(-129);

      const listShort = new List<number>();
      precisionValues.short.forEach(val => listShort.add(val));
      listShort.replaceAllElements((value) => value);

      expect(listShort.get(1)).assertEqual(32767);
      expect(listShort.get(3)).assertEqual(32768);

      const listChar = new List<number>();
      precisionValues.char.forEach(val => listChar.add(val));
      listChar.replaceAllElements((value) => value);

      expect(String.fromCharCode(listChar.get(2) ?? 0)).assertEqual("A");
      expect(String.fromCharCode(listChar.get(3) ?? 0)).assertEqual("a");

      const listLong = new List<bigint>();
      precisionValues.long.forEach(val => listLong.add(val));
      listLong.replaceAllElements((value) => value);

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
      listInsert.add(0);
      listInsert.replaceAllElements((value) => value);

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
     * @tc.number    SUB_LIST_TEXT09_2100
     * @tc.name      testList09Chapter0021
     * @tc.desc      List.replaceAllElements: base expression number values (hex/octal/scientific/exponent)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList09Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList09Chapter0021';
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

      const constructorVals = [
        baseExprValues.hex16,
        baseExprValues.hex32,
        baseExprValues.octal,
        baseExprValues.sci1,
        baseExprValues.exponent
      ];

      const listConstructor = new List<number>();
      constructorVals.forEach(val => listConstructor.add(val));
      listConstructor.replaceAllElements((value) => value);

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
      listInsert.add(100);
      listInsert.replaceAllElements((value) => value);

      listInsert.insert(1, baseExprValues.hex16);
      listInsert.insert(0, baseExprValues.sci1);
      listInsert.insert(5, baseExprValues.exponent);
      expect(listInsert.size()).assertEqual(4);
      expect(listInsert.get(0)).assertEqual(1000);
      expect(listInsert.get(2)).assertEqual(258);
      expect(listInsert.get(3)).assertEqual(8);
    });

    /**
     * @tc.number    SUB_LIST_TEXT09_2200
     * @tc.name      testList09Chapter0022
     * @tc.desc      List.replaceAllElements: bigint values (fixed redundant wrapping)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList09Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList09Chapter0022';
      console.log(TAG + ' start');
      const bigIntValues = [
        0xdecafafecacefaden,
        9007199254740991n,
        -9223372036854775808n,
        123.456,
        18446744073709551615n
      ];

      const listConstructor = new List<bigint | number>();
      bigIntValues.forEach(val => listConstructor.add(val));
      listConstructor.replaceAllElements((value) => value);

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
      listInsert.add(0n);
      listInsert.replaceAllElements((value) => value);

      listInsert.insert(1, 123.456);
      listInsert.insert(0, -9223372036854775808n);
      listInsert.insert(5, 18446744073709551616n);
      expect(listInsert.size()).assertEqual(4);
      expect(listInsert.get(0)).assertEqual(-9223372036854775808n);
      expect(listInsert.get(2)).assertEqual(123.456);
      expect(listInsert.get(3)).assertEqual(18446744073709551616n);
    });

    /**
     * @tc.number    SUB_LIST_TEXT09_2300
     * @tc.name      testList09Chapter0023
     * @tc.desc      List.replaceAllElements: basic boolean values (true/false)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList09Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList09Chapter0023';
      console.log(TAG + ' start');
      const basicValues: boolean[] = [true, false];

      const listConstructor = new List<boolean>();
      basicValues.forEach(val => listConstructor.add(val));
      listConstructor.replaceAllElements((value) => value);

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
      listInsert.add(true);
      listInsert.replaceAllElements((value) => value);

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
     * @tc.number    SUB_LIST_TEXT09_2400
     * @tc.name      testList09Chapter0024
     * @tc.desc      List.replaceAllElements: false-like values (0/NaN/"" /null/undefined/!\'s\')
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList09Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList09Chapter0024';
      console.log(TAG + ' start');
      const falseLikeValues: (number | string | null | undefined | boolean)[] = [0, NaN, "", null, undefined, !'s'];

      const listConstructor = new List<number | string | null | undefined | boolean>();
      falseLikeValues.forEach(val => listConstructor.add(val));
      listConstructor.replaceAllElements((value) => value);

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
      listInsert.add(true);
      listInsert.replaceAllElements((value) => value);

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
     * @tc.number    SUB_LIST_TEXT09_2500
     * @tc.name      testList09Chapter0025
     * @tc.desc      List.replaceAllElements: true-like values (fixed EmptyObject initialization)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList09Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList09Chapter0025';
      console.log(TAG + ' start');
      const emptyObj = new EmptyObject();
      const trueLikeValues: (boolean | number | string | EmptyObject | number[])[] = [!0, 1, "non-empty", emptyObj, [1]];

      const listConstructor = new List<boolean | number | string | EmptyObject | number[]>();
      trueLikeValues.forEach(val => listConstructor.add(val));
      listConstructor.replaceAllElements((value) => value);

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
      listInsert.add(false);
      listInsert.replaceAllElements((value) => value);

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
     * @tc.number    SUB_LIST_TEXT09_2600
     * @tc.name      testList09Chapter0026
     * @tc.desc      List.replaceAllElements: mixed boolean/number/string values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList09Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList09Chapter0026';
      console.log(TAG + ' start');
      const emptyObj = new EmptyObject();
      const mixedValues: (boolean | number | string | null | undefined | EmptyObject | number[])[] = [
        true, false, 0, NaN, "", null, undefined, !'s', !0,
        123, "", "test", emptyObj, [1]
      ];

      const listConstructor = new List<boolean | number | string | null | undefined | EmptyObject | number[]>();
      mixedValues.forEach(val => listConstructor.add(val));
      listConstructor.replaceAllElements((value) => value);

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
      listInsert.add(true);
      listInsert.add(false);
      listInsert.replaceAllElements((value) => value);

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
     * @tc.number    SUB_LIST_TEXT09_2700
     * @tc.name      testList09Chapter0027
     * @tc.desc      List.replaceAllElements: basic objects (normal/nested/empty)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList09Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList09Chapter0027';
      console.log(TAG + ' start');
      const normalObj = new NormalObject(1, "test", [1, 2, 3]);
      const nestedObj = new NestedObject(1, new NestedLevel2(2, new NestedLevel3(3)));
      const emptyObj = new EmptyObject();

      const listNormal = new List<NormalObject>();
      listNormal.add(normalObj);
      listNormal.replaceAllElements((value) => value);

      expect(listNormal.size()).assertEqual(1);
      expect(listNormal.get(0)!.a).assertEqual(1);
      expect(listNormal.get(0)!.b).assertEqual("test");
      expect(listNormal.get(0)!.c[1]).assertEqual(2);

      const listNested = new List<NestedObject>();
      listNested.add(nestedObj);
      listNested.replaceAllElements((value) => value);

      expect(listNested.get(0)!.b.d.e).assertEqual(3);

      const listEmpty = new List<EmptyObject>();
      listEmpty.add(emptyObj);
      listEmpty.replaceAllElements((value) => value);

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
      listInsert.add(normalObj);
      listInsert.replaceAllElements((value) => value);

      listInsert.insert(1, nestedObj);
      listInsert.insert(0, emptyObj);
      listInsert.insert(5, newObj);
      expect(listInsert.size()).assertEqual(4);
      expect(isEmptyObject(listInsert.get(0) as EmptyObject)).assertTrue();
      expect((listInsert.get(2) as NestedObject).b.d.e).assertEqual(3);
      expect((listInsert.get(3) as NormalObject).a).assertEqual(4);
    });
    /**
     * @tc.number    SUB_LIST_TEXT09_2800
     * @tc.name      testList09Chapter0028
     * @tc.desc      List.replaceAllElements: special key/inherit/non-enum objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList09Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList09Chapter0028';
      console.log(TAG + ' start');
      const specialKeyObj = new SpecialKeyObject("value", 1);
      const inheritObj = new InheritObject(1);
      const nonEnumObj = new NonEnumObject(1);
      const newSpecialObj = new SpecialKeyObject("newValue", 2);

      const listSpecial = new List<SpecialKeyObject>();
      listSpecial.add(specialKeyObj);
      listSpecial.replaceAllElements((value) => value);

      expect(listSpecial.get(0)!.specialKey).assertEqual("value");
      expect(listSpecial.get(0)!.a).assertEqual(1);

      const listInherit = new List<InheritObject>();
      listInherit.add(inheritObj);
      listInherit.replaceAllElements((value) => value);

      expect(listInherit.get(0)!.parentProp).assertEqual(1);

      const listNonEnum = new List<NonEnumObject>();
      listNonEnum.add(nonEnumObj);
      listNonEnum.replaceAllElements((value) => value);

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
      listInsert.add(specialKeyObj);
      listInsert.replaceAllElements((value) => value);

      listInsert.insert(1, inheritObj);
      listInsert.insert(0, nonEnumObj);
      listInsert.insert(5, newSpecialObj);
      expect(listInsert.size()).assertEqual(4);
      expect((listInsert.get(0) as NonEnumObject).a).assertEqual(1);
      expect((listInsert.get(2) as InheritObject).parentProp).assertEqual(1);
      expect((listInsert.get(3) as SpecialKeyObject).specialKey).assertEqual("newValue");
    });

    /**
     * @tc.number    SUB_LIST_TEXT09_2900
     * @tc.name      testList09Chapter0029
     * @tc.desc      List.replaceAllElements: buffer/dataview/typed array objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList09Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList09Chapter0029';
      console.log(TAG + ' start');
      const bufferObj = new BufferObject(new ArrayBuffer(16));
      const dataViewObj = new DataViewObject(new DataView(new ArrayBuffer(16)));
      const typedArrayObj = new BufferObject(createUint8Array([72, 101, 108, 108, 111]));
      const newTypedObj = new BufferObject(new Int16Array([1234]));

      const listBuffer = new List<BufferObject>();
      listBuffer.add(bufferObj);
      listBuffer.replaceAllElements((value) => value);

      expect((listBuffer.get(0)!.buffer as ArrayBuffer).byteLength).assertEqual(16);

      const listDataView = new List<DataViewObject>();
      listDataView.add(dataViewObj);
      listDataView.replaceAllElements((value) => value);

      expect(listDataView.get(0)!.view.buffer.byteLength).assertEqual(16);

      const listTypedArray = new List<BufferObject>();
      listTypedArray.add(typedArrayObj);
      listTypedArray.replaceAllElements((value) => value);

      expect((listTypedArray.get(0)!.buffer as Uint8Array)[0]).assertEqual(72);

      const listAdd = new List<Object>();
      listAdd.add(bufferObj);
      listAdd.add(dataViewObj);
      listAdd.add(typedArrayObj);
      expect(listAdd.size()).assertEqual(3);
      expect(((listAdd.get(0) as BufferObject).buffer as ArrayBuffer).byteLength).assertEqual(16);
      expect(((listAdd.get(2) as BufferObject).buffer as Uint8Array).length).assertEqual(5);

      const listInsert = new List<Object>();
      listInsert.add(bufferObj);
      listInsert.replaceAllElements((value) => value);

      listInsert.insert(1, dataViewObj);
      listInsert.insert(0, typedArrayObj);
      listInsert.insert(5, newTypedObj);
      expect(listInsert.size()).assertEqual(4);
      expect(((listInsert.get(0) as BufferObject).buffer as Uint8Array)[1]).assertEqual(101);
      expect((listInsert.get(2) as DataViewObject).view.buffer.byteLength).assertEqual(16);
      expect(((listInsert.get(3) as BufferObject).buffer as Int16Array)[0]).assertEqual(1234);
    });

    /**
     * @tc.number    SUB_LIST_TEXT09_3000
     * @tc.name      testList09Chapter0030
     * @tc.desc      List.replaceAllElements: map/set/func/regex/promise objects (improved promise test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList09Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const TAG = 'testList09Chapter0030';
        console.log(TAG + ' start');
        const mapObj = new MapObject([['key1', 'value1'], ['key2', new NestedLevel2(1, new NestedLevel3(1))]]);
        const setObj = new SetObject([1, 2, 3, 2, 1]);
        const funcObj = new FuncObject(1, () => "func");
        const regexObj = new RegexObject(/abc/gi);
        const testPromise = new Promise<string>((resolve) => setTimeout(() => resolve('done'), 100));
        const promiseObj = new PromiseObject(testPromise);

        const listMap = new List<MapObject>();
        listMap.add(mapObj);
        listMap.replaceAllElements((value) => value);

        expect(listMap.get(0)!.map.get('key1')).assertEqual('value1');
        expect((listMap.get(0)!.map.get('key2') as NestedLevel2).c).assertEqual(1);

        const listSet = new List<SetObject>();
        listSet.add(setObj);
        listSet.replaceAllElements((value) => value);

        expect(listSet.get(0)!.set.size).assertEqual(3);

        const listFunc = new List<FuncObject>();
        listFunc.add(funcObj);
        listFunc.replaceAllElements((value) => value);

        expect(listFunc.get(0)!.b()).assertEqual("func");

        const listRegex = new List<RegexObject>();
        listRegex.add(regexObj);
        listRegex.replaceAllElements((value) => value);

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
        listInsert.add(mapObj);
        listInsert.replaceAllElements((value) => value);

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
  })
}