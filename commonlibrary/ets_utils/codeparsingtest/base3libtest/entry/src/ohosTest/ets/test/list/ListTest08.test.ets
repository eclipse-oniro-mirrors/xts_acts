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

  removeByIndex(index: number): T | undefined {
    if (index < 0 || index >= this.data.length) {
      return undefined;
    }
    return this.data.splice(index, 1)[0];
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
interface NumberBaseExprValues {
  hex16: number;
  hex32: number;
  octal: number;
  sci1: number;
  sci2: number;
  exponent: number;
  floatHex: number;
}

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ListTest08() {
  describe('ListTest08', () => {
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
     * @tc.number    SUB_LIST_TEXT08_0100
     * @tc.name      testList08Chapter0001
     * @tc.desc      List.removeByIndex: remove boolean/boolean-like elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0001';
      console.log(TAG + ' start');
      const boolList1 = new List<boolean>([true, false, true, false]);
      expect(boolList1.size()).assertEqual(4);
      const removedFalse = boolList1.removeByIndex(1);
      expect(removedFalse).assertEqual(false);
      expect(boolList1.size()).assertEqual(3);
      expect(boolList1.get(1)).assertEqual(true);
      const falseLikeValues: (number | string | null | undefined | boolean)[] = [0, NaN, "", null, undefined, false];
      const boolList2 = new List<number | string | null | undefined | boolean>(falseLikeValues);
      const removedNull = boolList2.removeByIndex(3);
      expect(removedNull).assertEqual(null);
      expect(boolList2.size()).assertEqual(5);
      expect(boolList2.get(3)).assertEqual(undefined);
      const trueLikeValues: (boolean | number | string | EmptyObject | number[])[] = [true, 1, "non-empty", {}, [1]];
      const boolList3 = new List<boolean | number | string | EmptyObject | number[]>(trueLikeValues);
      const removedArr = boolList3.removeByIndex(4) as number[];
      expect(removedArr.length).assertEqual(1);
      expect(removedArr[0]).assertEqual(1);
      expect(boolList3.size()).assertEqual(4);
      expect(Boolean(boolList3.get(3))).assertEqual(true);
    });

    /**
     * @tc.number    SUB_LIST_TEXT08_0200
     * @tc.name      testList08Chapter0002
     * @tc.desc      List.removeByIndex: remove basic objects (normal/nested/empty)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0002';
      console.log(TAG + ' start');
      const normalObj = new NormalObject(1, "test", [1, 2, 3]);
      const nestedObj = new NestedObject(1, new NestedLevel2(2, new NestedLevel3(3)));
      const emptyObj = new EmptyObject();
      const objList1 = new List<Object>([normalObj, nestedObj, emptyObj]);
      expect(objList1.size()).assertEqual(3);
      const removedNested = objList1.removeByIndex(1);
      expect((removedNested as NestedObject).b.d.e).assertEqual(3);
      expect(objList1.size()).assertEqual(2);
      expect(isEmptyObject(objList1.get(1) as EmptyObject)).assertTrue();
      const removedNormal = objList1.removeByIndex(0);
      expect((removedNormal as NormalObject).a).assertEqual(1);
      expect(objList1.get(0)).assertEqual(emptyObj);
    });

    /**
     * @tc.number    SUB_LIST_TEXT08_0300
     * @tc.name      testList08Chapter0003
     * @tc.desc      List.removeByIndex: remove special objects (special-key/inherited/non-enumerable)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0003';
      console.log(TAG + ' start');
      const specialKeyObj = new SpecialKeyObject("value", 1);
      const inheritObj = new InheritObject(1);
      const nonEnumObj = new NonEnumObject(1);
      const objList2 = new List<Object>([specialKeyObj, inheritObj, nonEnumObj]);
      expect(objList2.size()).assertEqual(3);
      const removedInherit = objList2.removeByIndex(1);
      expect((removedInherit as InheritObject).parentProp).assertEqual(1);
      expect(objList2.size()).assertEqual(2);
      const removedNonEnum = objList2.removeByIndex(1);
      expect((removedNonEnum as NonEnumObject).a).assertEqual(1);
      expect((objList2.get(0) as SpecialKeyObject).specialKey).assertEqual("value");
    });

    /**
     * @tc.number    SUB_LIST_TEXT08_0400
     * @tc.name      testList08Chapter0004
     * @tc.desc      List.removeByIndex: remove buffer objects (ArrayBuffer/DataView/TypedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0004';
      console.log(TAG + ' start');
      const bufferObj = new BufferObject(new ArrayBuffer(16));
      const dataViewObj = new DataViewObject(new DataView(new ArrayBuffer(16)));
      const typedArrayObj = new BufferObject(createUint8Array([72, 101, 108, 108, 111]));
      const newTypedObj = new BufferObject(new Int16Array([1234]));
      const bufferList = new List<Object>([bufferObj, dataViewObj, typedArrayObj, newTypedObj]);
      expect(bufferList.size()).assertEqual(4);
      const removedDataView = bufferList.removeByIndex(1);
      expect((removedDataView as DataViewObject).view.buffer.byteLength).assertEqual(16);
      expect(bufferList.size()).assertEqual(3);
      const removedTyped = bufferList.removeByIndex(1);
      expect(((removedTyped as BufferObject).buffer as Uint8Array)[0]).assertEqual(72);
      expect(bufferList.get(1)).assertEqual(newTypedObj);
      const removedInvalid = bufferList.removeByIndex(5);
      expect(removedInvalid).assertEqual(undefined);
      expect(bufferList.size()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_LIST_TEXT08_0500
     * @tc.name      testList08Chapter0005
     * @tc.desc      List.removeByIndex: remove complex objects (Map/Set/Function/RegExp/Promise)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0005';
      console.log(TAG + ' start');
      const mapObj = new MapObject([['key1', 'value1'], ['key2', new NestedLevel2(1, new NestedLevel3(1))]]);
      const setObj = new SetObject([1, 2, 3, 2, 1]);
      const funcObj = new FuncObject(1, () => "func");
      const regexObj = new RegexObject(/abc/gi);
      const promiseObj = new PromiseObject(new Promise((resolve) => setTimeout(() => resolve('done'), 100)));
      const complexList = new List<Object>([mapObj, setObj, funcObj, regexObj, promiseObj]);
      expect(complexList.size()).assertEqual(5);
      const removedSet = complexList.removeByIndex(1);
      expect((removedSet as SetObject).set.size).assertEqual(3);
      expect(complexList.size()).assertEqual(4);
      const removedFunc = complexList.removeByIndex(1);
      expect((removedFunc as FuncObject).b()).assertEqual("func");
      expect(complexList.get(1)).assertEqual(regexObj);
      const removedPromise = complexList.removeByIndex(2);
      expect(removedPromise !== undefined).assertTrue();
      expect(removedPromise instanceof PromiseObject).assertTrue();
      expect(complexList.size()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_LIST_TEXT08_0600
     * @tc.name      testList08Chapter0006
     * @tc.desc      List.removeByIndex: remove special-value/large/mixed objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0006';
      console.log(TAG + ' start')
      const specialValObj = new SpecialValueObject(NaN, Infinity, -Infinity);
      specialValObj.a = undefined;
      specialValObj.b = null;
      const specialValExtObj = new SpecialValueExtObject(NaN, -Infinity);
      const largeObj = new LargeObject(10000);
      const mixedObj = new MixedObject(
        123, "test", true, null,
        new NestedLevel2(456, new NestedLevel3(0)),
        new Map([['key', 'val']]),
        new Set([1, 2, 3]),
        /abc/,
        new ArrayBuffer(8)
      );

      const specialList = new List<Object>([specialValObj, specialValExtObj, largeObj, mixedObj]);
      expect(specialList.size()).assertEqual(4);
      const removedSpecialExt = specialList.removeByIndex(1);
      expect(isNaN((removedSpecialExt as SpecialValueExtObject).f)).assertTrue();
      expect(specialList.size()).assertEqual(3);
      const removedLarge = specialList.removeByIndex(1);
      expect((removedLarge as LargeObject).getPropertyCount()).assertEqual(10000);
      expect((specialList.get(1) as MixedObject).g.size).assertEqual(3);
      const removedMixed = specialList.removeByIndex(1);
      expect((removedMixed as MixedObject).i.byteLength).assertEqual(8);
      expect(specialList.get(0)).assertEqual(specialValObj);
    });

    /**
     * @tc.number    SUB_LIST_TEXT08_0700
     * @tc.name      testList08Chapter0007
     * @tc.desc      List.removeByIndex: edge cases (empty/single-element/continuous removal/invalid index)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0007';
      console.log(TAG + ' start');
      const emptyList = new List<number>();
      const removedEmpty = emptyList.removeByIndex(0);
      expect(removedEmpty).assertEqual(undefined);
      expect(emptyList.isEmpty()).assertTrue();
      const singleList = new List<string>(['only']);
      const removedSingle = singleList.removeByIndex(0);
      expect(removedSingle).assertEqual('only');
      expect(singleList.size()).assertEqual(0);
      const multiList = new List<number>([1, 2, 3, 4, 5]);
      multiList.removeByIndex(2);
      multiList.removeByIndex(0);
      multiList.removeByIndex(2);
      expect(multiList.size()).assertEqual(2);
      expect(multiList.get(0)).assertEqual(2);
      expect(multiList.get(1)).assertEqual(4);
      const invalidList = new List<string>(['a', 'b', 'c']);
      const removedNeg = invalidList.removeByIndex(-2);
      const removedOver = invalidList.removeByIndex(10);
      expect(removedNeg).assertEqual(undefined);
      expect(removedOver).assertEqual(undefined);
      expect(invalidList.size()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_LIST_TEXT08_0800
     * @tc.name      testList08Chapter0008
     * @tc.desc      List.removeByIndex: remove mixed-type element lists
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0008';
      console.log(TAG + ' start');
      const mixedValues: (string | number | boolean | Object | null | undefined)[] = [
        'test', 123, true,
        new NormalObject(2, "mix", [4,5]),
        null, undefined,
        new RegexObject(/mix/),
        BigInt(987654321n)
      ];
      const mixedList = new List<string | number | boolean | Object | null | undefined | bigint>(mixedValues);
      expect(mixedList.size()).assertEqual(8);
      const removedNull = mixedList.removeByIndex(4);
      expect(removedNull).assertEqual(null);
      expect(mixedList.get(4)).assertEqual(undefined);
      const removedRegex = mixedList.removeByIndex(5);
      expect((removedRegex as RegexObject).regex.test('mix')).assertTrue();
      expect(mixedList.size()).assertEqual(6);
      const removedBigInt = mixedList.removeByIndex(5);
      expect(removedBigInt).assertEqual(987654321n);
      expect(mixedList.get(4)).assertEqual(undefined);
      expect(mixedList.get(0)).assertEqual('test');
      expect(mixedList.get(1)).assertEqual(123);
      expect(mixedList.get(2)).assertEqual(true);
      expect((mixedList.get(3) as NormalObject).a).assertEqual(2);
    });

    /**
     * @tc.number    SUB_LIST_TEXT08_0900
     * @tc.name      testList08Chapter0009
     * @tc.desc      List.removeByIndex: remove special-value-inserted/small/new-key objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0009';
      console.log(TAG + ' start');
      const insertObj1 = new SpecialValueInsertObject(undefined, undefined, undefined, null);
      const insertObj2 = new SpecialValueInsertObject(NaN);
      const insertObj3 = new SpecialValueInsertObject(undefined, Infinity);
      const smallObj = new SmallObject(99);
      const newKeyObj = new NewKeyObject("testNewKey");
      const specialInsertList = new List<Object>([insertObj1, insertObj2, smallObj, insertObj3, newKeyObj]);
      expect(specialInsertList.size()).assertEqual(5);
      const removedSmall = specialInsertList.removeByIndex(2);
      expect((removedSmall as SmallObject).small).assertEqual(99);
      expect(specialInsertList.size()).assertEqual(4);
      const removedInsert1 = specialInsertList.removeByIndex(0);
      expect((removedInsert1 as SpecialValueInsertObject).h).assertEqual(undefined);
      expect((removedInsert1 as SpecialValueInsertObject).i).assertEqual(null);
      const removedNewKey = specialInsertList.removeByIndex(2);
      expect(removedNewKey !== undefined).assertTrue();
      expect((removedNewKey as NewKeyObject).newKey).assertEqual("testNewKey");
      expect(specialInsertList.size()).assertEqual(2);
      expect(isNaN((specialInsertList.get(0) as SpecialValueInsertObject).j)).assertTrue();
      expect((specialInsertList.get(1) as SpecialValueInsertObject).k).assertEqual(Infinity);
    });

    /**
     * @tc.number    SUB_LIST_TEXT08_1000
     * @tc.name      testList08Chapter0010
     * @tc.desc      List.removeByIndex: remove numeric expressions (hex/octal/scientific)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0010';
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
      const exprList = new List<number>([
        baseExprValues.hex16,
        baseExprValues.octal,
        baseExprValues.sci1,
        baseExprValues.exponent,
        baseExprValues.floatHex
      ]);
      expect(exprList.size()).assertEqual(5);
      const removedSci = exprList.removeByIndex(2);
      expect(removedSci).assertEqual(1000);
      expect(exprList.size()).assertEqual(4);
      const removedHex = exprList.removeByIndex(0);
      expect(removedHex).assertEqual(258);
      const removedFloatHex = exprList.removeByIndex(2);
      expect(removedFloatHex).assertEqual(3405691582);
      expect(exprList.size()).assertEqual(2);
      expect(exprList.get(0)).assertEqual(3);
      expect(exprList.get(1)).assertEqual(8);
    });

    /**
     * @tc.number    SUB_LIST_TEXT08_1100
     * @tc.name      testList08Chapter0011
     * @tc.desc      List.removeByIndex: remove boolean-like elements (falsy/truthy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0011';
      console.log(TAG + ' start');
      const falseLikeValues: (number | string | null | undefined | boolean)[] = [0, NaN, "", null, undefined, false];
      const falseList = new List<number | string | null | undefined | boolean>(falseLikeValues);
      expect(falseList.size()).assertEqual(6);
      const removedNull = falseList.removeByIndex(3);
      expect(removedNull).assertEqual(null);
      expect(falseList.size()).assertEqual(5);
      const removedNaN = falseList.removeByIndex(1);
      expect(isNaN(removedNaN as number)).assertTrue();
      const trueLikeValues: (boolean | number | string | EmptyObject
        | number[])[] = [true, 1, "non-empty", {}, [1,2,3]];
      const trueList = new List<boolean | number | string | EmptyObject | number[]>(trueLikeValues);
      expect(trueList.size()).assertEqual(5);
      const removedArr = trueList.removeByIndex(4);
      expect((removedArr as number[]).length).assertEqual(3);
      expect((removedArr as number[])[1]).assertEqual(2);
      expect(Boolean(trueList.get(0))).assertTrue();
      expect(Boolean(trueList.get(3))).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEXT08_1200
     * @tc.name      testList08Chapter0012
     * @tc.desc      List.removeByIndex: edge cases (max index/continuous head-tail removal)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0012';
      console.log(TAG + ' start');
      const maxIndexList = new List<string>(['a', 'b', 'c', 'd', 'e']);
      const maxIndex = maxIndexList.size() - 1;
      const removedMaxIdx = maxIndexList.removeByIndex(maxIndex);
      expect(removedMaxIdx).assertEqual('e');
      expect(maxIndexList.size()).assertEqual(4);
      expect(maxIndexList.get(maxIndex - 1)).assertEqual('d');
      const headTailList = new List<number>([10, 20, 30, 40, 50]);
      headTailList.removeByIndex(0);
      headTailList.removeByIndex(0);
      expect(headTailList.get(0)).assertEqual(30);
      headTailList.removeByIndex(headTailList.size() - 1);
      headTailList.removeByIndex(headTailList.size() - 1);
      expect(headTailList.size()).assertEqual(1);
      expect(headTailList.get(0)).assertEqual(30);
      const emptyRepeatList = new List<boolean>();
      const remove1 = emptyRepeatList.removeByIndex(0);
      const remove2 = emptyRepeatList.removeByIndex(-1);
      const remove3 = emptyRepeatList.removeByIndex(100);
      expect(remove1).assertEqual(undefined);
      expect(remove2).assertEqual(undefined);
      expect(remove3).assertEqual(undefined);
      expect(emptyRepeatList.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEXT08_1300
     * @tc.name      testList08Chapter0013
     * @tc.desc      List.removeByIndex: remove complex mixed-type elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0013';
      console.log(TAG + ' start');
      const complexMixedValues: (string | number | bigint | boolean | Object | null | undefined)[] = [
        'emoji😊',
        BigInt(9007199254740991n),
        new MapObject([['mixKey', 'mixVal']]),
        3.1415926,
        null,
        new FuncObject(2, () => "mixedFunc"),
        true,
        new BufferObject(createUint8Array([1,2,3])),
        undefined,
        new RegexObject(/mixed/i)
      ];
      const complexMixedList = new List<string | number | bigint | boolean
        | Object | null | undefined>(complexMixedValues);
      expect(complexMixedList.size()).assertEqual(10);
      const removedBigInt = complexMixedList.removeByIndex(1);
      expect(removedBigInt !== undefined).assertTrue();
      expect(removedBigInt as bigint).assertEqual(9007199254740991n);
      const removedFunc = complexMixedList.removeByIndex(4);
      expect(removedFunc !== undefined).assertTrue();
      expect((removedFunc as FuncObject).b()).assertEqual("mixedFunc");
      const removedBuffer = complexMixedList.removeByIndex(5);
      expect(removedBuffer !== undefined).assertTrue();
      expect(((removedBuffer as BufferObject).buffer as Uint8Array)[2]).assertEqual(3);
      const removedRegex = complexMixedList.removeByIndex(6);
      expect(removedRegex !== undefined).assertTrue();
      expect((removedRegex as RegexObject).regex.flags).assertEqual('i');
      expect(complexMixedList.size()).assertEqual(6);
      const firstItem = complexMixedList.get(0);
      expect(firstItem !== undefined).assertTrue();
      expect(firstItem).assertEqual('emoji😊');
      const mapItem = complexMixedList.get(1);
      expect(mapItem !== undefined).assertTrue();
      expect((mapItem as MapObject).map.get('mixKey')).assertEqual('mixVal');
    });

    /**
     * @tc.number    SUB_LIST_TEXT08_1400
     * @tc.name      testList08Chapter0014
     * @tc.desc      List.removeByIndex: remove inherited/non-enumerable/special-key objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0014';
      console.log(TAG + ' start');
      const specialKeyObj1 = new SpecialKeyObject("key1", 10);
      const specialKeyObj2 = new SpecialKeyObject("key2", 20);
      const inheritObj = new InheritObject(30);
      const nonEnumObj = new NonEnumObject(40);
      const inheritNonEnumList = new List<Object>([specialKeyObj1, inheritObj, nonEnumObj, specialKeyObj2]);
      expect(inheritNonEnumList.size()).assertEqual(4);
      const removedNonEnum = inheritNonEnumList.removeByIndex(2);
      expect((removedNonEnum as NonEnumObject).a).assertEqual(40);
      expect(inheritNonEnumList.size()).assertEqual(3);
      const removedInherit = inheritNonEnumList.removeByIndex(1);
      expect((removedInherit as InheritObject).parentProp).assertEqual(30);
      expect((inheritNonEnumList.get(0) as SpecialKeyObject).specialKey).assertEqual("key1");
      expect((inheritNonEnumList.get(1) as SpecialKeyObject).a).assertEqual(20);
    });

    /**
     * @tc.number    SUB_LIST_TEXT08_1500
     * @tc.name      testList08Chapter0015
     * @tc.desc      List.removeByIndex: extreme cases (ultra-large/duplicate/cyclic removal)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0015';
      console.log(TAG + ' start');
      const largeSize = 1000;
      const largeList = new List<number>();
      for (let i = 0; i < largeSize; i++) {
        largeList.add(i);
      }
      expect(largeList.size()).assertEqual(largeSize);
      const middleIndex = 500;
      const removedMiddle = largeList.removeByIndex(middleIndex);
      expect(removedMiddle).assertEqual(middleIndex);
      expect(largeList.size()).assertEqual(largeSize - 1);
      expect(largeList.get(middleIndex)).assertEqual(middleIndex + 1);
      const repeatList = new List<string>(['a', 'a', 'a', 'a', 'a']);
      repeatList.removeByIndex(2);
      expect(repeatList.size()).assertEqual(4);
      for (let i = 0; i < repeatList.size(); i++) {
        expect(repeatList.get(i)).assertEqual('a');
      }
      const cycleList = new List<number>([1,2,3,4,5]);
      const originalSize = cycleList.size();
      for (let i = 0; i < originalSize; i++) {
        cycleList.removeByIndex(0);
      }
      expect(cycleList.isEmpty()).assertTrue();
      expect(cycleList.removeByIndex(0)).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEXT080_1600
     * @tc.name      testList08Chapter0016
     * @tc.desc      List.remove: remove normal/zero-filled Uint8Array/number arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0016';
      console.log(TAG + ' start');

      const normalUint8Arr: Uint8Array = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);
      const zeroArr: number[] = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];
      type TestArray = Uint8Array | number[];
      const list: List<TestArray> = new List<TestArray>();
      list.add(normalUint8Arr);
      list.add(zeroArr);
      expect(list.length).assertEqual(2);
      expect(list.get(0)! as Uint8Array).assertEqual(normalUint8Arr);
      expect(list.get(1)! as number[]).assertEqual(zeroArr);

      const removeResult1: boolean = list.remove(normalUint8Arr);
      expect(removeResult1).assertTrue();
      expect(list.length).assertEqual(1);
      expect(list.get(0)! as number[]).assertEqual(zeroArr);
      const removeResult2: boolean = list.remove(zeroArr);
      expect(removeResult2).assertTrue();
      expect(list.length).assertEqual(0);

      const nonExistentArr: Uint8Array = new Uint8Array([1, 2, 3]);
      const removeResult3: boolean = list.remove(nonExistentArr);
      expect(removeResult3).assertFalse();
      expect(list.length).assertEqual(0);

      list.add(normalUint8Arr);
      list.add(zeroArr);
      const item0: Uint8Array = list.get(0)! as Uint8Array;
      expect(item0.length).assertEqual(14);
      expect(item0[0]).assertEqual(72);
      expect(item0[13]).assertEqual(63);
      const item1: number[] = list.get(1)! as number[];
      expect(item1.length).assertEqual(19);
      expect(item1[9]).assertEqual(0);
      expect(item1[13]).assertEqual(0);
      expect(item1[18]).assertEqual(63);
    });

    /**
     * @tc.number    SUB_LIST_TEXT08_1700
     * @tc.name      testList08Chapter0017
     * @tc.desc      List.remove: remove negative-number/non-numeric-index arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList08Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const TAG = 'testList08Chapter0017';
        console.log(TAG + ' start');

        const negativeArr: number[] = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
        const uint8NegArr: Uint8Array = new Uint8Array(negativeArr);
        const int8NegArr: Int8Array = new Int8Array(negativeArr);
        const numericArr: number[] = [333];
        const nonNumericMap: Map<string, number> = new Map<string, number>();
        nonNumericMap.set("abc", 111);
        nonNumericMap.set("aaa", 222);
        type TypedArray = Uint8Array | Int8Array;
        const list: List<TypedArray | number[]> = new List<TypedArray | number[]>();
        list.add(uint8NegArr);
        list.add(int8NegArr);
        list.add(numericArr);

        expect(list.length).assertEqual(3);
        expect(list.get(0) as Uint8Array).assertEqual(uint8NegArr);
        expect(list.get(1) as Int8Array).assertEqual(int8NegArr);
        expect(list.get(2) as number[]).assertEqual(numericArr);

        const removeResult1: boolean = list.remove(int8NegArr);
        expect(removeResult1).assertTrue();
        expect(list.length).assertEqual(2);
        expect(list.get(0) as Uint8Array).assertEqual(uint8NegArr);
        expect(list.get(1) as number[]).assertEqual(numericArr);

        const removeResult2: boolean = list.remove(uint8NegArr);
        expect(removeResult2).assertTrue();
        expect(list.length).assertEqual(1);
        expect(list.get(0) as number[]).assertEqual(numericArr);

        const item: Uint8Array = new Uint8Array(negativeArr);
        expect(item[6]).assertEqual(145);
        expect(item[10]).assertEqual(207);
        const int8Item: Int8Array = new Int8Array(negativeArr);
        expect(int8Item[6]).assertEqual(-111);
        expect(int8Item[10]).assertEqual(-49);
        expect(numericArr[0]).assertEqual(333);
        expect(nonNumericMap.get("abc")).assertEqual(111);
        expect(nonNumericMap.get("aaa")).assertEqual(222);
      });

    /**
     * @tc.number    SUB_LIST_TEXT08_1800
     * @tc.name      testList08Chapter0018
     * @tc.desc      List.remove: remove NaN/Infinity/non-numeric type arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList08Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const TAG = 'testList08Chapter0018';
        console.log(TAG + ' start');
        const specialValueArr: number[] = [72, 101, NaN, Infinity, -Infinity, 108, 111];
        const nonNumericTypeArr: (number | string | boolean | null | undefined)[] =
          [72, "abc", true, null, undefined, 108];
        const list: List<number[] | (number | string | boolean | null | undefined)[]> =
          new List<number[] | (number | string | boolean | null | undefined)[]>();
        list.add(specialValueArr);
        list.add(nonNumericTypeArr);
        expect(list.length).assertEqual(2);
        const removeResult: boolean = list.remove(nonNumericTypeArr);
        expect(removeResult).assertTrue();
        expect(list.length).assertEqual(1);
        expect(list.get(0) as number[]).assertEqual(specialValueArr);
        const item0: number[] = list.get(0) as number[];
        expect(item0[0]).assertEqual(72);
        expect(isNaN(item0[2])).assertTrue();
        expect(item0[3]).assertEqual(Infinity);
        expect(item0[4]).assertEqual(-Infinity);
        const removeResult2: boolean = list.remove(specialValueArr);
        expect(removeResult2).assertTrue();
        expect(list.length).assertEqual(0);
      });

    /**
     * @tc.number    SUB_LIST_TEXT08_1900
     * @tc.name      testList08Chapter0019
     * @tc.desc      List.remove: remove empty/overflow-value arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList08Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const TAG = 'testList08Chapter0019';
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

        const removeResult1: boolean = list.remove(emptyArr);
        expect(removeResult1).assertTrue();
        expect(list.length).assertEqual(2);
        expect(list.get(0) as number[]).assertEqual(overflowArr);

        const removeResult2: boolean = list.remove(overflowArr);
        expect(removeResult2).assertTrue();
        expect(list.length).assertEqual(1);
        expect(list.get(0) as number[]).assertEqual(deletedArr);

        const item2: number[] = list.get(0) as number[];
        expect(item2.length).assertEqual(2);
        expect(item2[0]).assertEqual(1);
        expect(item2[1]).assertEqual(3);

        const removeResult3: boolean = list.remove(deletedArr);
        expect(removeResult3).assertTrue();
        expect(list.length).assertEqual(0);
      });

    /**
     * @tc.number    SUB_LIST_TEXT08_2000
     * @tc.name      testList08Chapter0020
     * @tc.desc      List.remove: remove nested/TypedArray-sub/ultra-long arrays
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("testList08Chapter0020", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async (): Promise<void> => {
      const TAG = 'testList08Chapter0020';
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
      expect(nestedList.length).assertEqual(1);
      const typedList: List<TypedArray[]> = new List<TypedArray[]>();
      typedList.add(typedSubArr);
      expect(typedList.length).assertEqual(1);
      const largeList: List<number[]> = new List<number[]>();
      largeList.add(largeArr);
      expect(largeList.length).assertEqual(1);
      const removeNested: boolean = nestedList.remove(nestedArr);
      expect(removeNested).assertTrue();
      expect(nestedList.length).assertEqual(0);
      const removeTyped: boolean = typedList.remove(typedSubArr);
      expect(removeTyped).assertTrue();
      expect(typedList.length).assertEqual(0);
      const removeLarge: boolean = largeList.remove(largeArr);
      expect(removeLarge).assertTrue();
      expect(largeList.length).assertEqual(0);
      nestedList.add(nestedArr);
      const item0: (number | number[] | (number | number[])[])[] = nestedList.get(0)!;
      expect(item0[0] as number).assertEqual(1);
      expect((item0[1] as number[])[1]).assertEqual(3);
      expect(((item0[2] as (number | number[])[])[1] as number[])[0]).assertEqual(5);
      typedList.add(typedSubArr);
      const item1: TypedArray[] = typedList.get(0)!;
      expect((item1[0] as Int32Array)[0]).assertEqual(10);
      expect((item1[1] as Float64Array)[1]).assertClose(6.28, 0.01);
      largeList.add(largeArr);
      const item2: number[] = largeList.get(0)!;
      expect(item2.length).assertEqual(1000000);
      expect(item2[0]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_LIST_TEXT08_2100
     * @tc.name      testList08Chapter0021
     * @tc.desc      List.remove: remove function/keyword/Symbol-included arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testList08Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const TAG = 'testList08Chapter0021';
        console.log(TAG + ' start');
        type MixedElement = (() => string) | string;
        const func: () => string = () => "testResult";
        const mixedTypeArr: MixedElement[] = [func, "0", "NaN", ""];
        const list: List<MixedElement[]> = new List<MixedElement[]>();
        list.add(mixedTypeArr);
        expect(list.length).assertEqual(1);
        const item0: MixedElement[] = list.get(0)!;
        expect((item0[0] as () => string)()).assertEqual("testResult");
        expect(item0[1] as string).assertEqual("0");
        expect(item0[2] as string).assertEqual("NaN");
        expect(item0[3] as string).assertEqual("");
        const removeResult: boolean = list.remove(mixedTypeArr);
        expect(removeResult).assertTrue();
        expect(list.length).assertEqual(0);
        const fakeArr: MixedElement[] = [() => "fake", "1"];
        const removeResult2: boolean = list.remove(fakeArr);
        expect(removeResult2).assertFalse();
      });

    /**
     * @tc.number    SUB_LIST_TEXT08_2200
     * @tc.name      testList08Chapter0022
     * @tc.desc      List.remove: remove normal/special-char/empty strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0022';
      console.log(TAG + ' start');
      const list1 = new List<string>(['undefined', 'null', '', 'test']);
      expect(list1.remove(0)).assertEqual('undefined');
      expect(list1.size()).assertEqual(3);
      expect(list1.get(0)).assertEqual('null');
      const specialChars = ['!"#$%', '&\'()', '*+,-.', '/:;<='];
      const list2 = new List<string>(specialChars);
      expect(list2.remove(2)).assertEqual('*+,-.');
      expect(list2.size()).assertEqual(3);
      expect(list2.get(2)).assertEqual('/:;<=');
      const list3 = new List<string>(['', 'non-empty']);
      expect(list3.remove(0)).assertEqual('');
      expect(list3.size()).assertEqual(1);
      expect(list3.get(0)).assertEqual('non-empty');
      const list4 = new List<string>(['a', 'b']);
      expect(list4.remove(-1)).assertEqual(undefined);
      expect(list4.remove(5)).assertEqual(undefined);
      expect(list4.size()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_LIST_TEXT08_2300
     * @tc.name      testList08Chapter0023
     * @tc.desc      List.remove: remove escape-char/emoji/ultra-long strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0023';
      console.log(TAG + ' start');
      const escapeChars = ['\n', '\r', '\t', '\\', '\''];
      const list1 = new List<string>(escapeChars);
      expect(list1.remove(3)).assertEqual('\\');
      expect(list1.size()).assertEqual(4);
      expect(list1.get(3)).assertEqual('\'');
      const emojis = ['👆', '👿', '👀', '💯', '🎅'];
      const list2 = new List<string>(emojis);
      expect(list2.remove(1)).assertEqual('👿');
      expect(list2.size()).assertEqual(4);
      expect(list2.get(1)).assertEqual('👀');
      const bigStr = 'a'.repeat(10000);
      const list3 = new List<string>(['short', bigStr, 'medium']);
      expect(list3.remove(1)).assertEqual(bigStr);
      expect(list3.size()).assertEqual(2);
      expect(list3.get(1)).assertEqual('medium');
      const invalidUnicode = '\udc04\ud83d\udff4';
      const list4 = new List<string>([invalidUnicode, 'valid']);
      expect(list4.remove(0)).assertEqual(invalidUnicode);
      expect(list4.size()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_LIST_TEXT08_2400
     * @tc.name      testList08Chapter0024
     * @tc.desc      List.remove: remove basic/extreme/special numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0024';
      console.log(TAG + ' start');
      const basicNums = [0, NaN, -0, Infinity, -Infinity, undefined];
      const list1 = new List<number | undefined>(basicNums);
      const removedVal = list1.remove(1);
      expect(isNaN(removedVal as number)).assertTrue();
      expect(list1.size()).assertEqual(5);
      expect(list1.get(1)).assertEqual(-0);
      const extremeNums = [Number.MAX_VALUE, Number.MIN_VALUE, Number.EPSILON, Number.MAX_SAFE_INTEGER];
      const list2 = new List<number>(extremeNums);
      expect(list2.remove(2)).assertEqual(Number.EPSILON);
      expect(list2.size()).assertEqual(3);
      expect(list2.get(2)).assertEqual(Number.MAX_SAFE_INTEGER);
      const baseNums = [0x0102, 0o3, 1e3, 2 ** 3];
      const list3 = new List<number>(baseNums);
      expect(list3.remove(1)).assertEqual(3);
      expect(list3.size()).assertEqual(3);
      expect(list3.get(1)).assertEqual(1000);
      const bigInts = [100n, -9223372036854775808n, 18446744073709551615n];
      const list4 = new List<bigint>(bigInts);
      expect(list4.remove(1)).assertEqual(-9223372036854775808n);
      expect(list4.size()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_LIST_TEXT08_2500
     * @tc.name      testList08Chapter0025
     * @tc.desc      List.remove: remove boolean/boolean-like values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0025';
      console.log(TAG + ' start');
      const booleans = [true, false, true, false];
      const list1 = new List<boolean>(booleans);
      expect(list1.remove(2)).assertEqual(true);
      expect(list1.size()).assertEqual(3);
      expect(list1.get(2)).assertEqual(false);
      const boolLike = [0, 1, "", "non-empty", null, undefined];
      const list2 = new List<number | string | null | undefined>(boolLike);
      expect(list2.remove(3)).assertEqual("non-empty");
      expect(list2.size()).assertEqual(5);
      expect(Boolean(list2.get(3))).assertEqual(false);
      const mixedBool = [true, 0, false, "test", null];
      const list3 = new List<boolean | number | string | null>(mixedBool);
      expect(list3.remove(1)).assertEqual(0);
      expect(list3.size()).assertEqual(4);
      expect(list3.get(1)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_LIST_TEXT5_2600
     * @tc.name      testList08Chapter0026
     * @tc.desc      List.remove: remove normal/nested/empty objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0026';
      console.log(TAG + ' start');
      const normalObj = new NormalObject(1, "test", [1,2,3]);
      const list1 = new List<NormalObject>([normalObj, new NormalObject(2, "test2", [4,5,6])]);
      const removedNormal = list1.remove(0);
      expect(removedNormal?.a).assertEqual(1);
      expect(removedNormal?.b).assertEqual("test");
      expect(list1.size()).assertEqual(1);
      const nestedObj = new NestedObject(1, new NestedLevel2(2, new NestedLevel3(3)));
      const list2 = new List<NestedObject>([new NestedObject(0, new NestedLevel2(0, new NestedLevel3(0))), nestedObj]);
      const removedNested = list2.remove(1);
      expect(removedNested?.b.d.e).assertEqual(3);
      expect(list2.size()).assertEqual(1);
      const emptyObj = new EmptyObject();
      const list3 = new List<EmptyObject>([emptyObj, new EmptyObject()]);
      const removedEmpty = list3.remove(0);
      expect(isEmptyObject(removedEmpty!)).assertTrue();
      expect(list3.size()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_LIST_TEXT08_2700
     * @tc.name      testList08Chapter0027
     * @tc.desc      List.remove: remove special-key/inherited/buffer objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0027';
      console.log(TAG + ' start');
      const specialKeyObj = new SpecialKeyObject("value", 1);
      const list1 = new List<SpecialKeyObject>([specialKeyObj, new SpecialKeyObject("value2", 2)]);
      expect(list1.remove(0)?.specialKey).assertEqual("value");
      expect(list1.size()).assertEqual(1);
      const inheritObj = new InheritObject(100);
      const list2 = new List<InheritObject>([new InheritObject(50), inheritObj]);
      expect(list2.remove(1)?.parentProp).assertEqual(100);
      expect(list2.size()).assertEqual(1);
      const bufferObj = new BufferObject(new ArrayBuffer(16));
      const typedArray = new BufferObject(createUint8Array([72,101,108,108,111]));
      const list3 = new List<BufferObject>([bufferObj, typedArray]);
      const removedBuffer = list3.remove(1);
      expect(((removedBuffer?.buffer as Uint8Array)[0])).assertEqual(72);
      expect(list3.size()).assertEqual(1);
      const dataViewObj = new DataViewObject(new DataView(new ArrayBuffer(16)));
      const list4 = new List<DataViewObject>([new DataViewObject(new DataView(new ArrayBuffer(8))), dataViewObj]);
      expect(list4.remove(1)?.view.buffer.byteLength).assertEqual(16);
      expect(list4.size()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_LIST_TEXT08_2800
     * @tc.name      testList08Chapter0028
     * @tc.desc      List.remove: remove Map/Set/Function/RegExp/Promise complex objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0028';
      console.log(TAG + ' start');
      const mapObj = new MapObject([['key1', 'value1'], ['key2', new NestedLevel2(1, new NestedLevel3(1))]]);
      const list1 = new List<MapObject>([new MapObject([]), mapObj]);
      const removedMap = list1.remove(1);
      expect(removedMap?.map.get('key1')).assertEqual('value1');
      expect(list1.size()).assertEqual(1);
      const setObj = new SetObject([1,2,3]);
      const list2 = new List<SetObject>([new SetObject([4,5]), setObj]);
      expect(list2.remove(1)?.set.size).assertEqual(3);
      expect(list2.size()).assertEqual(1);
      const funcObj = new FuncObject(1, () => "testFunc");
      const list3 = new List<FuncObject>([new FuncObject(2, () => "empty"), funcObj]);
      expect(list3.remove(1)?.b()).assertEqual("testFunc");
      expect(list3.size()).assertEqual(1);
      const regexObj = new RegexObject(/abc/gi);
      const list4 = new List<RegexObject>([new RegexObject(/^$/), regexObj]);
      expect(list4.remove(1)?.regex.flags).assertEqual('gi');
      expect(list4.size()).assertEqual(1);
      const promiseObj = new PromiseObject(Promise.resolve("done"));
      const list5 = new List<PromiseObject>([new PromiseObject(Promise.resolve("")), promiseObj]);
      const removedPromise = list5.remove(1);
      expect(removedPromise?.promise !== undefined).assertTrue();
      expect(list5.size()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_LIST_TEXT6_2900
     * @tc.name      testList08Chapter0029
     * @tc.desc      List.remove: remove special-value/large/mixed objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0029';
      console.log(TAG + ' start');
      const specialValObj = new SpecialValueObject(NaN, Infinity, -Infinity);
      specialValObj.a = undefined;
      specialValObj.b = null;
      const list1 = new List<SpecialValueObject>([new SpecialValueObject(0, 0, 0), specialValObj]);
      const removedSpecial = list1.remove(1);
      expect(removedSpecial!.a).assertEqual(undefined);
      expect(isNaN(removedSpecial!.c)).assertTrue();
      expect(list1.size()).assertEqual(1);
      const largeObj = new LargeObject(10000);
      const list2 = new List<LargeObject>([new LargeObject(5000), largeObj]);
      expect(list2.remove(1)?.getPropertyCount()).assertEqual(10000);
      expect(list2.size()).assertEqual(1);
      const mixedObj = new MixedObject(
        123, "test", true, null,
        new NestedLevel2(456, new NestedLevel3(0)),
        new Map([['key', 'val']]),
        new Set([1,2,3]),
        /abc/,
        new ArrayBuffer(8)
      );
      const list3 = new List<MixedObject>([new MixedObject(0, "", false, "",
        new NestedLevel2(0, new NestedLevel3(0)), new Map(), new Set(), /^$/, new ArrayBuffer(0)), mixedObj]);
      const removedMixed = list3.remove(1);
      expect(removedMixed?.a).assertEqual(123);
      expect(removedMixed?.f.get('key')).assertEqual('val');
      expect(list3.size()).assertEqual(1);
      const smallObj = new SmallObject(1);
      const newKeyObj = new NewKeyObject("newVal");
      const list4 = new List<Object>([smallObj, newKeyObj]);
      expect((list4.remove(0) as SmallObject).small).assertEqual(1);
      expect((list4.get(0) as NewKeyObject).newKey).assertEqual("newVal");
      expect(list4.size()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_LIST_TEXT08_3000
     * @tc.name      testList08Chapter0030
     * @tc.desc      List.remove: remove boundary-index/empty/single-element lists
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0030';
      console.log(TAG + ' start');
      const emptyList = new List<string>();
      expect(emptyList.remove(0)).assertEqual(undefined);
      expect(emptyList.size()).assertEqual(0);
      const singleList = new List<number>([100]);
      expect(singleList.remove(0)).assertEqual(100);
      expect(singleList.size()).assertEqual(0);
      expect(singleList.isEmpty()).assertTrue();
      const boundaryList = new List<string>(['a', 'b', 'c', 'd']);
      expect(boundaryList.remove(3)).assertEqual('d');
      expect(boundaryList.size()).assertEqual(3);
      expect(boundaryList.get(2)).assertEqual('c');
      const multiRemoveList = new List<number>([1,2,3,4,5]);
      multiRemoveList.remove(1);
      multiRemoveList.remove(2);
      expect(multiRemoveList.size()).assertEqual(3);
      expect(multiRemoveList.get(0)).assertEqual(1);
      expect(multiRemoveList.get(1)).assertEqual(3);
      expect(multiRemoveList.get(2)).assertEqual(5);
    });

    /**
     * @tc.number    SUB_LIST_TEXT08_3100
     * @tc.name      testList08Chapter0031
     * @tc.desc      List.remove: remove mixed-data-type elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0031';
      console.log(TAG + ' start');
      const mixedBasic = [100, 'test', true, null, undefined, 3.14];
      const list1 = new List<number | string | boolean | null | undefined>(mixedBasic);
      expect(list1.remove(2)).assertEqual(true);
      expect(list1.size()).assertEqual(5);
      expect(list1.get(2)).assertEqual(null);
      expect(list1.get(4)).assertEqual(3.14);
      const normalObj = new NormalObject(1, "obj", [1,2]);
      const mixedComplex = [123, 'string', normalObj, false, new EmptyObject()];
      const list2 = new List<number | string | NormalObject | boolean | EmptyObject>(mixedComplex);
      const removedObj = list2.remove(2);
      expect((removedObj as NormalObject).a).assertEqual(1);
      expect((removedObj as NormalObject).b).assertEqual("obj");
      expect(list2.size()).assertEqual(4);
      expect(list2.get(2)).assertEqual(false);
      const specialValObj = new SpecialValueObject(NaN, Infinity, -Infinity);
      const mixedSpecial = [specialValObj, 'emoji👀', 999n, new MapObject([])];
      const list3 = new List<SpecialValueObject | string | bigint | MapObject>(mixedSpecial);
      expect(list3.remove(1)).assertEqual('emoji👀');
      expect(list3.size()).assertEqual(3);
      expect((list3.get(0) as SpecialValueObject).d).assertEqual(Infinity);
      expect(list3.get(1)).assertEqual(999n);
    });
    /**
     * @tc.number    SUB_LIST_TEXT08_3200
     * @tc.name      testList08Chapter0032
     * @tc.desc      List.remove: performance/correctness of removing massive elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0032';
      console.log(TAG + ' start');
      const largeBasicList = new List<number>();
      const batchSize = 1000;
      for (let i = 0; i < batchSize; i++) {
        largeBasicList.add(i);
      }
      expect(largeBasicList.size()).assertEqual(batchSize);
      const middleIndex = Math.floor(batchSize / 2);
      expect(largeBasicList.remove(middleIndex)).assertEqual(middleIndex);
      expect(largeBasicList.size()).assertEqual(batchSize - 1);
      expect(largeBasicList.get(middleIndex)).assertEqual(middleIndex + 1);
      for (let i = 0; i < 100; i++) {
        largeBasicList.remove(0);
      }
      expect(largeBasicList.size()).assertEqual(batchSize - 101);
      expect(largeBasicList.get(0)).assertEqual(100);
      for (let i = 0; i < 100; i++) {
        const lastIndex = largeBasicList.size() - 1;
        largeBasicList.remove(lastIndex);
      }
      expect(largeBasicList.size()).assertEqual(batchSize - 201);
      expect(largeBasicList.get(largeBasicList.size() - 1)).assertEqual(batchSize - 101);
    });

    /**
     * @tc.number    SUB_LIST_TEXT08_3300
     * @tc.name      testList08Chapter0033
     * @tc.desc      List.remove: remove Buffer+DataView+Map+Set special object combinations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0033';
      console.log(TAG + ' start');
      const bufferObj = new BufferObject(createUint8Array([1,2,3,4]));
      const dataViewObj = new DataViewObject(new DataView(new ArrayBuffer(8)));
      const mapObj = new MapObject([['key', 'val']]);
      const setObj = new SetObject([10,20,30]);
      const regexObj = new RegexObject(/test/);
      const specialComboList = new List<Object>([bufferObj, dataViewObj, mapObj, setObj, regexObj]);
      expect(specialComboList.size()).assertEqual(5);
      const removedMap = specialComboList.remove(2);
      expect((removedMap as MapObject).map.get('key')).assertEqual('val');
      expect(specialComboList.size()).assertEqual(4);
      expect(specialComboList.get(2)).assertEqual(setObj);
      const removedBuffer = specialComboList.remove(0);
      expect(((removedBuffer as BufferObject).buffer as Uint8Array)[0]).assertEqual(1);
      expect(specialComboList.size()).assertEqual(3);
      const removedRegex = specialComboList.remove(2);
      expect((removedRegex as RegexObject).regex.source).assertEqual('test');
      expect(specialComboList.size()).assertEqual(2);
      expect(specialComboList.get(0)).assertEqual(dataViewObj);
      expect(specialComboList.get(1)).assertEqual(setObj);
    });

    /**
     * @tc.number    SUB_LIST_TEXT08_3400
     * @tc.name      testList08Chapter0034
     * @tc.desc      List.remove: deep property correctness after removing nested objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0034';
      console.log(TAG + ' start');
      const level3_1 = new NestedLevel3(10);
      const level2_1 = new NestedLevel2(20, level3_1);
      const nestedObj1 = new NestedObject(30, level2_1);
      const level3_2 = new NestedLevel3(100);
      const level2_2 = new NestedLevel2(200, level3_2);
      const nestedObj2 = new NestedObject(300, level2_2);
      const nestedObj3 = new NestedObject(400, new NestedLevel2(500, new NestedLevel3(600)));
      const nestedList = new List<NestedObject>([nestedObj1, nestedObj2, nestedObj3]);
      expect(nestedList.size()).assertEqual(3);
      const removedNested = nestedList.remove(1);
      expect(removedNested?.a).assertEqual(300);
      expect(removedNested?.b.c).assertEqual(200);
      expect(removedNested?.b.d.e).assertEqual(100);
      expect(nestedList.size()).assertEqual(2);
      expect(nestedList.get(0)?.b.d.e).assertEqual(10);
      expect(nestedList.get(1)?.b.c).assertEqual(500);
      nestedList.remove(0);
      expect(nestedList.size()).assertEqual(1);
      expect(nestedList.get(0)?.a).assertEqual(400);
      expect(nestedList.get(0)?.b.d.e).assertEqual(600);
    });

    /**
     * @tc.number    SUB_LIST_TEXT08_3500
     * @tc.name      testList08Chapter0035
     * @tc.desc      List.remove: remove undefined/null/NaN/Infinity special-value object combinations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0035';
      console.log(TAG + ' start');
      const obj1 = new SpecialValueObject(NaN, Infinity, -Infinity);
      obj1.a = undefined;
      obj1.b = null;
      const obj2 = new SpecialValueExtObject(NaN, -Infinity);
      const obj3 = new SpecialValueInsertObject(undefined, Infinity, undefined, null);
      const specialValList = new List<SpecialValueObject | SpecialValueExtObject |
      SpecialValueInsertObject>([obj1, obj2, obj3]);
      expect(specialValList.size()).assertEqual(3);
      const removedExt = specialValList.remove(1);
      expect(isNaN((removedExt as SpecialValueExtObject).f)).assertTrue();
      expect((removedExt as SpecialValueExtObject).g).assertEqual(-Infinity);
      expect(specialValList.size()).assertEqual(2);
      expect((specialValList.get(0) as SpecialValueObject).a).assertEqual(undefined);
      expect((specialValList.get(0) as SpecialValueObject).b).assertEqual(null);
      expect(isNaN((specialValList.get(0) as SpecialValueObject).c)).assertTrue();
      expect((specialValList.get(1) as SpecialValueInsertObject).h).assertEqual(undefined);
      expect((specialValList.get(1) as SpecialValueInsertObject).i).assertEqual(null);
      expect((specialValList.get(1) as SpecialValueInsertObject).k).assertEqual(Infinity);
      specialValList.remove(0);
      expect(specialValList.size()).assertEqual(1);
      expect((specialValList.get(0) as SpecialValueInsertObject).j).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT08_3600
     * @tc.name      testList08Chapter0036
     * @tc.desc      List.remove: remove Function and Promise objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0036';
      console.log(TAG + ' start');
      const funcObj1 = new FuncObject(1, () => "func1");
      const funcObj2 = new FuncObject(2, () => "func2");
      const promiseObj1 = new PromiseObject(Promise.resolve("promise1"));
      const promiseObj2 = new PromiseObject(Promise.resolve("promise2"));
      const funcPromiseList = new List<FuncObject | PromiseObject>([funcObj1, promiseObj1, funcObj2, promiseObj2]);
      expect(funcPromiseList.size()).assertEqual(4);
      const removedPromise = funcPromiseList.remove(1);
      expect((removedPromise as PromiseObject).promise !== undefined).assertTrue();
      expect(funcPromiseList.size()).assertEqual(3);
      expect(funcPromiseList.get(1)).assertEqual(funcObj2);
      const removedFunc = funcPromiseList.remove(1);
      expect((removedFunc as FuncObject).b()).assertEqual("func2");
      expect(funcPromiseList.size()).assertEqual(2);
      expect(funcPromiseList.get(0)).assertEqual(funcObj1);
      expect(funcPromiseList.get(1)).assertEqual(promiseObj2);
      expect((funcPromiseList.get(0) as FuncObject).b()).assertEqual("func1");
    });

    /**
     * @tc.number    SUB_LIST_TEXT08_3700
     * @tc.name      testList08Chapter0037
     * @tc.desc      List.remove: remove large/small object combinations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0037';
      console.log(TAG + ' start');
      const largeObj = new LargeObject(5000);
      const smallObj1 = new SmallObject(10);
      const smallObj2 = new SmallObject(20);
      const newKeyObj1 = new NewKeyObject("key1");
      const newKeyObj2 = new NewKeyObject("key2");
      const sizeComboList = new List<LargeObject | SmallObject | NewKeyObject>([largeObj, smallObj1, newKeyObj1,
        smallObj2, newKeyObj2]);
      expect(sizeComboList.size()).assertEqual(5);
      const removedLarge = sizeComboList.remove(0);
      expect((removedLarge as LargeObject).getPropertyCount()).assertEqual(5000);
      expect((removedLarge as LargeObject).getProperty("4999")).assertEqual(4999);
      expect(sizeComboList.size()).assertEqual(4);
      const removedNewKey = sizeComboList.remove(1);
      expect((removedNewKey as NewKeyObject).newKey).assertEqual("key1");
      expect(sizeComboList.size()).assertEqual(3);
      expect((sizeComboList.get(0) as SmallObject).small).assertEqual(10);
      expect((sizeComboList.get(1) as SmallObject).small).assertEqual(20);
      expect((sizeComboList.get(2) as NewKeyObject).newKey).assertEqual("key2");
      sizeComboList.remove(2);
      expect(sizeComboList.size()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_LIST_TEXT08_3800
     * @tc.name      testList08Chapter0038
     * @tc.desc      List.remove: continuous removal + boundary index combinations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0038';
      console.log(TAG + ' start');
      const testList = new List<string>(['a', 'b', 'c', 'd', 'e', 'f', 'g']);
      expect(testList.size()).assertEqual(7);
      testList.remove(3);
      testList.remove(3);
      expect(testList.size()).assertEqual(5);
      expect(testList.get(3)).assertEqual('f');
      testList.remove(0);
      testList.remove(testList.size() - 1);
      expect(testList.size()).assertEqual(3);
      expect(testList.get(0)).assertEqual('b');
      expect(testList.get(2)).assertEqual('f');
      expect(testList.remove(10)).assertEqual(undefined);
      expect(testList.remove(-2)).assertEqual(undefined);
      testList.remove(1);
      expect(testList.size()).assertEqual(2);
      expect(testList.get(0)).assertEqual('b');
      expect(testList.get(1)).assertEqual('f');
      testList.remove(0);
      testList.remove(0);
      expect(testList.size()).assertEqual(0);
      expect(testList.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEXT08_3900
     * @tc.name      testList08Chapter0039
     * @tc.desc      List.remove: remove duplicate elements in lists
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0039';
      console.log(TAG + ' start');
      const repeatBasic = ['a', 'a', 'b', 'a', 'c'];
      const list1 = new List<string>(repeatBasic);
      expect(list1.remove(1)).assertEqual('a');
      expect(list1.size()).assertEqual(4);
      expect(list1.get(1)).assertEqual('b');
      expect(list1.get(2)).assertEqual('a');
      const sameObj = new NormalObject(10, "repeat", [1,2]);
      const repeatObj = [sameObj, sameObj, new NormalObject(20, "unique", [3,4]), sameObj];
      const list2 = new List<NormalObject>(repeatObj);
      expect(list2.remove(3)).assertEqual(sameObj);
      expect(list2.size()).assertEqual(3);
      expect((list2.get(0) as NormalObject).a).assertEqual(10);
      expect((list2.get(1) as NormalObject).a).assertEqual(10);
      const repeatSpecial = [NaN, NaN, Infinity, Infinity];
      const list3 = new List<number>(repeatSpecial);
      expect(isNaN(list3.remove(1) ?? NaN)).assertTrue();
      expect(list3.size()).assertEqual(3);
      expect(list3.get(1)).assertEqual(Infinity);
    });

    /**
     * @tc.number    SUB_LIST_TEXT08_4000
     * @tc.name      testList08Chapter0040
     * @tc.desc      List.remove: correctness of cyclic element removal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0040';
      console.log(TAG + ' start');
      const numList = new List<number>([0,1,2,3,4,5,6,7,8,9]);
      const removedEvens: number[] = [];
      for (let i = 0; i < numList.size(); i++) {
        const currentVal = numList.get(i);
        if (currentVal !== undefined && currentVal % 2 !== 0) {
          const removed = numList.remove(i);
          if (removed !== undefined) {
            removedEvens.push(removed);
          }
          i--;
        }
      }
      expect(numList.size()).assertEqual(5);
      expect(numList.get(0)).assertEqual(0);
      expect(numList.get(4)).assertEqual(8);
      const strList = new List<string>(['x', 'y', 'z']);
      while (!strList.isEmpty()) {
        strList.remove(0);
      }
      expect(strList.size()).assertEqual(0);
      expect(strList.get(0)).assertEqual(undefined);
      const objList = new List<SmallObject>([new SmallObject(1), new SmallObject(2), new SmallObject(3),
        new SmallObject(4)]);
      let index = 1;
      while (objList.size() > 2) {
        objList.remove(index);
        index = index % objList.size() || 1;
      }
      expect(objList.size()).assertEqual(2);
      expect((objList.get(0) as SmallObject).small).assertEqual(1);
      expect((objList.get(1) as SmallObject).small).assertEqual(4);
    });

    /**
     * @tc.number    SUB_LIST_TEXT08_4100
     * @tc.name      testList08Chapter0041
     * @tc.desc      List.remove: remove empty/special-key object combinations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList08Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList08Chapter0041';
      console.log(TAG + ' start');

      const emptyObj1 = new EmptyObject();
      const specialKeyObj1 = new SpecialKeyObject("keyA", 100);
      const emptyObj2 = new EmptyObject();
      const specialKeyObj2 = new SpecialKeyObject("keyB", 200);
      const emptyObj3 = new EmptyObject();

      const comboList = new List<Object>([emptyObj1, specialKeyObj1, emptyObj2, specialKeyObj2, emptyObj3]);
      expect(comboList.size()).assertEqual(5);

      const removedEmpty = comboList.remove(2);
      expect(isEmptyObject(removedEmpty as EmptyObject)).assertTrue();
      expect(comboList.size()).assertEqual(4);
      expect(comboList.get(2)).assertEqual(specialKeyObj2);
      const removedSpecialKey = comboList.remove(1);
      expect((removedSpecialKey as SpecialKeyObject).specialKey).assertEqual("keyA");
      expect((removedSpecialKey as SpecialKeyObject).a).assertEqual(100);
      expect(comboList.size()).assertEqual(3);

      expect(isEmptyObject(comboList.get(0) as EmptyObject)).assertTrue();
      expect((comboList.get(1) as SpecialKeyObject).specialKey).assertEqual("keyB");
      expect(isEmptyObject(comboList.get(2) as EmptyObject)).assertTrue();
    });
  })
}