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
  replaceAllElements(
    callbackFn: (value: T, index?: number, list?: List<T>, thisArg?: Object) => T,
    thisArg?: Object
  ): void {
    this.data = this.data.map<T>((value: T, index: number): T => {
      return callbackFn(value, index, this, thisArg);
    });
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
  remove(index: number): T | undefined {
    if (index < 0 || index >= this.data.length) {
      return undefined;
    }
    return this.data.splice(index, 1)[0];
  }
  getLastIndexOf(element: T): number {
    for (let i = this.data.length - 1; i >= 0; i--) {
      if (this.data[i] === element) {
        return i;
      }
    }
    return -1;
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

class NormalObject {
  a: number = 0;
  b: string = "";
  constructor(a: number, b: string) {
    this.a = a;
    this.b = b;
  }
}

class EmptyObject {}
class SpecialValueObject {
  value: number | undefined | null = 0;
  constructor(value: number | undefined | null) {
    this.value = value;
  }
}

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ListTest06() {
  describe('ListTest06', () => {
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
     * @tc.number    SUB_LIST_TEXT06_0100
     * @tc.name      testList06Chapter0001
     * @tc.desc      Test get interface with boundary values & empty list & repeat add
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList06Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList06Chapter0001';
      console.log(TAG + ' start');
      const emptyList = new List<number>();
      expect(emptyList.get(0)).assertUndefined();
      expect(emptyList.size()).assertEqual(0);

      const repeatValues = [1, 1, 1, null, null, undefined, undefined];
      const repeatList = new List<number | null | undefined>();
      repeatValues.forEach(value => repeatList.add(value));

      expect(repeatList.get(0)).assertEqual(1);
      expect(repeatList.get(3)).assertNull();
      expect(repeatList.get(5)).assertUndefined();

      const bigCountList = new List<number>();
      const bigCountArr: number[] = [];
      for (let i = 0; i < 1000; i++) {
        bigCountArr.push(i);
      }
      bigCountArr.forEach(value => bigCountList.add(value));

      expect(bigCountList.get(999)).assertEqual(999);
      bigCountList.clear();
      expect(bigCountList.get(0)).assertUndefined();
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_0200
     * @tc.name      testList06Chapter0002
     * @tc.desc      Test get interface with nested List object & multi-type nested data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList06Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList06Chapter0002';
      console.log(TAG + ' start');
      const numList = new List<number>();
      [1,2,3,4,5].forEach(value => numList.add(value));

      const nestedList = new List<List<number>>();
      nestedList.add(numList);

      expect(nestedList.get(0)!.get(2)).assertEqual(3);
      expect(nestedList.get(0)!.size()).assertEqual(5);

      const strList = new List<string>();
      ["a", "b", "c"].forEach(value => strList.add(value));

      const mixList = new List<List<number> | List<string>>();
      mixList.add(numList);
      mixList.add(strList);

      expect((mixList.get(0) as List<number>).get(1)).assertEqual(2);
      expect((mixList.get(1) as List<string>).get(1)).assertEqual("b");
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_0300
     * @tc.name      testList06Chapter0003
     * @tc.desc      Verify the functional correctness of the getLastIndexOf interface of the List container in array
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList06Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList06Chapter0003';
      console.log(TAG + ' start');

      const normalUint8Arr: Uint8Array = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63
      ]);

      const zeroArr: number[] = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];

      const list: List<TestArray> = new List<TestArray>();
      list.add(normalUint8Arr);
      list.add(zeroArr);
      list.add(normalUint8Arr);
      expect(list.length).assertEqual(3);

      const lastIndexNormal: number = list.getLastIndexOf(normalUint8Arr);
      expect(lastIndexNormal).assertEqual(2);

      const lastIndexZero: number = list.getLastIndexOf(zeroArr);
      expect(lastIndexZero).assertEqual(1);

      const nonExistentArr: Uint8Array = new Uint8Array([1, 2, 3]);
      const invalidIndex: number = list.getLastIndexOf(nonExistentArr);
      expect(invalidIndex).assertEqual(-1);

      const itemNormal: Uint8Array = list.get(lastIndexNormal) as Uint8Array;
      expect(itemNormal.length).assertEqual(14);
      expect(itemNormal[0]).assertEqual(72);
      expect(itemNormal[13]).assertEqual(63);

      const itemZero: number[] = list.get(lastIndexZero) as number[];
      expect(itemZero.length).assertEqual(19);
      expect(itemZero[9]).assertEqual(0);
      expect(itemZero[13]).assertEqual(0);
      expect(itemZero[18]).assertEqual(63);
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_0400
     * @tc.name      testList06Chapter0004
     * @tc.desc      Verify getLastIndexOf() for negative/non-numeric index arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList06Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ():
      Promise<void> => {
      const TAG = 'testList06Chapter0004';
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
      list.add(int8NegArr);

      expect(list.length).assertEqual(4);

      const lastIndexInt8: number = list.getLastIndexOf(int8NegArr);
      expect(lastIndexInt8).assertEqual(3);

      const lastIndexUint8: number = list.getLastIndexOf(uint8NegArr);
      expect(lastIndexUint8).assertEqual(0);
      const lastIndexNumeric: number = list.getLastIndexOf(numericArr);
      expect(lastIndexNumeric).assertEqual(2);

      const itemUint8: Uint8Array = list.get(lastIndexUint8) as Uint8Array;
      expect(itemUint8[6]).assertEqual(145);
      expect(itemUint8[10]).assertEqual(207);

      const itemInt8: Int8Array = list.get(lastIndexInt8) as Int8Array;
      expect(itemInt8[6]).assertEqual(-111);
      expect(itemInt8[10]).assertEqual(-49);

      const itemNumeric: number[] = list.get(lastIndexNumeric) as number[];
      expect(itemNumeric[0]).assertEqual(333);

      expect(nonNumericMap.get("abc")).assertEqual(111);
      expect(nonNumericMap.get("aaa")).assertEqual(222);
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_0500
     * @tc.name      testList06Chapter0005
     * @tc.desc      Verify getLastIndexOf() for NaN/Infinity/non-numeric type arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList06Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ():
      Promise<void> => {
      const TAG = 'testList06Chapter0005';
      console.log(TAG + ' start');
      const specialValueArr: number[] = [72, 101, NaN, Infinity, -Infinity, 108, 111];
      const nonNumericTypeArr: (number | string | boolean | null | undefined)[] = [72, "abc", true, null, undefined, 108
      ];
      const list: List<number[] | (number | string | boolean | null | undefined)[]> = new List<number[] |
      (number | string | boolean | null | undefined)[]>();
      list.add(specialValueArr);
      list.add(nonNumericTypeArr);
      list.add(specialValueArr);

      expect(list.length).assertEqual(3);
      const lastIndexSpecial: number = list.getLastIndexOf(specialValueArr);
      expect(lastIndexSpecial).assertEqual(2);
      const lastIndexNonNumeric: number = list.getLastIndexOf(nonNumericTypeArr);
      expect(lastIndexNonNumeric).assertEqual(1);
      const itemSpecial: number[] = list.get(lastIndexSpecial) as number[];
      expect(itemSpecial[0]).assertEqual(72);
      expect(isNaN(itemSpecial[2])).assertTrue();
      expect(itemSpecial[3]).assertEqual(Infinity);
      expect(itemSpecial[4]).assertEqual(-Infinity);

      const itemNonNumeric: (number | string | boolean | null | undefined)[] =
        list.get(lastIndexNonNumeric) as (number | string | boolean | null | undefined)[];
      expect(itemNonNumeric[1]).assertEqual("abc");
      expect(itemNonNumeric[2]).assertEqual(true);
      expect(itemNonNumeric[3]).assertEqual(null);
      expect(itemNonNumeric[4]).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_0600
     * @tc.name      testList06Chapter0006
     * @tc.desc      Verify getLastIndexOf() for empty/overflow/deleted element arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList06Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ():
      Promise<void> => {
      const TAG = 'testList06Chapter0006';
      console.log(TAG + ' start');

      const emptyArr: number[] = [];
      const overflowArr: number[] = [256, 65536, 32768];
      const deletedArr: number[] = [1, 2, 3];
      deletedArr.splice(1, 1);

      const list: List<number[]> = new List<number[]>();
      list.add(emptyArr);
      list.add(overflowArr);
      list.add(deletedArr);
      list.add(emptyArr);
      expect(list.length).assertEqual(4);

      const lastIndexEmpty: number = list.getLastIndexOf(emptyArr);
      expect(lastIndexEmpty).assertEqual(3);

      const lastIndexOverflow: number = list.getLastIndexOf(overflowArr);
      expect(lastIndexOverflow).assertEqual(1);
      const lastIndexDeleted: number = list.getLastIndexOf(deletedArr);
      expect(lastIndexDeleted).assertEqual(2);
      const itemEmpty: number[] = list.get(lastIndexEmpty) as number[];
      expect(itemEmpty.length).assertEqual(0);

      const itemOverflow: number[] = list.get(lastIndexOverflow) as number[];
      expect(itemOverflow[0]).assertEqual(256);
      expect(itemOverflow[1]).assertEqual(65536);
      expect(itemOverflow[2]).assertEqual(32768);

      const itemDeleted: number[] = list.get(lastIndexDeleted) as number[];
      expect(itemDeleted.length).assertEqual(2);
      expect(itemDeleted[0]).assertEqual(1);
      expect(itemDeleted[1]).assertEqual(3);
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_0700
     * @tc.name      testList06Chapter0007
     * @tc.desc      Verify getLastIndexOf() for nested/TypedArray/ultra-long arrays
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList06Chapter0007", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async ():
      Promise<void> => {
      const TAG = 'testList06Chapter0007';
      console.log(TAG + ' start');

      const level3Arr: number[] = [5, 6];
      const level2Arr1: number[] = [2, 3];
      const level2Arr2: (number | number[])[] = [4, level3Arr];
      const nestedArr: (number | number[] | (number | number[])[])[] = [1, level2Arr1, level2Arr2];

      const typedSubArr: TypedArray[] = [new Int32Array([10, 20]), new Float64Array([3.14, 6.28])];

      const largeArr: number[] = new Array(1000000).fill(1);

      const nestedList: List<(number | number[] | (number | number[])[])[]> = new List<(number | number[] | (number
        | number[])[])[]>();
      nestedList.add(nestedArr);
      nestedList.add(nestedArr);
      expect(nestedList.length).assertEqual(2);

      const typedList: List<TypedArray[]> = new List<TypedArray[]>();
      typedList.add(typedSubArr);
      expect(typedList.length).assertEqual(1);

      const largeList: List<number[]> = new List<number[]>();
      largeList.add(largeArr);
      largeList.add(largeArr);
      expect(largeList.length).assertEqual(2);

      const lastIndexNested: number = nestedList.getLastIndexOf(nestedArr);
      expect(lastIndexNested).assertEqual(1);

      const lastIndexTyped: number = typedList.getLastIndexOf(typedSubArr);
      expect(lastIndexTyped).assertEqual(0);
      const lastIndexLarge: number = largeList.getLastIndexOf(largeArr);
      expect(lastIndexLarge).assertEqual(1);
      const itemNested: (number | number[] | (number | number[])[])[] = nestedList.get(lastIndexNested)!;
      expect(itemNested[0] as number).assertEqual(1);
      expect((itemNested[1] as number[])[1]).assertEqual(3);
      expect(((itemNested[2] as (number | number[])[])[1] as number[])[0]).assertEqual(5);

      const itemTyped: TypedArray[] = typedList.get(lastIndexTyped)!;
      expect((itemTyped[0] as Int32Array)[0]).assertEqual(10);
      expect((itemTyped[1] as Float64Array)[1]).assertClose(6.28, 0.01);

      const itemLarge: number[] = largeList.get(lastIndexLarge)!;
      expect(itemLarge.length).assertEqual(1000000);
      expect(itemLarge[0]).assertEqual(1);
      expect(itemLarge[999999]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_0800
     * @tc.name      testList06Chapter0008
     * @tc.desc      Verify getLastIndexOf() for function/keyword arrays (no Symbol)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList06Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testList06Chapter0008';
      console.log(TAG + ' start');

      type MixedElement = (() => string) | string;
      const func: () => string = () => "testResult";
      const mixedTypeArr: MixedElement[] = [func, "0", "NaN", ""];
      const list: List<MixedElement[]> = new List<MixedElement[]>();
      list.add(mixedTypeArr);
      list.add(mixedTypeArr);
      expect(list.length).assertEqual(2);
      const lastIndexMixed: number = list.getLastIndexOf(mixedTypeArr);
      expect(lastIndexMixed).assertEqual(1);
      const fakeArr: MixedElement[] = [() => "fake", "1"];
      const invalidIndex: number = list.getLastIndexOf(fakeArr);
      expect(invalidIndex).assertEqual(-1);

      const itemMixed: MixedElement[] = list.get(lastIndexMixed)!;
      expect((itemMixed[0] as () => string)()).assertEqual("testResult");
      expect(itemMixed[1] as string).assertEqual("0");
      expect(itemMixed[2] as string).assertEqual("NaN");
      expect(itemMixed[3] as string).assertEqual("");
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_0900
     * @tc.name      testList06Chapter0009
     * @tc.desc      Test getLastIndexOf with basic string values (undefined/null/empty/special chars/ASCII)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList06Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testList06Chapter0009';
      console.log(TAG + ' start');

      const undefinedStr: string = String(undefined);
      const list1: List<string> = new List<string>();
      list1.add(undefinedStr);
      expect(list1.length).assertEqual(1);
      expect(list1.get(0)).assertEqual('undefined');
      expect(list1.getLastIndexOf('undefined')).assertEqual(0);

      const nullStr: string = String(null);
      const list2: List<string> = new List<string>();
      list2.add(nullStr);
      expect(list2.length).assertEqual(1);
      expect(list2.get(0)).assertEqual('null');
      expect(list2.getLastIndexOf('null')).assertEqual(0);

      const emptyStr: string = '';
      const list3: List<string> = new List<string>();
      list3.add(emptyStr);
      expect(list3.length).assertEqual(1);
      expect(list3.get(0)).assertEqual('');
      expect(list3.getLastIndexOf('')).assertEqual(0);

      const specialCharStr1: string = '!"#$%';
      const list4: List<string> = new List<string>();
      list4.add(specialCharStr1);
      expect(list4.length).assertEqual(1);
      expect(list4.get(0)).assertEqual(specialCharStr1);
      expect(list4.getLastIndexOf(specialCharStr1)).assertEqual(0);

      let asciiStr: string = '';
      for (let i = 32; i <= 126; i++) {
        asciiStr += String.fromCharCode(i);
      }
      const list5: List<string> = new List<string>();
      list5.add(asciiStr);
      expect(list5.length).assertEqual(1);
      expect(list5.get(0)).assertEqual(asciiStr);
      expect(list5.getLastIndexOf(asciiStr)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_1000
     * @tc.name      testList06Chapter0010
     * @tc.desc      Test getLastIndexOf with extended special character strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList06Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testList06Chapter0010';
      console.log(TAG + ' start');

      const specialCharStr2: string = '&\'()*+';
      const list6: List<string> = new List<string>();
      list6.add(specialCharStr2);
      expect(list6.length).assertEqual(1);
      expect(list6.get(0)).assertEqual(specialCharStr2);
      expect(list6.getLastIndexOf(specialCharStr2)).assertEqual(0);

      const specialCharStr3: string = ',-./:;<=';
      const list7: List<string> = new List<string>();
      list7.add(specialCharStr3);
      expect(list7.length).assertEqual(1);
      expect(list7.get(0)).assertEqual(specialCharStr3);
      expect(list7.getLastIndexOf(specialCharStr3)).assertEqual(0);

      const specialCharStr4: string = '>?@[\\\\]^';
      const list8: List<string> = new List<string>();
      list8.add(specialCharStr4);
      expect(list8.length).assertEqual(1);
      expect(list8.get(0)).assertEqual(specialCharStr4);
      expect(list8.getLastIndexOf(specialCharStr4)).assertEqual(0);

      const specialCharStr5: string = '_`{|}~';
      const list9: List<string> = new List<string>();
      list9.add(specialCharStr5);
      expect(list9.length).assertEqual(1);
      expect(list9.get(0)).assertEqual(specialCharStr5);
      expect(list9.getLastIndexOf(specialCharStr5)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_1100
     * @tc.name      testList06Chapter0011
     * @tc.desc      Test getLastIndexOf with escape characters and null element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList06Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testList06Chapter0011';
      console.log(TAG + ' start');

      const escapeStrA: string = String.fromCharCode(7);
      const list10: List<string | null> = new List<string | null>();
      list10.add(null);
      expect(list10.length).assertEqual(1);
      const val10 = list10.get(0);
      expect(val10).assertNull();
      expect(escapeStrA.charCodeAt(0)).assertEqual(7)
      expect(list10.getLastIndexOf(escapeStrA)).assertEqual(-1);

      const escapeStrB: string = String.fromCharCode(8);
      const list11: List<string | null> = new List<string | null>();
      list11.add(null);
      expect(list11.length).assertEqual(1);
      const val11 = list11.get(0);
      expect(val11).assertNull();
      expect(escapeStrB.charCodeAt(0)).assertEqual(8);
      expect(list11.getLastIndexOf(escapeStrB)).assertEqual(-1);

      const escapeStrF: string = String.fromCharCode(12);
      const list12: List<string | null> = new List<string | null>();
      list12.add(null);
      expect(list12.length).assertEqual(1);
      const val12 = list12.get(0);
      expect(val12).assertNull();
      expect(escapeStrF.charCodeAt(0)).assertEqual(12);
      expect(list12.getLastIndexOf(escapeStrF)).assertEqual(-1);

      const escapeStrN: string = '\n';
      const list13: List<string | null> = new List<string | null>();
      list13.add(null);
      expect(list13.length).assertEqual(1);
      const val13 = list13.get(0);
      expect(val13).assertNull();
      expect(escapeStrN.charCodeAt(0)).assertEqual(10);
      expect(list13.getLastIndexOf(escapeStrN)).assertEqual(-1);

      const escapeStrR: string = '\r';
      const list14: List<string | null> = new List<string | null>();
      list14.add(null);
      expect(list14.length).assertEqual(1);
      const val14 = list14.get(0);
      expect(val14).assertNull();
      expect(escapeStrR.charCodeAt(0)).assertEqual(13);
      expect(list14.getLastIndexOf(escapeStrR)).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_1200
     * @tc.name      testList06Chapter0012
     * @tc.desc      Test getLastIndexOf with emoji strings and their Unicode values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList06Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList06Chapter0012';
      console.log(TAG + ' start');

      const emoji1: string = '👆';
      const emojiUnicode1: string = '\ud83d\udc46';
      const list15: List<string> = new List<string>();
      list15.add(emoji1);
      expect(list15.length).assertEqual(1);
      expect(list15.get(0)).assertEqual(emojiUnicode1);
      expect(list15.getLastIndexOf(emojiUnicode1)).assertEqual(0);

      const emoji2: string = '💯';
      const emojiUnicode2: string = '\ud83d\udcaf';
      const list16: List<string> = new List<string>();
      list16.add(emoji2);
      expect(list16.length).assertEqual(1);
      expect(list16.get(0)).assertEqual(emojiUnicode2);
      expect(list16.getLastIndexOf(emoji2)).assertEqual(0);

      const emoji3: string = '🎅';
      const emojiUnicode3: string = '\ud83c\udf85';
      const list17: List<string> = new List<string>();
      list17.add(emoji3);
      expect(list17.length).assertEqual(1);
      expect(list17.get(0)).assertEqual(emojiUnicode3);
      expect(list17.getLastIndexOf(emojiUnicode3)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_1300
     * @tc.name      testList06Chapter0013
     * @tc.desc      Test getLastIndexOf with basic number values (positive/negative/decimal)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testList06Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testList06Chapter0013';
      console.log(TAG + ' start');

      const num1: number = 0;
      const list18: List<number> = new List<number>();
      list18.add(num1);
      expect(list18.length).assertEqual(1);
      expect(list18.get(0)).assertEqual(0);
      expect(list18.getLastIndexOf(0)).assertEqual(0);

      const num2: number = 123;
      const list19: List<number> = new List<number>();
      list19.add(num2);
      expect(list19.length).assertEqual(1);
      expect(list19.get(0)).assertEqual(123);
      expect(list19.getLastIndexOf(123)).assertEqual(0);

      const num3: number = -456;
      const list20: List<number> = new List<number>();
      list20.add(num3);
      expect(list20.length).assertEqual(1);
      expect(list20.get(0)).assertEqual(-456);
      expect(list20.getLastIndexOf(-456)).assertEqual(0);

      const num4: number = 123.456;
      const list21: List<number> = new List<number>();
      list21.add(num4);
      expect(list21.length).assertEqual(1);
      expect(list21.get(0)).assertEqual(123.456);
      expect(list21.getLastIndexOf(123.456)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_1400
     * @tc.name      testList06Chapter0014
     * @tc.desc      Test getLastIndexOf with special number values (NaN/Infinity/-0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList06Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList06Chapter0014';
      console.log(TAG + ' start');

      const num5: number = NaN;
      const list22: List<number> = new List<number>();
      list22.add(num5);
      expect(list22.length).assertEqual(1);
      expect(isNaN(list22.get(0) ?? NaN)).assertTrue();
      expect(list22.getLastIndexOf(NaN)).assertEqual(-1);

      const num6: number = Infinity;
      const list23: List<number> = new List<number>();
      list23.add(num6);
      expect(list23.length).assertEqual(1);
      expect(list23.get(0)).assertEqual(Infinity);
      expect(list23.getLastIndexOf(Infinity)).assertEqual(0);

      const num7: number = -Infinity;
      const list24: List<number> = new List<number>();
      list24.add(num7);
      expect(list24.length).assertEqual(1);
      expect(list24.get(0)).assertEqual(-Infinity);
      expect(list24.getLastIndexOf(-Infinity)).assertEqual(0);

      const num8: number = -0;
      const list25: List<number> = new List<number>();
      list25.add(num8);
      expect(list25.length).assertEqual(1);
      expect(list25.get(0)).assertEqual(-0);
      expect(list25.getLastIndexOf(0)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_1500
     * @tc.name      testList06Chapter0015
     * @tc.desc      Test getLastIndexOf with extreme number values (MAX/MIN/SAFE_INTEGER)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList06Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList06Chapter0015';
      console.log(TAG + ' start');

      const num9: number = Number.MAX_VALUE;
      const list26: List<number> = new List<number>();
      list26.add(num9);
      expect(list26.length).assertEqual(1);
      expect(list26.get(0)).assertEqual(1.7976931348623157e+308);
      expect(list26.getLastIndexOf(Number.MAX_VALUE)).assertEqual(0);

      const num10: number = Number.MIN_VALUE;
      const list27: List<number> = new List<number>();
      list27.add(num10);
      expect(list27.length).assertEqual(1);
      expect(list27.get(0)).assertEqual(5e-324);
      expect(list27.getLastIndexOf(Number.MIN_VALUE)).assertEqual(0);

      const num11: number = Number.MAX_SAFE_INTEGER;
      const list28: List<number> = new List<number>();
      list28.add(num11);
      expect(list28.length).assertEqual(1);
      expect(list28.get(0)).assertEqual(9007199254740991);
      expect(list28.getLastIndexOf(Number.MAX_SAFE_INTEGER)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_1600
     * @tc.name      testList06Chapter0016
     * @tc.desc      Test getLastIndexOf with bigint values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList06Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList06Chapter0016';
      console.log(TAG + ' start');

      const bigInt1: bigint = 9007199254740991n;
      const list29: List<bigint> = new List<bigint>();
      list29.add(bigInt1);
      expect(list29.length).assertEqual(1);
      expect(list29.get(0)).assertEqual(9007199254740991n);
      expect(list29.getLastIndexOf(9007199254740991n)).assertEqual(0);

      const bigInt2: bigint = -9223372036854775808n;
      const list30: List<bigint> = new List<bigint>();
      list30.add(bigInt2);
      expect(list30.length).assertEqual(1);
      expect(list30.get(0)).assertEqual(-9223372036854775808n);
      expect(list30.getLastIndexOf(-9223372036854775808n)).assertEqual(0);

      const bigInt3: bigint = 18446744073709551615n;
      const list31: List<bigint> = new List<bigint>();
      list31.add(bigInt3);
      expect(list31.length).assertEqual(1);
      expect(list31.get(0)).assertEqual(18446744073709551615n);
      expect(list31.getLastIndexOf(18446744073709551615n)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_1700
     * @tc.name      testList06Chapter0017
     * @tc.desc      Test getLastIndexOf with boolean values (true/false)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList06Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testList06Chapter0017';
      console.log(TAG + ' start');

      const bool1: boolean = true;
      const list32: List<boolean> = new List<boolean>();
      list32.add(bool1);
      expect(list32.length).assertEqual(1);
      expect(list32.get(0)).assertEqual(true);
      expect(list32.getLastIndexOf(true)).assertEqual(0);

      const bool2: boolean = false;
      const list33: List<boolean> = new List<boolean>();
      list33.add(bool2);
      expect(list33.length).assertEqual(1);
      expect(list33.get(0)).assertEqual(false);
      expect(list33.getLastIndexOf(false)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_1800
     * @tc.name      testList06Chapter0018
     * @tc.desc      Test getLastIndexOf with false-like values (null/undefined/empty string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testList06Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testList06Chapter0018';
      console.log(TAG + ' start');

      const val1: null = null;
      const list34: List<null> = new List<null>();
      list34.add(val1);
      expect(list34.length).assertEqual(1);
      expect(list34.get(0)).assertEqual(null);
      expect(list34.getLastIndexOf(null)).assertEqual(0);

      const val2: undefined = undefined;
      const list35: List<undefined> = new List<undefined>();
      list35.add(val2);
      expect(list35.length).assertEqual(1);
      expect(list35.get(0)).assertEqual(undefined);
      expect(list35.getLastIndexOf(undefined)).assertEqual(0);

      const val3: string = "";
      const list36: List<string> = new List<string>();
      list36.add(val3);
      expect(list36.length).assertEqual(1);
      expect(list36.get(0)).assertEqual("");
      expect(list36.getLastIndexOf("")).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_1900
     * @tc.name      testList06Chapter0019
     * @tc.desc      Test getLastIndexOf with normal and empty objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList06Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList06Chapter0019';
      console.log(TAG + ' start');

      const obj1: NormalObject = new NormalObject(1, "test1");
      const list37: List<NormalObject> = new List<NormalObject>();
      list37.add(obj1);
      expect(list37.length).assertEqual(1);
      expect(list37.get(0)!.a).assertEqual(1);
      expect(list37.get(0)!.b).assertEqual("test1");
      expect(list37.getLastIndexOf(obj1)).assertEqual(0);

      const obj2: NormalObject = new NormalObject(2, "test2");
      const list38: List<NormalObject> = new List<NormalObject>();
      list38.add(obj2);
      expect(list38.length).assertEqual(1);
      expect(list38.get(0)!.a).assertEqual(2);
      expect(list38.getLastIndexOf(obj2)).assertEqual(0);
      expect(list38.getLastIndexOf(obj1)).assertEqual(-1);

      const emptyObj: EmptyObject = new EmptyObject();
      const list39: List<EmptyObject> = new List<EmptyObject>();
      list39.add(emptyObj);
      expect(list39.length).assertEqual(1);
      expect(list39.get(0) instanceof EmptyObject).assertTrue();
      expect(list39.getLastIndexOf(emptyObj)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_2000
     * @tc.name      testList06Chapter0020
     * @tc.desc      Test getLastIndexOf with objects containing special values (null/undefined/NaN)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList06Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList06Chapter0020';
      console.log(TAG + ' start');

      const specObj1: SpecialValueObject = new SpecialValueObject(null);
      const list40: List<SpecialValueObject> = new List<SpecialValueObject>();
      list40.add(specObj1);
      expect(list40.length).assertEqual(1);
      expect(list40.get(0)!.value).assertEqual(null);
      expect(list40.getLastIndexOf(specObj1)).assertEqual(0);

      const specObj2: SpecialValueObject = new SpecialValueObject(undefined);
      const list41: List<SpecialValueObject> = new List<SpecialValueObject>();
      list41.add(specObj2);
      expect(list41.length).assertEqual(1);
      expect(list41.get(0)!.value).assertEqual(undefined);
      expect(list41.getLastIndexOf(specObj2)).assertEqual(0);

      const specObj3: SpecialValueObject = new SpecialValueObject(NaN);
      const list42: List<SpecialValueObject> = new List<SpecialValueObject>();
      list42.add(specObj3);
      expect(list42.length).assertEqual(1);
      expect(isNaN(list42.get(0)!.value as number)).assertTrue();
      expect(list42.getLastIndexOf(specObj3)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_2100
     * @tc.name      testList06Chapter0021
     * @tc.desc      Test getLastIndexOf with repeated elements (string/number)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList06Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList06Chapter0021';
      console.log(TAG + ' start');

      const strVal: string = 'test';
      const list43: List<string> = new List<string>();
      list43.add(strVal);
      list43.add('other');
      list43.add(strVal);
      list43.add('another');
      list43.add(strVal);
      expect(list43.length).assertEqual(5);
      expect(list43.getLastIndexOf(strVal)).assertEqual(4);

      const numVal: number = 5;
      const list44: List<number> = new List<number>();
      list44.add(1);
      list44.add(numVal);
      list44.add(3);
      list44.add(numVal);
      list44.add(5);
      expect(list44.length).assertEqual(5);
      expect(list44.getLastIndexOf(numVal)).assertEqual(4);
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_2200
     * @tc.name      testList06Chapter0022
     * @tc.desc      Verify getIndexOf() for Uint8Array/multi-zero arrays (return -1 if not exist)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList06Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList06Chapter0022';
      console.log(TAG + ' start');

      const normalUint8Arr: Uint8Array = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63
      ]);
      const zeroArr: number[] = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];

      const list: List<TestArray> = new List<TestArray>();
      list.add(normalUint8Arr);
      list.add(zeroArr);

      expect(list.length).assertEqual(2);

      const index0: number = list.getIndexOf(normalUint8Arr);
      expect(index0).assertEqual(0);
      const index1: number = list.getIndexOf(zeroArr);
      expect(index1).assertEqual(1);

      const item0: Uint8Array = list.get(index0) as Uint8Array;
      expect(item0.length).assertEqual(14);
      expect(item0[0]).assertEqual(72);
      expect(item0[13]).assertEqual(63);

      const item1: number[] = list.get(index1) as number[];
      expect(item1.length).assertEqual(19);
      expect(item1[9]).assertEqual(0);
      expect(item1[13]).assertEqual(0);
      expect(item1[18]).assertEqual(63);

      const nonExistentArr: Uint8Array = new Uint8Array([1, 2, 3]);
      const invalidIndex: number = list.getIndexOf(nonExistentArr);
      expect(invalidIndex).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_2300
     * @tc.name      testList06Chapter0023
     * @tc.desc      Verify getIndexOf() for negative/non-numeric index arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList06Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ():
      Promise<void> => {
      const TAG = 'testList06Chapter0023';
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

      const indexUint8: number = list.getIndexOf(uint8NegArr);
      expect(indexUint8).assertEqual(0);
      const indexInt8: number = list.getIndexOf(int8NegArr);
      expect(indexInt8).assertEqual(1);
      const indexNumeric: number = list.getIndexOf(numericArr);
      expect(indexNumeric).assertEqual(2);

      const item0: Uint8Array = list.get(indexUint8) as Uint8Array;
      expect(item0[6]).assertEqual(145);
      expect(item0[10]).assertEqual(207);

      const item1: Int8Array = list.get(indexInt8) as Int8Array;
      expect(item1[6]).assertEqual(-111);
      expect(item1[10]).assertEqual(-49);

      const item2: number[] = list.get(indexNumeric) as number[];
      expect(item2.length).assertEqual(1);
      expect(item2[0]).assertEqual(333);

      expect(nonNumericMap.get("abc")).assertEqual(111);
      expect(nonNumericMap.get("aaa")).assertEqual(222);
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_2400
     * @tc.name      testList06Chapter0024
     * @tc.desc      Verify getIndexOf() for NaN/Infinity/non-numeric type arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList06Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testList06Chapter0024';
      console.log(TAG + ' start');

      const specialValueArr: number[] = [72, 101, NaN, Infinity, -Infinity, 108, 111];
      const nonNumericTypeArr: (number | string | boolean | null | undefined)[] = [72, "abc", true, null, undefined, 108
      ];

      const list: List<number[] | (number | string | boolean | null | undefined)[]> = new List<number[] | (number |
      string | boolean | null | undefined)[]>();
      list.add(specialValueArr);
      list.add(nonNumericTypeArr);

      expect(list.length).assertEqual(2);

      const indexSpecial: number = list.getIndexOf(specialValueArr);
      expect(indexSpecial).assertEqual(0);
      const indexNonNumeric: number = list.getIndexOf(nonNumericTypeArr);
      expect(indexNonNumeric).assertEqual(1);

      const item0: number[] = list.get(indexSpecial) as number[];
      expect(item0[0]).assertEqual(72);
      expect(isNaN(item0[2])).assertTrue();
      expect(item0[3]).assertEqual(Infinity);
      expect(item0[4]).assertEqual(-Infinity);

      const item1: (number | string | boolean | null | undefined)[] = list.get(indexNonNumeric) as (number | string
        | boolean | null | undefined)[];
      expect(item1[1]).assertEqual("abc");
      expect(item1[2]).assertEqual(true);
      expect(item1[3]).assertEqual(null);
      expect(item1[4]).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_2500
     * @tc.name      testList06Chapter0025
     * @tc.desc      Verify getIndexOf() for empty/overflow/deleted element arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList06Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testList06Chapter0025';
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

      const indexEmpty: number = list.getIndexOf(emptyArr);
      expect(indexEmpty).assertEqual(0);
      const indexOverflow: number = list.getIndexOf(overflowArr);
      expect(indexOverflow).assertEqual(1);
      const indexDeleted: number = list.getIndexOf(deletedArr);
      expect(indexDeleted).assertEqual(2);

      const item0: number[] = list.get(indexEmpty) as number[];
      expect(item0.length).assertEqual(0);

      const item1: number[] = list.get(indexOverflow) as number[];
      expect(item1[0]).assertEqual(256);
      expect(item1[1]).assertEqual(65536);
      expect(item1[2]).assertEqual(32768);

      const item2: number[] = list.get(indexDeleted) as number[];
      expect(item2.length).assertEqual(2);
      expect(item2[0]).assertEqual(1);
      expect(item2[1]).assertEqual(3);
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_2600
     * @tc.name      testList06Chapter0026
     * @tc.desc      Verify getIndexOf() for nested/TypedArray/ultra-long arrays
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("testList06Chapter0026", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async ():
      Promise<void> => {
      const TAG = 'testList06Chapter0026';
      console.log(TAG + ' start');

      const level3Arr: number[] = [5, 6];
      const level2Arr1: number[] = [2, 3];
      const level2Arr2: (number | number[])[] = [4, level3Arr];
      const nestedArr: (number | number[] | (number | number[])[])[] = [1, level2Arr1, level2Arr2];

      const typedSubArr: TypedArray[] = [new Int32Array([10, 20]), new Float64Array([3.14, 6.28])];
      const largeArr: number[] = new Array(1000000).fill(1);

      const nestedList: List<(number | number[] | (number | number[])[])[]> = new List<(number | number[] | (number
        | number[])[])[]>();
      nestedList.add(nestedArr);

      const typedList: List<TypedArray[]> = new List<TypedArray[]>();
      typedList.add(typedSubArr);

      const largeList: List<number[]> = new List<number[]>();
      largeList.add(largeArr);

      expect(nestedList.length).assertEqual(1);
      expect(typedList.length).assertEqual(1);
      expect(largeList.length).assertEqual(1);

      const indexNested: number = nestedList.getIndexOf(nestedArr);
      expect(indexNested).assertEqual(0);
      const indexTyped: number = typedList.getIndexOf(typedSubArr);
      expect(indexTyped).assertEqual(0);
      const indexLarge: number = largeList.getIndexOf(largeArr);
      expect(indexLarge).assertEqual(0);

      const item0 = nestedList.get(indexNested);
      if (item0) {
        expect((item0[0] as number)).assertEqual(1);
        expect(((item0[1] as number[])[1])).assertEqual(3);
        expect((((item0[2] as (number | number[])[])[1] as number[])[0])).assertEqual(5);
      }

      const item1 = typedList.get(indexTyped);
      if (item1) {
        expect(((item1[0] as Int32Array)[0])).assertEqual(10);
        expect(((item1[1] as Float64Array)[1])).assertClose(6.28, 0.01);
      }

      const item2 = largeList.get(indexLarge);
      if (item2) {
        expect(item2.length).assertEqual(1000000);
        expect(item2[0]).assertEqual(1);
        expect(item2[999999]).assertEqual(1);
      }
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_2700
     * @tc.name      testList06Chapter0027
     * @tc.desc      Verify getIndexOf() for function/keyword arrays (no Symbol)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList06Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ():
      Promise<void> => {
      const TAG = 'testList06Chapter0027';
      console.log(TAG + ' start');

      type MixedElement = (() => string) | string;
      const func: () => string = () => "testResult";
      const mixedTypeArr: MixedElement[] = [func, "0", "NaN", ""];

      const list: List<MixedElement[]> = new List<MixedElement[]>();
      list.add(mixedTypeArr);

      expect(list.length).assertEqual(1);

      const indexMixed: number = list.getIndexOf(mixedTypeArr);
      expect(indexMixed).assertEqual(0);

      const item0 = list.get(indexMixed);
      if (item0) {
        const funcElement = item0[0] as () => string;
        expect(funcElement()).assertEqual("testResult");
        expect(item0[1] as string).assertEqual("0");
        expect(item0[2] as string).assertEqual("NaN");
        expect(item0[3] as string).assertEqual("");}
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_2800
     * @tc.name      testList06Chapter0028
     * @tc.desc      Test getIndexOf interface with basic string values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList06Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList06Chapter0028';
      console.log(TAG + ' start');
      const undefinedStr: string = String(undefined);
      const nullStr: string = String(null);
      const list1: List<string> = new List<string>();
      list1.add(undefinedStr);
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
      expect(list1.getIndexOf('undefined')).assertEqual(0);
      expect(list2.getIndexOf('null')).assertEqual(0);
      expect(list3.getIndexOf('')).assertEqual(0);
      expect(list4.getIndexOf(specialCharStr1)).assertEqual(0);
      expect(list5.getIndexOf(asciiStr)).assertEqual(0);
      expect(list1.getIndexOf('test')).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_2900
     * @tc.name      testList06Chapter0029
     * @tc.desc      Test getIndexOf interface with special character strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList06Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList06Chapter0029';
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
      expect(list6.getIndexOf(specialCharStr2)).assertEqual(0);
      expect(list7.getIndexOf(specialCharStr3)).assertEqual(0);
      expect(list8.getIndexOf(specialCharStr4)).assertEqual(0);
      expect(list9.getIndexOf(specialCharStr5)).assertEqual(0);
      expect(list10.getIndexOf(specialCharStr6)).assertEqual(0);
      expect(list11.getIndexOf(specialCharStr7)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_3000
     * @tc.name      testList06Chapter0030
     * @tc.desc      Test getIndexOf interface with escape character strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList06Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList06Chapter0030';
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
      list16.add(escapeStrN);
      expect(list12.getIndexOf(doubleSpecialCharStr)).assertEqual(0);
      expect(list13.getIndexOf(escapeStrA)).assertEqual(0);
      expect(list14.getIndexOf(escapeStrB)).assertEqual(0);
      expect(list15.getIndexOf(escapeStrF)).assertEqual(0);
      expect(list16.getIndexOf(escapeStrN)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_3100
     * @tc.name      testList06Chapter0031
     * @tc.desc      Test getIndexOf interface with more escape character strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList06Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList06Chapter0031';
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
      expect(list17.getIndexOf(escapeStrR)).assertEqual(0);
      expect(list18.getIndexOf(escapeStrT)).assertEqual(0);
      expect(list19.getIndexOf(escapeStrV)).assertEqual(0);
      expect(list20.getIndexOf('\\')).assertEqual(0);
      expect(list21.getIndexOf('\'')).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_3200
     * @tc.name      testList06Chapter0032
     * @tc.desc      Test getIndexOf interface with hex/octal escape strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList06Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList06Chapter0032';
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
      expect(list22.getIndexOf('"')).assertEqual(0);
      expect(list23.getIndexOf('?')).assertEqual(0);
      expect(list24.getIndexOf(escapeStrNull)).assertEqual(0);
      expect(list25.getIndexOf('a')).assertEqual(0);
      expect(list26.getIndexOf('a')).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_3300
     * @tc.name      testList06Chapter0033
     * @tc.desc      Test getIndexOf interface with emoji strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList06Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList06Chapter0033';
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
      expect(list27.getIndexOf(emojiUnicode1)).assertEqual(0);
      expect(list28.getIndexOf(emojiUnicode2)).assertEqual(0);
      expect(list29.getIndexOf(emojiUnicode3)).assertEqual(0);
      expect(list30.getIndexOf(emojiUnicode4)).assertEqual(0);
      expect(list31.getIndexOf(emojiUnicode5)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_3400
     * @tc.name      testList06Chapter0034
     * @tc.desc      Test getIndexOf interface with special unicode strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList06Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList06Chapter0034';
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
      expect(list32.getIndexOf(emoji6)).assertEqual(0);
      expect(list33.getIndexOf(emoji7)).assertEqual(0);
      expect(list34.getIndexOf(invalidUnicodeStr)).assertEqual(0);
      expect(list35_1.getIndexOf(keywordStr1)).assertEqual(0);
      expect(list35_2.getIndexOf(keywordStr2)).assertEqual(0);
      expect(list35_3.getIndexOf(keywordStr3)).assertEqual(0);
      expect(list36.getIndexOf(treeStr)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_3500
     * @tc.name      testList06Chapter0035
     * @tc.desc      Test getIndexOf interface with large strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList06Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList06Chapter0035';
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
      expect(list38.getIndexOf('a')).assertEqual(0);
      const gcTestStrPlaceholder = 'a';
      const list39: List<string> = new List<string>();
      list39.add(gcTestStrPlaceholder);
      expect(list39.getIndexOf('a')).assertEqual(0);
      list39.clear();
      expect(list39.getIndexOf('a')).assertEqual(-1);
      expect(list37.getIndexOf(result)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_3600
     * @tc.name      testList06Chapter0036
     * @tc.desc      Test getIndexOf interface with special number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList06Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList06Chapter0036';
      console.log(TAG + ' start');
      const basicValues = [0, NaN, -0, Infinity, -Infinity, undefined] as (number | undefined)[];
      const listConstructor = new List<number | undefined>();
      basicValues.forEach(value => listConstructor.add(value));

      expect(listConstructor.getIndexOf(0)).assertEqual(0);
      expect(listConstructor.getIndexOf(NaN)).assertEqual(1);
      expect(listConstructor.getIndexOf(-0)).assertEqual(2);
      expect(listConstructor.getIndexOf(Infinity)).assertEqual(3);
      expect(listConstructor.getIndexOf(-Infinity)).assertEqual(4);
      expect(listConstructor.getIndexOf(undefined)).assertEqual(5);
      expect(listConstructor.getIndexOf(100)).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_3700
     * @tc.name      testList06Chapter0037
     * @tc.desc      Test getIndexOf interface with extreme number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList06Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList06Chapter0037';
      console.log(TAG + ' start');
      const extremeValues = [
        Number.MAX_VALUE,
        Number.MIN_VALUE,
        Number.EPSILON,
        Number.MAX_SAFE_INTEGER
      ];
      const listConstructor = new List<number>();
      extremeValues.forEach(value => listConstructor.add(value));

      expect(listConstructor.getIndexOf(1.7976931348623157e+308)).assertEqual(0);
      expect(listConstructor.getIndexOf(5e-324)).assertEqual(1);
      expect(listConstructor.getIndexOf(2.220446049250313e-16)).assertEqual(2);
      expect(listConstructor.getIndexOf(9007199254740991)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_LIST_TEXT06_3800
     * @tc.name      testList06Chapter0038
     * @tc.desc      Test getIndexOf interface with precision number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList06Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList06Chapter0038';
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

      expect(listByte.getIndexOf(-128)).assertEqual(0);
      expect(listByte.getIndexOf(-129)).assertEqual(2);
      const listChar = new List<number>();
      precisionValues.char.forEach(value => listChar.add(value));

      expect(listChar.getIndexOf(65)).assertEqual(2);
      expect(listChar.getIndexOf(97)).assertEqual(3);
      const listLong = new List<bigint>();
      precisionValues.long.forEach(value => listLong.add(value));

      expect(listLong.getIndexOf(-9223372036854775808n)).assertEqual(0);
      expect(listLong.getIndexOf(9223372036854775807n)).assertEqual(1);
    });
  })
}