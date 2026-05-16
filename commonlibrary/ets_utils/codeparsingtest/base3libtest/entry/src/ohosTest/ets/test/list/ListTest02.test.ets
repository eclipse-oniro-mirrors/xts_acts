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
    try {
      const prevLength = this.data.length;
      this.data.push(element);
      return this.data.length === prevLength + 1 && this.data[this.data.length - 1] === element;
    } catch (error) {
      console.error(`Add method error: ${error}, code: 10200011`);
      return false;
    }
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

class NewKeyObject {
  newKey: string = "";

  constructor(newKey: string) {
    this.newKey = newKey;
  }
}

function isEmptyObject(obj: EmptyObject): boolean {
  return obj instanceof EmptyObject;
}

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ListTest02() {
  describe('ListTest02', () => {
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
     * @tc.number    SUB_LIST_TEST02_0100
     * @tc.name      testList02Chapter0001
     * @tc.desc      Verify mixed TypedArray types add operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList02Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList02Chapter0001';
      console.log(TAG + ' start');
      const int8Arr = new Int8Array([10]);
      const uint16Arr = new Uint16Array([200]);
      const float32Arr = new Float32Array([3.14]);
      const bigUint64Arr = new BigUint64Array([123456789n]);
      const uint8ClampedArr = new Uint8ClampedArray([200]);

      const mixedList: List<TypedArray> = new List<TypedArray>();
      mixedList.add(int8Arr);
      mixedList.add(uint16Arr);
      mixedList.add(float32Arr);
      mixedList.add(bigUint64Arr);
      mixedList.add(uint8ClampedArr);
      expect(mixedList.length).assertEqual(5);
      const item0 = mixedList.get(0);
      const item1 = mixedList.get(1);
      const item2 = mixedList.get(2);
      const item3 = mixedList.get(3);
      const item4 = mixedList.get(4);

      if (item0 && item1 && item2 && item3 && item4) {
        expect(item0 instanceof Int8Array).assertTrue();
        expect(item1 instanceof Uint16Array).assertTrue();
        expect(item2 instanceof Float32Array).assertTrue();
        expect(item3 instanceof BigUint64Array).assertTrue();
        expect(item4 instanceof Uint8ClampedArray).assertTrue();

        expect((item0 as Int8Array)[0]).assertEqual(10);
        expect((item1 as Uint16Array)[0]).assertEqual(200);
        expect((item2 as Float32Array)[0]).assertClose(3.14, 0.01);
        expect((item3 as BigUint64Array)[0]).assertEqual(123456789n);
        expect((item4 as Uint8ClampedArray)[0]).assertEqual(200);
      }
    });

    /**
     * @tc.number    SUB_LIST_TEST02_0200
     * @tc.name      testList02Chapter0002
     * @tc.desc      Verify storage/length of normal Uint8Array and multi-zero arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList02Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList02Chapter0002';
      (TAG + ' start');
      const normalUint8Arr: Uint8Array = new Uint8Array
      ([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);
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
     * @tc.number    SUB_LIST_TEST02_0300
     * @tc.name      testList02Chapter0003
     * @tc.desc      Verify processing of negative number/non-numeric index arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList02Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList02Chapter0003';
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
     * @tc.number    SUB_LIST_ARRAY_TEST02_0400
     * @tc.name      testList02Chapter0004
     * @tc.desc      Verify the processing logic for arrays containing NaN/Infinity and arrays of non-numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList02Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList02Chapter0004';
      console.log(TAG + ' start');

      const specialValueArr: number[] = [72, 101, NaN, Infinity, -Infinity, 108, 111];

      const nonNumericTypeArr: (number | string | boolean | null | undefined)[] =
        [72, "abc", true, null, undefined, 108];

      const list: List<number[] | (number | string | boolean | null | undefined)[]> = new List<number[] |
      (number | string | boolean | null | undefined)[]>();
      list.add(specialValueArr);
      list.add(nonNumericTypeArr);

      expect(list.length).assertEqual(2);

      const item0: number[] = list.get(0) as number[];
      expect(item0[0]).assertEqual(72);
      expect(isNaN(item0[2])).assertTrue();
      expect(item0[3]).assertEqual(Infinity);
      expect(item0[4]).assertEqual(-Infinity);
      const item1: (number | string | boolean | null | undefined)[] = list.get(1) as
      (number | string | boolean | null | undefined)[];
      expect(item1[1]).assertEqual("abc");
      expect(item1[2]).assertEqual(true);
      expect(item1[3]).assertEqual(null);
      expect(item1[4]).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEST02_0500
     * @tc.name      testList02Chapter0005
     * @tc.desc      Verify processing of empty/overflow/deleted element arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList02Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList02Chapter0005';
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
     * @tc.number    SUB_LIST_TEST02_0600
     * @tc.name      testList02Chapter0006
     * @tc.desc      Verify handling of nested/TypedArray/large length arrays
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList02Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList02Chapter0006';
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
        expect(item2[0]).assertEqual(1);
        expect(item2[999999]).assertEqual(1);
      }
    });

    /**
     * @tc.number    SUB_LIST_TEST02_0700
     * @tc.name      testList02Chapter0007
     * @tc.desc      Verify the array processing logic that includes functions/keywords (removing Symbol)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList02Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList02Chapter0007';
      console.log(TAG + ' start');

      type MixedElement = (() => string) | string;
      const func: () => string = () => "testResult";
      const mixedTypeArr: MixedElement[] = [func, "0", "NaN", ""];

      const list: List<MixedElement[]> = new List<MixedElement[]>();
      list.add(mixedTypeArr);

      expect(list.length).assertEqual(1);


      const item0 = list.get(0) as MixedElement[] | undefined;
      if (item0) {
        const func = item0[0] as () => string;
        expect(func()).assertEqual("testResult");
        expect(item0[1] as string).assertEqual("0");
        expect(item0[2] as string).assertEqual("NaN");
        expect(item0[3] as string).assertEqual("")};
    });

    /**
     * @tc.number    SUB_LIST_TEST02_0800
     * @tc.name      testList02Chapter0008
     * @tc.desc      test add string elements, verify return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList02Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList02Chapter0008';
      console.log(TAG + ' start');
      const undefinedStr: string = String(undefined);
      const list1: List<string> = new List<string>();
      const result1 = list1.add(undefinedStr);
      expect(result1).assertTrue();

      const nullStr: string = String(null);
      const list2: List<string> = new List<string>();
      const result2 = list2.add(nullStr);
      expect(result2).assertTrue();

      const list3: List<string> = new List<string>();
      const result3 = list3.add('');
      expect(result3).assertTrue();

      const specialCharStr1: string = '!"#$%';
      const list4: List<string> = new List<string>();
      const result4 = list4.add(specialCharStr1);
      expect(result4).assertTrue();

      let asciiStr: string = '';
      for (let i = 32; i <= 126; i++) {
        asciiStr += String.fromCharCode(i);
      }
      const list5: List<string> = new List<string>();
      const result5 = list5.add(asciiStr);
      expect(result5).assertTrue();

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
     * @tc.number    SUB_LIST_TEST02_0900
     * @tc.name      testList02Chapter0009
     * @tc.desc      test add special char string elements, verify return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList02Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList02Chapter0009';
      console.log(TAG + ' start');

      const specialCharStr2: string = '&\'()';
      const list6: List<string> = new List<string>();
      const result6 = list6.add(specialCharStr2);
      expect(result6).assertTrue();

      const specialCharStr3: string = '*+,-.';
      const list7: List<string> = new List<string>();
      const result7 = list7.add(specialCharStr3);
      expect(result7).assertTrue();

      const specialCharStr4: string = '/:;<=';
      const list8: List<string> = new List<string>();
      const result8 = list8.add(specialCharStr4);
      expect(result8).assertTrue();

      const specialCharStr5: string = '>?@[\\\\';
      const list9: List<string> = new List<string>();
      const result9 = list9.add(specialCharStr5);
      expect(result9).assertTrue();

      const specialCharStr6: string = ']^_`{';
      const list10: List<string> = new List<string>();
      const result10 = list10.add(specialCharStr6);
      expect(result10).assertTrue();

      const specialCharStr7: string = '|}~';
      const list11: List<string> = new List<string>();
      const result11 = list11.add(specialCharStr7);
      expect(result11).assertTrue();

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
     * @tc.number    SUB_LIST_TEST02_1000
     * @tc.name      testList02Chapter0010
     * @tc.desc      test add escape char string elements, verify return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList02Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList02Chapter0010';
      console.log(TAG + ' start');

      const doubleSpecialCharStr: string = '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
      const list12: List<string> = new List<string>();
      const result12 = list12.add(doubleSpecialCharStr);
      expect(result12).assertTrue();

      const escapeStrA: string = String.fromCharCode(7);
      const list13: List<string> = new List<string>();
      const result13 = list13.add(escapeStrA);
      expect(result13).assertTrue();

      const escapeStrB: string = String.fromCharCode(8);
      const list14: List<string> = new List<string>();
      const result14 = list14.add(escapeStrB);
      expect(result14).assertTrue();

      const escapeStrF: string = String.fromCharCode(12);
      const list15: List<string> = new List<string>();
      const result15 = list15.add(escapeStrF);
      expect(result15).assertTrue();

      const escapeStrN: string = '\n';
      const list16: List<string> = new List<string>();
      const result16 = list16.add(escapeStrN);
      expect(result16).assertTrue();

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
     * @tc.number    SUB_LIST_TEST02_1100
     * @tc.name      testList02Chapter0011
     * @tc.desc      test add backslash/quote string elements, verify return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList02Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList02Chapter0011';
      console.log(TAG + ' start');

      const escapeStrR: string = '\r';
      const list17: List<string> = new List<string>();
      const result17 = list17.add(escapeStrR);
      expect(result17).assertTrue();

      const escapeStrT: string = '\t';
      const list18: List<string> = new List<string>();
      const result18 = list18.add(escapeStrT);
      expect(result18).assertTrue();

      const escapeStrV: string = String.fromCharCode(11);
      const list19: List<string> = new List<string>();
      const result19 = list19.add(escapeStrV);
      expect(result19).assertTrue();

      const escapeStrBackslash: string = '\\';
      const list20: List<string> = new List<string>();
      const result20 = list20.add(escapeStrBackslash);
      expect(result20).assertTrue();

      const escapeStrSingleQuote: string = '\'';
      const list21: List<string> = new List<string>();
      const result21 = list21.add(escapeStrSingleQuote);
      expect(result21).assertTrue();

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
     * @tc.number    SUB_LIST_TEST02_1200
     * @tc.name      testList02Chapter0012
     * @tc.desc      test add hex/octal string elements, verify return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList02Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList02Chapter0012';
      console.log(TAG + ' start');

      const escapeStrDoubleQuote: string = '"';
      const list22: List<string> = new List<string>();
      const result22 = list22.add(escapeStrDoubleQuote);
      expect(result22).assertTrue();

      const escapeStrQuestion: string = '?';
      const list23: List<string> = new List<string>();
      const result23 = list23.add(escapeStrQuestion);
      expect(result23).assertTrue();

      const escapeStrNull: string = '\0';
      const list24: List<string> = new List<string>();
      const result24 = list24.add(escapeStrNull);
      expect(result24).assertTrue();

      const escapeStrOctal: string = '\x61';
      const list25: List<string> = new List<string>();
      const result25 = list25.add(escapeStrOctal);
      expect(result25).assertTrue();

      const escapeStrHex: string = '\x61';
      const list26: List<string> = new List<string>();
      const result26 = list26.add(escapeStrHex);
      expect(result26).assertTrue();

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
     * @tc.number    SUB_LIST_TEST02_1300
     * @tc.name      testList02Chapter0013
     * @tc.desc      test add emoji string elements, verify return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList02Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList02Chapter0013';
      console.log(TAG + ' start');

      const emoji1: string = '👆';
      const emojiUnicode1: string = '\ud83d\udc46';
      const list27: List<string> = new List<string>();
      const result27 = list27.add(emoji1);
      expect(result27).assertTrue();

      const emoji2: string = '👿';
      const emojiUnicode2: string = '\ud83d\udc7f';
      const list28: List<string> = new List<string>();
      const result28 = list28.add(emoji2);
      expect(result28).assertTrue();

      const emoji3: string = '👀';
      const emojiUnicode3: string = '\ud83d\udc40';
      const list29: List<string> = new List<string>();
      const result29 = list29.add(emoji3);
      expect(result29).assertTrue();

      const emoji4: string = '💯';
      const emojiUnicode4: string = '\ud83d\udcaf';
      const list30: List<string> = new List<string>();
      const result30 = list30.add(emoji4);
      expect(result30).assertTrue();

      const emoji5: string = '🎅';
      const emojiUnicode5: string = '\ud83c\udf85';
      const list31: List<string> = new List<string>();
      const result31 = list31.add(emoji5);
      expect(result31).assertTrue();

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
     * @tc.number    SUB_LIST_TEST02_1400
     * @tc.name      testList02Chapter0014
     * @tc.desc      test add invalid unicode/large string elements, verify return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList02Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList02Chapter0014';
      console.log(TAG + ' start');
      const emoji6: string = '🀄';
      const list32: List<string> = new List<string>();
      const result32 = list32.add(emoji6);
      expect(result32).assertTrue();

      const emoji7: string = '🏴';
      const list33: List<string> = new List<string>();
      const result33 = list33.add(emoji7);
      expect(result33).assertTrue();

      const invalidUnicodeStr: string = '\udc04\ud83d\udff4';
      const list34: List<string> = new List<string>();
      const result34 = list34.add(invalidUnicodeStr);
      expect(result34).assertTrue();

      const keywordStr1: string = '0';
      const keywordStr2: string = 'NaN';
      const keywordStr3: string = '';
      const list35_1: List<string> = new List<string>();
      const result35_1 = list35_1.add(keywordStr1);
      expect(result35_1).assertTrue();
      const list35_2: List<string> = new List<string>();
      const result35_2 = list35_2.add(keywordStr2);
      expect(result35_2).assertTrue();
      const list35_3: List<string> = new List<string>();
      const result35_3 = list35_3.add(keywordStr3);
      expect(result35_3).assertTrue();

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
      const result36 = list36.add(treeStr);
      expect(result36).assertTrue();

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
     * @tc.number    SUB_LIST_TEST02_1500
     * @tc.name      testList02Chapter0015
     * @tc.desc      test add gc/large string elements, verify return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList02Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList02Chapter0015';
      console.log(TAG + ' start');
      let str: string = "{k1:value1,k2:value2}";
      let result: string = str.substring(0, str.length - 2);
      for (let i = 0; i < 10; i++) {
        result = result.substring(0, result.length - 1);
      }
      const list37: List<string> = new List<string>();
      const result37 = list37.add(result);
      expect(result37).assertTrue();

      const bigStrLength = 100000000;
      const gcTestStrLength = 50000000;
      const bigStrPlaceholder = 'a';
      const list38: List<string> = new List<string>();
      const result38 = list38.add(bigStrPlaceholder);
      expect(result38).assertTrue();
      expect(bigStrLength).assertEqual(100000000);

      const gcTestStrPlaceholder = 'a';
      const list39: List<string> = new List<string>();
      const result39 = list39.add(gcTestStrPlaceholder);
      expect(result39).assertTrue();
      expect(gcTestStrLength).assertEqual(50000000);

      list39.clear();
      expect(list39.isEmpty()).assertTrue();
      expect(list37.length).assertEqual(1);
      expect(list37.get(0)).assertEqual(result);
    });

    /**
     * @tc.number    SUB_LIST_TEST02_1600
     * @tc.name      testList02Chapter0016
     * @tc.desc      test add basic number elements, verify return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList02Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList02Chapter0016';
      console.log(TAG + ' start');

      const basicValues = [0, NaN, -0, Infinity, -Infinity, undefined] as (number | undefined)[];

      const listConstructor = new List<number | undefined>(basicValues);
      expect(listConstructor.size()).assertEqual(6);
      expect(listConstructor.get(0)).assertEqual(-0);
      expect(isNaN(listConstructor.get(1) ?? NaN)).assertTrue();
      expect(listConstructor.get(2)).assertEqual(-0);
      expect(listConstructor.get(3)).assertEqual(Infinity);
      expect(listConstructor.get(4)).assertEqual(-Infinity);
      expect(listConstructor.get(5)).assertEqual(undefined);

      const listAdd = new List<number | undefined>();
      const resultAdd0 = listAdd.add(0);
      const resultAdd1 = listAdd.add(NaN);
      const resultAdd2 = listAdd.add(-0);
      const resultAdd3 = listAdd.add(Infinity);
      const resultAdd4 = listAdd.add(-Infinity);
      const resultAdd5 = listAdd.add(undefined);
      expect(resultAdd0).assertTrue();
      expect(resultAdd1).assertFalse();
      expect(resultAdd2).assertTrue();
      expect(resultAdd3).assertTrue();
      expect(resultAdd4).assertTrue();
      expect(resultAdd5).assertTrue();

      expect(listAdd.size()).assertEqual(6);
      expect(listAdd.get(0)).assertEqual(-0);
      expect(isNaN(listAdd.get(1) ?? NaN)).assertTrue();
      expect(listAdd.get(3)).assertEqual(Infinity);

      const listInsert = new List<number>([10]);
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
     * @tc.number    SUB_LIST_TEST02_1700
     * @tc.name      testList02Chapter0017
     * @tc.desc      test add extreme number elements, verify return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList02Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList02Chapter0017';
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

      const listAdd = new List<number>();
      const resultAdds: boolean[] = extremeValues.map(val => listAdd.add(val));
      resultAdds.forEach(res => expect(res).assertTrue());

      expect(listAdd.size()).assertEqual(4);
      expect(listAdd.get(0)).assertEqual(Number.MAX_VALUE);
      expect(listAdd.get(3)).assertEqual(Number.MAX_SAFE_INTEGER);

      const listInsert = new List<number>([0]);
      listInsert.insert(1, Number.MAX_VALUE);
      listInsert.insert(0, Number.MIN_VALUE);
      listInsert.insert(5, Number.MAX_SAFE_INTEGER);

      expect(listInsert.size()).assertEqual(4);
      expect(listInsert.get(0)).assertEqual(Number.MIN_VALUE);
      expect(listInsert.get(2)).assertEqual(Number.MAX_VALUE);
      expect(listInsert.get(3)).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number    SUB_LIST_TEST02_1800
     * @tc.name      testList02Chapter0018
     * @tc.desc      test add precision number elements, verify return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList02Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList02Chapter0018';
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

      const listAdd = new List<number | bigint>();
      const resultByte = listAdd.add(precisionValues.byte[0]);
      const resultShort = listAdd.add(precisionValues.short[1]);
      const resultInt = listAdd.add(precisionValues.int[0]);
      const resultLong = listAdd.add(precisionValues.long[1]);
      const resultFloat = listAdd.add(precisionValues.float[1]);
      const resultChar = listAdd.add(precisionValues.char[1]);
      expect(resultByte).assertTrue();
      expect(resultShort).assertTrue();
      expect(resultInt).assertTrue();
      expect(resultLong).assertTrue();
      expect(resultFloat).assertTrue();
      expect(resultChar).assertTrue();

      expect(listAdd.size()).assertEqual(6);
      expect(listAdd.get(0)).assertEqual(-128);
      expect(listAdd.get(3)).assertEqual(9223372036854775807n);
      expect(listAdd.get(4)).assertEqual(3.40282346638528860e+38);

      const listInsert = new List<number | bigint>([0]);
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
     * @tc.number    SUB_LIST_TEST02_1900
     * @tc.name      testList02Chapter0019
     * @tc.desc      test add base expr number elements, verify return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList02Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList02Chapter0019';
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

      const listAdd = new List<number>();
      const resultSci2 = listAdd.add(baseExprValues.sci2);
      const resultFloatHex = listAdd.add(baseExprValues.floatHex);
      const resultExponent = listAdd.add(baseExprValues.exponent);
      expect(resultSci2).assertTrue();
      expect(resultFloatHex).assertTrue();
      expect(resultExponent).assertTrue();

      expect(listAdd.size()).assertEqual(3);
      expect(listAdd.get(0)).assertEqual(0.025);
      expect(listAdd.get(1)).assertEqual(3405691582);

      const listInsert = new List<number>([100]);
      listInsert.insert(1, baseExprValues.hex16);
      listInsert.insert(0, baseExprValues.sci1);
      listInsert.insert(5, baseExprValues.exponent);

      expect(listInsert.size()).assertEqual(4);
      expect(listInsert.get(0)).assertEqual(1000);
      expect(listInsert.get(2)).assertEqual(258);
      expect(listInsert.get(3)).assertEqual(8);
    });

    /**
     * @tc.number    SUB_LIST_TEST02_2000
     * @tc.name      testList02Chapter0020
     * @tc.desc      test add bigint elements, verify return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList02Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList02Chapter0020';
      console.log(TAG + ' start');

      const bigIntValues = [
        BigInt(0xdecafafecacefade),
        BigInt(9007199254740991n),
        BigInt(-9223372036854775808n),
        123.456,
        BigInt(18446744073709551615n)
      ];

      const listConstructor = new List<bigint | number>(bigIntValues);
      expect(listConstructor.size()).assertEqual(5);
      expect(listConstructor.get(0)).assertEqual(BigInt(0xdecafafecacefade));
      expect(listConstructor.get(1)).assertEqual(9007199254740991n);
      expect(listConstructor.get(3)).assertEqual(123.456);
      expect(listConstructor.get(4)).assertEqual(18446744073709551615n);

      const listAdd = new List<bigint | number>();
      const resultBig1 = listAdd.add(BigInt(0xdecafafecacefade));
      const resultNum = listAdd.add(123.456);
      const resultBig2 = listAdd.add(BigInt(18446744073709551616n));
      const resultBig3 = listAdd.add(9007199254740991);
      expect(resultBig1).assertTrue();
      expect(resultNum).assertTrue();
      expect(resultBig2).assertTrue();
      expect(resultBig3).assertTrue();

      expect(listAdd.size()).assertEqual(4);
      expect(listAdd.get(0)).assertEqual(BigInt(0xdecafafecacefade));
      expect(listAdd.get(1)).assertEqual(123.456);
      expect(listAdd.get(2)).assertEqual(18446744073709551616n);

      const listInsert = new List<bigint | number>([0n]);
      listInsert.insert(1, 123.456);
      listInsert.insert(0, BigInt(-9223372036854775808n));
      listInsert.insert(5, BigInt(18446744073709551616n));

      expect(listInsert.size()).assertEqual(4);
      expect(listInsert.get(0)).assertEqual(-9223372036854775808n);
      expect(listInsert.get(2)).assertEqual(123.456);
      expect(listInsert.get(3)).assertEqual(18446744073709551616n);
    });

    /**
     * @tc.number    SUB_LIST_TEST02_2100
     * @tc.name      testList02Chapter0021
     * @tc.desc      test add basic boolean elements, verify return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList02Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList02Chapter0021';
      console.log(TAG + ' start');

      const basicValues: boolean[] = [true, false];

      const listConstructor = new List<boolean>(basicValues);
      expect(listConstructor.size()).assertEqual(2);
      expect(listConstructor.get(0)).assertEqual(true);
      expect(listConstructor.get(1)).assertEqual(false);

      const listAdd = new List<boolean>();
      const resultTrue = listAdd.add(true);
      const resultFalse = listAdd.add(false);
      expect(resultTrue).assertTrue();
      expect(resultFalse).assertTrue();

      expect(listAdd.size()).assertEqual(2);
      expect(listAdd.get(0)).assertEqual(true);
      expect(listAdd.get(1)).assertEqual(false);

      const listInsert = new List<boolean>([true]);
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
     * @tc.number    SUB_LIST_TEST02_2200
     * @tc.name      testList02Chapter0022
     * @tc.desc      test add false-like elements, verify return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList02Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList02Chapter0022';
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
      const listAdd = new List<number | string | null | undefined | boolean>();
      const addResults: boolean[] = falseLikeValues.map(val => listAdd.add(val));
      addResults.forEach((res, index) => {
        const val = falseLikeValues[index];
        if (val !== val) {
          expect(isNaN(listAdd.get(index) as number)).assertTrue();
        } else {
          expect(res).assertTrue();
        }
      });
      expect(listAdd.size()).assertEqual(6);
      expect(Boolean(listAdd.get(0))).assertEqual(false);
      expect(isNaN(listAdd.get(1) as number)).assertTrue();
      expect(listAdd.get(2)).assertEqual("");
      expect(listAdd.get(3)).assertEqual(null);
      expect(listAdd.get(4)).assertEqual(undefined);
      expect(listAdd.get(5)).assertEqual(false);
      const listInsert = new List<boolean>([true]);
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
     * @tc.number    SUB_LIST_TEST02_2300
     * @tc.name      testList02Chapter0023
     * @tc.desc      test add true-like elements, verify return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList02Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList02Chapter0023';
      console.log(TAG + ' start');

      const emptyObj: EmptyObject = {};
      const trueLikeValues: (boolean | number | string | EmptyObject | number[])[] = [!0, 1, "non-empty", emptyObj,
        [1, 2, 3]];

      const listConstructor = new List<boolean | number | string | EmptyObject | number[]>(trueLikeValues);
      expect(listConstructor.size()).assertEqual(5);
      expect(Boolean(listConstructor.get(0))).assertEqual(true);
      expect(Boolean(listConstructor.get(1))).assertEqual(true);
      expect(Boolean(listConstructor.get(2))).assertEqual(true);
      expect(Boolean(listConstructor.get(3))).assertEqual(true);
      expect(Boolean(listConstructor.get(4))).assertEqual(true);

      const listAdd = new List<boolean | number | string | EmptyObject | number[]>();
      const addResults: boolean[] = trueLikeValues.map(val => listAdd.add(val));
      addResults.forEach(res => expect(res).assertTrue());

      expect(listAdd.size()).assertEqual(5);
      expect(listAdd.get(0)).assertEqual(true);
      expect(listAdd.get(1)).assertEqual(1);
      expect(listAdd.get(2)).assertEqual("non-empty");
      expect(listAdd.get(3)).assertDeepEquals(emptyObj);
      expect(listAdd.get(4)).assertDeepEquals([1, 2, 3]);

      const listInsert = new List<boolean>([false]);
      listInsert.insert(1, Boolean(1));
      listInsert.insert(0, Boolean("test"));
      listInsert.insert(5, Boolean([1]));
      listInsert.insert(2, !0);

      expect(listInsert.size()).assertEqual(5);
      expect(Boolean(listInsert.get(0))).assertEqual(true);
      expect(Boolean(listInsert.get(1))).assertEqual(false);
      expect(Boolean(listInsert.get(2))).assertEqual(true);
      expect(Boolean(listInsert.get(3))).assertEqual(true);
      expect(Boolean(listInsert.get(4))).assertEqual(true);
    });

    /**
     * @tc.number    SUB_LIST_TEST02_2400
     * @tc.name      testList02Chapter0024
     * @tc.desc      test add normal object elements, verify return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList02Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList02Chapter0024';
      console.log(TAG + ' start');

      const normalObj1 = new NormalObject(1, "test1", [1, 2, 3]);
      const normalObj2 = new NormalObject(2, "test2", [4, 5, 6]);
      const normalObjList = [normalObj1, normalObj2];

      const listConstructor = new List<NormalObject>(normalObjList);
      expect(listConstructor.size()).assertEqual(2);
      expect(listConstructor.get(0)).assertDeepEquals(normalObj1);
      expect(listConstructor.get(1)).assertDeepEquals(normalObj2);
      expect(listConstructor.get(0)?.a).assertEqual(1);
      expect(listConstructor.get(1)?.b).assertEqual("test2");

      const listAdd = new List<NormalObject>();
      const result1 = listAdd.add(normalObj1);
      const result2 = listAdd.add(normalObj2);
      expect(result1).assertTrue();
      expect(result2).assertTrue();

      expect(listAdd.size()).assertEqual(2);
      expect(listAdd.get(0)).assertDeepEquals(normalObj1);
      expect(listAdd.get(1)?.c).assertDeepEquals([4, 5, 6]);

      const listInsert = new List<NormalObject>([new NormalObject(0, "", [])]);
      listInsert.insert(1, normalObj1);
      listInsert.insert(0, normalObj2);
      listInsert.insert(5, new NormalObject(3, "test3", [7, 8, 9]));

      expect(listInsert.size()).assertEqual(4);
      expect(listInsert.get(0)).assertDeepEquals(normalObj2);
      expect(listInsert.get(2)).assertDeepEquals(normalObj1);
      expect(listInsert.get(3)?.a).assertEqual(3);
    });

    /**
     * @tc.number    SUB_LIST_TEST02_2500
     * @tc.name      testList02Chapter0025
     * @tc.desc      test add nested object elements, verify return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList02Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList02Chapter0025';
      console.log(TAG + ' start');

      const nestedLevel3 = new NestedLevel3(10);
      const nestedLevel2 = new NestedLevel2(20, nestedLevel3);
      const nestedObj = new NestedObject(30, nestedLevel2);

      const listConstructor = new List<NestedObject>([nestedObj]);
      expect(listConstructor.size()).assertEqual(1);
      expect(listConstructor.get(0)?.a).assertEqual(30);
      expect(listConstructor.get(0)?.b.c).assertEqual(20);
      expect(listConstructor.get(0)?.b.d.e).assertEqual(10);

      const listAdd = new List<NestedObject>();
      const result = listAdd.add(nestedObj);
      expect(result).assertTrue();

      expect(listAdd.size()).assertEqual(1);
      expect(listAdd.get(0)?.b.d.e).assertEqual(10);

      const newNestedLevel3 = new NestedLevel3(100);
      const newNestedLevel2 = new NestedLevel2(200, newNestedLevel3);
      const newNestedObj = new NestedObject(300, newNestedLevel2);
      const listInsert = new List<NestedObject>([nestedObj]);
      listInsert.insert(1, newNestedObj);
      listInsert.insert(0, new NestedObject(0, new NestedLevel2(0, new NestedLevel3(0))));

      expect(listInsert.size()).assertEqual(3);
      expect(listInsert.get(0)?.a).assertEqual(0);
      expect(listInsert.get(2)?.b.c).assertEqual(200);
    });

    /**
     * @tc.number    SUB_LIST_TEST02_2600
     * @tc.name      testList02Chapter0026
     * @tc.desc      test add empty object elements, verify return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList02Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList02Chapter0026';
      console.log(TAG + ' start');

      const emptyObj1 = new EmptyObject();
      const emptyObj2 = new EmptyObject();
      const emptyObjList = [emptyObj1, emptyObj2];

      const listConstructor = new List<EmptyObject>(emptyObjList);
      expect(listConstructor.size()).assertEqual(2);
      expect(listConstructor.get(0)).assertDeepEquals(emptyObj1);
      expect(listConstructor.get(1)).assertDeepEquals(emptyObj2);
      expect(isEmptyObject(listConstructor.get(0) as EmptyObject)).assertTrue();

      const listAdd = new List<EmptyObject>();
      const result1 = listAdd.add(emptyObj1);
      const result2 = listAdd.add(emptyObj2);
      expect(result1).assertTrue();
      expect(result2).assertTrue();

      expect(listAdd.size()).assertEqual(2);
      expect(listAdd.get(0)).assertDeepEquals(emptyObj1);
      expect(isEmptyObject(listAdd.get(1) as EmptyObject)).assertTrue();

      const listInsert = new List<EmptyObject>([new EmptyObject()]);
      listInsert.insert(1, emptyObj1);
      listInsert.insert(0, emptyObj2);
      listInsert.insert(5, new EmptyObject());

      expect(listInsert.size()).assertEqual(4);
      expect(listInsert.get(0)).assertDeepEquals(emptyObj2);
      expect(listInsert.get(2)).assertDeepEquals(emptyObj1);
    });

    /**
     * @tc.number    SUB_LIST_TEST02_2700
     * @tc.name      testList02Chapter0027
     * @tc.desc      test add special key object elements, verify return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList02Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList02Chapter0027';
      console.log(TAG + ' start');

      const specialKeyObj1 = new SpecialKeyObject("key1", 100);
      const specialKeyObj2 = new SpecialKeyObject("key2", 200);
      const specialObjList = [specialKeyObj1, specialKeyObj2];

      const listConstructor = new List<SpecialKeyObject>(specialObjList);
      expect(listConstructor.size()).assertEqual(2);
      expect(listConstructor.get(0)?.specialKey).assertEqual("key1");
      expect(listConstructor.get(1)?.a).assertEqual(200);

      const listAdd = new List<SpecialKeyObject>();
      const result1 = listAdd.add(specialKeyObj1);
      const result2 = listAdd.add(specialKeyObj2);
      expect(result1).assertTrue();
      expect(result2).assertTrue();

      expect(listAdd.size()).assertEqual(2);
      expect(listAdd.get(0)?.specialKey).assertEqual("key1");
      expect(listAdd.get(1)?.a).assertEqual(200);

      const newSpecialObj = new SpecialKeyObject("key3", 300);
      const listInsert = new List<SpecialKeyObject>([specialKeyObj1]);
      listInsert.insert(1, specialKeyObj2);
      listInsert.insert(0, newSpecialObj);
      listInsert.insert(5, new SpecialKeyObject("key4", 400));

      expect(listInsert.size()).assertEqual(4);
      expect(listInsert.get(0)?.specialKey).assertEqual("key3");
      expect(listInsert.get(2)?.a).assertEqual(200);
      expect(listInsert.get(3)?.specialKey).assertEqual("key4");
    });

    /**
     * @tc.number    SUB_LIST_TEST02_2800
     * @tc.name      testList02Chapter0028
     * @tc.desc      test add inherit object elements, verify return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList02Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList02Chapter0028';
      console.log(TAG + ' start');

      const inheritObj1 = new InheritObject(10);
      const inheritObj2 = new InheritObject(20);
      const inheritObjList = [inheritObj1, inheritObj2];

      const listConstructor = new List<InheritObject>(inheritObjList);
      expect(listConstructor.size()).assertEqual(2);
      expect(listConstructor.get(0)?.parentProp).assertEqual(10);
      expect(listConstructor.get(1)?.parentProp).assertEqual(20);

      const listAdd = new List<InheritObject>();
      const result1 = listAdd.add(inheritObj1);
      const result2 = listAdd.add(inheritObj2);
      expect(result1).assertTrue();
      expect(result2).assertTrue();

      expect(listAdd.size()).assertEqual(2);
      expect(listAdd.get(0)?.parentProp).assertEqual(10);
      expect(listAdd.get(1)?.parentProp).assertEqual(20);

      const newInheritObj = new InheritObject(30);
      const listInsert = new List<InheritObject>([inheritObj1]);
      listInsert.insert(1, inheritObj2);
      listInsert.insert(0, newInheritObj);
      listInsert.insert(5, new InheritObject(40));

      expect(listInsert.size()).assertEqual(4);
      expect(listInsert.get(0)?.parentProp).assertEqual(30);
      expect(listInsert.get(2)?.parentProp).assertEqual(20);
      expect(listInsert.get(3)?.parentProp).assertEqual(40);
    });

    /**
     * @tc.number    SUB_LIST_TEST02_2900
     * @tc.name      testList02Chapter0029
     * @tc.desc      test add new key object elements, verify return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList02Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList02Chapter0029';
      console.log(TAG + ' start');

      const newKeyObj1 = new NewKeyObject("key1");
      const newKeyObj2 = new NewKeyObject("key2");
      const newKeyObj3 = new NewKeyObject("key3");
      const newKeyObjList = [newKeyObj1, newKeyObj2, newKeyObj3];

      const listConstructor = new List<NewKeyObject>(newKeyObjList);
      expect(listConstructor.size()).assertEqual(3);
      expect(listConstructor.get(0)?.newKey).assertEqual("key1");
      expect(listConstructor.get(1)?.newKey).assertEqual("key2");
      expect(listConstructor.get(2)?.newKey).assertEqual("key3");

      const listAdd = new List<NewKeyObject>();
      const result1 = listAdd.add(newKeyObj1);
      const result2 = listAdd.add(newKeyObj2);
      const result3 = listAdd.add(newKeyObj3);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();

      expect(listAdd.size()).assertEqual(3);
      expect(listAdd.get(0)?.newKey).assertEqual("key1");
      expect(listAdd.get(1)?.newKey).assertEqual("key2");
      expect(listAdd.get(2)?.newKey).assertEqual("key3");

      const newKeyObj4 = new NewKeyObject("key4");
      const listInsert = new List<NewKeyObject>([newKeyObj1]);
      listInsert.insert(1, newKeyObj2);
      listInsert.insert(0, newKeyObj4);
      listInsert.insert(5, new NewKeyObject("key5"));

      expect(listInsert.size()).assertEqual(4);
      expect(listInsert.get(0)?.newKey).assertEqual("key4");
      expect(listInsert.get(2)?.newKey).assertEqual("key2");
      expect(listInsert.get(3)?.newKey).assertEqual("key5");
    });

    /**
     * @tc.number    SUB_LIST_TEST02_3000
     * @tc.name      testList02Chapter0030
     * @tc.desc      test add buffer object elements, verify return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList02Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList02Chapter0030';
      console.log(TAG + ' start');

      const arrayBuffer = new ArrayBuffer(8);
      const uint8Array = new Uint8Array([1, 2, 3]);
      const int16Array = new Int16Array([10, 20]);
      const bufferObj1 = new BufferObject(arrayBuffer);
      const bufferObj2 = new BufferObject(uint8Array);
      const bufferObj3 = new BufferObject(int16Array);
      const bufferObjList = [bufferObj1, bufferObj2, bufferObj3];

      const listConstructor = new List<BufferObject>(bufferObjList);
      expect(listConstructor.size()).assertEqual(3);
      expect(listConstructor.get(0)?.buffer).assertDeepEquals(arrayBuffer);
      expect(listConstructor.get(1)?.buffer).assertDeepEquals(uint8Array);
      expect(listConstructor.get(2)?.buffer).assertDeepEquals(int16Array);

      const listAdd = new List<BufferObject>();
      const result1 = listAdd.add(bufferObj1);
      const result2 = listAdd.add(bufferObj2);
      const result3 = listAdd.add(bufferObj3);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();

      expect(listAdd.size()).assertEqual(3);
      expect(listAdd.get(0)?.buffer).assertDeepEquals(arrayBuffer);
      expect(listAdd.get(1)?.buffer).assertDeepEquals(uint8Array);
      expect(listAdd.get(2)?.buffer).assertDeepEquals(int16Array);


      const newBuffer = new ArrayBuffer(16);
      const newBufferObj = new BufferObject(newBuffer);
      const listInsert = new List<BufferObject>([bufferObj1]);
      listInsert.insert(1, bufferObj2);
      listInsert.insert(0, newBufferObj);
      listInsert.insert(5, new BufferObject(new Uint8Array([4, 5, 6])));

      expect(listInsert.size()).assertEqual(4);
      expect(listInsert.get(0)?.buffer).assertDeepEquals(newBuffer);
      expect(listInsert.get(2)?.buffer).assertDeepEquals(uint8Array);
      expect(listInsert.get(3)?.buffer).assertDeepEquals(new Uint8Array([4, 5, 6]));
    });

    /**
     * @tc.number    SUB_LIST_TEST02_3100
     * @tc.name      testList02Chapter0031
     * @tc.desc      test add data view object elements, verify return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList02Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList02Chapter0031';
      console.log(TAG + ' start');

      const buffer1 = new ArrayBuffer(16);
      const dataView1 = new DataView(buffer1);
      dataView1.setInt32(0, 12345);
      const dataViewObj1 = new DataViewObject(dataView1);

      const buffer2 = new ArrayBuffer(8);
      const dataView2 = new DataView(buffer2);
      dataView2.setFloat64(0, 67.89);
      const dataViewObj2 = new DataViewObject(dataView2);

      const dataViewObjList = [dataViewObj1, dataViewObj2];
      const listConstructor = new List<DataViewObject>(dataViewObjList);
      expect(listConstructor.size()).assertEqual(2);
      expect(listConstructor.get(0)?.view.getInt32(0)).assertEqual(12345);
      expect(listConstructor.get(1)?.view.getFloat64(0)).assertEqual(67.89);

      const listAdd = new List<DataViewObject>();
      const result1 = listAdd.add(dataViewObj1);
      const result2 = listAdd.add(dataViewObj2);
      expect(result1).assertTrue();
      expect(result2).assertTrue();

      expect(listAdd.size()).assertEqual(2);
      expect(listAdd.get(0)?.view.getInt32(0)).assertEqual(12345);
      expect(listAdd.get(1)?.view.getFloat64(0)).assertEqual(67.89);

      const buffer3 = new ArrayBuffer(4);
      const dataView3 = new DataView(buffer3);
      dataView3.setUint8(0, 255);
      const newDataViewObj = new DataViewObject(dataView3);
      const listInsert = new List<DataViewObject>([dataViewObj1]);
      listInsert.insert(1, dataViewObj2);
      listInsert.insert(0, newDataViewObj);
      listInsert.insert(5, new DataViewObject(new DataView(new ArrayBuffer(0))));

      expect(listInsert.size()).assertEqual(4);
      expect(listInsert.get(0)?.view.getUint8(0)).assertEqual(255);
      expect(listInsert.get(2)?.view.getFloat64(0)).assertEqual(67.89);
    });

    /**
     * @tc.number    SUB_LIST_TEST02_3200
     * @tc.name      testList02Chapter0032
     * @tc.desc      test add map object elements, verify return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList02Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList02Chapter0032';
      console.log(TAG + ' start');

      const nestedLevel2 = new NestedLevel2(5, new NestedLevel3(10));
      const mapEntries1: [string, string | NestedLevel2][] = [
        ["key1", "value1"],
        ["key2", nestedLevel2]
      ];
      const mapEntries2: [string, string | NestedLevel2][] = [
        ["key3", "value3"],
        ["key4", new NestedLevel2(15, new NestedLevel3(20))]
      ];
      const mapObj1 = new MapObject(mapEntries1);
      const mapObj2 = new MapObject(mapEntries2);
      const mapObjList = [mapObj1, mapObj2];

      const listConstructor = new List<MapObject>(mapObjList);
      expect(listConstructor.size()).assertEqual(2);
      expect(listConstructor.get(0)?.map.get("key1")).assertEqual("value1");
      expect(listConstructor.get(0)?.map.get("key2") as NestedLevel2).assertDeepEquals(nestedLevel2);
      expect((listConstructor.get(0)?.map.get("key2") as NestedLevel2).c).assertEqual(5);
      expect((listConstructor.get(1)?.map.get("key4") as NestedLevel2).c).assertEqual(15);

      const listAdd = new List<MapObject>();
      const result1 = listAdd.add(mapObj1);
      const result2 = listAdd.add(mapObj2);
      expect(result1).assertTrue();
      expect(result2).assertTrue();

      expect(listAdd.size()).assertEqual(2);
      expect((listAdd.get(0)?.map.get("key2") as NestedLevel2).d.e).assertEqual(10);
      expect(listAdd.get(1)?.map.get("key3")).assertEqual("value3");

      const newMapEntries: [string, string | NestedLevel2][] = [["key5", "value5"]];
      const newMapObj = new MapObject(newMapEntries);
      const listInsert = new List<MapObject>([mapObj1]);
      listInsert.insert(1, mapObj2);
      listInsert.insert(0, newMapObj);
      listInsert.insert(5, new MapObject([]));

      expect(listInsert.size()).assertEqual(4);
      expect(listInsert.get(0)?.map.get("key5")).assertEqual("value5");
      expect((listInsert.get(2)?.map.get("key4") as NestedLevel2).d.e).assertEqual(20);
    });
  })
}