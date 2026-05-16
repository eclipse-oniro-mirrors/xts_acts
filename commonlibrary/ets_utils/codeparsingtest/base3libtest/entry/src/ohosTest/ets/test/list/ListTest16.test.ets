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
    const threshold = 10000;
    if (this.data.length !== 0 && this.data.length % threshold === 0) {
      this.data.length += threshold;
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

  // 新增修复：getLast方法，匹配测试用例调用
  getLast(): T | undefined {
    return this.data.length > 0 ? this.data[this.data.length - 1] : undefined;
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

type PrimitiveType = number | string | boolean | null | undefined | bigint | (() => string);
type TestArrayElement = PrimitiveType | TypedArray | TestArrayElement[];
type TestArray = TestArrayElement[] | TypedArray;

export interface IteratorItem<T> {
  index: number;
  value: T;
  type: string;
}

function getTypedArrayTypeName(value: object): string | null {
  if (value instanceof Int8Array) return 'Int8Array';
  if (value instanceof Uint8Array) return 'Uint8Array';
  if (value instanceof Uint8ClampedArray) return 'Uint8ClampedArray';
  if (value instanceof Int16Array) return 'Int16Array';
  if (value instanceof Uint16Array) return 'Uint16Array';
  if (value instanceof Int32Array) return 'Int32Array';
  if (value instanceof Uint32Array) return 'Uint32Array';
  if (value instanceof Float32Array) return 'Float32Array';
  if (value instanceof Float64Array) return 'Float64Array';
  if (value instanceof BigInt64Array) return 'BigInt64Array';
  if (value instanceof BigUint64Array) return 'BigUint64Array';
  return null;
}

class IterableIteratorImpl<T> implements IterableIterator<IteratorItem<T>> {
  private index: number = 0;
  private items: T[];

  constructor(items: T[]) {
    this.items = items;
  }

  next(): IteratorResult<IteratorItem<T>, IteratorItem<T>> {
    if (this.index < this.items.length) {
      const value = this.items[this.index];
      let type: string;
      if (typeof value === 'object' && value !== null) {
        const typedArrayType = getTypedArrayTypeName(value);
        if (typedArrayType) {
          type = typedArrayType;
        } else if (Array.isArray(value)) {
          type = 'Array';
        } else {
          type = 'object';
        }
      } else if (typeof value === 'function') {
        type = 'Function';
      } else {
        type = typeof value;
      }

      const result: IteratorItem<T> = {
        index: this.index,
        value: value,
        type: type
      };
      this.index++;
      return { done: false, value: result };
    } else {
      return { done: true, value: undefined! };
    }
  }

  [Symbol.iterator](): IterableIterator<IteratorItem<T>> {
    return this;
  }
}

class IterableContainer<T> {
  private items: T[] = [];

  add(item: T): void {
    this.items.push(item);
  }

  get(index: number): T | undefined {
    return this.items[index];
  }

  get length(): number {
    return this.items.length;
  }

  [Symbol.iterator](): IterableIterator<IteratorItem<T>> {
    return new IterableIteratorImpl<T>(this.items);
  }
}

function isNaNValue(num: number): boolean {
  return num !== num;
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

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ListTest16() {
  describe('ListTest16', () => {
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
     * @tc.number    SUB_LIST_TEXT16_0100
     * @tc.name      testList16Chapter0001
     * @tc.desc      Test getFirst interface with escape character strings (replace constructor test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0001';
      console.log(TAG + ' start');
      const escapeStrs = [
        '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~',
        String.fromCharCode(7),
        String.fromCharCode(8),
        String.fromCharCode(12),
        '\n'
      ];
      const list: List<string> = new List<string>(escapeStrs);
      expect(list.size()).assertEqual(5);
      expect(list.getFirst()).assertEqual(escapeStrs[0]);
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_0200
     * @tc.name      testList16Chapter0002
     * @tc.desc      Test getFirst interface with more escape character strings (replace constructor test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0002';
      console.log(TAG + ' start');
      const escapeStrs = ['\r', '\t', String.fromCharCode(11), '\\', '\''];
      const list: List<string> = new List<string>(escapeStrs);
      expect(list.size()).assertEqual(5);
      expect(list.getFirst()).assertEqual('\r');
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_0300
     * @tc.name      testList16Chapter0003
     * @tc.desc      Test chatper interface with hex/octal escape strings (replace constructor test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0003';
      console.log(TAG + ' start');
      const escapeStrs: string[] = ['"', '?', '\0', '\x61', '\x61'];
      const list: List<string> = new List(escapeStrs);
      const listSize = list.size();
      const firstVal = list.getFirst();
      expect(listSize).assertEqual(5);
      expect(firstVal).assertEqual('"');
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_0400
     * @tc.name      testList16Chapter0004
     * @tc.desc      Test getFirst interface with emoji strings (replace constructor test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0004';
      console.log(TAG + ' start');
      const emojis = ['👆', '👿', '👀', '💯', '🎅'];
      const list: List<string> = new List<string>(emojis);
      expect(list.size()).assertEqual(5);
      expect(list.getFirst()).assertEqual('👆');
      expect(list.getFirst()).assertEqual('\ud83d\udc46');
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_0500
     * @tc.name      testList16Chapter0005
     * @tc.desc      Test getFirst interface with special unicode strings (replace constructor test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0005';
      console.log(TAG + ' start');
      const largeObj = new LargeObject(10000);
      const nested3 = new NestedLevel3(0);
      const nested2 = new NestedLevel2(456, nested3);
      const map = new Map([['key', 'val']]);
      const set = new Set([1, 2, 3]);
      const regex = /abc/;
      const buffer = new ArrayBuffer(8);
      const mixedObj = new MixedObject(123, "test", true, null, nested2, map, set, regex, buffer);
      const smallObj = new SmallObject(1);
      const newKeyObj = new NewKeyObject("newVal");
      const objects = [largeObj, mixedObj, smallObj, newKeyObj];

      const listLarge = new List<LargeObject>([largeObj]);
      const firstLarge = listLarge.getFirst()!;
      expect(firstLarge.getPropertyCount()).assertEqual(10000);

      const listMixed = new List<MixedObject>([mixedObj]);
      const firstMixed = listMixed.getFirst()!;
      expect(firstMixed.a).assertEqual(123);
      expect(firstMixed.f.get('key')).assertEqual('val');

      const listAll = new List<Object>(objects);
      const firstAll = listAll.getFirst() as LargeObject;
      expect(firstAll.getProperty("0")).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_0600
     * @tc.name      testList16Chapter0006
     * @tc.desc      Test getFirst interface with large strings (replace constructor test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0006';
      console.log(TAG + ' start');
      let str: string = "{k1:value1,k2:value2}";
      let result: string = str.substring(0, str.length - 2);
      for (let i = 0; i < 10; i++) {
        result = result.substring(0, result.length - 1);
      }
      const bigStrPlaceholder = 'a';
      const gcTestStrPlaceholder = 'a';
      const strs = [result, bigStrPlaceholder, gcTestStrPlaceholder];
      const list: List<string> = new List<string>(strs);
      expect(list.size()).assertEqual(3);
      expect(list.getFirst()).assertEqual(result);
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_0700
     * @tc.name      testList16Chapter0007
     * @tc.desc      Test getFirst interface with special number values (replace constructor test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0007';
      console.log(TAG + ' start');
      const basicValues = [0, NaN, -0, Infinity, -Infinity, undefined] as (number | undefined)[];
      const list: List<number | undefined> = new List<number | undefined>(basicValues);
      expect(list.size()).assertEqual(6);
      expect(list.getFirst()).assertEqual(-0);
      expect(isNaN(list.getFirst() ?? NaN)).assertFalse();
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_0800
     * @tc.name      testList16Chapter0008
     * @tc.desc      Test getFirst interface with extreme number values (replace constructor test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0008';
      console.log(TAG + ' start');
      const extremeValues = [
        Number.MAX_VALUE,
        Number.MIN_VALUE,
        Number.EPSILON,
        Number.MAX_SAFE_INTEGER
      ];
      const list: List<number> = new List<number>(extremeValues);
      expect(list.size()).assertEqual(4);
      expect(list.getFirst()).assertEqual(1.7976931348623157e+308);
      expect(list.getFirst()).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_0900
     * @tc.name      testList16Chapter0009
     * @tc.desc      Test getFirst interface with precision number values (replace constructor test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0009';
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
      expect(listByte.getFirst()).assertEqual(-128);

      const listShort = new List<number>(precisionValues.short);
      expect(listShort.getFirst()).assertEqual(-32768);

      const listChar = new List<number>(precisionValues.char);
      expect(listChar.getFirst()).assertEqual(0);
      expect(String.fromCharCode(listChar.getFirst() ?? 0)).assertEqual("\0");

      const listLong = new List<bigint>(precisionValues.long);
      expect(listLong.getFirst()).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_1000
     * @tc.name      testList16Chapter0010
     * @tc.desc      Test getFirst interface with base expression number values (replace constructor test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0010';
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
      const baseExprs = [
        baseExprValues.hex16,
        baseExprValues.hex32,
        baseExprValues.octal,
        baseExprValues.sci1,
        baseExprValues.exponent
      ];
      const list: List<number> = new List<number>(baseExprs);
      expect(list.size()).assertEqual(5);
      expect(list.getFirst()).assertEqual(258);
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_1100
     * @tc.name      testList16Chapter0011
     * @tc.desc      Test getFirst interface with bigint values (replace constructor test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0011';
      console.log(TAG + ' start');
      const bigIntValues = [
        0xdecafafecacefaden,
        9007199254740991n,
        -9223372036854775808n,
        123.456,
        18446744073709551615n
      ];
      const list: List<bigint | number> = new List<bigint | number>(bigIntValues);
      expect(list.size()).assertEqual(5);
      expect(list.getFirst()).assertEqual(0xdecafafecacefaden);
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_1200
     * @tc.name      testList16Chapter0012
     * @tc.desc      Test getFirst interface with basic boolean values (replace constructor test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0012';
      console.log(TAG + ' start');
      const basicValues: boolean[] = [true, false];
      const list: List<boolean> = new List<boolean>(basicValues);
      expect(list.size()).assertEqual(2);
      expect(list.getFirst()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_1300
     * @tc.name      testList16Chapter0013
     * @tc.desc      Test getFirst interface with false-like values (replace constructor test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0013';
      console.log(TAG + ' start');
      const falseLikeValues: (number | string | null | undefined | boolean)[] = [0, NaN, "", null, undefined, !'s'];
      const list: List<number | string | null | undefined | boolean> = new List<number | string | null | undefined |
      boolean>(falseLikeValues);
      expect(list.size()).assertEqual(6);
      expect(list.getFirst()).assertEqual(0);
      expect(Boolean(list.getFirst())).assertEqual(false);
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_1400
     * @tc.name      testList16Chapter0014
     * @tc.desc      Test getFirst interface with true-like values (replace constructor test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0014';
      console.log(TAG + ' start');
      const emptyObj = new EmptyObject();
      const trueLikeValues: (boolean | number | string | EmptyObject | number[])[] =
        [!0, 1, "non-empty", emptyObj, [1]];
      const list: List<boolean | number | string | EmptyObject | number[]> =
        new List<boolean | number | string | EmptyObject | number[]>(trueLikeValues);
      expect(list.size()).assertEqual(5);
      expect(list.getFirst()).assertEqual(true);
      expect(Boolean(list.getFirst())).assertEqual(true);
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_1500
     * @tc.name      testList16Chapter0015
     * @tc.desc      Test getFirst interface with mixed boolean/number/string values (replace constructor test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0015';
      console.log(TAG + ' start');
      const emptyObj = new EmptyObject();
      const mixedValues: (boolean | number | string | null | undefined | EmptyObject | number[])[] = [
        true, false, 0, NaN, "", null, undefined, !'s', !0,
        123, "", "test", emptyObj, [1]
      ];
      const list: List<boolean | number | string | null | undefined | EmptyObject | number[]> =
        new List<boolean | number | string | null | undefined | EmptyObject | number[]>(mixedValues);
      expect(list.size()).assertEqual(14);
      expect(list.getFirst()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_1600
     * @tc.name      testList16Chapter0016
     * @tc.desc      Test getFirst interface with basic objects (replace constructor test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0016';
      console.log(TAG + ' start');
      const normalObj = new NormalObject(1, "test", [1, 2, 3]);
      const nestedObj = new NestedObject(1, new NestedLevel2(2, new NestedLevel3(3)));
      const emptyObj = new EmptyObject();
      const objects = [normalObj, nestedObj, emptyObj];

      const listNormal = new List<NormalObject>([normalObj]);
      expect(listNormal.getFirst()!.a).assertEqual(1);

      const listNested = new List<NestedObject>([nestedObj]);
      expect(listNested.getFirst()!.b.d.e).assertEqual(3);

      const listEmpty = new List<EmptyObject>([emptyObj]);
      expect(isEmptyObject(listEmpty.getFirst()!)).assertTrue();

      const listMixed = new List<Object>(objects);
      expect((listMixed.getFirst() as NormalObject).b).assertEqual("test");
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_1700
     * @tc.name      testList16Chapter0017
     * @tc.desc      Test getFirst interface with special key/inherit/non-enum objects (replace constructor test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0017';
      console.log(TAG + ' start');
      const specialKeyObj = new SpecialKeyObject("value", 1);
      const inheritObj = new InheritObject(1);
      const nonEnumObj = new NonEnumObject(1);
      const objects = [specialKeyObj, inheritObj, nonEnumObj];

      const listSpecial = new List<SpecialKeyObject>([specialKeyObj]);
      expect(listSpecial.getFirst()!.specialKey).assertEqual("value");

      const listInherit = new List<InheritObject>([inheritObj]);
      expect(listInherit.getFirst()!.parentProp).assertEqual(1);

      const listNonEnum = new List<NonEnumObject>([nonEnumObj]);
      expect(listNonEnum.getFirst()!.a).assertEqual(1);

      const listMixed = new List<Object>(objects);
      expect((listMixed.getFirst() as SpecialKeyObject).a).assertEqual(1);
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_1800
     * @tc.name      testList16Chapter0018
     * @tc.desc      Test getFirst interface with buffer/dataview/typed array objects (replace constructor test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0018';
      console.log(TAG + ' start');
      const bufferObj = new BufferObject(new ArrayBuffer(16));
      const dataViewObj = new DataViewObject(new DataView(new ArrayBuffer(16)));
      const typedArrayObj = new BufferObject(createUint8Array([72, 101, 108, 108, 111]));
      const objects = [bufferObj, dataViewObj, typedArrayObj];

      const listBuffer = new List<BufferObject>([bufferObj]);
      expect(((listBuffer.getFirst()!.buffer as ArrayBuffer).byteLength)).assertEqual(16);

      const listDataView = new List<DataViewObject>([dataViewObj]);
      expect(listDataView.getFirst()!.view.buffer.byteLength).assertEqual(16);

      const listTypedArray = new List<BufferObject>([typedArrayObj]);
      expect(((listTypedArray.getFirst()!.buffer as Uint8Array)[0])).assertEqual(72);

      const listMixed = new List<Object>(objects);
      expect(((listMixed.getFirst() as BufferObject).buffer as ArrayBuffer).byteLength).assertEqual(16);
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_1900
     * @tc.name      testList16Chapter0019
     * @tc.desc      Verify List adds arrays and checks element length/index values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0019';
      console.log(TAG + ' start');
      const normalUint8Arr: Uint8Array =
        new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);
      const zeroArr: number[] = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];
      const list: List<TestArray> = new List<TestArray>();
      list.add(normalUint8Arr);
      list.add(zeroArr);
      expect(list.length).assertEqual(2);
      const lastItem: number[] = list.getLast() as number[];
      expect(lastItem.length).assertEqual(19);
      expect(lastItem[9]).assertEqual(0);
      expect(lastItem[13]).assertEqual(0);
      expect(lastItem[18]).assertEqual(63);
      const prevLastItem: Uint8Array = list.get(0) as Uint8Array;
      expect(prevLastItem.length).assertEqual(14);
      expect(prevLastItem[0]).assertEqual(72);
      expect(prevLastItem[13]).assertEqual(63);
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_2000
     * @tc.name      testList16Chapter0020
     * @tc.desc      Verify the processing logic of arrays containing negative numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0020';
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
      const lastItem: number[] = list.getLast() as number[];
      expect(lastItem.length).assertEqual(1);
      expect(lastItem[0]).assertEqual(333);
      const prevLastItem: Int8Array = list.get(1) as Int8Array;
      expect(prevLastItem[6]).assertEqual(-111);
      expect(prevLastItem[10]).assertEqual(-49);
      const firstItem: Uint8Array = list.get(0) as Uint8Array;
      expect(firstItem[6]).assertEqual(145);
      expect(firstItem[10]).assertEqual(207);
      expect(nonNumericMap.get("abc")).assertEqual(111);
      expect(nonNumericMap.get("aaa")).assertEqual(222);
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_2100
     * @tc.name      testList16Chapter0021
     * @tc.desc      Verify the processing logic of arrays containing NaN/Infinity and arrays with non-numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0021';
      console.log(TAG + ' start');
      const specialValueArr: number[] = [72, 101, NaN, Infinity, -Infinity, 108, 111];
      const nonNumericTypeArr: (number | string | boolean | null | undefined)[] =
        [72, "abc", true, null, undefined, 108];
      const list: List<number[] | (number | string | boolean | null | undefined)[]> =
        new List<number[] | (number | string | boolean | null | undefined)[]>();
      list.add(specialValueArr);
      list.add(nonNumericTypeArr);
      expect(list.length).assertEqual(2);
      const lastItem: (number | string | boolean | null | undefined)[] =
        list.getLast() as (number | string | boolean | null | undefined)[];
      expect(lastItem[1]).assertEqual("abc");
      expect(lastItem[2]).assertEqual(true);
      expect(lastItem[3]).assertEqual(null);
      expect(lastItem[4]).assertEqual(undefined);
      const firstItem: number[] = list.get(0) as number[];
      expect(firstItem[0]).assertEqual(72);
      expect(isNaN(firstItem[2])).assertTrue();
      expect(firstItem[3]).assertEqual(Infinity);
      expect(firstItem[4]).assertEqual(-Infinity);
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_2200
     * @tc.name      testList16Chapter0022
     * @tc.desc      Verify the processing logic of empty arrays, arrays with extremely large value overflows
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0022';
      console.log(TAG + ' start');

      const emptyArr: number[] = [];
      const overflowArr: number[] = [256, 65536, 32768];
      const deletedArr: number[] = [1, 2, 3];
      deletedArr.splice(1, 1);
      const list: List<number[]> = new List();
      list.add(emptyArr);
      list.add(overflowArr);
      list.add(deletedArr);
      const listLen = list.length;
      const lastItem = list.getLast() as number[];
      const prevLastItem = list.get(1) as number[];
      const firstItem = list.get(0) as number[];
      const lastItemLen = lastItem.length;
      const lastItem0 = lastItem[0];
      const lastItem1 = lastItem[1];
      const prevLastItem0 = prevLastItem[0];
      const prevLastItem1 = prevLastItem[1];
      const prevLastItem2 = prevLastItem[2];
      const firstItemLen = firstItem.length;
      expect(listLen).assertEqual(3);
      expect(lastItemLen).assertEqual(2);
      expect(lastItem0).assertEqual(1);
      expect(lastItem1).assertEqual(3);
      expect(prevLastItem0).assertEqual(256);
      expect(prevLastItem1).assertEqual(65536);
      expect(prevLastItem2).assertEqual(32768);
      expect(firstItemLen).assertEqual(0);
    });
    /**
     * @tc.number    SUB_LIST_TEXT16_2300
     * @tc.name      testList16Chapter0023
     * @tc.desc      Verify the processing of nested arrays, arrays containing TypedArray sub-elements
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testList16Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0023';
      console.log(TAG + ' start');
      const nestedArr: (number | number[] | (number | number[])[])[] = [1, [2, 3], [4, [5, 6]]];
      const typedSubArr: TypedArray[] = [new Int32Array([10, 20]), new Float64Array([3.14, 6.28])];
      const largeArr: number[] = new Array<number>(1000000);
      largeArr.fill(1, 0, 1000000);

      const nestedList: List<(number | number[] | (number | number[])[])[]> = new List();
      nestedList.add(nestedArr);
      const typedList: List<TypedArray[]> = new List();
      typedList.add(typedSubArr);
      const largeList: List<number[]> = new List();
      largeList.add(largeArr);
      const nestedLast = nestedList.getLast()!;
      const typedLast = typedList.getLast()!;
      const largeLast = largeList.getLast()!;
      const nestedLen = nestedList.length;
      const typedLen = typedList.length;
      const largeLen = largeList.length;
      expect(nestedLen).assertEqual(1);
      expect(typedLen).assertEqual(1);
      expect(largeLen).assertEqual(1);
      const nested1 = nestedLast[0] as number;
      const nested2 = nestedLast[1] as number[];
      const nested3 = nestedLast[2] as (number | number[])[];
      const nested3Child = nested3[1] as number[];
      expect(nested1).assertEqual(1);
      expect(nested2[1]).assertEqual(3);
      expect(nested3Child[0]).assertEqual(5);
      const typed0 = typedLast[0] as Int32Array;
      const typed1 = typedLast[1] as Float64Array;
      expect(typed0[0]).assertEqual(10);
      expect(typed1[1]).assertClose(6.28, 0.01);
      const largeArrLen = largeLast.length;
      const largeFirstVal = largeLast[0];
      const largeEndVal = largeLast[999999];
      expect(largeArrLen).assertEqual(1000000);
      expect(largeFirstVal).assertEqual(1);
      expect(largeEndVal).assertEqual(1);
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_2400
     * @tc.name      testList16Chapter0024
     * @tc.desc      Verify the processing logic of arrays containing functions/keywords (Symbol removed)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0024';
      console.log(TAG + ' start');
      type MixedElement = (() => string) | string;
      const func: () => string = () => "testResult";
      const mixedTypeArr: MixedElement[] = [func, "0", "NaN", ""];
      const list: List<MixedElement[]> = new List<MixedElement[]>();
      list.add(mixedTypeArr);
      expect(list.length).assertEqual(1);
      const lastItem: MixedElement[] = list.getLast()!;
      expect((lastItem[0] as () => string)()).assertEqual("testResult");
      expect(lastItem[1] as string).assertEqual("0");
      expect(lastItem[2] as string).assertEqual("NaN");
      expect(lastItem[3] as string).assertEqual("");
    });
    /**
     * @tc.number    SUB_LIST_TEXT16_2500
     * @tc.name      testList16Chapter0025
     * @tc.desc      Test getLast interface with basic string values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0025';
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
      expect(list.getLast()).assertEqual(asciiStr);

      const singleList: List<string> = new List<string>([emptyStr]);
      expect(singleList.getLast()).assertEqual('');
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_2600
     * @tc.name      testList16Chapter0026
     * @tc.desc      Test getLast interface with special character strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0026';
      console.log(TAG + ' start');
      const list: List<string> = new List<string>(['!&\'()*,+-./:;<=>?@[\\]^_`{|}~']);
      const listSize = list.size();
      const lastVal = list.getLast();
      expect(listSize).assertEqual(1);
      expect(lastVal).assertEqual('!&\'()*,+-./:;<=>?@[\\]^_`{|}~');
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_2700
     * @tc.name      testList16Chapter0027
     * @tc.desc      Test getLast interface with escape character strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0027';
      console.log(TAG + ' start');
      const escapeStrs = [
        '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~',
        String.fromCharCode(7),
        String.fromCharCode(8),
        String.fromCharCode(12),
        '\n'
      ];
      const list: List<string> = new List<string>(escapeStrs);
      expect(list.size()).assertEqual(5);
      expect(list.getLast()).assertEqual('\n');
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_2800
     * @tc.name      testList16Chapter0028
     * @tc.desc      Test getLast interface with more escape character strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0028';
      console.log(TAG + ' start');
      const escapeStrs = ['\r', '\t', String.fromCharCode(11), '\\', '\''];
      const list: List<string> = new List<string>(escapeStrs);
      expect(list.size()).assertEqual(5);
      expect(list.getLast()).assertEqual('\'');
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_2900
     * @tc.name      testList16Chapter0029
     * @tc.desc      Test getLast interface with hex/octal escape strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0029';
      console.log(TAG + ' start');
      const escapeStrs = ['"', '?', '\0', '\x61', '\x62'];
      const list: List<string> = new List<string>(escapeStrs);
      expect(list.size()).assertEqual(5);
      expect(list.getLast()).assertEqual('b');
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_3000
     * @tc.name      testList16Chapter0030
     * @tc.desc      Test getLast interface with emoji strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0030';
      console.log(TAG + ' start');
      const emojis = ['👆', '👿', '👀', '💯', '🎅'];
      const list: List<string> = new List<string>(emojis);
      expect(list.size()).assertEqual(5);
      expect(list.getLast()).assertEqual('\ud83c\udf85');
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_3100
     * @tc.name      testList16Chapter0031
     * @tc.desc      Test getLast interface with special unicode strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0031';
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
      const unicodeStrs = ['🀄', '🏴', '\udc04\ud83d\udff4', '0', 'NaN', '', treeStr];
      const list: List<string> = new List<string>(unicodeStrs);
      expect(list.size()).assertEqual(7);
      expect(list.getLast()).assertEqual(treeStr);
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_3200
     * @tc.name      testList16Chapter0032
     * @tc.desc      Test getLast interface with large strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0032';
      console.log(TAG + ' start');
      let str: string = "{k1:value1,k2:value2}";
      let result: string = str.substring(0, str.length - 2);
      for (let i = 0; i < 10; i++) {
        result = result.substring(0, result.length - 1);
      }
      const bigStrPlaceholder = 'a';
      const gcTestStrPlaceholder = 'b';
      const strs = [result, bigStrPlaceholder, gcTestStrPlaceholder];
      const list: List<string> = new List<string>(strs);
      expect(list.size()).assertEqual(3);
      expect(list.getLast()).assertEqual(gcTestStrPlaceholder);
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_3300
     * @tc.name      testList16Chapter0033
     * @tc.desc      Test getLast interface with special number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0033';
      console.log(TAG + ' start');
      const basicValues = [0, NaN, -0, Infinity, -Infinity, undefined] as (number | undefined)[];
      const list: List<number | undefined> = new List<number | undefined>(basicValues);
      expect(list.size()).assertEqual(6);
      expect(list.getLast()).assertEqual(undefined);
      expect(isNaN(list.get(1) ?? NaN)).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_3400
     * @tc.name      testList16Chapter0034
     * @tc.desc      Test getLast interface with extreme number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0034';
      console.log(TAG + ' start');

      const extremeValues: number[] = [
        Number.MAX_VALUE,
        Number.MIN_VALUE,
        Number.EPSILON,
        Number.MAX_SAFE_INTEGER
      ];

      const list: List<number> = new List(extremeValues);

      const listSize = list.size();
      const lastVal = list.getLast();

      expect(listSize).assertEqual(4);
      expect(lastVal).assertEqual(9007199254740991);
      expect(lastVal).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_3500
     * @tc.name      testList16Chapter0035
     * @tc.desc      Test getLast interface with precision number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0035';
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
      expect(listByte.getLast()).assertEqual(128);

      const listLong = new List<bigint>(precisionValues.long);
      expect(listLong.getLast()).assertEqual(9223372036854775807n);

      const mixedPrecision = [
        precisionValues.byte[0],
        precisionValues.float[1],
        precisionValues.char[3],
        precisionValues.long[1]
      ] as (number | bigint)[];
      const listMixed = new List<number | bigint>(mixedPrecision);
      expect(listMixed.getLast()).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_3600
     * @tc.name      testList16Chapter0036
     * @tc.desc      Test getLast interface with base expression number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0036';
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
      const baseExprs = [
        baseExprValues.hex16,
        baseExprValues.octal,
        baseExprValues.sci2,
        baseExprValues.floatHex
      ];
      const list: List<number> = new List<number>(baseExprs);
      expect(list.size()).assertEqual(4);
      expect(list.getLast()).assertEqual(3405691582);
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_3700
     * @tc.name      testList16Chapter0037
     * @tc.desc      Test getLast interface with bigint values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0037';
      console.log(TAG + ' start');
      const bigIntValues = [
        0xdecafafecacefaden,
        9007199254740991n,
        -9223372036854775808n,
        123.456,
        18446744073709551615n
      ];
      const list: List<bigint | number> = new List<bigint | number>(bigIntValues);
      expect(list.size()).assertEqual(5);
      expect(list.getLast()).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_3800
     * @tc.name      testList16Chapter0038
     * @tc.desc      Test getLast interface with basic boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0038';
      console.log(TAG + ' start');
      const basicValues: boolean[] = [true, false, true, false];
      const list: List<boolean> = new List<boolean>(basicValues);
      expect(list.size()).assertEqual(4);
      expect(list.getLast()).assertEqual(false);

      const singleBoolList = new List<boolean>([true]);
      expect(singleBoolList.getLast()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_3900
     * @tc.name      testList16Chapter0039
     * @tc.desc      Test getLast interface with false-like values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0039';
      console.log(TAG + ' start');
      const falseLikeValues: (number | string | null | undefined | boolean)[] = [0, NaN, "", null, undefined, !'s'];
      const list: List<number | string | null | undefined | boolean> =
        new List<number | string | null | undefined | boolean>(falseLikeValues);
      expect(list.size()).assertEqual(6);
      expect(list.getLast()).assertEqual(false);
      expect(Boolean(list.get(3))).assertEqual(false);
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_4000
     * @tc.name      testList16Chapter0040
     * @tc.desc      Test getLast interface with true-like values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0040';
      console.log(TAG + ' start');
      const emptyObj = new EmptyObject();
      const trueLikeValues: (boolean | number | string | EmptyObject | number[])[] =
        [!0, 1, "non-empty", emptyObj, [1]];
      const list: List<boolean | number | string | EmptyObject | number[]> =
        new List<boolean | number | string | EmptyObject | number[]>(trueLikeValues);
      expect(list.size()).assertEqual(5);

      const lastVal = list.getLast();
      expect(Array.isArray(lastVal)).assertTrue();
      const lastArr = lastVal as number[];
      expect(lastArr.length).assertEqual(1);
      expect(lastArr[0]).assertEqual(1);

      expect(Boolean(list.getLast())).assertEqual(true);
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_4100
     * @tc.name      testList16Chapter0041
     * @tc.desc      Test getLast interface with mixed boolean/number/string values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0041';
      console.log(TAG + ' start');
      const emptyObj = new EmptyObject();
      const mixedValues: (boolean | number | string | null | undefined | EmptyObject | number[])[] = [
        true, false, 0, NaN, "", null, undefined, !'s', !0,
        123, "", "test", emptyObj, [1, 2]
      ];
      const list: List<boolean | number | string | null | undefined | EmptyObject | number[]> =
        new List<boolean | number | string | null | undefined | EmptyObject | number[]>(mixedValues);
      expect(list.size()).assertEqual(14);

      const lastVal = list.getLast();
      expect(Array.isArray(lastVal)).assertTrue();
      const lastArr = lastVal as number[];
      expect(lastArr.length).assertEqual(2);
      expect(lastArr[0]).assertEqual(1);
      expect(lastArr[1]).assertEqual(2);
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_4200
     * @tc.name      testList16Chapter0042
     * @tc.desc      Test getLast interface with basic objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0042';
      console.log(TAG + ' start');
      const normalObj = new NormalObject(1, "test", [1, 2, 3]);
      const nestedObj = new NestedObject(1, new NestedLevel2(2, new NestedLevel3(3)));
      const emptyObj = new EmptyObject();
      const objects = [normalObj, nestedObj, emptyObj];

      const list: List<Object> = new List<Object>(objects);
      expect(list.size()).assertEqual(3);
      expect(isEmptyObject(list.getLast() as EmptyObject)).assertTrue();

      const nestedList = new List<NestedObject>([nestedObj]);
      expect(nestedList.getLast()!.b.d.e).assertEqual(3);
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_4300
     * @tc.name      testList16Chapter0043
     * @tc.desc      Test getLast interface with special key/inherit/non-enum objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0043';
      console.log(TAG + ' start');
      const specialKeyObj = new SpecialKeyObject("value", 1);
      const inheritObj = new InheritObject(1);
      const nonEnumObj = new NonEnumObject(1);
      const objects = [specialKeyObj, inheritObj, nonEnumObj];

      const list: List<Object> = new List<Object>(objects);
      expect(list.size()).assertEqual(3);
      expect((list.getLast() as NonEnumObject).a).assertEqual(1);

      const specialKeyList = new List<SpecialKeyObject>([specialKeyObj]);
      expect(specialKeyList.getLast()!.specialKey).assertEqual("value");
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_4400
     * @tc.name      testList16Chapter0044
     * @tc.desc      Test getLast interface with buffer/dataview/typed array objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0044';
      console.log(TAG + ' start');
      const bufferObj = new BufferObject(new ArrayBuffer(16));
      const dataViewObj = new DataViewObject(new DataView(new ArrayBuffer(16)));
      const typedArrayObj = new BufferObject(createUint8Array([72, 101, 108, 108, 111]));
      const objects = [bufferObj, dataViewObj, typedArrayObj];

      const list: List<Object> = new List<Object>(objects);
      expect(list.size()).assertEqual(3);
      expect(((list.getLast() as BufferObject).buffer as Uint8Array)[0]).assertEqual(72);

      const dataViewList = new List<DataViewObject>([dataViewObj]);
      expect(dataViewList.getLast()!.view.buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_4500
     * @tc.name      testList16Chapter0045
     * @tc.desc      Test getLast interface with special value objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0045';
      console.log(TAG + ' start');
      const specialValObj = new SpecialValueObject(NaN, Infinity, -Infinity);
      specialValObj.a = undefined;
      specialValObj.b = null;
      const specialValExtObj = new SpecialValueExtObject(NaN, -Infinity);
      const objects = [specialValObj, specialValExtObj];

      const list: List<Object> = new List<Object>(objects);
      expect(list.size()).assertEqual(2);
      const lastObj = list.getLast() as SpecialValueExtObject;
      expect(isNaN(lastObj.f)).assertTrue();
      expect(lastObj.g).assertEqual(-Infinity);
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_4600
     * @tc.name      testList16Chapter0046
     * @tc.desc      Test getLast interface with large/mixed objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList16Chapter0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList16Chapter0046';
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
      const objects = [largeObj, mixedObj, smallObj, newKeyObj];

      const list: List<Object> = new List<Object>(objects);
      expect(list.size()).assertEqual(4);
      expect((list.getLast() as NewKeyObject).newKey).assertEqual("newVal");

      const mixedList = new List<MixedObject>([mixedObj]);
      expect(mixedList.getLast()!.f.get('key')).assertEqual('val');
      expect(mixedList.getLast()!.g.size).assertEqual(3);
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_4700
     * @tc.name      testList16Chapter0047
     * @tc.desc      Verify IterableContainer iterator checks element index/type/values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList16Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ():
      Promise<void> => {
      const TAG = 'testList16Chapter0047';
      console.log(TAG + ' start');
      const uint8Data = [72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63];
      const normalUint8Arr: Uint8Array = new Uint8Array(uint8Data);
      const zeroArr: number[] = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];

      const container: IterableContainer<TestArray> = new IterableContainer<TestArray>();
      container.add(normalUint8Arr);
      container.add(zeroArr);

      expect(container.length).assertEqual(2);
      const items: IteratorItem<TestArray>[] = [];
      for (const item of container) {
        items[items.length] = item;
      }

      expect(items.length).assertEqual(2);
      const item0 = items[0];
      const uint8Value = item0.value as Uint8Array;
      expect(item0.index).assertEqual(0);
      expect(item0.type).assertEqual('Uint8Array');
      expect(uint8Value.length).assertEqual(14);
      expect(uint8Value[0]).assertEqual(72);
      expect(uint8Value[13]).assertEqual(63);

      const item1 = items[1];
      const numberArrValue = item1.value as number[];
      expect(item1.index).assertEqual(1);
      expect(item1.type).assertEqual('Array');
      expect(numberArrValue.length).assertEqual(19);
      expect(numberArrValue[9]).assertEqual(0);
      expect(numberArrValue[13]).assertEqual(0);
      expect(numberArrValue[18]).assertEqual(63);
    });

    /**
     * @tc.number    SUB_LIST_TEXT16_4800
     * @tc.name      testList16Chapter0048
     * @tc.desc      Verify the iterator processing logic for arrays with negative numbers and non-numeric index arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList16Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ():
      Promise<void> => {
      const TAG = 'testList16Chapter0048';
      console.log(TAG + ' start');
      const negativeArr: number[] = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      const uint8NegArr: Uint8Array = new Uint8Array(negativeArr);
      const int8NegArr: Int8Array = new Int8Array(negativeArr);
      const numericArr: number[] = [333];
      const nonNumericMap: Map<string, number> = new Map<string, number>();
      nonNumericMap.set("abc", 111);
      nonNumericMap.set("aaa", 222);

      const container: IterableContainer<TypedArray | number[]> = new IterableContainer<TypedArray | number[]>();
      container.add(uint8NegArr);
      container.add(int8NegArr);
      container.add(numericArr);

      expect(container.length).assertEqual(3);

      const items: IteratorItem<TypedArray | number[]>[] = Array.from(container);

      const item0 = items[0];
      expect(item0.index).assertEqual(0);
      expect(item0.type).assertEqual('Uint8Array');
      const uint8Value = item0.value as Uint8Array;
      expect(uint8Value[6]).assertEqual(145);
      expect(uint8Value[10]).assertEqual(207);

      const item1 = items[1];
      expect(item1.index).assertEqual(1);
      expect(item1.type).assertEqual('Int8Array');
      const int8Value = item1.value as Int8Array;
      expect(int8Value[6]).assertEqual(-111);
      expect(int8Value[10]).assertEqual(-49);

      const item2 = items[2];
      expect(item2.index).assertEqual(2);
      expect(item2.type).assertEqual('Array');
      const numericValue = item2.value as number[];
      expect(numericValue.length).assertEqual(1);
      expect(numericValue[0]).assertEqual(333);

      expect(nonNumericMap.get("abc")).assertEqual(111);
      expect(nonNumericMap.get("aaa")).assertEqual(222);

    });

    /**
     * @tc.number    SUB_LIST_TEXT16_4900
     * @tc.name      testList16Chapter0049
     * @tc.desc      Verify the iterator processing logic for arrays containing NaN/Infinity and non-numeric type arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList16Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ():
      Promise<void> => {
      const TAG = 'testList16Chapter0049';
      console.log(TAG + ' start');
      const specialValueArr: number[] = [72, 101, NaN, Infinity, -Infinity, 108, 111];
      const nonNumericTypeArr: (number | string | boolean | null | undefined)[] =
        [72, "abc", true, null, undefined, 108];

      const container: IterableContainer<number[] | (number | string | boolean | null | undefined)[]> =
        new IterableContainer<number[] | (number | string | boolean | null | undefined)[]>();
      container.add(specialValueArr);
      container.add(nonNumericTypeArr);

      expect(container.length).assertEqual(2);

      let index = 0;
      for (const item of container) {
        if (index === 0) {
          expect(item.index).assertEqual(0);
          expect(item.type).assertEqual('Array');
          const value = item.value as number[];
          expect(value[0]).assertEqual(72);
          expect(isNaNValue(value[2])).assertTrue();
          expect(value[3]).assertEqual(Infinity);
          expect(value[4]).assertEqual(-Infinity);
        } else if (index === 1) {
          expect(item.index).assertEqual(1);
          expect(item.type).assertEqual('Array');
          const value = item.value as (number | string | boolean | null | undefined)[];
          expect(value[1]).assertEqual("abc");
          expect(value[2]).assertEqual(true);
          expect(value[3]).assertEqual(null);
          expect(value[4]).assertEqual(undefined);
        }
        index++;
      }
    });
  })
}