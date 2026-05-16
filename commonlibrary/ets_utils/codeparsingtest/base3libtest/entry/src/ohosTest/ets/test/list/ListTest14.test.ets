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
}
class SpecialKeyObject {
  specialKey: string = "";
  a: number = 0;
  constructor(specialKey: string, a: number) {
    this.specialKey = specialKey;
    this.a = a;
  }
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


class SmallObject {
  small: number = 0;

  constructor(small: number) {
    this.small = small;
  }
}
class NonEnumObject {
  a: number = 0;
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
function isEmptyObject(obj: EmptyObject): boolean {
  return obj instanceof EmptyObject;
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

type TestArray = TypedArray | number[];
interface KeyObj {
  key: string;
}
interface ChildObj {
  parent: NestedCycleObj;
}

interface CycleObj {
  a: number;
  self: CycleObj;
}

interface NestedCycleObj {
  b: number;
  child: ChildObj;
}
function createUint8Array(values: Array<number>): Uint8Array {
  const arr = new Uint8Array(values.length);
  values.forEach((val, idx) => {
    arr[idx] = val;
  });
  return arr;
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
class NewKeyObject {
  newKey: string = "";
  constructor(newKey: string) {
    this.newKey = newKey;
  }
}

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ListTest14() {
  describe('ListTest14', () => {
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
     * @tc.number    SUB_LIST_TEXT14_0100
     * @tc.name      testList14Chapter0001
     * @tc.desc      Test add interface with basic objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0001';
      console.log(TAG + ' start');
      const normalObj = new NormalObject(1, "test", [1, 2, 3]);
      const nestedObj = new NestedObject(1, new NestedLevel2(2, new NestedLevel3(3)));
      const emptyObj = new EmptyObject();
      const listNormal = new List<NormalObject>();
      listNormal.set(0, normalObj);
      expect(listNormal.size()).assertEqual(1);
      expect(listNormal.get(0)!.a).assertEqual(1);
      expect(listNormal.get(0)!.b).assertEqual("test");
      expect(listNormal.get(0)!.c[1]).assertEqual(2);
      const listNested = new List<NestedObject>();
      listNested.set(0, nestedObj);
      expect(listNested.get(0)!.b.d.e).assertEqual(3);
      const listEmpty = new List<EmptyObject>();
      listEmpty.set(0, emptyObj);
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
      listInsert.set(0, normalObj);
      listInsert.insert(1, nestedObj);
      listInsert.insert(0, emptyObj);
      listInsert.insert(5, newObj);
      expect(listInsert.size()).assertEqual(4);
      expect(isEmptyObject(listInsert.get(0) as EmptyObject)).assertTrue();
      expect((listInsert.get(2) as NestedObject).b.d.e).assertEqual(3);
      expect((listInsert.get(3) as NormalObject).a).assertEqual(4);
    });
    /**
     * @tc.number    SUB_LIST_TEXT14_0200
     * @tc.name      testList14Chapter0002
     * @tc.desc      Test add interface with special key/inherit/non-enum objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0002';
      console.log(TAG + ' start');
      const specialKeyObj = new SpecialKeyObject("value", 1);
      const inheritObj = new InheritObject(1);
      const nonEnumObj = new NonEnumObject(1);
      const newSpecialObj = new SpecialKeyObject("newValue", 2);
      const listSpecial = new List<SpecialKeyObject>();
      listSpecial.set(0, specialKeyObj);
      expect(listSpecial.get(0)!.specialKey).assertEqual("value");
      expect(listSpecial.get(0)!.a).assertEqual(1);
      const listInherit = new List<InheritObject>();
      listInherit.set(0, inheritObj);
      expect(listInherit.get(0)!.parentProp).assertEqual(1);
      const listNonEnum = new List<NonEnumObject>();
      listNonEnum.set(0, nonEnumObj);
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
      listInsert.set(0, specialKeyObj);
      listInsert.insert(1, inheritObj);
      listInsert.insert(0, nonEnumObj);
      listInsert.insert(5, newSpecialObj);
      expect(listInsert.size()).assertEqual(4);
      expect((listInsert.get(0) as NonEnumObject).a).assertEqual(1);
      expect((listInsert.get(2) as InheritObject).parentProp).assertEqual(1);
      expect((listInsert.get(3) as SpecialKeyObject).specialKey).assertEqual("newValue");
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_0300
     * @tc.name      testList14Chapter0003
     * @tc.desc      Test add interface with buffer/dataview/typed array objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0003';
      console.log(TAG + ' start');
      const bufferObj = new BufferObject(new ArrayBuffer(16));
      const dataViewObj = new DataViewObject(new DataView(new ArrayBuffer(16)));
      const typedArrayObj = new BufferObject(createUint8Array([72, 101, 108, 108, 111]));
      const newTypedObj = new BufferObject(new Int16Array([1234]));
      const listBuffer = new List<BufferObject>();
      listBuffer.set(0, bufferObj);
      expect((listBuffer.get(0)!.buffer as ArrayBuffer).byteLength).assertEqual(16);
      const listDataView = new List<DataViewObject>();
      listDataView.set(0, dataViewObj);
      expect(listDataView.get(0)!.view.buffer.byteLength).assertEqual(16);
      const listTypedArray = new List<BufferObject>();
      listTypedArray.set(0, typedArrayObj);
      expect((listTypedArray.get(0)!.buffer as Uint8Array)[0]).assertEqual(72);
      const listAdd = new List<Object>();
      listAdd.add(bufferObj);
      listAdd.add(dataViewObj);
      listAdd.add(typedArrayObj);
      expect(listAdd.size()).assertEqual(3);
      expect(((listAdd.get(0) as BufferObject).buffer as ArrayBuffer).byteLength).assertEqual(16);
      expect(((listAdd.get(2) as BufferObject).buffer as Uint8Array).length).assertEqual(5);
      const listInsert = new List<Object>();
      listInsert.set(0, bufferObj);
      listInsert.insert(1, dataViewObj);
      listInsert.insert(0, typedArrayObj);
      listInsert.insert(5, newTypedObj);
      expect(listInsert.size()).assertEqual(4);
      expect(((listInsert.get(0) as BufferObject).buffer as Uint8Array)[1]).assertEqual(101);
      expect((listInsert.get(2) as DataViewObject).view.buffer.byteLength).assertEqual(16);
      expect(((listInsert.get(3) as BufferObject).buffer as Int16Array)[0]).assertEqual(1234);
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_0400
     * @tc.name      testList14Chapter0004
     * @tc.desc      Test add interface with map/set/func/regex/promise objects (improved promise test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testList14Chapter0004';
      console.log(TAG + ' start');
      const mapObj = new MapObject([['key1', 'value1'], ['key2', new NestedLevel2(1, new NestedLevel3(1))]]);
      const setObj = new SetObject([1, 2, 3, 2, 1]);
      const funcObj = new FuncObject(1, () => "func");
      const regexObj = new RegexObject(/abc/gi);
      const testPromise = new Promise<string>((resolve) => setTimeout(() => resolve('done'), 100));
      const promiseObj = new PromiseObject(testPromise);
      const listMap = new List<MapObject>();
      listMap.set(0, mapObj);
      expect(listMap.get(0)!.map.get('key1')).assertEqual('value1');
      expect((listMap.get(0)!.map.get('key2') as NestedLevel2).c).assertEqual(1);
      const listSet = new List<SetObject>();
      listSet.set(0, setObj);
      expect(listSet.get(0)!.set.size).assertEqual(3);
      const listFunc = new List<FuncObject>();
      listFunc.set(0, funcObj);
      expect(listFunc.get(0)!.b()).assertEqual("func");
      const listRegex = new List<RegexObject>();
      listRegex.set(0, regexObj);
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
      listInsert.set(0, mapObj);
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
     * @tc.number    SUB_LIST_TEXT14_0500
     * @tc.name      testList14Chapter0005
     * @tc.desc      Test add interface with special value objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0005';
      console.log(TAG + ' start');
      const specialValObj = new SpecialValueObject(NaN, Infinity, -Infinity);
      specialValObj.a = undefined;
      specialValObj.b = null;
      const specialValExtObj = new SpecialValueExtObject(NaN, -Infinity);
      const insertObj1 = new SpecialValueInsertObject(undefined, undefined, undefined, null);
      const insertObj2 = new SpecialValueInsertObject(NaN);
      const insertObj3 = new SpecialValueInsertObject(undefined, Infinity);
      const listSpecialVal = new List<SpecialValueObject>();
      listSpecialVal.set(0, specialValObj);
      expect(listSpecialVal.get(0)!.a).assertEqual(undefined);
      expect(listSpecialVal.get(0)!.b).assertEqual(null);
      expect(isNaN(listSpecialVal.get(0)!.c)).assertTrue();
      expect(listSpecialVal.get(0)!.e).assertEqual(-Infinity);
      const listAdd = new List<Object>();
      listAdd.add(specialValObj);
      listAdd.add(specialValExtObj);
      expect(listAdd.size()).assertEqual(2);
      expect(isNaN((listAdd.get(1) as SpecialValueExtObject).f)).assertTrue();
      expect((listAdd.get(1) as SpecialValueExtObject).g).assertEqual(-Infinity);
      const listInsert = new List<Object>();
      listInsert.set(0, specialValObj);
      listInsert.insert(1, insertObj1);
      listInsert.insert(0, insertObj2);
      listInsert.insert(5, insertObj3);
      expect(listInsert.size()).assertEqual(4);
      expect(isNaN((listInsert.get(0) as SpecialValueInsertObject).j)).assertTrue();
      expect((listInsert.get(2) as SpecialValueInsertObject).h).assertEqual(undefined);
      expect((listInsert.get(3) as SpecialValueInsertObject).k).assertEqual(Infinity);
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_0600
     * @tc.name      testList14Chapter0006
     * @tc.desc      Test add interface with large/mixed/small/newKey objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0006';
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
      listLarge.set(0, largeObj);
      expect(listLarge.size()).assertEqual(1);
      expect(listLarge.get(0)!.getPropertyCount()).assertEqual(10000);
      expect(listLarge.get(0)!.getProperty("9999")).assertEqual(9999);
      const listMixed = new List<MixedObject>();
      listMixed.set(0, mixedObj);
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
      listInsert.set(0, largeObj);
      listInsert.insert(1, mixedObj);
      listInsert.insert(0, smallObj);
      listInsert.insert(5, newKeyObj);
      expect(listInsert.size()).assertEqual(4);
      expect((listInsert.get(0) as SmallObject).small).assertEqual(1);
      expect((listInsert.get(2) as MixedObject).g.has(2)).assertTrue();
      expect((listInsert.get(3) as NewKeyObject).newKey).assertEqual("newVal");
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_0700
     * @tc.name      testList14Chapter0007
     * @tc.desc      Verify List convertToArray() with Int8/Uint8/Uint8Clamped arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0007';
      console.log(TAG + ' start');
      const list1: List<Int8Array> = new List<Int8Array>();
      const int8Arr1 = new Int8Array([-128]);
      const int8Arr2 = new Int8Array([127]);
      list1.add(int8Arr1);
      list1.add(int8Arr2);
      expect(list1.length).assertEqual(2);
      const int8ResultArr: Array<Int8Array> = list1.convertToArray();

      expect(Array.isArray(int8ResultArr)).assertTrue();
      expect(int8ResultArr.length).assertEqual(2);
      expect(int8ResultArr[0][0]).assertEqual(-128);
      expect(int8ResultArr[1][0]).assertEqual(127);
      const list2: List<Uint8Array> = new List<Uint8Array>();
      const uint8Arr1 = new Uint8Array([0]);
      const uint8Arr2 = new Uint8Array([255]);
      list2.add(uint8Arr1);
      list2.add(uint8Arr2);
      const uint8ResultArr = list2.convertToArray();
      expect(uint8ResultArr.length).assertEqual(2);
      expect(uint8ResultArr[0][0]).assertEqual(0);
      expect(uint8ResultArr[1][0]).assertEqual(255);
      const list3: List<Uint8ClampedArray> = new List<Uint8ClampedArray>();
      const clampedArr1 = new Uint8ClampedArray([0]);
      const clampedArr2 = new Uint8ClampedArray([255]);
      list3.add(clampedArr1);
      list3.add(clampedArr2);
      const clampedResultArr = list3.convertToArray();
      expect(clampedResultArr.length).assertEqual(2);
      expect(clampedResultArr[0][0]).assertEqual(0);
      expect(clampedResultArr[1][0]).assertEqual(255);
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_0800
     * @tc.name      testList14Chapter0008
     * @tc.desc      Verify convertToArray() for floating-point/BigInt TypedArray List
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0008';
      console.log(TAG + ' start');
      const floatList: List<Float32Array> = new List<Float32Array>();
      const float32Arr1 = new Float32Array([3.14]);
      const float32Arr2 = new Float32Array([Infinity]);
      floatList.add(float32Arr1);
      floatList.add(float32Arr2);
      const floatResultArr = floatList.convertToArray();
      expect(floatResultArr.length).assertEqual(2);
      expect(floatResultArr[0][0]).assertClose(3.14, 0.01);
      expect(floatResultArr[1][0]).assertEqual(Number.POSITIVE_INFINITY);
      const bigIntList1: List<BigInt64Array> = new List<BigInt64Array>();
      const bigInt64Arr = new BigInt64Array([123n]);
      bigIntList1.add(bigInt64Arr);
      const bigInt64ResultArr = bigIntList1.convertToArray();
      expect(bigInt64ResultArr.length).assertEqual(1);
      expect(bigInt64ResultArr[0][0]).assertEqual(123n);

      const bigIntList2: List<BigUint64Array> = new List<BigUint64Array>();
      const bigUint64Arr = new BigUint64Array([456n]);
      bigIntList2.add(bigUint64Arr);
      const bigUint64ResultArr = bigIntList2.convertToArray();
      expect(bigUint64ResultArr.length).assertEqual(1);
      expect(bigUint64ResultArr[0][0]).assertEqual(456n);
      const emptyFloatList: List<Float64Array> = new List<Float64Array>();
      const emptyResultArr = emptyFloatList.convertToArray();
      expect(emptyResultArr.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_0900
     * @tc.name      testList14Chapter0009
     * @tc.desc      Verify convertToArray() for mixed TypedArray List and re-convert after operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0009';
      console.log(TAG + ' start');

      const mixedList: List<TypedArray> = new List<TypedArray>();
      const int8Arr = new Int8Array([10]);
      const uint16Arr = new Uint16Array([200]);
      const float32Arr = new Float32Array([3.14]);
      mixedList.add(int8Arr);
      mixedList.add(uint16Arr);
      mixedList.add(float32Arr);
      expect(mixedList.length).assertEqual(3);
      const firstConvertArr = mixedList.convertToArray();
      expect(firstConvertArr.length).assertEqual(3);
      expect((firstConvertArr[0] as Int8Array)[0]).assertEqual(10);
      expect((firstConvertArr[1] as Uint16Array)[0]).assertEqual(200);
      expect((firstConvertArr[2] as Float32Array)[0]).assertClose(3.14, 0.01);
      mixedList.clear();
      const bigUint64Arr = new BigUint64Array([123456789n]);
      mixedList.add(bigUint64Arr);
      const secondConvertArr = mixedList.convertToArray();
      expect(secondConvertArr.length).assertEqual(1);
      expect((secondConvertArr[0] as BigUint64Array)[0]).assertEqual(123456789n);
      const thirdConvertArr = mixedList.convertToArray();
      expect(thirdConvertArr.length).assertEqual(1);
      const secondItem = secondConvertArr[0] as BigUint64Array;
      const thirdItem = thirdConvertArr[0] as BigUint64Array;
      expect(thirdItem[0]).assertEqual(secondItem[0]);
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_1000
     * @tc.name      testList14Chapter0010
     * @tc.desc      Verify convertToArray() with normal Uint8Array and multi-zero arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0010';
      console.log(TAG + ' start');
      const list: List<TestArray> = new List<TestArray>();
      const normalUint8Arr: Uint8Array = new Uint8Array
      ([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);
      const zeroArr: number[] = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];
      list.add(normalUint8Arr);
      list.add(zeroArr);
      expect(list.length).assertEqual(2);
      const resultArr = list.convertToArray();
      expect(resultArr.length).assertEqual(2);
      const convertedUint8 = resultArr[0] as Uint8Array;
      expect(convertedUint8.length).assertEqual(14);
      expect(convertedUint8[0]).assertEqual(72);
      expect(convertedUint8[13]).assertEqual(63);
      const convertedZeroArr = resultArr[1] as number[];
      expect(convertedZeroArr.length).assertEqual(19);
      expect(convertedZeroArr[9]).assertEqual(0);
      expect(convertedZeroArr[18]).assertEqual(63);
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_1100
     * @tc.name      testList14Chapter0011
     * @tc.desc      Verify convertToArray() with negative/typed/non-numeric index arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0011';
      console.log(TAG + ' start');
      const list: List<TypedArray | number[]> = new List<TypedArray | number[]>();
      const negativeArr: number[] = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      const uint8NegArr: Uint8Array = new Uint8Array(negativeArr);
      const int8NegArr: Int8Array = new Int8Array(negativeArr);
      const numericArr: number[] = [333];
      list.add(uint8NegArr);
      list.add(int8NegArr);
      list.add(numericArr);
      expect(list.length).assertEqual(3);
      const resultArr = list.convertToArray();
      expect(resultArr.length).assertEqual(3);
      const convertedUint8Neg = resultArr[0] as Uint8Array;
      expect(convertedUint8Neg[6]).assertEqual(145);
      expect(convertedUint8Neg[10]).assertEqual(207);

      const convertedInt8Neg = resultArr[1] as Int8Array;
      expect(convertedInt8Neg[6]).assertEqual(-111);
      expect(convertedInt8Neg[10]).assertEqual(-49);

      const convertedNumeric = resultArr[2] as number[];
      expect(convertedNumeric[0]).assertEqual(333);
      const nonNumericMap: Map<string, number> = new Map<string, number>();
      nonNumericMap.set("abc", 111);
      nonNumericMap.set("aaa", 222);
      expect(nonNumericMap.get("abc")).assertEqual(111);
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_1200
     * @tc.name      testList14Chapter0012
     * @tc.desc      Verify convertToArray() with NaN/Infinity/mixed type value arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0012';
      console.log(TAG + ' start');
      const list: List<number[] | (number | string | boolean | null | undefined)[]> = new List<number[] |
      (number | string | boolean | null | undefined)[]>();
      const specialValueArr: number[] = [72, 101, NaN, Infinity, -Infinity, 108, 111];
      const nonNumericTypeArr: (number | string | boolean | null | undefined)[] =
        [72, "abc", true, null, undefined, 108];
      list.add(specialValueArr);
      list.add(nonNumericTypeArr);
      const resultArr = list.convertToArray();
      expect(resultArr.length).assertEqual(2);
      const convertedSpecial = resultArr[0] as number[];
      expect(convertedSpecial[0]).assertEqual(72);
      expect(isNaN(convertedSpecial[2])).assertTrue();
      expect(convertedSpecial[3]).assertEqual(Infinity);
      expect(convertedSpecial[4]).assertEqual(-Infinity);

      const convertedNonNumeric = resultArr[1] as (number | string | boolean | null | undefined)[];
      expect(convertedNonNumeric[1]).assertEqual("abc");
      expect(convertedNonNumeric[2]).assertEqual(true);
      expect(convertedNonNumeric[3]).assertEqual(null);
      expect(convertedNonNumeric[4]).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_1300
     * @tc.name      testList14Chapter0013
     * @tc.desc      Verify convertToArray() with empty/overflow/deleted element arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0013';
      console.log(TAG + ' start');
      const list: List<number[]> = new List<number[]>();
      const emptyArr: number[] = [];
      const overflowArr: number[] = [256, 65536, 32768];
      const deletedArr: number[] = [1, 2, 3];
      deletedArr.splice(1, 1);
      list.add(emptyArr);
      list.add(overflowArr);
      list.add(deletedArr);
      const resultArr = list.convertToArray();

      expect(resultArr.length).assertEqual(3);

      const convertedEmpty = resultArr[0] as number[];
      expect(convertedEmpty.length).assertEqual(0);

      const convertedOverflow = resultArr[1] as number[];
      expect(convertedOverflow[0]).assertEqual(256);
      expect(convertedOverflow[1]).assertEqual(65536);

      const convertedDeleted = resultArr[2] as number[];
      expect(convertedDeleted.length).assertEqual(2);
      expect(convertedDeleted[0]).assertEqual(1);
      expect(convertedDeleted[1]).assertEqual(3);

      const emptyList: List<number[]> = new List<number[]>();
      const emptyResultArr = emptyList.convertToArray();
      expect(emptyResultArr.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_1400
     * @tc.name      testList14Chapter0014
     * @tc.desc      Verify convertToArray() with nested/typed/large length arrays
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testList14Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0014';
      console.log(TAG + ' start');

      const nestedList: List<(number | number[] | (number | number[])[])[]> =
        new List<(number | number[] | (number | number[])[])[]>();
      const level3Arr: number[] = [5, 6];
      const level2Arr1: number[] = [2, 3];
      const level2Arr2: (number | number[])[] = [4, level3Arr];
      const nestedArr: (number | number[] | (number | number[])[])[] = [1, level2Arr1, level2Arr2];
      nestedList.add(nestedArr);

      const typedList: List<TypedArray[]> = new List<TypedArray[]>();
      const typedSubArr: TypedArray[] = [new Int32Array([10, 20]), new Float64Array([3.14, 6.28])];
      typedList.add(typedSubArr);

      const largeList: List<number[]> = new List<number[]>();
      const largeArr: number[] = new Array(1000000).fill(1);
      largeList.add(largeArr);

      const nestedResultArr = nestedList.convertToArray();
      const typedResultArr = typedList.convertToArray();
      const largeResultArr = largeList.convertToArray();

      expect(nestedResultArr.length).assertEqual(1);
      const convertedNested = nestedResultArr[0] as (number | number[] | (number | number[])[])[];
      expect(convertedNested[0] as number).assertEqual(1);
      expect(((convertedNested[1] as number[])[1])).assertEqual(3);
      expect((((convertedNested[2] as (number | number[])[])[1] as number[])[0])).assertEqual(5);

      expect(typedResultArr.length).assertEqual(1);
      const convertedTyped = typedResultArr[0] as TypedArray[];
      expect((convertedTyped[0] as Int32Array)[0]).assertEqual(10);
      expect((convertedTyped[1] as Float64Array)[1]).assertClose(6.28, 0.01);

      expect(largeResultArr.length).assertEqual(1);
      const convertedLarge = largeResultArr[0] as number[];
      expect(convertedLarge.length).assertEqual(1000000);
      expect(convertedLarge[999999]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_1500
     * @tc.name      testList14Chapter0015
     * @tc.desc      Verify convertToArray() with function/keyword string mixed arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0015';
      console.log(TAG + ' start');

      type MixedElement = (() => string) | string;
      const list: List<MixedElement[]> = new List<MixedElement[]>();
      const func: () => string = () => "testResult";
      const mixedTypeArr: MixedElement[] = [func, "0", "NaN", ""];
      list.add(mixedTypeArr);

      const resultArr = list.convertToArray();

      expect(resultArr.length).assertEqual(1);
      const convertedMixed = resultArr[0] as MixedElement[];

      const convertedFunc = convertedMixed[0] as () => string;
      expect(convertedFunc()).assertEqual("testResult");

      expect(convertedMixed[1] as string).assertEqual("0");
      expect(convertedMixed[2] as string).assertEqual("NaN");
      expect(convertedMixed[3] as string).assertEqual("");
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_1600
     * @tc.name      testList14Chapter0016
     * @tc.desc      Test the convertToArray method to convert a basic string type List
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0016';
      console.log(TAG + ' start');
      const list1 = new List<string>();
      list1.add('undefined');
      list1.add('null');
      list1.add('');
      list1.add('!"#$%');
      const result1 = list1.convertToArray();
      expect(result1.length).assertEqual(4);
      expect(result1[0]).assertEqual('undefined');
      expect(result1[1]).assertEqual('null');
      expect(result1[2]).assertEqual('');
      expect(result1[3]).assertEqual('!"#$%');
      result1[0] = 'modified';
      expect(list1.get(0)).assertEqual('undefined');
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_1700
     * @tc.name      testList14Chapter0017
     * @tc.desc      Verify convertToArray() for special/escape chars & emoji string lists
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0017';
      console.log(TAG + ' start');
      const list2 = new List<string>();
      list2.add('&\'()*+,-.');
      list2.add('\n\r\t');
      list2.add('👆👿💯');
      list2.add('\x61\0');
      const result2 = list2.convertToArray();
      expect(result2.length).assertEqual(4);
      expect(result2[0]).assertEqual('&\'()*+,-.');
      expect(result2[1]).assertEqual('\n\r\t');
      expect(result2[2]).assertEqual('👆👿💯');
      expect(result2[3]).assertEqual('a\0');
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_1800
     * @tc.name      testList14Chapter0018
     * @tc.desc      Test the convertToArray method to convert a basic numeric type List
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0018';
      console.log(TAG + ' start');
      const list3 = new List<number | undefined>();
      list3.add(0);
      list3.add(NaN);
      list3.add(-0);
      list3.add(Infinity);
      list3.add(-Infinity);
      list3.add(undefined);
      const result3 = list3.convertToArray();
      expect(result3.length).assertEqual(6);
      expect(result3[0]).assertEqual(0);
      expect(isNaN(result3[1] ?? NaN)).assertTrue();
      expect(result3[2]).assertEqual(-0);
      expect(result3[3]).assertEqual(Infinity);
      expect(result3[4]).assertEqual(-Infinity);
      expect(result3[5]).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_1900
     * @tc.name      testList14Chapter0019
     * @tc.desc      Verify convertToArray() for numeric extremes/different base number lists
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0019';
      console.log(TAG + ' start');
      const list4 = new List<number | bigint>();
      list4.add(Number.MAX_VALUE);
      list4.add(Number.MIN_VALUE);
      list4.add(0x0102);
      list4.add(0o3);
      list4.add(1e3);
      list4.add(9007199254740991n);
      const result4 = list4.convertToArray();
      expect(result4.length).assertEqual(6);
      expect(result4[0]).assertEqual(1.7976931348623157e+308);
      expect(result4[1]).assertEqual(5e-324);
      expect(result4[2]).assertEqual(258);
      expect(result4[3]).assertEqual(3);
      expect(result4[4]).assertEqual(1000);
      expect(result4[5]).assertEqual(9007199254740991n);
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_2000
     * @tc.name      testList14Chapter0020
     * @tc.desc      Verify convertToArray() for Boolean/true/false value scenarios in List
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0020';
      console.log(TAG + ' start');
      const list5 = new List<boolean | number | string | null | undefined>();
      list5.add(true);
      list5.add(false);
      list5.add(0);
      list5.add(1);
      list5.add("");
      list5.add("test");
      list5.add(null);
      const result5 = list5.convertToArray();
      expect(result5.length).assertEqual(7);
      expect(result5[0]).assertEqual(true);
      expect(result5[1]).assertEqual(false);
      expect(result5[2]).assertEqual(0);
      expect(result5[3]).assertEqual(1);
      expect(result5[4]).assertEqual("");
      expect(result5[5]).assertEqual("test");
      expect(result5[6]).assertEqual(null);
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_2100
     * @tc.name      testList14Chapter0021
     * @tc.desc      Verify convertToArray() for regular/nested/empty object lists
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0021';
      console.log(TAG + ' start');
      const normalObj = new NormalObject(1, "test", [1, 2, 3]);
      const nestedObj = new NestedObject(1, new NestedLevel2(2, new NestedLevel3(3)));
      const emptyObj = new EmptyObject();
      const list6 = new List<object>();
      list6.add(normalObj);
      list6.add(nestedObj);
      list6.add(emptyObj);
      const result6 = list6.convertToArray();
      expect(result6.length).assertEqual(3);
      expect((result6[0] as NormalObject).a).assertEqual(1);
      expect((result6[1] as NestedObject).b.d.e).assertEqual(3);
      expect(isEmptyObject(result6[2] as EmptyObject)).assertTrue();
      (result6[0] as NormalObject).a = 999;
      expect(normalObj.a).assertEqual(999);
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_2200
     * @tc.name      testList14Chapter0022
     * @tc.desc      Verify convertToArray() for Buffer/Map/Set/Function special object lists
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0022';
      console.log(TAG + ' start');
      const bufferObj = new BufferObject(new ArrayBuffer(16));
      const mapObj = new MapObject([['key1', 'value1'], ['key2', new NestedLevel2(1, new NestedLevel3(1))]]);
      const setObj = new SetObject([1, 2, 3]);
      const funcObj = new FuncObject(1, () => "func");
      const regexObj = new RegexObject(/abc/gi);
      const list7 = new List<object>();
      list7.add(bufferObj);
      list7.add(mapObj);
      list7.add(setObj);
      list7.add(funcObj);
      list7.add(regexObj);
      const result7 = list7.convertToArray();
      expect(result7.length).assertEqual(5);
      expect(((result7[0] as BufferObject).buffer as ArrayBuffer).byteLength).assertEqual(16);
      expect((result7[1] as MapObject).map.get('key1')).assertEqual('value1');
      expect((result7[2] as SetObject).set.size).assertEqual(3);
      expect((result7[3] as FuncObject).b()).assertEqual("func");
      expect((result7[4] as RegexObject).regex.test('ABC')).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_2300
     * @tc.name      testList14Chapter0023
     * @tc.desc      Test the convertToArray method with an empty List
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0023';
      console.log(TAG + ' start');
      const list8 = new List<number>();
      const result8 = list8.convertToArray();
      expect(result8.length).assertEqual(0);
      expect(Array.isArray(result8)).assertTrue();
      const list9 = new List<string>(['test']);
      list9.clear();
      const result9 = list9.convertToArray();
      expect(result9.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_2400
     * @tc.name      testList14Chapter0024
     * @tc.desc      Test the convertToArray method to convert a large data List
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0024';
      console.log(TAG + ' start');
      const list10 = new List<number>();
      for (let i = 0; i < 1000; i++) {
        list10.add(i);
      }
      const result10 = list10.convertToArray();
      expect(result10.length).assertEqual(1000);
      expect(result10[999]).assertEqual(999);
      expect(result10[0]).assertEqual(0);
      const largeObj = new LargeObject(1000);
      const list11 = new List<LargeObject>();
      list11.add(largeObj);
      const result11 = list11.convertToArray();
      expect(result11[0].getPropertyCount()).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_2500
     * @tc.name      testList14Chapter0025
     * @tc.desc      Test the convertToArray method to convert a mixed-type List
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0025';
      console.log(TAG + ' start');
      const list12 = new List<number | string | boolean | object | null | undefined>();
      list12.add(123);
      list12.add("test");
      list12.add(true);
      list12.add(new SmallObject(5));
      list12.add(null);
      list12.add(undefined);
      const result12 = list12.convertToArray();
      expect(result12.length).assertEqual(6);
      expect(result12[0]).assertEqual(123);
      expect(result12[1]).assertEqual("test");
      expect(result12[2]).assertEqual(true);
      expect((result12[3] as SmallObject).small).assertEqual(5);
      expect(result12[4]).assertEqual(null);
      expect(result12[5]).assertEqual(undefined);
    });
    /**
     * @tc.number    SUB_LIST_TEXT14_2600
     * @tc.name      testList14Chapter0026
     * @tc.desc      Test the convertToArray method to convert a List initialized by a constructor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0026';
      console.log(TAG + ' start');
      const initArray = [10, 20, 30, 40];
      const list13 = new List<number>(initArray);
      const result13 = list13.convertToArray();
      expect(result13.length).assertEqual(4);
      expect(result13).assertDeepEquals(initArray);
      const list14 = new List<string>("single value");
      const result14 = list14.convertToArray();
      expect(result14.length).assertEqual(1);
      expect(result14[0]).assertEqual("single value");
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_2700
     * @tc.name      testList14Chapter0027
     * @tc.desc      Test the convertToArray method to convert the List after the insert operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0027';
      console.log(TAG + ' start');
      const list15 = new List<number>([1]);
      list15.insert(0, 0);
      list15.insert(2, 2);
      list15.insert(10, 3);
      const result15 = list15.convertToArray();
      expect(result15.length).assertEqual(4);
      expect(result15[0]).assertEqual(0);
      expect(result15[1]).assertEqual(1);
      expect(result15[2]).assertEqual(2);
      expect(result15[3]).assertEqual(3);
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_2800
     * @tc.name      testList14Chapter0028
     * @tc.desc      Test the convertToArray method to convert a List containing NaN, Infinity, and -0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0028';
      console.log(TAG + ' start');
      const list16 = new List<number>();
      list16.add(NaN);
      list16.add(Infinity);
      list16.add(-Infinity);
      list16.add(-0);
      list16.add(0);
      const result16 = list16.convertToArray();
      expect(result16.length).assertEqual(5);
      expect(isNaN(result16[0])).assertTrue();
      expect(result16[1]).assertEqual(Infinity);
      expect(result16[2]).assertEqual(-Infinity);
      expect(1 / result16[3]).assertEqual(-Infinity);
      expect(1 / result16[4]).assertEqual(Infinity);
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_2900
     * @tc.name      testList14Chapter0029
     * @tc.desc      Test the convertToArray method to convert a list containing Promises and AsyncFunctions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0029';
      console.log(TAG + ' start');
      const promise1 = Promise.resolve("success");
      const asyncFunc = async () => {
        return "async result";
      };
      const promiseObj = new PromiseObject(promise1);
      const list17 = new List<Promise<string> | (() => Promise<string>) | PromiseObject>();
      list17.add(promise1);
      list17.add(asyncFunc);
      list17.add(promiseObj);
      const result17 = list17.convertToArray();
      expect(result17.length).assertEqual(3);
      expect(result17[0] instanceof Promise).assertTrue();
      expect(result17[1].constructor.name).assertEqual("AsyncFunction");
      expect(result17[2] instanceof PromiseObject).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_3000
     * @tc.name      testList14Chapter0030
     * @tc.desc      Verify convertToArray() for List with nested Lists & multi-dimensional arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0030';
      console.log(TAG + ' start');
      const subList1 = new List<number>([1, 2, 3]);
      const subList2 = new List<string>(["a", "b"]);
      const multiArray = [[10, 20], [30, 40]];
      const list18 = new List<List<number> | List<string> | number[][]>();
      list18.add(subList1);
      list18.add(subList2);
      list18.add(multiArray);
      const result18 = list18.convertToArray();
      expect(result18.length).assertEqual(3);
      if (result18[0] instanceof List) {
        const subArr1 = result18[0].convertToArray();
        expect(subArr1.length).assertEqual(3);
        expect(subArr1[0]).assertEqual(1);
        expect(subArr1[1]).assertEqual(2);
        expect(subArr1[2]).assertEqual(3);
      }
      if (result18[1] instanceof List) {
        const subArr2 = result18[1].convertToArray();
        expect(subArr2.length).assertEqual(2);
        expect(subArr2[0]).assertEqual("a");
        expect(subArr2[1]).assertEqual("b");
      }
      const multiArr = result18[2];
      if (Array.isArray(multiArr)) {
        const firstSubArr = multiArr[0];
        if (Array.isArray(firstSubArr)) {
          expect(firstSubArr[1]).assertEqual(20);
        }
        const secondSubArr = multiArr[1];
        if (Array.isArray(secondSubArr)) {
          expect(secondSubArr[0]).assertEqual(30);
        }
      }
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_3100
     * @tc.name      testList14Chapter0031
     * @tc.desc      Test the convertToArray method to convert a List with mixed initialization types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0031';
      console.log(TAG + ' start');
      const list32 = new List<string | number | boolean | KeyObj>("single");
      list32.add(123);
      list32.add(true);
      list32.insert(1, { key: "obj" } as KeyObj);
      const result32 = list32.convertToArray();
      expect(result32.length).assertEqual(4);
      expect(result32[0]).assertEqual("single");
      const objItem = result32[1] as KeyObj;
      expect(objItem.key).assertEqual("obj");
      expect(result32[2]).assertEqual(123);
      expect(result32[3]).assertEqual(true);
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_3200
     * @tc.name      testList14Chapter0032
     * @tc.desc      Test the convertToArray method to convert a List containing very large strings and binary data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0032';
      console.log(TAG + ' start');
      const bigStr = "a".repeat(1000)
      const uint8Arr = new Uint8Array([0x01, 0x02, 0x03, 0x04]);
      const bufferObj = new BufferObject(uint8Arr);
      const list20 = new List<string | BufferObject>();
      list20.add(bigStr);
      list20.add(bufferObj);
      const result20 = list20.convertToArray();
      expect(result20.length).assertEqual(2);
      const bigStrItem = result20[0];
      if (typeof bigStrItem === 'string') {
        expect(bigStrItem.length).assertEqual(1000);
      }
      expect(((result20[1] as BufferObject).buffer as Uint8Array)[2]).assertEqual(0x03);
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_3300
     * @tc.name      testList14Chapter0033
     * @tc.desc      Verify convertToArray() for List with duplicate elements/same object references
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0033';
      console.log(TAG + ' start');
      const sharedObj = new NormalObject(5, "shared", [1, 2]);
      const list21 = new List<NormalObject | number>();
      list21.add(sharedObj);
      list21.add(sharedObj);
      list21.add(10);
      list21.add(10);
      const result21 = list21.convertToArray();
      expect(result21.length).assertEqual(4);
      expect(result21[0] === result21[1]).assertTrue();
      expect(result21[2] === result21[3]).assertTrue();
      sharedObj.a = 99;
      const item0 = result21[0];
      if (item0 instanceof NormalObject) {
        expect(item0.a).assertEqual(99);
      }
      const item1 = result21[1];
      if (item1 instanceof NormalObject) {
        expect(item1.a).assertEqual(99);
      }
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_3400
     * @tc.name      testList14Chapter0034
     * @tc.desc      Verify convertToArray() for List with inherited objects/prototype chain props
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0034';
      console.log(TAG + ' start');
      class InheritObjectWithProto extends InheritObject {
        protoProp: string = "";

        constructor(parentProp: number) {
          super(parentProp);
        }
      }
      class ChildInheritObject extends InheritObjectWithProto {
        childProp: string = "";
        constructor(parentProp: number, childProp: string) {
          super(parentProp);
          this.childProp = childProp;
        }
      }
      const childObj = new ChildInheritObject(10, "child");
      childObj.protoProp = "proto";
      const list22 = new List<ChildInheritObject>();
      list22.add(childObj);
      const result22 = list22.convertToArray();
      expect(result22.length).assertEqual(1);
      expect(result22[0].parentProp).assertEqual(10);
      expect(result22[0].childProp).assertEqual("child");
      expect(result22[0].protoProp).assertEqual("proto");
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_3500
     * @tc.name      testList14Chapter0035
     * @tc.desc      Test the consistency and independence of multiple calls to the convertToArray method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0035';
      console.log(TAG + ' start');
      const list23 = new List<number>([1, 2, 3, 4]);
      const result23_1 = list23.convertToArray();
      const result23_2 = list23.convertToArray();
      const result23_3 = list23.convertToArray();
      expect(result23_1.length).assertEqual(result23_2.length);
      for (let i = 0; i < result23_1.length; i++) {
        expect(result23_1[i]).assertEqual(result23_2[i]);
      }
      expect(result23_2.length).assertEqual(result23_3.length);
      for (let i = 0; i < result23_2.length; i++) {
        expect(result23_2[i]).assertEqual(result23_3[i]);
      }
      result23_1[0] = 99;
      expect(result23_2[0]).assertEqual(1);
      expect(list23.get(0)).assertEqual(1);
      list23.add(5);
      const result23_4 = list23.convertToArray();
      expect(result23_4.length).assertEqual(5);
      expect(result23_4[4]).assertEqual(5);
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_3600
     * @tc.name      testList14Chapter0036
     * @tc.desc      Test the convertToArray method to convert a List containing undefined, null, and optional types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0036';
      console.log(TAG + ' start');
      type OptionalType = number | undefined | null;
      const list24 = new List<OptionalType>();
      list24.add(undefined);
      list24.add(null);
      list24.add(123);
      list24.add(undefined);
      list24.add(null);
      const result24 = list24.convertToArray();
      expect(result24.length).assertEqual(5);
      expect(result24[0]).assertEqual(undefined);
      expect(result24[1]).assertEqual(null);
      expect(result24[2]).assertEqual(123);
      expect(result24[3]).assertEqual(undefined);
      expect(result24[4]).assertEqual(null);
      const specialValObj = new SpecialValueObject(NaN, Infinity, -Infinity);
      specialValObj.a = undefined;
      specialValObj.b = null;
      const list25 = new List<SpecialValueObject>();
      list25.add(specialValObj);
      const result25 = list25.convertToArray();
      expect(result25[0].a).assertEqual(undefined);
      expect(result25[0].b).assertEqual(null);
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_3700
     * @tc.name      testList14Chapter0037
     * @tc.desc      Test the convertToArray method with an extremely long list (memory boundary test)
     * @tc.size      LargeTest
     * @tc.type      Performance
     * @tc.level     Level 3
     */
    it('testList14Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0037';
      console.log(TAG + ' start');
      const list26 = new List<number>();
      const testCount = 100;
      for (let i = 0; i < testCount; i++) {
        list26.add(i % 100);
      }
      const startTime = Date.now();
      const result26 = list26.convertToArray();
      const endTime = Date.now();
      expect(result26.length).assertEqual(testCount);
      expect(result26[testCount - 1]).assertEqual((testCount - 1) % 100);
      const emptyList = new List<number>();
      for (let i = 0; i < 100; i++) {
        const emptyResult = emptyList.convertToArray();
        expect(emptyResult.length).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_3800
     * @tc.name      testList14Chapter0038
     * @tc.desc      Test the convertToArray method to convert a List initialized from a read-only array/ArrayLike
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0038';
      console.log(TAG + ' start');
      const readonlyArr = [10, 20, 30] as readonly number[];
      const list27 = new List<number>(readonlyArr);
      const result27 = list27.convertToArray();
      expect(result27.length).assertEqual(3);
      expect(result27[0]).assertEqual(10);
      expect(result27[1]).assertEqual(20);
      expect(result27[2]).assertEqual(30);
      result27[0] = 99;
      expect(result27[0]).assertEqual(99);
      const arrayLike = ['a', 'b', 'c'];
      const list28 = new List<string>(arrayLike);
      const result28 = list28.convertToArray();
      expect(result28.length).assertEqual(3);
      expect(result28[1]).assertEqual('b');
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_3900
     * @tc.name      testList14Chapter0039
     * @tc.desc      Test the convertToArray method to convert a List containing unique Symbol and BigInt values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0039';
      console.log(TAG + ' start');
      const uniqueStr1 = 'unique_key_1';
      const uniqueStr2 = 'unique_key_2';
      const list29 = new List<string | bigint>();
      list29.add(uniqueStr1);
      list29.add(uniqueStr2);
      list29.add(123456789012345678901234567890n);
      const result29 = list29.convertToArray();
      expect(result29.length).assertEqual(3);
      expect(result29[0]).assertEqual(uniqueStr1);
      expect(result29[1]).assertEqual(uniqueStr2);
      expect(result29[2]).assertEqual(123456789012345678901234567890n);
      expect(result29[0] !== result29[1]).assertTrue();
    });

    /**
     * @tc.number    SUB_LIST_TEXT14_4000
     * @tc.name      testList14Chapter0040
     * @tc.desc      Test the convertToArray method to convert a List containing circular reference objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList14Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList14Chapter0040';
      console.log(TAG + ' start');
      const cycleObj: Partial<CycleObj> = { a: 1 };
      cycleObj.self = cycleObj as CycleObj;
      const nestedCycleObj: Partial<NestedCycleObj> = { b: 2 };
      nestedCycleObj.child = { parent: nestedCycleObj as NestedCycleObj };
      const list30 = new List<CycleObj | NestedCycleObj>();
      list30.add(cycleObj as CycleObj);
      list30.add(nestedCycleObj as NestedCycleObj);
      const result30 = list30.convertToArray();
      expect(result30.length).assertEqual(2);
      expect(result30.length).assertEqual(2);
      expect((result30[0] as CycleObj).self).assertEqual(result30[0]);
      expect((result30[1] as NestedCycleObj).child.parent).assertEqual(result30[1]);
      expect((result30[0] as CycleObj).a).assertEqual(1);
      expect((result30[1] as NestedCycleObj).b).assertEqual(2);
    });
  })
}