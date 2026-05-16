import { describe, beforeAll, beforeEach, afterEach, afterAll, it, TestType, Size, Level, expect } from '@ohos/hypium';
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
    const threshold = 10000;
    if (this.data.length % threshold === 0 && this.data.length !== 0) {
      this.data.length = this.data.length + threshold;
    }
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

  getFirst(): T | undefined {
    return this.data.length > 0 ? this.data[0] : undefined;
  }

  removeByIndex(index: number): T | undefined {
    if (index < 0 || index >= this.data.length) {
      return undefined;
    }
    return this.data.splice(index, 1)[0];
  }

  convertToArray(): Array<T> {
    const len = this.data.length;
    const arr = new Array<T>(len);
    let i = 0;
    while (i < len) {
      arr[i] = this.data[i];
      i++;
    }
    return arr;
  }

  set(index: number, element: T): T | undefined {
    if (index < 0 || index >= this.data.length) {
      return undefined;
    }
    const oldValue = this.data[index];
    this.data[index] = element;
    return oldValue;
  }

  replaceAllElements(callback: (value: T) => T): void {
    const len = this.data.length;
    let i = 0;
    while (i < len) {
      this.data[i] = callback(this.data[i]);
      i++;
    }
  }

  getSubList(fromIndex: number, toIndex: number): List<T> {
    const subData = this.data.slice(fromIndex, toIndex);
    const subList = new List<T>();
    subData.forEach(item => subList.add(item));
    return subList;
  }

  remove(index: number): T | undefined;
  remove(item: T): boolean;

  remove(arg: number | T): T | undefined | boolean {
    if (typeof arg === 'number') {
      const index = arg;
      if (index < 0 || index >= this.data.length) {
        return undefined;
      }
      return this.data.splice(index, 1)[0];
    } else {
      const item = arg;
      const findIndex = this.data.findIndex(i => i === item);
      if (findIndex === -1) {
        return false;
      }
      this.data.splice(findIndex, 1);
      return true;
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
class EmptyObject {}

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ListTest15() {
  describe('ListTest15', () => {
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
     * @tc.number    SUB_LIST_TEXT15_0100
     * @tc.name      testList15Chapter0001
     * @tc.desc      Verify isEmpty() with negative/typed/non-numeric index arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList15Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList15Chapter0001';
      console.log(TAG + ' start');

      const negativeArr: number[] = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      const uint8NegArr: Uint8Array = new Uint8Array(negativeArr);
      const int8NegArr: Int8Array = new Int8Array(negativeArr);

      const nonNumericMap: Map<string, number> = new Map<string, number>();
      nonNumericMap.set("abc", 111);
      nonNumericMap.set("aaa", 222);
      const numericArr: number[] = [333];

      const list: List<TypedArray | number[]> = new List<TypedArray | number[]>();
      expect(list.isEmpty()).assertTrue();
      list.add(uint8NegArr);
      list.add(int8NegArr);
      list.add(numericArr);

      expect(list.isEmpty()).assertFalse();
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
     * @tc.number    SUB_LIST_TEXT15_0200
     * @tc.name      testList15Chapter0002
     * @tc.desc      Verify isEmpty() with NaN/Infinity/mixed type value arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList15Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList15Chapter0002';
      console.log(TAG + ' start');

      const specialValueArr: number[] = [72, 101, NaN, Infinity, -Infinity, 108, 111];
      const nonNumericTypeArr: (number | string | boolean | null | undefined)[] =
        [72, "abc", true, null, undefined, 108];

      const list: List<number[] | (number | string | boolean | null | undefined)[]> =
        new List<number[] | (number | string | boolean | null | undefined)[]>();
      expect(list.isEmpty()).assertTrue();

      list.add(specialValueArr);
      list.add(nonNumericTypeArr);
      expect(list.isEmpty()).assertFalse();
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
     * @tc.number    SUB_LIST_TEXT15_0300
     * @tc.name      testList15Chapter0003
     * @tc.desc      Verify isEmpty() with empty/overflow/deleted element arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList15Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList15Chapter0003';
      console.log(TAG + ' start');
      const emptyArr: number[] = [];
      const overflowArr: number[] = [256, 65536, 32768];
      const deletedArr: number[] = [1, 2, 3];
      deletedArr.splice(1, 1);
      const list: List<number[]> = new List<number[]>();
      expect(list.isEmpty()).assertTrue();

      list.add(emptyArr);
      list.add(overflowArr);
      list.add(deletedArr);

      expect(list.isEmpty()).assertFalse();
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
     * @tc.number    SUB_LIST_TEXT15_0400
     * @tc.name      testList15Chapter0004
     * @tc.desc      Verify isEmpty() with nested/typed/large length arrays
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testList15Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList15Chapter0004';
      console.log(TAG + ' start');

      const level3Arr: number[] = [5, 6];
      const level2Arr1: number[] = [2, 3];
      const level2Arr2: (number | number[])[] = [4, level3Arr];
      const nestedArr: (number | number[] | (number | number[])[])[] = [1, level2Arr1, level2Arr2];

      const typedSubArr: TypedArray[] = [new Int32Array([10, 20]), new Float64Array([3.14, 6.28])];

      const largeArr: number[] = new Array(1000000).fill(1);

      const nestedList: List<(number | number[] | (number | number[])[])[]> =
        new List<(number | number[] | (number | number[])[])[]>();
      expect(nestedList.isEmpty()).assertTrue();
      nestedList.add(nestedArr);
      expect(nestedList.isEmpty()).assertFalse();

      const typedList: List<TypedArray[]> = new List<TypedArray[]>();
      expect(typedList.isEmpty()).assertTrue();
      typedList.add(typedSubArr);
      expect(typedList.isEmpty()).assertFalse();

      const largeList: List<number[]> = new List<number[]>();
      expect(largeList.isEmpty()).assertTrue();
      largeList.add(largeArr);
      expect(largeList.isEmpty()).assertFalse();

      expect(nestedList.length).assertEqual(1);
      expect(typedList.length).assertEqual(1);
      expect(largeList.length).assertEqual(1);

      const item0: (number | number[] | (number | number[])[])[] = nestedList.get(0)!;
      expect(item0[0] as number).assertEqual(1);
      expect((item0[1] as number[])[1]).assertEqual(3);
      expect(((item0[2] as (number | number[])[])[1] as number[])[0]).assertEqual(5);

      const item1: TypedArray[] = typedList.get(0)!;
      expect((item1[0] as Int32Array)[0]).assertEqual(10);
      expect((item1[1] as Float64Array)[1]).assertClose(6.28, 0.01);

      const item2: number[] = largeList.get(0)!;
      expect(item2.length).assertEqual(1000000);
      expect(item2[0]).assertEqual(1);
      expect(item2[999999]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_LIST_TEXT15_0500
     * @tc.name      testList15Chapter0005
     * @tc.desc      Verify isEmpty() with function/keyword string mixed arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList15Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList15Chapter0005';
      console.log(TAG + ' start');
      type MixedElement = (() => string) | string;
      const func: () => string = () => "testResult";
      const mixedTypeArr: MixedElement[] = [func, "0", "NaN", ""];
      const list: List<MixedElement[]> = new List<MixedElement[]>();
      expect(list.isEmpty()).assertTrue();

      list.add(mixedTypeArr);

      expect(list.isEmpty()).assertFalse();
      expect(list.length).assertEqual(1);

      const item0: MixedElement[] = list.get(0)!;
      expect((item0[0] as () => string)()).assertEqual("testResult");
      expect(item0[1] as string).assertEqual("0");
      expect(item0[2] as string).assertEqual("NaN");
      expect(item0[3] as string).assertEqual("");
    });

    /**
     * @tc.number    SUB_LIST_TEXT15_0600
     * @tc.name      testList15Chapter0006
     * @tc.desc      Verify isEmpty() for empty constructed List of basic types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testList15Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList15Chapter0006';
      console.log(TAG + ' start');
      const list1: List<string> = new List<string>();
      const list2: List<number> = new List<number>();
      const list3: List<boolean> = new List<boolean>();
      const list4: List<Object> = new List<Object>();
      expect(list1.isEmpty()).assertTrue();
      expect(list2.isEmpty()).assertTrue();
      expect(list3.isEmpty()).assertTrue();
      expect(list4.isEmpty()).assertTrue();
      expect(list1.size()).assertEqual(0);
      expect(list2.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT15_0700
     * @tc.name      testList15Chapter0007
     * @tc.desc      Verify isEmpty() after adding normal/empty/undefined strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList15Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList15Chapter0007';
      console.log(TAG + ' start');
      const list1: List<string> = new List<string>();
      list1.add('normal string');
      const list2: List<string> = new List<string>(['init string']);
      const list3: List<string> = new List<string>();
      list3.add('');
      const list4: List<string> = new List<string>();
      list4.add(String(undefined));
      const list5: List<string> = new List<string>();
      list5.add(String(null));
      expect(list1.isEmpty()).assertFalse();
      expect(list2.isEmpty()).assertFalse();
      expect(list3.isEmpty()).assertFalse();
      expect(list4.isEmpty()).assertFalse();
      expect(list5.isEmpty()).assertFalse();
      expect(list1.size()).assertEqual(1);
      expect(list3.get(0)).assertEqual('');
    });

    /**
     * @tc.number    SUB_LIST_TEXT15_0800
     * @tc.name      testList15Chapter0008
     * @tc.desc      Verify isEmpty() after adding special/escape/emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList15Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList15Chapter0008';
      console.log(TAG + ' start');
      const specialChars = ['!"#$%&\'()*+,-./', ':;<=>?@[\\]^_`{|}~'];
      const escapeChars = [String.fromCharCode(7), '\n', '\r', '\t', '\\', '\0', '\x61'];
      const emojiChars = ['👆', '👿', '👀', '💯', '🎅', '🀄', '🏴'];
      const list1: List<string> = new List<string>(specialChars);
      const list2: List<string> = new List<string>();
      escapeChars.forEach(char => list2.add(char));
      const list3: List<string> = new List<string>();
      emojiChars.forEach(emoji => list3.add(emoji));
      const list4: List<string> = new List<string>();
      list4.add('\udc04\ud83d\udff4');
      expect(list1.isEmpty()).assertFalse();
      expect(list2.isEmpty()).assertFalse();
      expect(list3.isEmpty()).assertFalse();
      expect(list4.isEmpty()).assertFalse();
      expect(list1.size()).assertEqual(2);
      expect(list2.size()).assertEqual(7);
      expect(list3.size()).assertEqual(7);
    });

    /**
     * @tc.number    SUB_LIST_TEXT15_0900
     * @tc.name      testList15Chapter0009
     * @tc.desc      Verify isEmpty() after adding basic numeric values (0/NaN/Infinity)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList15Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList15Chapter0009';
      console.log(TAG + ' start');
      const basicNumbers = [0, -0, 123, -456, NaN, Infinity, -Infinity, undefined];
      const list1: List<number | undefined> = new List<number | undefined>(basicNumbers);
      const list2: List<number> = new List<number>();
      list2.add(0);
      const list3: List<number> = new List<number>();
      list3.add(NaN);
      const list4: List<number> = new List<number>();
      list4.add(Infinity);

      expect(list1.isEmpty()).assertFalse();
      expect(list2.isEmpty()).assertFalse();
      expect(list3.isEmpty()).assertFalse();
      expect(list4.isEmpty()).assertFalse();
      expect(list1.size()).assertEqual(8);
      expect(list2.size()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_LIST_TEXT15_1000
     * @tc.name      testList15Chapter0010
     * @tc.desc      Verify isEmpty() after adding extreme/precision numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList15Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList15Chapter0010';
      console.log(TAG + ' start');
      const extremeNumbers = [
        Number.MAX_VALUE,
        Number.MIN_VALUE,
        Number.EPSILON,
        Number.MAX_SAFE_INTEGER,
        Number.MIN_SAFE_INTEGER
      ];
      const precisionValues: NumberPrecisionValues = {
        byte: [-128, 127],
        short: [-32768, 32767],
        int: [-2147483648, 2147483647],
        long: [-9223372036854775808n, 9223372036854775807n],
        float: [1.40129846432481707e-45, 3.40282346638528860e+38],
        double: [4.94065645841246544e-324, 1.79769313486231570e+308],
        char: [0, 65535]
      };

      const list1: List<number> = new List<number>(extremeNumbers);
      const list2: List<bigint> = new List<bigint>(precisionValues.long);
      const list3: List<number> = new List<number>();
      list3.add(precisionValues.float[0]);
      const list4: List<number> = new List<number>();
      list4.add(precisionValues.double[1]);

      expect(list1.isEmpty()).assertFalse();
      expect(list2.isEmpty()).assertFalse();
      expect(list3.isEmpty()).assertFalse();
      expect(list4.isEmpty()).assertFalse();
      expect(list1.size()).assertEqual(5);
      expect(list2.size()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_LIST_TEXT15_1100
     * @tc.name      testList15Chapter0011
     * @tc.desc      Verify isEmpty() after adding numeric expressions/BigInt values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList15Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList15Chapter0011';
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
      const bigIntValues = [
        BigInt(0xdecafafecacefade),
        BigInt(9007199254740991n),
        BigInt(-9223372036854775808n),
        BigInt(18446744073709551615n)
      ];

      const list1: List<number> = new List<number>(Object.values(baseExprValues));
      const list2: List<bigint> = new List<bigint>(bigIntValues);
      const list3: List<bigint | number> = new List<bigint | number>();
      list3.add(BigInt(1234567890123456789n));
      list3.add(123.456);

      expect(list1.isEmpty()).assertFalse();
      expect(list2.isEmpty()).assertFalse();
      expect(list3.isEmpty()).assertFalse();
      expect(list1.size()).assertEqual(7);
      expect(list2.size()).assertEqual(4);
      expect(list3.size()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_LIST_TEXT15_1200
     * @tc.name      testList15Chapter0012
     * @tc.desc      Verify isEmpty() after adding boolean values (true/false)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList15Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList15Chapter0012';
      console.log(TAG + ' start');
      const basicBools = [true, false];
      const list1: List<boolean> = new List<boolean>(basicBools);
      const list2: List<boolean> = new List<boolean>();
      list2.add(true);
      const list3: List<boolean> = new List<boolean>();
      list3.add(false);
      const list4: List<boolean> = new List<boolean>();
      list4.insert(0, true);

      expect(list1.isEmpty()).assertFalse();
      expect(list2.isEmpty()).assertFalse();
      expect(list3.isEmpty()).assertFalse();
      expect(list4.isEmpty()).assertFalse();
      expect(list1.size()).assertEqual(2);
      expect(list4.size()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_LIST_TEXT15_1300
     * @tc.name      testList15Chapter0013
     * @tc.desc      Verify isEmpty() after adding falsy values (0/"" null/undefined)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList15Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList15Chapter0013';
      console.log(TAG + ' start');
      const falseLikeValues: (number | string | null | undefined | boolean)[] = [0, NaN, "", null, undefined, !'s'];
      const list1: List<number | string | null | undefined | boolean> =
        new List<number | string | null | undefined | boolean>(falseLikeValues);
      const list2: List<number> = new List<number>();
      list2.add(0);
      const list3: List<string> = new List<string>();
      list3.add("");
      const list4: List<null> = new List<null>();
      list4.add(null);
      const list5: List<undefined> = new List<undefined>();
      list5.add(undefined);

      expect(list1.isEmpty()).assertFalse();
      expect(list2.isEmpty()).assertFalse();
      expect(list3.isEmpty()).assertFalse();
      expect(list4.isEmpty()).assertFalse();
      expect(list5.isEmpty()).assertFalse();
      expect(list1.size()).assertEqual(6);
      expect(list4.size()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_LIST_TEXT15_1400
     * @tc.name      testList15Chapter0014
     * @tc.desc      Verify isEmpty() after adding truthy values (1/"non-empty"/object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList15Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList15Chapter0014';
      console.log(TAG + ' start');
      const emptyObj: EmptyObject = new EmptyObject();
      const trueLikeValues: (boolean | number | string | EmptyObject | number[])[] = [!0, 1, "non-empty",
        emptyObj, [1]];
      const list1: List<boolean | number | string | EmptyObject | number[]> = new List<boolean | number | string |
      EmptyObject | number[]>(trueLikeValues);
      const list2: List<number> = new List<number>();
      list2.add(1);
      const list3: List<string> = new List<string>();
      list3.add("non-empty");
      const list4: List<EmptyObject> = new List<EmptyObject>();
      list4.add(emptyObj);
      const list5: List<number[]> = new List<number[]>();
      list5.add([1, 2, 3]);

      expect(list1.isEmpty()).assertFalse();
      expect(list2.isEmpty()).assertFalse();
      expect(list3.isEmpty()).assertFalse();
      expect(list4.isEmpty()).assertFalse();
      expect(list5.isEmpty()).assertFalse();
      expect(list1.size()).assertEqual(5);
      expect(list5.size()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_LIST_TEXT15_1500
     * @tc.name      testList15Chapter0015
     * @tc.desc      Verify isEmpty() after adding mixed basic type values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList15Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList15Chapter0015';
      console.log(TAG + ' start');
      const emptyObj: EmptyObject = new EmptyObject();
      const mixedValues: (boolean | number | string | null | undefined | EmptyObject | number[])[] = [
        true, false, 0, NaN, "", null, undefined, !'s', !0,
        123, "test", emptyObj, [1]
      ];
      const list1: List<boolean | number | string | null | undefined | EmptyObject | number[]> = new List<boolean |
      number | string | null | undefined | EmptyObject | number[]>(mixedValues);
      type MixedValueType = boolean | number | string | null | undefined | EmptyObject | number[];
      const list2: List<MixedValueType> = new List<MixedValueType>();
      list2.add(true);
      list2.add(123);
      list2.add("string");
      list2.add(null);
      list2.add(emptyObj);
      expect(list1.isEmpty()).assertFalse();
      expect(list2.isEmpty()).assertFalse();
      expect(list1.size()).assertEqual(13);
      expect(list2.size()).assertEqual(5);
    });
    /**
     * @tc.number    SUB_LIST_TEXT15_1600
     * @tc.name      testList15Chapter0016
     * @tc.desc      Verify isEmpty() after adding normal/nested/empty objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList15Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList15Chapter0016';
      console.log(TAG + ' start');

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
      class NestedLevel3 {
        e: number = 0;
        constructor(e: number) {
          this.e = e;
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
      class NestedObject {
        a: number = 0;
        b: NestedLevel2 = new NestedLevel2(0, new NestedLevel3(0));
        constructor(a: number, b: NestedLevel2) {
          this.a = a;
          this.b = b;
        }
      }

      const normalObj = new NormalObject(1, "test", [1, 2, 3]);
      const nestedObj = new NestedObject(1, new NestedLevel2(2, new NestedLevel3(3)));
      const emptyObj = new EmptyObject();

      const list1: List<NormalObject> = new List<NormalObject>([normalObj]);
      const list2: List<NestedObject> = new List<NestedObject>([nestedObj]);
      const list3: List<EmptyObject> = new List<EmptyObject>([emptyObj]);
      const list4: List<Object> = new List<Object>();
      list4.add(normalObj);
      list4.add(nestedObj);

      expect(list1.isEmpty()).assertFalse();
      expect(list2.isEmpty()).assertFalse();
      expect(list3.isEmpty()).assertFalse();
      expect(list4.isEmpty()).assertFalse();
      expect(list1.size()).assertEqual(1);
      expect(list4.size()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_LIST_TEXT15_1700
     * @tc.name      testList15Chapter0017
     * @tc.desc      Verify isEmpty() after adding special key/inherited/non-enum objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList15Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList15Chapter0017';
      console.log(TAG + ' start');

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

      const specialKeyObj = new SpecialKeyObject("value", 1);
      const inheritObj = new InheritObject(1);
      const nonEnumObj = new NonEnumObject(1);

      const list1: List<SpecialKeyObject> = new List<SpecialKeyObject>([specialKeyObj]);
      const list2: List<InheritObject> = new List<InheritObject>([inheritObj]);
      const list3: List<NonEnumObject> = new List<NonEnumObject>([nonEnumObj]);
      const list4: List<Object> = new List<Object>();
      list4.add(specialKeyObj);
      list4.add(inheritObj);
      list4.add(nonEnumObj);

      expect(list1.isEmpty()).assertFalse();
      expect(list2.isEmpty()).assertFalse();
      expect(list3.isEmpty()).assertFalse();
      expect(list4.isEmpty()).assertFalse();
      expect(list1.size()).assertEqual(1);
      expect(list4.size()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_LIST_TEXT15_1800
     * @tc.name      testList15Chapter0018
     * @tc.desc      Verify isEmpty() after adding Buffer/DataView/TypedArray objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList15Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList15Chapter0018';
      console.log(TAG + ' start');

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

      let createUint8Array: (values: Array<number>) => Uint8Array = (values: Array<number>): Uint8Array => {
        const arr = new Uint8Array(values.length);
        values.forEach((val, idx) => {
          arr[idx] = val;
        });
        return arr;
      };

      const bufferObj = new BufferObject(new ArrayBuffer(16));
      const dataViewObj = new DataViewObject(new DataView(new ArrayBuffer(16)));
      const typedArrayObj = new BufferObject(createUint8Array([72, 101, 108, 108, 111]));

      const list1: List<BufferObject> = new List<BufferObject>([bufferObj]);
      const list2: List<DataViewObject> = new List<DataViewObject>([dataViewObj]);
      const list3: List<BufferObject> = new List<BufferObject>([typedArrayObj]);
      const list4: List<Object> = new List<Object>();
      list4.add(bufferObj);
      list4.add(dataViewObj);

      expect(list1.isEmpty()).assertFalse();
      expect(list2.isEmpty()).assertFalse();
      expect(list3.isEmpty()).assertFalse();
      expect(list4.isEmpty()).assertFalse();
      expect(list1.size()).assertEqual(1);
      expect(list4.size()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_LIST_TEXT15_1900
     * @tc.name      testList15Chapter0019
     * @tc.desc      Verify isEmpty() after adding complex objects (Map/Set/Regex/Promise)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList15Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList15Chapter0019';
      console.log(TAG + ' start');

      class NestedLevel3 {
        e: number = 0;
        constructor(e: number) {
          this.e = e;
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

      const mapObj = new MapObject([['key1', 'value1'], ['key2', new NestedLevel2(1, new NestedLevel3(1))]]);
      const setObj = new SetObject([1, 2, 3]);
      const funcObj = new FuncObject(1, () => "func");
      const regexObj = new RegexObject(/abc/gi);
      const promiseObj = new PromiseObject(Promise.resolve('done'));

      const list1: List<MapObject> = new List<MapObject>([mapObj]);
      const list2: List<SetObject> = new List<SetObject>([setObj]);
      const list3: List<FuncObject> = new List<FuncObject>([funcObj]);
      const list4: List<RegexObject> = new List<RegexObject>([regexObj]);
      const list5: List<PromiseObject> = new List<PromiseObject>([promiseObj]);
      const list6: List<Object> = new List<Object>();
      list6.add(mapObj);
      list6.add(setObj);
      list6.add(funcObj);

      expect(list1.isEmpty()).assertFalse();
      expect(list2.isEmpty()).assertFalse();
      expect(list3.isEmpty()).assertFalse();
      expect(list4.isEmpty()).assertFalse();
      expect(list5.isEmpty()).assertFalse();
      expect(list6.isEmpty()).assertFalse();
      expect(list1.size()).assertEqual(1);
      expect(list6.size()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_LIST_TEXT15_2000
     * @tc.name      testList15Chapter0020
     * @tc.desc         Test if the List is non-empty after adding objects with special values (undefined, null, NaN, etc.)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList15Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList15Chapter0020';
      console.log(TAG + ' start');

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

      const specialValObj = new SpecialValueObject(NaN, Infinity, -Infinity);
      specialValObj.a = undefined;
      specialValObj.b = null;
      const specialValExtObj = new SpecialValueExtObject(NaN, -Infinity);
      const insertObj = new SpecialValueInsertObject(undefined, undefined, undefined, null);

      const list1: List<SpecialValueObject> = new List<SpecialValueObject>([specialValObj]);
      const list2: List<SpecialValueExtObject> = new List<SpecialValueExtObject>([specialValExtObj]);
      const list3: List<SpecialValueInsertObject> = new List<SpecialValueInsertObject>([insertObj]);
      const list4: List<Object> = new List<Object>();
      list4.add(specialValObj);
      list4.add(insertObj);

      expect(list1.isEmpty()).assertFalse();
      expect(list2.isEmpty()).assertFalse();
      expect(list3.isEmpty()).assertFalse();
      expect(list4.isEmpty()).assertFalse();
      expect(list1.size()).assertEqual(1);
      expect(list4.size()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_LIST_TEXT15_2100
     * @tc.name      testList15Chapter0021
     * @tc.desc      Verify isEmpty() after adding objects with undefined/null/NaN values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList15Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList15Chapter0021';
      console.log(TAG + ' start');

      class NestedLevel3 {
        e: number = 0;
        constructor(e: number) {
          this.e = e;
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
      class LargeObject {
        private props: Map<string, number> = new Map();
        constructor(size: number) {
          for (let i = 0; i < size; i++) {
            this.props.set(i.toString(), i);
          }
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

      const list1: List<LargeObject> = new List<LargeObject>([largeObj]);
      const list2: List<MixedObject> = new List<MixedObject>([mixedObj]);
      const list3: List<SmallObject> = new List<SmallObject>([smallObj]);
      const list4: List<NewKeyObject> = new List<NewKeyObject>([newKeyObj]);
      const list5: List<Object> = new List<Object>();
      list5.add(largeObj);
      list5.add(mixedObj);
      list5.add(smallObj);

      expect(list1.isEmpty()).assertFalse();
      expect(list2.isEmpty()).assertFalse();
      expect(list3.isEmpty()).assertFalse();
      expect(list4.isEmpty()).assertFalse();
      expect(list5.isEmpty()).assertFalse();
      expect(list1.size()).assertEqual(1);
      expect(list5.size()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_LIST_TEXT15_2200
     * @tc.name      testList15Chapter0022
     * @tc.desc      Verify isEmpty() after adding large/mixed/small/new key objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList15Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList15Chapter0022';
      console.log(TAG + ' start');

      const list1: List<string> = new List<string>(['test', 'clear']);
      list1.clear();
      expect(list1.isEmpty()).assertTrue();
      expect(list1.size()).assertEqual(0);
      const list2: List<number> = new List<number>();
      list2.add(123);
      list2.add(456);
      list2.clear();
      expect(list2.isEmpty()).assertTrue();
      class NormalObject {
        a: number = 0;
        constructor(a: number) {
          this.a = a;
        }
      }
      const list3: List<NormalObject> = new List<NormalObject>();
      list3.add(new NormalObject(1));
      list3.add(new NormalObject(2));
      list3.clear();
      expect(list3.isEmpty()).assertTrue();
      const list4: List<boolean | string | null | object> = new List<boolean | string | null | object>();
      list4.add(true);
      list4.add("string");
      list4.add(null);
      list4.clear();
      expect(list4.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEXT15_2300
     * @tc.name      testList15Chapter0023
     * @tc.desc      Verify isEmpty() after adding elements then calling clear()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList15Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList15Chapter0023';
      console.log(TAG + ' start');

      const list1: List<string> = new List<string>();
      list1.insert(0, 'insert 0');
      expect(list1.isEmpty()).assertFalse();
      expect(list1.size()).assertEqual(1);

      const list2: List<number> = new List<number>([10]);
      list2.insert(1, 20);
      list2.insert(3, 30);
      expect(list2.isEmpty()).assertFalse();
      expect(list2.size()).assertEqual(3);

      class EmptyObject {}
      const list3: List<EmptyObject> = new List<EmptyObject>();
      list3.insert(5, new EmptyObject());
      expect(list3.isEmpty()).assertFalse();
      expect(list3.size()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_LIST_TEXT15_2400
     * @tc.name      testList15Chapter0024
     * @tc.desc      Verify isEmpty() after adding single element then clear()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList15Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList15Chapter0024';
      console.log(TAG + ' start');


      const list1: List<string> = new List<string>();
      list1.add('single');
      expect(list1.isEmpty()).assertFalse();
      list1.clear();
      expect(list1.isEmpty()).assertTrue();

      class SmallObject {
        val: string = "";
        constructor(val: string) {
          this.val = val;
        }
      }
      const list2: List<SmallObject> = new List<SmallObject>();
      list2.add(new SmallObject('test'));
      expect(list2.isEmpty()).assertFalse();
      list2.clear();
      expect(list2.isEmpty()).assertTrue();


      const list3: List<null> = new List<null>();
      list3.add(null);
      expect(list3.isEmpty()).assertFalse();
      list3.clear();
      expect(list3.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEXT15_2500
     * @tc.name      testList15Chapter0025
     * @tc.desc      Verify List getFirst() with Uint8Array and multi-zero number arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList15Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList15Chapter0025';
      console.log(TAG + ' start');
      const normalUint8Arr: Uint8Array =
        new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);
      const zeroArr: number[] = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];

      const list1: List<Uint8Array> = new List<Uint8Array>();
      list1.add(normalUint8Arr);
      expect(list1.length).assertEqual(1);
      const firstItem: Uint8Array = list1.getFirst() as Uint8Array;
      expect(firstItem.length).assertEqual(14);
      expect(firstItem[0]).assertEqual(72);
      expect(firstItem[13]).assertEqual(63);

      const list2: List<number[]> = new List<number[]>();
      list2.add(zeroArr);
      expect(list2.length).assertEqual(1);
      const secondItem: number[] = list2.getFirst() as number[];
      expect(secondItem.length).assertEqual(19);
      expect(secondItem[9]).assertEqual(0);
      expect(secondItem[18]).assertEqual(63);
    });

    /**
     * @tc.number    SUB_LIST_TEXT15_2600
     * @tc.name      testList15Chapter0026
     * @tc.desc      Verify getFirst logic for negative-number arrays & non-numeric index arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList15Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList15Chapter0026';
      console.log(TAG + ' start');

      const negativeArr: number[] = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      const uint8NegArr: Uint8Array = new Uint8Array(negativeArr);
      const int8NegArr: Int8Array = new Int8Array(negativeArr);
      const numericArr: number[] = [333];
      const nonNumericMap: Map<string, number> = new Map<string, number>();
      nonNumericMap.set("abc", 111);
      nonNumericMap.set("aaa", 222);

      const listUint8: List<Uint8Array> = new List<Uint8Array>();
      listUint8.add(uint8NegArr);
      const itemUint8: Uint8Array = listUint8.getFirst() as Uint8Array;
      expect(itemUint8[6]).assertEqual(145);
      expect(itemUint8[10]).assertEqual(207);

      const listInt8: List<Int8Array> = new List<Int8Array>();
      listInt8.add(int8NegArr);
      const itemInt8: Int8Array = listInt8.getFirst() as Int8Array;
      expect(itemInt8[6]).assertEqual(-111);
      expect(itemInt8[10]).assertEqual(-49);

      const listNumeric: List<number[]> = new List<number[]>();
      listNumeric.add(numericArr);
      const itemNumeric: number[] = listNumeric.getFirst() as number[];
      expect(itemNumeric[0]).assertEqual(333);

      expect(nonNumericMap.get("abc")).assertEqual(111);
      expect(nonNumericMap.get("aaa")).assertEqual(222);
    });

    /**
     * @tc.number    SUB_LIST_TEXT15_2700
     * @tc.name      testList15Chapter0027
     * @tc.desc      Verify getFirst logic for NaN/Infinity arrays & non-numeric type arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList15Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList15Chapter0027';
      console.log(TAG + ' start');

      const specialValueArr: number[] = [72, 101, NaN, Infinity, -Infinity, 108, 111];
      const nonNumericTypeArr: (number | string | boolean | null | undefined)[] =
        [72, "abc", true, null, undefined, 108];

      const listSpecial: List<number[]> = new List<number[]>();
      listSpecial.add(specialValueArr);
      const itemSpecial: number[] = listSpecial.getFirst() as number[];
      expect(itemSpecial[0]).assertEqual(72);
      expect(isNaN(itemSpecial[2])).assertTrue();
      expect(itemSpecial[3]).assertEqual(Infinity);

      const listNonNumeric: List<(number | string | boolean | null | undefined)[]> =
        new List<(number | string | boolean | null | undefined)[]>();
      listNonNumeric.add(nonNumericTypeArr);
      const itemNonNumeric: (number | string | boolean | null | undefined)[] =
        listNonNumeric.getFirst() as (number | string | boolean | null | undefined)[];
      expect(itemNonNumeric[1]).assertEqual("abc");
      expect(itemNonNumeric[2]).assertEqual(true);
      expect(itemNonNumeric[3]).assertEqual(null);
    });

    /**
     * @tc.number    SUB_LIST_TEXT15_2800
     * @tc.name      testList15Chapter0028
     * @tc.desc      Verify getFirst logic for empty arrays, extreme numeric overflow arrays & post-removal arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList15Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList15Chapter0028';
      console.log(TAG + ' start');

      const emptyArr: number[] = [];
      const overflowArr: number[] = [256, 65536, 32768];
      const deletedArr: number[] = [1, 2, 3];
      deletedArr.splice(1, 1);

      const listEmpty: List<number[]> = new List<number[]>();
      listEmpty.add(emptyArr);
      const itemEmpty: number[] = listEmpty.getFirst() as number[];
      expect(itemEmpty.length).assertEqual(0);

      const listOverflow: List<number[]> = new List<number[]>();
      listOverflow.add(overflowArr);
      const itemOverflow: number[] = listOverflow.getFirst() as number[];
      expect(itemOverflow[0]).assertEqual(256);
      expect(itemOverflow[1]).assertEqual(65536);

      const listDeleted: List<number[]> = new List<number[]>();
      listDeleted.add(deletedArr);
      const itemDeleted: number[] = listDeleted.getFirst() as number[];
      expect(itemDeleted.length).assertEqual(2);
      expect(itemDeleted[0]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_LIST_TEXT15_2900
     * @tc.name      testList15Chapter0029
     * @tc.desc      Verify the processing of nested arrays, arrays with TypedArray sub-elements,and ultra-long arrays (getFirst to get the first element)
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testList15Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList15Chapter0029';
      console.log(TAG + ' start');

      const nestedArr: (number | number[] | (number | number[])[])[] = [1, [2, 3], [4, [5, 6]]];
      const typedSubArr: TypedArray[] = [new Int32Array([10, 20]), new Float64Array([3.14, 6.28])];
      const largeArr: number[] = new Array<number>(1000000);
      largeArr.fill(1, 0, 1000000);
      const listNested: List<(number | number[] | (number | number[])[])[]> = new List();
      listNested.add(nestedArr);
      const listTyped: List<TypedArray[]> = new List();
      listTyped.add(typedSubArr);
      const listLarge: List<number[]> = new List();
      listLarge.add(largeArr);
      const itemNested = listNested.getFirst() as (number | number[] | (number | number[])[])[];
      const itemTyped = listTyped.getFirst() as TypedArray[];
      const itemLarge = listLarge.getFirst() as number[];
      const nested0 = itemNested[0] as number;
      const nested1 = itemNested[1] as number[];
      const nested2 = itemNested[2] as (number | number[])[];
      const nested2Child = nested2[1] as number[];
      expect(nested0).assertEqual(1);
      expect(nested1[1]).assertEqual(3);
      expect(nested2Child[0]).assertEqual(5);
      const typed0 = itemTyped[0] as Int32Array;
      const typed1 = itemTyped[1] as Float64Array;
      expect(typed0[0]).assertEqual(10);
      expect(typed1[1]).assertClose(6.28, 0.01);
      const largeLen = itemLarge.length;
      const largeFirstVal = itemLarge[0];
      expect(largeLen).assertEqual(1000000);
      expect(largeFirstVal).assertEqual(1);
    });

    /**
     * @tc.number    SUB_LIST_TEXT15_3000
     * @tc.name      testList15Chapter0030
     * @tc.desc      Verify the processing logic of arrays containing functions/keywords (remove Symbol, getFirst to get the first element)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList15Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList15Chapter0030';
      console.log(TAG + ' start');

      type MixedElement = (() => string) | string;
      const func: () => string = () => "testResult";
      const mixedTypeArr: MixedElement[] = [func, "0", "NaN", ""];

      const list: List<MixedElement[]> = new List<MixedElement[]>();
      list.add(mixedTypeArr);
      expect(list.length).assertEqual(1);

      const firstItem: MixedElement[] = list.getFirst() as MixedElement[];
      expect((firstItem[0] as () => string)()).assertEqual("testResult");
      expect(firstItem[1] as string).assertEqual("0");
      expect(firstItem[2] as string).assertEqual("NaN");
    });

    /**
     * @tc.number    SUB_LIST_TEXT15_3100
     * @tc.name      testList15Chapter0031
     * @tc.desc      Test getFirst interface with basic string values (replace constructor test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList15Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList15Chapter0031';
      console.log(TAG + ' start');
      const undefinedStr: string = String(undefined);
      const nullStr: string = String(null);
      const emptyStr: string = '';
      const specialCharStr1: string = '!"#$%';
      let asciiStr: string = '';
      for (let i = 32; i <= 126; i++) {
        asciiStr += String.fromCharCode(i);
      }
      const list: List<string> = new List<string>([undefinedStr, nullStr, emptyStr, specialCharStr1, asciiStr]);
      expect(list.size()).assertEqual(5);
      expect(list.getFirst()).assertEqual(undefinedStr);
      expect(list.getFirst()).assertEqual('undefined');
    });

    /**
     * @tc.number    SUB_LIST_TEXT15_3200
     * @tc.name      testList15Chapter0032
     * @tc.desc      Test getFirst interface with special character strings (replace constructor test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList15Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList15Chapter0032';
      console.log(TAG + ' start');
      const specialCharStrs = ['&\'()', '*+,-.', '/:;<=', '>?@[\\\\', ']^_`{', '|}~'];
      const list: List<string> = new List<string>(specialCharStrs);
      expect(list.size()).assertEqual(6);
      expect(list.getFirst()).assertEqual('&\'()');
    });
  })
}