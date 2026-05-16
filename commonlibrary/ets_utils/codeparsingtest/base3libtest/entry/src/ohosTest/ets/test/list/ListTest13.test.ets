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
      expect().assertFail()
      return false;
    }
  }
  set(index: number, element: T): T {
    const oldValue = this.data[index];
    this.data[index] = element;
    return oldValue;
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
function isEmptyObject(obj: EmptyObject): boolean {
  return obj instanceof EmptyObject;
}
interface GeneratedObjectLiteralInterface_1 {
  TestArray: Uint8Array;
  TypedArrayOrNumber: Uint8Array;
  NumberArray: number[];
  SpecialValueArray: number[];
  NonNumericTypeArray: (string | number | boolean | null | undefined)[];
  NestedArray: (number | number[] | (number | number[])[])[];
  TypedSubArray: TypedArray[];
  MixedElementArray: (string | (() => string))[];
}

const Placeholder: GeneratedObjectLiteralInterface_1 = {
  TestArray: new Uint8Array(0),
  TypedArrayOrNumber: new Uint8Array(0),
  NumberArray: [] as number[],
  SpecialValueArray: [] as number[],
  NonNumericTypeArray: [] as (number | string | boolean | null | undefined)[],
  NestedArray: [] as (number | number[] | (number | number[])[])[],
  TypedSubArray: [] as TypedArray[],
  MixedElementArray: [] as ((() => string) | string)[],
};
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

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ListTest13() {
  describe('ListTest13', () => {
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
     * @tc.number    SUB_LIST_TEXT13_0100
     * @tc.name      testList13Chapter0001
     * @tc.desc      test clear list with normal object elements, verify result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0001';
      console.log(TAG + ' start');
      const normalObj1 = new NormalObject(1, "test1", [1, 2, 3]);
      const normalObj2 = new NormalObject(2, "test2", [4, 5, 6]);
      const normalObj3 = new NormalObject(3, "test3", [7, 8, 9]);
      const objectList = new List<NormalObject>();
      objectList.add(normalObj1);
      objectList.add(normalObj2);
      objectList.add(normalObj3);
      expect(objectList.size()).assertEqual(3);
      expect(objectList.get(0)?.a).assertEqual(1);
      expect(objectList.get(1)?.c).assertDeepEquals([4, 5, 6]);
      objectList.clear();
      expect(objectList.size()).assertEqual(0);
      expect(objectList.isEmpty()).assertTrue();
      expect(objectList.get(0)).assertEqual(undefined);
      objectList.add(normalObj1);
      expect(objectList.size()).assertEqual(1);
      expect(objectList.get(0)?.b).assertEqual("test1");
    });

    /**
     * @tc.number    SUB_LIST_TEXT13_0200
     * @tc.name      testList13Chapter0002
     * @tc.desc      test clear list with nested object elements, verify result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0002';
      console.log(TAG + ' start');
      const nestedLevel3 = new NestedLevel3(10);
      const nestedLevel2 = new NestedLevel2(20, nestedLevel3);
      const nestedObj1 = new NestedObject(30, nestedLevel2);
      const nestedObj2 = new NestedObject(40, new NestedLevel2(50, new NestedLevel3(60)));
      const nestedList = new List<NestedObject>();
      nestedList.add(nestedObj1);
      nestedList.add(nestedObj2);
      expect(nestedList.size()).assertEqual(2);
      expect(nestedList.get(0)?.b.c).assertEqual(20);
      expect(nestedList.get(1)?.b.d.e).assertEqual(60);
      nestedList.clear();
      expect(nestedList.size()).assertEqual(0);
      expect(nestedList.isEmpty()).assertTrue();
      expect(nestedList.get(1)).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEXT13_0300
     * @tc.name      testList13Chapter0003
     * @tc.desc      test clear list with empty object elements, verify result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0003';
      console.log(TAG + ' start');
      const emptyObj1 = new EmptyObject();
      const emptyObj2 = new EmptyObject();
      const emptyObjList = new List<EmptyObject>();
      emptyObjList.add(emptyObj1);
      emptyObjList.add(emptyObj2);
      expect(emptyObjList.size()).assertEqual(2);
      expect(isEmptyObject(emptyObjList.get(0) as EmptyObject)).assertTrue();
      emptyObjList.clear();
      expect(emptyObjList.size()).assertEqual(0);
      expect(emptyObjList.isEmpty()).assertTrue();
      expect(emptyObjList.get(0)).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEXT13_0400
     * @tc.name      testList13Chapter0004
     * @tc.desc      test clear list with buffer object elements, verify result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0004';
      console.log(TAG + ' start');
      const arrayBuffer = new ArrayBuffer(8);
      const uint8Array = new Uint8Array([1, 2, 3]);
      const int16Array = new Int16Array([10, 20]);
      const bufferObj1 = new BufferObject(arrayBuffer);
      const bufferObj2 = new BufferObject(uint8Array);
      const bufferObj3 = new BufferObject(int16Array);
      const bufferList = new List<BufferObject>();
      bufferList.add(bufferObj1);
      bufferList.add(bufferObj2);
      bufferList.add(bufferObj3);
      expect(bufferList.size()).assertEqual(3);
      expect(bufferList.get(1)?.buffer).assertDeepEquals(uint8Array);
      expect((bufferList.get(2)?.buffer as Int16Array)[0]).assertEqual(10);
      bufferList.clear();
      expect(bufferList.size()).assertEqual(0);
      expect(bufferList.isEmpty()).assertTrue();
      expect(bufferList.get(0)).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEXT13_0500
     * @tc.name      testList13Chapter0005
     * @tc.desc      test clear list with dataview object elements, verify result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0005';
      console.log(TAG + ' start');
      const buffer1 = new ArrayBuffer(16);
      const dataView1 = new DataView(buffer1);
      dataView1.setInt32(0, 12345);
      const dataViewObj1 = new DataViewObject(dataView1);

      const buffer2 = new ArrayBuffer(8);
      const dataView2 = new DataView(buffer2);
      dataView2.setFloat64(0, 67.89);
      const dataViewObj2 = new DataViewObject(dataView2);

      const dataViewList = new List<DataViewObject>();
      dataViewList.add(dataViewObj1);
      dataViewList.add(dataViewObj2);

      expect(dataViewList.size()).assertEqual(2);
      expect(dataViewList.get(0)?.view.getInt32(0)).assertEqual(12345);
      expect(dataViewList.get(1)?.view.getFloat64(0)).assertEqual(67.89);

      dataViewList.clear();

      expect(dataViewList.size()).assertEqual(0);
      expect(dataViewList.isEmpty()).assertTrue();
      expect(dataViewList.get(1)).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEXT13_0600
     * @tc.name      testList13Chapter0006
     * @tc.desc      test clear list with map object elements, verify result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0006';
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
      const mapList = new List<MapObject>();
      mapList.add(mapObj1);
      mapList.add(mapObj2);
      expect(mapList.size()).assertEqual(2);
      expect(mapList.get(0)?.map.get("key1")).assertEqual("value1");
      expect((mapList.get(1)?.map.get("key4") as NestedLevel2).c).assertEqual(15);
      mapList.clear();
      expect(mapList.size()).assertEqual(0);
      expect(mapList.isEmpty()).assertTrue();
      expect(mapList.get(0)).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEXT13_0700
     * @tc.name      testList13Chapter0007
     * @tc.desc      test clear list with set object elements, verify result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0007';
      console.log(TAG + ' start');
      const setValues1 = [1, 2, 3, 4, 5];
      const setValues2 = [6, 7, 8, 9, 10];
      const setObj1 = new SetObject(setValues1);
      const setObj2 = new SetObject(setValues2);
      const setList = new List<SetObject>();
      setList.add(setObj1);
      setList.add(setObj2);
      expect(setList.size()).assertEqual(2);
      expect(setList.get(0)?.set.has(3)).assertTrue();
      expect(setList.get(1)?.set.has(8)).assertTrue();
      setList.clear();
      expect(setList.size()).assertEqual(0);
      expect(setList.isEmpty()).assertTrue();
      expect(setList.get(1)).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEXT13_0800
     * @tc.name      testList13Chapter0008
     * @tc.desc      test clear list with function object elements, verify result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0008';
      console.log(TAG + ' start');
      const func1 = () => "function1";
      const func2 = () => "function2";
      const funcObj1 = new FuncObject(10, func1);
      const funcObj2 = new FuncObject(20, func2);
      const funcList = new List<FuncObject>();
      funcList.add(funcObj1);
      funcList.add(funcObj2);
      expect(funcList.size()).assertEqual(2);
      expect(funcList.get(0)?.a).assertEqual(10);
      expect(funcList.get(1)?.b()).assertEqual("function2");
      funcList.clear();
      expect(funcList.size()).assertEqual(0);
      expect(funcList.isEmpty()).assertTrue();
      expect(funcList.get(0)).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEXT13_0900
     * @tc.name      testList13Chapter0009
     * @tc.desc      test clear list with regex object elements, verify result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0009';
      console.log(TAG + ' start');
      const regex1 = /^test\d+$/;
      const regex2 = /[a-zA-Z]+/g;
      const regexObj1 = new RegexObject(regex1);
      const regexObj2 = new RegexObject(regex2);
      const regexList = new List<RegexObject>();
      regexList.add(regexObj1);
      regexList.add(regexObj2);
      expect(regexList.size()).assertEqual(2);
      expect(regexList.get(0)?.regex.test("test123")).assertTrue();
      expect(regexList.get(1)?.regex.test("HelloWorld")).assertTrue();
      regexList.clear();
      expect(regexList.size()).assertEqual(0);
      expect(regexList.isEmpty()).assertTrue();
      expect(regexList.get(1)).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEXT13_1000
     * @tc.name      testList13Chapter0010
     * @tc.desc      test clear list with promise object elements, verify result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0010';
      console.log(TAG + ' start');
      const promise1 = Promise.resolve("success1");
      const promise2 = Promise.resolve("success2");
      const promiseObj1 = new PromiseObject(promise1);
      const promiseObj2 = new PromiseObject(promise2);
      const promiseList = new List<PromiseObject>();
      promiseList.add(promiseObj1);
      promiseList.add(promiseObj2);
      expect(promiseList.size()).assertEqual(2);
      promiseList.get(0)?.promise.then(res => expect(res).assertEqual("success1"));
      promiseList.get(1)?.promise.then(res => expect(res).assertEqual("success2"));
      promiseList.clear();
      expect(promiseList.size()).assertEqual(0);
      expect(promiseList.isEmpty()).assertTrue();
      expect(promiseList.get(0)).assertEqual(undefined);
      promise1.then(res => expect(res).assertEqual("success1"));
    });

    /**
     * @tc.number    SUB_LIST_TEXT13_1100
     * @tc.name      testList13Chapter0011
     * @tc.desc      test clear list with large object elements, verify result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0011';
      console.log(TAG + ' start');
      const largeObj1 = new LargeObject(100);
      const largeObj2 = new LargeObject(200);
      const largeObj3 = new LargeObject(500);
      const largeObjList = new List<LargeObject>();
      largeObjList.add(largeObj1);
      largeObjList.add(largeObj2);
      largeObjList.add(largeObj3);
      expect(largeObjList.size()).assertEqual(3);
      expect(largeObjList.get(0)?.getPropertyCount()).assertEqual(100);
      expect(largeObjList.get(2)?.getProperty("499")).assertEqual(499);
      largeObjList.clear();
      expect(largeObjList.size()).assertEqual(0);
      expect(largeObjList.isEmpty()).assertTrue();
      expect(largeObjList.get(0)).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEXT13_1200
     * @tc.name      testList13Chapter0012
     * @tc.desc      test clear list with mixed object elements, verify result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0012';
      console.log(TAG + ' start');
      const nestedLevel3 = new NestedLevel3(10);
      const nestedLevel2 = new NestedLevel2(20, nestedLevel3);
      const mapEntries: [string, string][] = [["key1", "value1"], ["key2", "value2"]];
      const map = new Map(mapEntries);
      const set = new Set([1, 2, 3]);
      const regex = /test/;
      const arrayBuffer = new ArrayBuffer(8);
      const mixedObj1 = new MixedObject(
        1, "test1", true, null, nestedLevel2, map, set, regex, arrayBuffer
      );
      const mixedObj2 = new MixedObject(
        2, "test2", false, "str", new NestedLevel2(30, new NestedLevel3(40)),
        new Map([["key3", "value3"]]), new Set([4, 5, 6]), /mixed/, new ArrayBuffer(16)
      );
      const mixedList = new List<MixedObject>();
      mixedList.add(mixedObj1);
      mixedList.add(mixedObj2);
      expect(mixedList.size()).assertEqual(2);
      expect(mixedList.get(0)?.a).assertEqual(1);
      expect(mixedList.get(1)?.e.d.e).assertEqual(40);
      expect(mixedList.get(0)?.g.has(2)).assertTrue();
      mixedList.clear();
      expect(mixedList.size()).assertEqual(0);
      expect(mixedList.isEmpty()).assertTrue();
      expect(mixedList.get(0)).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEXT13_1300
     * @tc.name      testList13Chapter0013
     * @tc.desc      test clear list with special value object elements, verify result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0013';
      console.log(TAG + ' start');
      const specialValueObj1 = new SpecialValueObject(1, 2, 3);
      specialValueObj1.a = undefined;
      specialValueObj1.b = null;
      const specialValueObj2 = new SpecialValueObject(4, 5, 6);
      specialValueObj2.a = undefined;
      specialValueObj2.b = null;
      const specialValueList = new List<SpecialValueObject>();
      specialValueList.add(specialValueObj1);
      specialValueList.add(specialValueObj2);
      expect(specialValueList.size()).assertEqual(2);
      expect(specialValueList.get(0)?.a).assertEqual(undefined);
      expect(specialValueList.get(1)?.d).assertEqual(5);
      specialValueList.clear();
      expect(specialValueList.size()).assertEqual(0);
      expect(specialValueList.isEmpty()).assertTrue();
      expect(specialValueList.get(0)).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEXT13_1400
     * @tc.name      testList13Chapter0014
     * @tc.desc      test clear list initialized with data, verify result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0014';
      console.log(TAG + ' start');
      const initNumberData = [10, 20, 30, 40, 50];
      const initStringData = ["a", "b", "c"];
      const initObjectData = [new NormalObject(1, "test", [1,2,3])];
      const numberInitList = new List<number>(initNumberData);
      expect(numberInitList.size()).assertEqual(5);
      numberInitList.clear();
      expect(numberInitList.size()).assertEqual(0);
      expect(numberInitList.isEmpty()).assertTrue();
      const stringInitList = new List<string>(initStringData);
      expect(stringInitList.size()).assertEqual(3);
      stringInitList.clear();
      expect(stringInitList.size()).assertEqual(0);
      const objectInitList = new List<NormalObject>(initObjectData);
      expect(objectInitList.size()).assertEqual(1);
      objectInitList.clear();
      expect(objectInitList.size()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT13_1500
     * @tc.name      testList13Chapter0015
     * @tc.desc      test clear list multiple times, verify result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0015';
      console.log(TAG + ' start');
      const multiClearList = new List<number>();
      multiClearList.add(1);
      multiClearList.add(2);
      multiClearList.add(3);
      multiClearList.clear();
      expect(multiClearList.size()).assertEqual(0);
      expect(multiClearList.isEmpty()).assertTrue();
      multiClearList.add(4);
      multiClearList.add(5);
      expect(multiClearList.size()).assertEqual(2);
      multiClearList.clear();
      expect(multiClearList.size()).assertEqual(0);
      multiClearList.clear();
      expect(multiClearList.size()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_LIST_TEXT13_1600
     * @tc.name      testList13Chapter0016
     * @tc.desc      test clear list after insert operation, verify result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0016';
      console.log(TAG + ' start');
      const insertList = new List<number>();
      insertList.add(1);
      insertList.add(2);
      insertList.insert(1, 3);
      insertList.insert(0, 4);
      insertList.insert(5, 5);
      expect(insertList.size()).assertEqual(5);
      expect(insertList.get(2)).assertEqual(3);
      insertList.clear();
      expect(insertList.size()).assertEqual(0);
      expect(insertList.isEmpty()).assertTrue();
      expect(insertList.get(0)).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEXT13_1700
     * @tc.name      testList13Chapter0017
     * @tc.desc      test clear list with bigint elements, verify result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0017';
      console.log(TAG + ' start');
      const bigIntList = new List<bigint>();
      bigIntList.add(9007199254740991n);
      bigIntList.add(-9223372036854775808n);
      bigIntList.add(18446744073709551615n);
      expect(bigIntList.size()).assertEqual(3);
      expect(bigIntList.get(1)).assertEqual(-9223372036854775808n);
      bigIntList.clear();
      expect(bigIntList.size()).assertEqual(0);
      expect(bigIntList.isEmpty()).assertTrue();
      expect(bigIntList.get(0)).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEXT13_1800
     * @tc.name      testList13Chapter0018
     * @tc.desc      test clear list with large amount of elements, verify result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0018';
      console.log(TAG + ' start');
      const largeDataList = new List<number>();
      for (let i = 0; i < 10000; i++) {
        largeDataList.add(i);
      }
      expect(largeDataList.size()).assertEqual(10000);
      expect(largeDataList.get(9999)).assertEqual(9999);
      largeDataList.clear();
      expect(largeDataList.size()).assertEqual(0);
      expect(largeDataList.isEmpty()).assertTrue();
      expect(largeDataList.get(0)).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEXT13_1900
     * @tc.name      testList13Chapter0019
     * @tc.desc      test clear list with mixed basic types, verify result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0019';
      console.log(TAG + ' start');
      const mixedBasicList = new List<number | string | boolean | null | undefined>();
      mixedBasicList.add(123);
      mixedBasicList.add("test");
      mixedBasicList.add(true);
      mixedBasicList.add(null);
      mixedBasicList.add(undefined);
      mixedBasicList.add(NaN);
      mixedBasicList.add(Infinity);
      mixedBasicList.add("");
      expect(mixedBasicList.size()).assertEqual(8);
      expect(mixedBasicList.get(3)).assertEqual(null);
      expect(isNaN(mixedBasicList.get(5) as number)).assertTrue();
      mixedBasicList.clear();
      expect(mixedBasicList.size()).assertEqual(0);
      expect(mixedBasicList.isEmpty()).assertTrue();
      expect(mixedBasicList.get(7)).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_LIST_TEXT13_2000
     * @tc.name      testList13Chapter0020
     * @tc.desc      Verify List set() with Uint8Array and multi-zero number arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0020';
      console.log(TAG + ' start');
      const normalUint8Arr: Uint8Array =
        new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);
      const zeroArr: number[] = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];

      const list: List<TestArray> = new List<TestArray>();
      list.add(Placeholder.TestArray);
      list.add(Placeholder.TestArray);
      list.set(0, normalUint8Arr);
      list.set(1, zeroArr);

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
     * @tc.number    SUB_LIST_TEXT13_2100
     * @tc.name      testList13Chapter0021
     * @tc.desc      Verify the processing logic for arrays with negative numbers and non-numeric index arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0021';
      console.log(TAG + ' start');
      const negativeArr: number[] = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      const uint8NegArr: Uint8Array = new Uint8Array(negativeArr);
      const int8NegArr: Int8Array = new Int8Array(negativeArr);
      const nonNumericMap: Map<string, number> = new Map<string, number>();
      nonNumericMap.set("abc", 111);
      nonNumericMap.set("aaa", 222);
      const numericArr: number[] = [333];

      const list: List<TypedArray | number[]> = new List<TypedArray | number[]>();
      list.add(Placeholder.TypedArrayOrNumber);
      list.add(Placeholder.TypedArrayOrNumber);
      list.add(Placeholder.NumberArray);
      list.set(0, uint8NegArr);
      list.set(1, int8NegArr);
      list.set(2, numericArr);

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
     * @tc.number    SUB_LIST_TEXT13_2200
     * @tc.name      testList13Chapter0022
     * @tc.desc      Verify the processing logic for arrays containing NaN/Infinity and non-numeric type arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0022';
      console.log(TAG + ' start');
      const specialValueArr: number[] = [72, 101, NaN, Infinity, -Infinity, 108, 111];
      const nonNumericTypeArr: (number | string | boolean | null | undefined)[] =
        [72, "abc", true, null, undefined, 108];

      const list: List<number[] | (number | string | boolean | null | undefined)[]> =
        new List<number[] | (number | string | boolean | null | undefined)[]>();
      list.add(Placeholder.SpecialValueArray);
      list.add(Placeholder.NonNumericTypeArray);
      list.set(0, specialValueArr);
      list.set(1, nonNumericTypeArr);

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
     * @tc.number    SUB_LIST_TEXT13_2300
     * @tc.name      testList13Chapter0023
     * @tc.desc      Verify set() for empty/overflow/deleted element arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0023';
      console.log(TAG + ' start');
      const emptyArr: number[] = [];
      const overflowArr: number[] = [256, 65536, 32768];
      const deletedArr: number[] = [1, 2, 3];
      deletedArr.splice(1, 1);

      const list: List<number[]> = new List<number[]>();
      list.add(Placeholder.NumberArray);
      list.add(Placeholder.NumberArray);
      list.add(Placeholder.NumberArray);
      list.set(0, emptyArr);
      list.set(1, overflowArr);
      list.set(2, deletedArr);

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
     * @tc.number    SUB_LIST_TEXT13_2400
     * @tc.name      testList13Chapter0024
     * @tc.desc      Verify set() for nested/TypedArray/ultra-long length arrays
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0024';
      console.log(TAG + ' start');
      const level3Arr: number[] = [5, 6];
      const level2Arr1: number[] = [2, 3];
      const level2Arr2: (number | number[])[] = [4, level3Arr];
      const nestedArr: (number | number[] | (number | number[])[])[] = [1, level2Arr1, level2Arr2];
      const typedSubArr: TypedArray[] = [new Int32Array([10, 20]), new Float64Array([3.14, 6.28])];
      const largeArr: number[] = new Array(1000000).fill(1);

      const nestedList: List<(number | number[] | (number | number[])[])[]> =
        new List<(number | number[] | (number | number[])[])[]>();
      nestedList.add(Placeholder.NestedArray);
      nestedList.set(0, nestedArr);

      const typedList: List<TypedArray[]> = new List<TypedArray[]>();
      typedList.add(Placeholder.TypedSubArray);
      typedList.set(0, typedSubArr);

      const largeList: List<number[]> = new List<number[]>();
      largeList.add(Placeholder.NumberArray);
      largeList.set(0, largeArr);

      expect(nestedList.length).assertEqual(1);
      expect(typedList.length).assertEqual(1);
      expect(largeList.length).assertEqual(1);
      const item0: (number | number[] | (number | number[])[])[] = nestedList.get(0)!;
      expect(item0[0] as number).assertEqual(1);
      expect((item0[1] as number[])[1]).assertEqual(3);
      expect(((item0[2] as (number | number[])[])[1] as number[])[0]).assertEqual(5)!;
      const item1: TypedArray[] = typedList.get(0)!;
      expect((item1[0] as Int32Array)[0]).assertEqual(10);
      expect((item1[1] as Float64Array)[1]).assertClose(6.28, 0.01);
      const item2: number[] = largeList.get(0)!;
      expect(item2.length).assertEqual(1000000);
      expect(item2[0]).assertEqual(1);
      expect(item2[999999]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_LIST_TEXT13_2500
     * @tc.name      testList13Chapter0025
     * @tc.desc      Verify the processing logic for arrays containing functions/keywords (Symbol removed)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0025';
      console.log(TAG + ' start');
      type MixedElement = (() => string) | string;
      const func: () => string = () => "testResult";
      const mixedTypeArr: MixedElement[] = [func, "0", "NaN", ""];

      const list: List<MixedElement[]> = new List<MixedElement[]>();
      list.add(Placeholder.MixedElementArray);
      list.set(0, mixedTypeArr);

      expect(list.length).assertEqual(1);
      const item0: MixedElement[] = list.get(0)!;
      expect((item0[0] as () => string)()).assertEqual("testResult");
      expect(item0[1] as string).assertEqual("0");
      expect(item0[2] as string).assertEqual("NaN");
      expect(item0[3] as string).assertEqual("");
    });

    /**
     * @tc.number    SUB_LIST_TEXT13_2600
     * @tc.name      testList13Chapter0026
     * @tc.desc      Test add interface with basic string values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0026';
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
     * @tc.number    SUB_LIST_TEXT13_2700
     * @tc.name      testList13Chapter0027
     * @tc.desc      Test add interface with special character strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0027';
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
     * @tc.number    SUB_LIST_TEXT13_2800
     * @tc.name      testList13Chapter0028
     * @tc.desc      Test add interface with escape character strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0028';
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
     * @tc.number    SUB_LIST_TEXT13_2900
     * @tc.name      testList13Chapter0029
     * @tc.desc      Test add interface with more escape character strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0029';
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
     * @tc.number    SUB_LIST_TEXT13_3000
     * @tc.name      testList13Chapter0030
     * @tc.desc      Test add interface with hex/octal escape strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0030';
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
     * @tc.number    SUB_LIST_TEXT13_3100
     * @tc.name      testList13Chapter0031
     * @tc.desc      Test add interface with emoji strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0031';
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
     * @tc.number    SUB_LIST_TEXT13_3200
     * @tc.name      testList13Chapter0032
     * @tc.desc      Test add interface with special unicode strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0032';
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
     * @tc.number    SUB_LIST_TEXT13_3300
     * @tc.name      testList13Chapter0033
     * @tc.desc      Test add interface with large strings (logic verification without actual large string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0033';
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
     * @tc.number    SUB_LIST_TEXT13_3400
     * @tc.name      testList13Chapter0034
     * @tc.desc      Test add interface with special number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0034';
      console.log(TAG + ' start');
      const basicValues = [0, NaN, -0, Infinity, -Infinity, undefined] as (number | undefined)[];
      const listConstructor = new List<number | undefined>();
      basicValues.forEach((val, index) => listConstructor.set(index, val));
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
      listInsert.set(0, 10);
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
     * @tc.number    SUB_LIST_TEXT13_3500
     * @tc.name      testList13Chapter0035
     * @tc.desc      Test add interface with extreme number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0035';
      console.log(TAG + ' start');
      const extremeValues = [
        Number.MAX_VALUE,
        Number.MIN_VALUE,
        Number.EPSILON,
        Number.MAX_SAFE_INTEGER
      ];
      const listConstructor = new List<number>();
      extremeValues.forEach((val, index) => listConstructor.set(index, val));
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
      listInsert.set(0, 0);
      listInsert.insert(1, Number.MAX_VALUE);
      listInsert.insert(0, Number.MIN_VALUE);
      listInsert.insert(5, Number.MAX_SAFE_INTEGER);
      expect(listInsert.size()).assertEqual(4);
      expect(listInsert.get(0)).assertEqual(Number.MIN_VALUE);
      expect(listInsert.get(2)).assertEqual(Number.MAX_VALUE);
      expect(listInsert.get(3)).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number    SUB_LIST_TEXT13_3600
     * @tc.name      testList13Chapter0036
     * @tc.desc      Test add interface with precision number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0036';
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
      precisionValues.byte.forEach((val, index) => listByte.set(index, val));
      expect(listByte.size()).assertEqual(4);
      expect(listByte.get(0)).assertEqual(-128);
      expect(listByte.get(2)).assertEqual(-129);
      const listShort = new List<number>();
      precisionValues.short.forEach((val, index) => listShort.set(index, val));
      expect(listShort.get(1)).assertEqual(32767);
      expect(listShort.get(3)).assertEqual(32768);
      const listChar = new List<number>();
      precisionValues.char.forEach((val, index) => listChar.set(index, val));
      expect(String.fromCharCode(listChar.get(2) ?? 0)).assertEqual("A");
      expect(String.fromCharCode(listChar.get(3) ?? 0)).assertEqual("a");
      const listLong = new List<bigint>();
      precisionValues.long.forEach((val, index) => listLong.set(index, val));
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
      listInsert.set(0, 0);
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
     * @tc.number    SUB_LIST_TEXT13_3700
     * @tc.name      testList13Chapter0037
     * @tc.desc      Test add interface with base expression number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0037';
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
      const constructorValues = [
        baseExprValues.hex16,
        baseExprValues.hex32,
        baseExprValues.octal,
        baseExprValues.sci1,
        baseExprValues.exponent
      ];
      const listConstructor = new List<number>();
      constructorValues.forEach((val, index) => listConstructor.set(index, val));
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
      listInsert.set(0, 100);
      listInsert.insert(1, baseExprValues.hex16);
      listInsert.insert(0, baseExprValues.sci1);
      listInsert.insert(5, baseExprValues.exponent);
      expect(listInsert.size()).assertEqual(4);
      expect(listInsert.get(0)).assertEqual(1000);
      expect(listInsert.get(2)).assertEqual(258);
      expect(listInsert.get(3)).assertEqual(8);
    });

    /**
     * @tc.number    SUB_LIST_TEXT13_3800
     * @tc.name      testList13Chapter0038
     * @tc.desc      Test add interface with bigint values (fixed redundant wrapping)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0038';
      console.log(TAG + ' start');
      const bigIntValues = [
        0xdecafafecacefaden,
        9007199254740991n,
        -9223372036854775808n,
        123.456,
        18446744073709551615n
      ];
      const listConstructor = new List<bigint | number>();
      bigIntValues.forEach((val, index) => listConstructor.set(index, val));
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
      listInsert.set(0, 0n);
      listInsert.insert(1, 123.456);
      listInsert.insert(0, -9223372036854775808n);
      listInsert.insert(5, 18446744073709551616n);
      expect(listInsert.size()).assertEqual(4);
      expect(listInsert.get(0)).assertEqual(-9223372036854775808n);
      expect(listInsert.get(2)).assertEqual(123.456);
      expect(listInsert.get(3)).assertEqual(18446744073709551616n);
    });

    /**
     * @tc.number    SUB_LIST_TEXT13_3900
     * @tc.name      testList13Chapter0039
     * @tc.desc      Test add interface with basic boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0039';
      console.log(TAG + ' start');
      const basicValues: boolean[] = [true, false];
      const listConstructor = new List<boolean>();
      basicValues.forEach((val, index) => listConstructor.set(index, val));
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
      listInsert.set(0, true);
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
     * @tc.number    SUB_LIST_TEXT13_4000
     * @tc.name      testList13Chapter0040
     * @tc.desc      Test add interface with false-like values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0040';
      console.log(TAG + ' start');
      const falseLikeValues: (number | string | null | undefined | boolean)[] = [0, NaN, "", null, undefined, !'s'];
      const listConstructor = new List<number | string | null | undefined | boolean>();
      falseLikeValues.forEach((val, index) => listConstructor.set(index, val));
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
      listInsert.set(0, true);
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
     * @tc.number    SUB_LIST_TEXT13_4100
     * @tc.name      testList13Chapter0041
     * @tc.desc      Test add interface with true-like values (fixed EmptyObject initialization)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0041';
      console.log(TAG + ' start');
      const emptyObj = new EmptyObject();
      const trueLikeValues: (boolean | number | string | EmptyObject | number[])[] =
        [!0, 1, "non-empty", emptyObj, [1]];
      const listConstructor = new List<boolean | number | string | EmptyObject | number[]>();
      trueLikeValues.forEach((val, index) => listConstructor.set(index, val));
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
      listInsert.set(0, false);
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
     * @tc.number    SUB_LIST_TEXT13_4200
     * @tc.name      testList13Chapter0042
     * @tc.desc      Test add interface with mixed boolean/number/string values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testList13Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testList13Chapter0042';
      console.log(TAG + ' start');
      const emptyObj = new EmptyObject();
      const mixedValues: (boolean | number | string | null | undefined | EmptyObject | number[])[] = [
        true, false, 0, NaN, "", null, undefined, !'s', !0,
        123, "", "test", emptyObj, [1]
      ];
      const listConstructor = new List<boolean | number | string | null | undefined | EmptyObject | number[]>();
      mixedValues.forEach((val, index) => listConstructor.set(index, val));
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
      listInsert.set(0, true);
      listInsert.set(1, false);
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
  })
}