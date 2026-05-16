import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { Vector } from '@kit.ArkTS';

const sleep = (time: number): Promise<void> => {
  return new Promise<void>((resolve) => {
    setTimeout(resolve, time);
  });
};

export default function vectorTest08() {
  describe('VectorTest08', () => {
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
     * @tc.number    SUB_VECTOR_TEST08_0100
     * @tc.name      testVector08Chapter0001
     * @tc.desc      set Array(has NaN/Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0001';
      let vector = new Vector<Array<number>>();
      let arrVal = [72,101,NaN,Infinity,108,111];
      vector.add([108]);
      vector.set(0,arrVal);
      expect(vector[0]).assertEqual(arrVal);
      expect(isNaN(vector[0][2])).assertTrue();
      expect(vector[0][3]).assertEqual(Infinity);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_0200
     * @tc.name      testVector08Chapter0002
     * @tc.desc      set Array(Contains non-numeric types) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0002';
      let vector = new Vector<Array<string | number | undefined | boolean | null>>();
      let arrVal = [72,"abc",true,null,undefined,108];
      vector.add([108]);
      vector.set(0,arrVal);
      expect(vector[0]).assertEqual(arrVal);
      expect(vector[0][1]).assertEqual("abc");
      expect(vector[0][2]).assertEqual(true);
      expect(vector[0][3]).assertEqual(null);
      expect(vector[0][4]).assertEqual(undefined);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_0300
     * @tc.name      testVector08Chapter0003
     * @tc.desc      set Array([]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0003';
      let vector = new Vector<Array<number>>();
      let arrVal: Array<number> = [];
      vector.add([108]);
      vector.set(0,arrVal);
      expect(vector[0]).assertEqual(arrVal);
      expect(vector[0].length).assertEqual(0);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_0400
     * @tc.name      testVector08Chapter0004
     * @tc.desc      set object({a:1, b:"test", c:[1,2,3]}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0004';
      let numArr= [1,2,3];
      class C1 {
        a: number = 1;
        b: string = "test";
        c: number[] = numArr;
      }
      let vector = new Vector<object>();
      let objVal = new C1();
      vector.add({a:2, b:"test2", c:[4,5,6]});
      vector.set(0,objVal);
      expect(vector[0]).assertEqual(objVal);
      expect(vector[0].a).assertEqual(1);
      expect(vector[0].b).assertEqual("test");
      expect(vector[0].c).assertEqual(numArr);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_0500
     * @tc.name      testVector08Chapter0005
     * @tc.desc      set object({a:1, b:{c:2, d:{e:3}}}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0005';
      class C3 { e: number = 3; }
      class C2 { c: number = 2; d: C3 = new C3(); }
      class C1 { a: number = 1; b: C2 = new C2(); }
      let vector = new Vector<C1>();
      let objVal = new C1();
      vector.add({a:2, b:{c:3, d:{e:4}}});
      vector.set(0,objVal);
      expect(vector[0]).assertEqual(objVal);
      expect(vector[0].a).assertEqual(1);
      expect(vector[0].b.c).assertEqual(2);
      expect(vector[0].b.d.e).assertEqual(3);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_0600
     * @tc.name      testVector08Chapter0006
     * @tc.desc      set object({a:1, b:()=>{}}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0006';
      class C1 { a: number = 1; b: () => void = ()=>{}; }
      let vector = new Vector<C1>();
      let objVal = new C1();
      vector.add({a:2, b:()=>{}});
      vector.set(0,objVal);
      expect(vector[0]).assertEqual(objVal);
      expect(vector[0].a).assertEqual(1);
      expect(vector[0].b).assertEqual(objVal.b);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_0700
     * @tc.name      testVector08Chapter0007
     * @tc.desc      set object.create({parentProp:1}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0007';
      let vector = new Vector<object>();
      class C1 {
        parentProp: number = 1;
        childProp: number = 2;
      }
      let objVal = new C1();
      objVal.childProp = 2;
      vector.add({parentProp:4, childProp:5});
      vector.set(0,objVal);
      expect(vector[0]).assertEqual(objVal);
      expect((vector[0] as C1).childProp).assertEqual(2);
      expect((vector[0] as C1).parentProp).assertEqual(1);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_0800
     * @tc.name      testVector08Chapter0008
     * @tc.desc      set object.defineProperty(obj, 'a', {enumerable:false, value:1}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0008';
      let vector = new Vector<object>();
      class StaticClass {
        private internalProp: number = 1;
        public publicProp: number = 2
      }
      let objVal = new StaticClass();
      vector.add({});
      vector.set(0,objVal);
      expect(vector[0]).assertEqual(objVal);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_0900
     * @tc.name      testVector08Chapter0009
     * @tc.desc      set object({buffer: new ArrayBuffer(16)}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0009';
      class C1 {
        buffer: ArrayBuffer = new ArrayBuffer(16);
      }
      let vector = new Vector<object>();
      let objVal = new C1();
      vector.add({buffer: new ArrayBuffer(8)});
      vector.set(0,objVal);
      expect(vector[0]).assertEqual(objVal);
      expect(vector[0].buffer.byteLength).assertEqual(16);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_1000
     * @tc.name      testVector08Chapter0010
     * @tc.desc      set object({view: new DataView(new ArrayBuffer(16))}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0010';
      let vector = new Vector<object>();
      class C1 {
        view: DataView = new DataView(new ArrayBuffer(16));
      }
      let objVal =  new C1();
      vector.add({view: new DataView(new ArrayBuffer(8))});
      vector.set(0,objVal);
      expect(vector[0]).assertEqual(objVal);
      expect(vector[0].view.byteLength).assertEqual(16);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_1100
     * @tc.name      testVector08Chapter0011
     * @tc.desc      set object({}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0011';
      let vector = new Vector<object>();
      class C1 {
      }
      let objVal = new C1();
      vector.add({a:1});
      vector.set(0,objVal);
      expect(vector[0]).assertEqual(objVal);
      expect(Object.keys(vector[0]).length).assertEqual(0);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_1200
     * @tc.name      testVector08Chapter0012
     * @tc.desc      set object({a:undefined, b:1}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0012';
      let vector = new Vector<object>();
      class C1 {
        a: undefined = undefined;
        b: number = 1;
      }
      let objVal = new C1();
      vector.add({a:undefined, b:2});
      vector.set(0,objVal);
      expect(vector[0]).assertEqual(objVal);
      expect(vector[0].a).assertUndefined();
      expect(vector[0].b).assertEqual(1);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_1300
     * @tc.name      testVector08Chapter0013
     * @tc.desc      set object({a:null, b:1}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0013';
      class C1 {
        a: null = null;
        b: number = 1;
      }
      let vector = new Vector<object>();
      let objVal = new C1();
      vector.add({a:null, b:2});
      vector.set(0,objVal);
      expect(vector[0]).assertEqual(objVal);
      expect(vector[0].a).assertEqual(null);
      expect(vector[0].b).assertEqual(1);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_1400
     * @tc.name      testVector08Chapter0014
     * @tc.desc      set object({a:NaN, b:1}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0014';
      class C1 {
        a: number = NaN;
        b: number = 1;
      }
      let vector = new Vector<object>();
      let objVal = new C1();
      vector.add({a:2, b:3});
      vector.set(0,objVal);
      expect(vector[0]).assertEqual(objVal);
      expect(vector[0].a).assertNaN();
      expect(vector[0].b).assertEqual(1);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_1500
     * @tc.name      testVector08Chapter0015
     * @tc.desc      set object({a:Infinity, b:1}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0015';
      class C1 {
        a: number = Infinity;
        b: number = 1;
      }
      let vector = new Vector<object>();
      let objVal = new C1();
      vector.add({a:2, b:3});
      vector.set(0,objVal);
      expect(vector[0]).assertEqual(objVal);
      expect(vector[0].a).assertEqual(Infinity);
      expect(vector[0].b).assertEqual(1);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_1600
     * @tc.name      testVector08Chapter0016
     * @tc.desc      set object({buffer: new Uint8Array([72,101,108,108,111])}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0016';
      class C1 {
        buffer: Uint8Array = new Uint8Array([72,101,108,108,111]);
      }
      let vector = new Vector<object>();
      let objVal = new C1();
      vector.add({buffer: new Uint8Array([108])});
      vector.set(0,objVal);
      expect(vector[0]).assertEqual(objVal);
      expect(vector[0].buffer[0]).assertEqual(72);
      expect(vector[0].buffer[4]).assertEqual(111);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_1700
     * @tc.name      testVector08Chapter0017
     * @tc.desc      set object({map: new Map([['key1', 'value1'], ['key2', {a:1}]]}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0017';
      class C2{
        a: number = 1;
      }
      class C1 {
        map:Map<string, string | C2>=new Map<string, string | C2>([['key1', 'value1'], ['key2', {a:1}]])
      }
      let vector = new Vector<object>();
      let objVal =new C1();
      vector.add({
        a:"Holle World"
      });
      vector.set(0,objVal);
      expect(vector[0]).assertEqual(objVal);
      expect(vector[0].map.get('key1')).assertEqual('value1');
      expect(vector[0].map.get('key2')?.a).assertEqual(1);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_1800
     * @tc.name      testVector08Chapter0018
     * @tc.desc      set object({set: new Set([1,2,3])}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0018';
      class C1 {
        set:Set<number>=new Set([1,2,3]);
      }
      let vector = new Vector<object>();
      let objVal = new C1();
      vector.add({set: new Set([4,5,6])});
      vector.set(0,objVal);
      expect(vector[0]).assertEqual(objVal);
      expect(vector[0].set.has(1)).assertTrue();
      expect(vector[0].set.has(3)).assertTrue();
      expect(vector[0].set.size).assertEqual(3);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_1900
     * @tc.name      testVector08Chapter0019
     * @tc.desc      set object({promise: new Promise((resolve) => setTimeout(() => resolve('done'), 100))}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0019';
      class C1 {
        promise:Promise<string>=new Promise((resolve) => setTimeout(() => resolve('done'), 100));
      }
      let vector = new Vector<object>();
      let objVal = new C1();
      vector.add({
        a:"Holle World"
      });
      vector.set(0,objVal);
      expect(vector[0]).assertEqual(objVal);
      expect(vector[0].promise instanceof Promise).assertTrue();
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_2000
     * @tc.name      testVector08Chapter0020
     * @tc.desc      set object({regex: /abc/gi, flags: /def/m}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0020';
      class C1 {
        regex:RegExp=/abc/gi;
        flags:RegExp=/def/m;
      }
      let vector = new Vector<object>();
      let objVal =new C1();
      vector.add({regex: /123/g, flags: /456/i});
      vector.set(0,objVal);
      expect(vector[0]).assertEqual(objVal);
      expect(vector[0].regex.source).assertEqual('abc');
      expect(vector[0].regex.flags).assertEqual('gi');
      expect(vector[0].flags.source).assertEqual('def');
      expect(vector[0].flags.flags).assertEqual('m');
      expect(vector.length).assertEqual(1);
    })

     /**
      * @tc.number    SUB_VECTOR_TEST08_2100
      * @tc.name      testVector08Chapter0021
      * @tc.desc      [Symbol.iterator] test (for...of iterate number elements)
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it("testVector08Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0021';
      let vector = new Vector<number>();
      vector.add(1)
      vector.add(2)
      const result: number[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_2200
     * @tc.name      testVector08Chapter0022
     * @tc.desc      [Symbol.iterator] test (for...of iterate empty Vector)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0022';
      let vector = new Vector<number>();
      const result: number[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result.length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_2300
     * @tc.name      testVector08Chapter0023
     * @tc.desc      [Symbol.iterator] Int8Array([-128]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0023';
      let vector = new Vector<Int8Array>();
      let int8Arr = new Int8Array([-128]);
      vector.add(int8Arr);
      const result: Int8Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(int8Arr);
      expect(result[0][0]).assertEqual(-128);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_2400
     * @tc.name      testVector08Chapter0024
     * @tc.desc      [Symbol.iterator] Int8Array([127]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0024';
      let vector = new Vector<Int8Array>();
      let int8Arr = new Int8Array([127]);
      vector.add(int8Arr);
      const result: Int8Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(int8Arr);
      expect(result[0][0]).assertEqual(127);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_2500
     * @tc.name      testVector08Chapter0025
     * @tc.desc      [Symbol.iterator] Int8Array([-129]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0025';
      let vector = new Vector<Int8Array>();
      let int8Arr = new Int8Array([-129]);
      vector.add(int8Arr);
      const result: Int8Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(int8Arr);
      expect(result[0][0]).assertEqual(127);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_2600
     * @tc.name      testVector08Chapter0026
     * @tc.desc      [Symbol.iterator] Int8Array([128]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0026';
      let vector = new Vector<Int8Array>();
      let int8Arr = new Int8Array([128]);
      vector.add(int8Arr);
      const result: Int8Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(int8Arr);
      expect(result[0][0]).assertEqual(-128); // Int8Array超出范围溢出：128 → -128
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_2700
     * @tc.name      testVector08Chapter0027
     * @tc.desc      [Symbol.iterator] Int8Array([0]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0027';
      let vector = new Vector<Int8Array>();
      let int8Arr = new Int8Array([0]);
      vector.add(int8Arr);
      const result: Int8Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(int8Arr);
      expect(result[0][0]).assertEqual(0);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_2800
     * @tc.name      testVector08Chapter0028
     * @tc.desc      [Symbol.iterator] Uint8Array([0]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0028';
      let vector = new Vector<Uint8Array>();
      let uint8Arr = new Uint8Array([0]);
      vector.add(uint8Arr);
      const result: Uint8Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(uint8Arr);
      expect(result[0][0]).assertEqual(0);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_2900
     * @tc.name      testVector08Chapter0029
     * @tc.desc      [Symbol.iterator] Uint8Array([255]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0029';
      let vector = new Vector<Uint8Array>();
      let uint8Arr = new Uint8Array([255]);
      vector.add(uint8Arr);
      const result: Uint8Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(uint8Arr);
      expect(result[0][0]).assertEqual(255);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_3000
     * @tc.name      testVector08Chapter0030
     * @tc.desc      [Symbol.iterator] Uint8Array([256]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0030';
      let vector = new Vector<Uint8Array>();
      let uint8Arr = new Uint8Array([256]);
      vector.add(uint8Arr);
      const result: Uint8Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(uint8Arr);
      expect(result[0][0]).assertEqual(0); // Uint8Array超出范围溢出：256 → 0
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_3100
     * @tc.name      testVector08Chapter0031
     * @tc.desc      [Symbol.iterator] Uint8Array([-1]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0031';
      let vector = new Vector<Uint8Array>();
      let uint8Arr = new Uint8Array([-1]);
      vector.add(uint8Arr);
      const result: Uint8Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(uint8Arr);
      expect(result[0][0]).assertEqual(255); // Uint8Array负数溢出：-1 → 255
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_3200
     * @tc.name      testVector08Chapter0032
     * @tc.desc      [Symbol.iterator] Uint8ClampedArray([0]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0032';
      let vector = new Vector<Uint8ClampedArray>();
      let uint8ClampedArr = new Uint8ClampedArray([0]);
      vector.add(uint8ClampedArr);
      const result: Uint8ClampedArray[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(uint8ClampedArr);
      expect(result[0][0]).assertEqual(0);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_3300
     * @tc.name      testVector08Chapter0033
     * @tc.desc      [Symbol.iterator] Uint8ClampedArray([255]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0033';
      let vector = new Vector<Uint8ClampedArray>();
      let uint8ClampedArr = new Uint8ClampedArray([255]);
      vector.add(uint8ClampedArr);
      const result: Uint8ClampedArray[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(uint8ClampedArr);
      expect(result[0][0]).assertEqual(255);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_3400
     * @tc.name      testVector08Chapter0034
     * @tc.desc      [Symbol.iterator] Uint8ClampedArray([-1]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0034';
      let vector = new Vector<Uint8ClampedArray>();
      let uint8ClampedArr = new Uint8ClampedArray([-1]);
      vector.add(uint8ClampedArr);
      const result: Uint8ClampedArray[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(uint8ClampedArr);
      expect(result[0][0]).assertEqual(0); // Uint8ClampedArray负数钳位：-1 → 0
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_3500
     * @tc.name      testVector08Chapter0035
     * @tc.desc      [Symbol.iterator] Uint8ClampedArray([256]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0035';
      let vector = new Vector<Uint8ClampedArray>();
      let uint8ClampedArr = new Uint8ClampedArray([256]);
      vector.add(uint8ClampedArr);
      const result: Uint8ClampedArray[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(uint8ClampedArr);
      expect(result[0][0]).assertEqual(255); // Uint8ClampedArray超上限钳位：256 → 255
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_3600
     * @tc.name      testVector08Chapter0036
     * @tc.desc      [Symbol.iterator] Int16Array([-32768]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0036';
      let vector = new Vector<Int16Array>();
      let int16Arr = new Int16Array([-32768]);
      vector.add(int16Arr);
      const result: Int16Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(int16Arr);
      expect(result[0][0]).assertEqual(-32768);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_3700
     * @tc.name      testVector08Chapter0037
     * @tc.desc      [Symbol.iterator] Int16Array([32767]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0037';
      let vector = new Vector<Int16Array>();
      let int16Arr = new Int16Array([32767]);
      vector.add(int16Arr);
      const result: Int16Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(int16Arr);
      expect(result[0][0]).assertEqual(32767);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_3800
     * @tc.name      testVector08Chapter0038
     * @tc.desc      [Symbol.iterator] Int16Array([-32769]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0038';
      let vector = new Vector<Int16Array>();
      let int16Arr = new Int16Array([-32769]);
      vector.add(int16Arr);
      const result: Int16Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(int16Arr);
      expect(result[0][0]).assertEqual(32767); // Int16Array溢出：-32769 → 32767
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_3900
     * @tc.name      testVector08Chapter0039
     * @tc.desc      [Symbol.iterator] Int16Array([32768]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0039';
      let vector = new Vector<Int16Array>();
      let int16Arr = new Int16Array([32768]);
      vector.add(int16Arr);
      const result: Int16Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(int16Arr);
      expect(result[0][0]).assertEqual(-32768); // Int16Array溢出：32768 → -32768
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_4000
     * @tc.name      testVector08Chapter0040
     * @tc.desc      [Symbol.iterator] Uint16Array([0]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0040';
      let vector = new Vector<Uint16Array>();
      let uint16Arr = new Uint16Array([0]);
      vector.add(uint16Arr);
      const result: Uint16Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(uint16Arr);
      expect(result[0][0]).assertEqual(0);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_4100
     * @tc.name      testVector08Chapter0041
     * @tc.desc      [Symbol.iterator] Uint16Array([65535]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0041';
      let vector = new Vector<Uint16Array>();
      let uint16Arr = new Uint16Array([65535]);
      vector.add(uint16Arr);
      const result: Uint16Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(uint16Arr);
      expect(result[0][0]).assertEqual(65535);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_4200
     * @tc.name      testVector08Chapter0042
     * @tc.desc      [Symbol.iterator] Uint16Array([-1]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0042';
      let vector = new Vector<Uint16Array>();
      let uint16Arr = new Uint16Array([-1]);
      vector.add(uint16Arr);
      const result: Uint16Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(uint16Arr);
      expect(result[0][0]).assertEqual(65535); // Uint16Array负数溢出：-1 → 65535
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_4300
     * @tc.name      testVector08Chapter0043
     * @tc.desc      [Symbol.iterator] Uint16Array([65536]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0043';
      let vector = new Vector<Uint16Array>();
      let uint16Arr = new Uint16Array([65536]);
      vector.add(uint16Arr);
      const result: Uint16Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(uint16Arr);
      expect(result[0][0]).assertEqual(0); // Uint16Array溢出：65536 → 0
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_4400
     * @tc.name      testVector08Chapter0044
     * @tc.desc      [Symbol.iterator] Int32Array([0]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0044';
      let vector = new Vector<Int32Array>();
      let int32Arr = new Int32Array([0]);
      vector.add(int32Arr);
      const result: Int32Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(int32Arr);
      expect(result[0][0]).assertEqual(0);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_4500
     * @tc.name      testVector08Chapter0045
     * @tc.desc      [Symbol.iterator] Int32Array([2147483647]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0045';
      let vector = new Vector<Int32Array>();
      let int32Arr = new Int32Array([2147483647]);
      vector.add(int32Arr);
      const result: Int32Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(int32Arr);
      expect(result[0][0]).assertEqual(2147483647);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_4600
     * @tc.name      testVector08Chapter0046
     * @tc.desc      [Symbol.iterator] Int32Array([-2147483648]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0046';
      let vector = new Vector<Int32Array>();
      let int32Arr = new Int32Array([-2147483648]);
      vector.add(int32Arr);
      const result: Int32Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(int32Arr);
      expect(result[0][0]).assertEqual(-2147483648);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_4700
     * @tc.name      testVector08Chapter0047
     * @tc.desc      [Symbol.iterator] Int32Array([-2147483649]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0047';
      let vector = new Vector<Int32Array>();
      let int32Arr = new Int32Array([-2147483649]);
      vector.add(int32Arr);
      const result: Int32Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(int32Arr);
      expect(result[0][0]).assertEqual(2147483647); // Int32Array溢出：-2147483649 → 2147483647
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_4800
     * @tc.name      testVector08Chapter0048
     * @tc.desc      [Symbol.iterator] Int32Array([2147483648]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0048';
      let vector = new Vector<Int32Array>();
      let int32Arr = new Int32Array([2147483648]);
      vector.add(int32Arr);
      const result: Int32Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(int32Arr);
      expect(result[0][0]).assertEqual(-2147483648); // Int32Array溢出：2147483648 → -2147483648
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_4900
     * @tc.name      testVector08Chapter0049
     * @tc.desc      [Symbol.iterator] Uint32Array([0]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0049';
      let vector = new Vector<Uint32Array>();
      let uint32Arr = new Uint32Array([0]);
      vector.add(uint32Arr);
      const result: Uint32Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(uint32Arr);
      expect(result[0][0]).assertEqual(0);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_5000
     * @tc.name      testVector08Chapter0050
     * @tc.desc      [Symbol.iterator] Uint32Array([4294967295]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0050';
      let vector = new Vector<Uint32Array>();
      let uint32Arr = new Uint32Array([4294967295]);
      vector.add(uint32Arr);
      const result: Uint32Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(uint32Arr);
      expect(result[0][0]).assertEqual(4294967295);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_5100
     * @tc.name      testVector08Chapter0051
     * @tc.desc      [Symbol.iterator] Uint32Array([4294967296]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0051';
      let vector = new Vector<Uint32Array>();
      let uint32Arr = new Uint32Array([4294967296]);
      vector.add(uint32Arr);
      const result: Uint32Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(uint32Arr);
      expect(result[0][0]).assertEqual(0); // Uint32Array溢出：4294967296 → 0
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_5200
     * @tc.name      testVector08Chapter0052
     * @tc.desc      [Symbol.iterator] Uint32Array([-1]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0052';
      let vector = new Vector<Uint32Array>();
      let uint32Arr = new Uint32Array([-1]);
      vector.add(uint32Arr);
      const result: Uint32Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(uint32Arr);
      expect(result[0][0]).assertEqual(4294967295); // Uint32Array负数溢出：-1 → 4294967295
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_5300
     * @tc.name      testVector08Chapter0053
     * @tc.desc      [Symbol.iterator] Float32Array([-3.4028234663852886e38]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0053';
      let vector = new Vector<Float32Array>();
      let float32Arr = new Float32Array([-3.4028234663852886e38]);
      vector.add(float32Arr);
      const result: Float32Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(float32Arr);
      expect(result[0][0]).assertEqual(-3.4028234663852886e38);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_5400
     * @tc.name      testVector08Chapter0054
     * @tc.desc      [Symbol.iterator] Float32Array([3.4028234663852886e38]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0054';
      let vector = new Vector<Float32Array>();
      let float32Arr = new Float32Array([3.4028234663852886e38]);
      vector.add(float32Arr);
      const result: Float32Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(float32Arr);
      expect(result[0][0]).assertEqual(3.4028234663852886e38);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_5500
     * @tc.name      testVector08Chapter0055
     * @tc.desc      [Symbol.iterator] Float32Array([-3.5e38]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0055';
      let vector = new Vector<Float32Array>();
      let float32Arr = new Float32Array([-3.5e38]);
      vector.add(float32Arr);
      const result: Float32Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(float32Arr);
      expect(result[0][0]).assertEqual(-Infinity); // Float32Array超出范围变为-Infinity
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_5600
     * @tc.name      testVector08Chapter0056
     * @tc.desc      [Symbol.iterator] Float32Array([3.5e38]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0056';
      let vector = new Vector<Float32Array>();
      let float32Arr = new Float32Array([3.5e38]);
      vector.add(float32Arr);
      const result: Float32Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(float32Arr);
      expect(result[0][0]).assertEqual(Infinity); // Float32Array超出范围变为Infinity
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_5700
     * @tc.name      testVector08Chapter0057
     * @tc.desc      [Symbol.iterator] Float64Array([-1.7976931348623157e308]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0057';
      let vector = new Vector<Float64Array>();
      let float64Arr = new Float64Array([-1.7976931348623157e308]);
      vector.add(float64Arr);
      const result: Float64Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(float64Arr);
      expect(result[0][0]).assertEqual(-1.7976931348623157e308);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_5800
     * @tc.name      testVector08Chapter0058
     * @tc.desc      [Symbol.iterator] Float64Array([1.7976931348623157e308]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0058';
      let vector = new Vector<Float64Array>();
      let float64Arr = new Float64Array([1.7976931348623157e308]);
      vector.add(float64Arr);
      const result: Float64Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(float64Arr);
      expect(result[0][0]).assertEqual(1.7976931348623157e308);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_5900
     * @tc.name      testVector08Chapter0059
     * @tc.desc      [Symbol.iterator] Float64Array([-1.8E308]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0059';
      let vector = new Vector<Float64Array>();
      let float64Arr = new Float64Array([-1.8E308]);
      vector.add(float64Arr);
      const result: Float64Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(float64Arr);
      expect(result[0][0]).assertEqual(-Infinity); // Float64Array超出范围变为-Infinity
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_6000
     * @tc.name      testVector08Chapter0060
     * @tc.desc      [Symbol.iterator] Float64Array([1.8E308]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0060';
      let vector = new Vector<Float64Array>();
      let float64Arr = new Float64Array([1.8E308]);
      vector.add(float64Arr);
      const result: Float64Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(float64Arr);
      expect(result[0][0]).assertEqual(Infinity); // Float64Array超出范围变为Infinity
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_6100
     * @tc.name      testVector08Chapter0061
     * @tc.desc      [Symbol.iterator] BigInt64Array([-9223372036854775808n]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0061';
      let vector = new Vector<BigInt64Array>();
      let bigInt64Arr = new BigInt64Array([-9223372036854775808n]);
      vector.add(bigInt64Arr);
      const result: BigInt64Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(bigInt64Arr);
      expect(result[0][0]).assertEqual(-9223372036854775808n);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_6200
     * @tc.name      testVector08Chapter0062
     * @tc.desc      [Symbol.iterator] BigInt64Array([9223372036854775807n]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0062';
      let vector = new Vector<BigInt64Array>();
      let bigInt64Arr = new BigInt64Array([9223372036854775807n]);
      vector.add(bigInt64Arr);
      const result: BigInt64Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(bigInt64Arr);
      expect(result[0][0]).assertEqual(9223372036854775807n);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_6300
     * @tc.name      testVector08Chapter0063
     * @tc.desc      [Symbol.iterator] BigInt64Array([-9223372036854775809n]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0063';
      let vector = new Vector<BigInt64Array>();
      let bigInt64Arr = new BigInt64Array([-9223372036854775809n]);
      vector.add(bigInt64Arr);
      const result: BigInt64Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(bigInt64Arr);
      expect(result[0][0]).assertEqual(9223372036854775807n); // BigInt64Array溢出：-9223372036854775809n → 9223372036854775807n
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_6400
     * @tc.name      testVector08Chapter0064
     * @tc.desc      [Symbol.iterator] BigInt64Array([9223372036854775808n]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0064';
      let vector = new Vector<BigInt64Array>();
      let bigInt64Arr = new BigInt64Array([9223372036854775808n]);
      vector.add(bigInt64Arr);
      const result: BigInt64Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(bigInt64Arr);
      expect(result[0][0]).assertEqual(-9223372036854775808n); // BigInt64Array溢出：9223372036854775808n → -9223372036854775808n
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_6500
     * @tc.name      testVector08Chapter0065
     * @tc.desc      [Symbol.iterator] BigUint64Array([0n]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0065';
      let vector = new Vector<BigUint64Array>();
      let bigUint64Arr = new BigUint64Array([0n]);
      vector.add(bigUint64Arr);
      const result: BigUint64Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(bigUint64Arr);
      expect(result[0][0]).assertEqual(0n);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_6600
     * @tc.name      testVector08Chapter0066
     * @tc.desc      [Symbol.iterator] BigUint64Array([18446744073709551615n]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0066';
      let vector = new Vector<BigUint64Array>();
      let bigUint64Arr = new BigUint64Array([18446744073709551615n]);
      vector.add(bigUint64Arr);
      const result: BigUint64Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(bigUint64Arr);
      expect(result[0][0]).assertEqual(18446744073709551615n);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_6700
     * @tc.name      testVector08Chapter0067
     * @tc.desc      [Symbol.iterator] BigUint64Array([18446744073709551616n]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0067';
      let vector = new Vector<BigUint64Array>();
      let bigUint64Arr = new BigUint64Array([18446744073709551616n]);
      vector.add(bigUint64Arr);
      const result: BigUint64Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(bigUint64Arr);
      expect(result[0][0]).assertEqual(0n); // BigUint64Array溢出：18446744073709551616n → 0n
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_6800
     * @tc.name      testVector08Chapter0068
     * @tc.desc      [Symbol.iterator] Float32Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0068';
      let vector = new Vector<Float32Array>();
      let float32Arr = new Float32Array([Infinity]);
      vector.add(float32Arr);
      const result: Float32Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(float32Arr);
      expect(result[0][0]).assertEqual(Infinity);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_6900
     * @tc.name      testVector08Chapter0069
     * @tc.desc      [Symbol.iterator] Float32Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0069';
      let vector = new Vector<Float32Array>();
      let float32Arr = new Float32Array([-Infinity]);
      vector.add(float32Arr);
      const result: Float32Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(float32Arr);
      expect(result[0][0]).assertEqual(-Infinity);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_7000
     * @tc.name      testVector08Chapter0070
     * @tc.desc      [Symbol.iterator] Float32Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0070';
      let vector = new Vector<Float32Array>();
      let float32Arr = new Float32Array([NaN]);
      vector.add(float32Arr);
      const result: Float32Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(float32Arr);
      expect(isNaN(result[0][0])).assertTrue();
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_7100
     * @tc.name      testVector08Chapter0071
     * @tc.desc      [Symbol.iterator] Float64Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0071';
      let vector = new Vector<Float64Array>();
      let float64Arr = new Float64Array([Infinity]);
      vector.add(float64Arr);
      const result: Float64Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(float64Arr);
      expect(result[0][0]).assertEqual(Infinity);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_7200
     * @tc.name      testVector08Chapter0072
     * @tc.desc      [Symbol.iterator] Float64Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0072';
      let vector = new Vector<Float64Array>();
      let float64Arr = new Float64Array([-Infinity]);
      vector.add(float64Arr);
      const result: Float64Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(float64Arr);
      expect(result[0][0]).assertEqual(-Infinity);
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_7300
     * @tc.name      testVector08Chapter0073
     * @tc.desc      [Symbol.iterator] Float64Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0073';
      let vector = new Vector<Float64Array>();
      let float64Arr = new Float64Array([NaN]);
      vector.add(float64Arr);
      const result: Float64Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(float64Arr);
      expect(isNaN(result[0][0])).assertTrue();
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_7400
     * @tc.name      testVector08Chapter0074
     * @tc.desc      [Symbol.iterator] Int8Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0074';
      let vector = new Vector<Int8Array>();
      let int8Arr = new Int8Array([Infinity]);
      vector.add(int8Arr);
      const result: Int8Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(int8Arr);
      expect(result[0][0]).assertEqual(0); // Int8Array Infinity溢出：Infinity → 0
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_7500
     * @tc.name      testVector08Chapter0075
     * @tc.desc      [Symbol.iterator] Int8Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0075';
      let vector = new Vector<Int8Array>();
      let int8Arr = new Int8Array([-Infinity]);
      vector.add(int8Arr);
      const result: Int8Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(int8Arr);
      expect(result[0][0]).assertEqual(0); // Int8Array -Infinity溢出：-Infinity → 0
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_7600
     * @tc.name      testVector08Chapter0076
     * @tc.desc      [Symbol.iterator] Int8Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0076';
      let vector = new Vector<Int8Array>();
      let int8Arr = new Int8Array([NaN]);
      vector.add(int8Arr);
      const result: Int8Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(int8Arr);
      expect(result[0][0]).assertEqual(0); // Int8Array NaN溢出：NaN → 0
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_7700
     * @tc.name      testVector08Chapter0077
     * @tc.desc      [Symbol.iterator] Uint8Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0077';
      let vector = new Vector<Uint8Array>();
      let uint8Arr = new Uint8Array([Infinity]);
      vector.add(uint8Arr);
      const result: Uint8Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(uint8Arr);
      expect(result[0][0]).assertEqual(0); // Uint8Array Infinity溢出：Infinity → 0
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_7800
     * @tc.name      testVector08Chapter0078
     * @tc.desc      [Symbol.iterator] Uint8Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0078';
      let vector = new Vector<Uint8Array>();
      let uint8Arr = new Uint8Array([-Infinity]);
      vector.add(uint8Arr);
      const result: Uint8Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(uint8Arr);
      expect(result[0][0]).assertEqual(0); // Uint8Array -Infinity溢出：-Infinity → 0
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_7900
     * @tc.name      testVector08Chapter0079
     * @tc.desc      [Symbol.iterator] Uint8Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0079';
      let vector = new Vector<Uint8Array>();
      let uint8Arr = new Uint8Array([NaN]);
      vector.add(uint8Arr);
      const result: Uint8Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(uint8Arr);
      expect(result[0][0]).assertEqual(0); // Uint8Array NaN溢出：NaN → 0
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_8000
     * @tc.name      testVector08Chapter0080
     * @tc.desc      [Symbol.iterator] Int16Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0080';
      let vector = new Vector<Int16Array>();
      let int16Arr = new Int16Array([Infinity]);
      vector.add(int16Arr);
      const result: Int16Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(int16Arr);
      expect(result[0][0]).assertEqual(0); // Int16Array Infinity溢出：Infinity → 0
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_8100
     * @tc.name      testVector08Chapter0081
     * @tc.desc      [Symbol.iterator] Int16Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0081';
      let vector = new Vector<Int16Array>();
      let int16Arr = new Int16Array([-Infinity]);
      vector.add(int16Arr);
      const result: Int16Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(int16Arr);
      expect(result[0][0]).assertEqual(0); // Int16Array -Infinity溢出：-Infinity → 0
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_8200
     * @tc.name      testVector08Chapter0082
     * @tc.desc      [Symbol.iterator] Int16Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0082';
      let vector = new Vector<Int16Array>();
      let int16Arr = new Int16Array([NaN]);
      vector.add(int16Arr);
      const result: Int16Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(int16Arr);
      expect(result[0][0]).assertEqual(0); // Int16Array NaN溢出：NaN → 0
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_8300
     * @tc.name      testVector08Chapter0083
     * @tc.desc      [Symbol.iterator] Uint16Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0083';
      let vector = new Vector<Uint16Array>();
      let uint16Arr = new Uint16Array([Infinity]);
      vector.add(uint16Arr);
      const result: Uint16Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(uint16Arr);
      expect(result[0][0]).assertEqual(0); // Uint16Array Infinity溢出：Infinity → 0
      expect(result.length).assertEqual(vector.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST08_8400
     * @tc.name      testVector08Chapter0084
     * @tc.desc      [Symbol.iterator] Uint16Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector08Chapter0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector08Chapter0084';
      let vector = new Vector<Uint16Array>();
      let uint16Arr = new Uint16Array([-Infinity]);
      vector.add(uint16Arr);
      const result: Uint16Array[] = [];
      for (const item of vector) {
        result.push(item);
      }
      expect(result[0]).assertEqual(uint16Arr);
      expect(result[0][0]).assertEqual(0); // Uint16Array -Infinity溢出：-Infinity → 0
      expect(result.length).assertEqual(vector.length);
    })
  })
}
