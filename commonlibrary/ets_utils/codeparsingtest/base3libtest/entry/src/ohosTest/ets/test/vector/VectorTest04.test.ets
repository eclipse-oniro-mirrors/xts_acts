import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { Vector } from '@kit.ArkTS';

const sleep = (time: number): Promise<void> => {
  return new Promise<void>((resolve) => {
    setTimeout(resolve, time);
  });
};

export default function vectorTest04() {
  describe('VectorTest04', () => {
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
     * @tc.number    SUB_VECTOR_TEST04_0100
     * @tc.name      testVector04Chapter0001
     * @tc.desc      insert number(Number Max Value（2^53 - 1）) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0001'
      let vector = new Vector<number>();
      for (let i = 0; i < 10; i++) {
        vector.add(i)
      }
      let length = vector.length;
      vector.insert(Number.MAX_SAFE_INTEGER, 3)
      expect(vector[3]).assertEqual(2**53 - 1);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_0200
     * @tc.name      testVector04Chapter0002
     * @tc.desc      insert number(1.40129846432481707e-45) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0002'
      let vector = new Vector<number>();
      for (let i = 0; i < 10; i++) {
        vector.add(i)
      }
      let length = vector.length;
      let float = 1.40129846432481707e-45
      vector.insert(float, 3)
      expect(vector[3]).assertEqual(float);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_0300
     * @tc.name      testVector04Chapter0003
     * @tc.desc      insert number(-1.40129846432481707e-45) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0003'
      let vector = new Vector<number>();
      for (let i = 0; i < 10; i++) {
        vector.add(i)
      }
      let length = vector.length;
      let float = -1.40129846432481707e-45
      vector.insert(float, 3)
      expect(vector[3]).assertEqual(float);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_0400
     * @tc.name      testVector04Chapter0004
     * @tc.desc      insert number(3.40282346638528860e+38) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0004'
      let vector = new Vector<number>();
      for (let i = 0; i < 10; i++) {
        vector.add(i)
      }
      let length = vector.length;
      let float = 3.40282346638528860e+38
      vector.insert(float, 3)
      expect(vector[3]).assertEqual(float);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_0500
     * @tc.name      testVector04Chapter0005
     * @tc.desc      insert number(-3.40282346638528860e+38) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0005'
      let vector = new Vector<number>();
      for (let i = 0; i < 10; i++) {
        vector.add(i)
      }
      let length = vector.length;
      let float = -3.40282346638528860e+38
      vector.insert(float, 3)
      expect(vector[3]).assertEqual(float);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_0600
     * @tc.name      testVector04Chapter0006
     * @tc.desc      insert number(4.94065645841246544e-324) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0006'
      let vector = new Vector<number>();
      for (let i = 0; i < 10; i++) {
        vector.add(i)
      }
      let length = vector.length;
      let float = 4.94065645841246544e-324
      vector.insert(float, 3)
      expect(vector[3]).assertEqual(float);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_0700
     * @tc.name      testVector04Chapter0007
     * @tc.desc      insert number(-4.94065645841246544e-324) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0007'
      let vector = new Vector<number>();
      for (let i = 0; i < 10; i++) {
        vector.add(i)
      }
      let length = vector.length;
      let float = -4.94065645841246544e-324
      vector.insert(float, 3)
      expect(vector[3]).assertEqual(float);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_0800
     * @tc.name      testVector04Chapter0008
     * @tc.desc      insert number(1.79769313486231570e+308) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0008'
      let vector = new Vector<number>();
      for (let i = 0; i < 10; i++) {
        vector.add(i)
      }
      let length = vector.length;
      let float = 1.79769313486231570e+308
      vector.insert(float, 3)
      expect(vector[3]).assertEqual(float);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_0900
     * @tc.name      testVector04Chapter0009
     * @tc.desc      insert number(-1.79769313486231570e+308) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0009'
      let vector = new Vector<number>();
      for (let i = 0; i < 10; i++) {
        vector.add(i)
      }
      let length = vector.length;
      let float = -1.79769313486231570e+308
      vector.insert(float, 3)
      expect(vector[3]).assertEqual(float);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_1000
     * @tc.name      testVector04Chapter0010
     * @tc.desc      insert boolean(true) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0010'
      let vector = new Vector<boolean>();
      for (let i = 0; i < 10; i++) {
        vector.add(true)
      }
      let length = vector.length;
      vector.insert(true, 3)
      expect(vector[3]).assertEqual(true);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_1100
     * @tc.name      testVector04Chapter0011
     * @tc.desc      insert boolean(false) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0011'
      let vector = new Vector<boolean>();
      for (let i = 0; i < 10; i++) {
        vector.add(false)
      }
      let length = vector.length;
      vector.insert(false, 3)
      expect(vector[3]).assertEqual(false);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_1200
     * @tc.name      testVector04Chapter0012
     * @tc.desc      insert boolean(undefined) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0012'
      let vector = new Vector<boolean>();
      for (let i = 0; i < 10; i++) {
        vector.add(true)
      }
      let length = vector.length;
      vector.insert(undefined, 3)
      expect(vector[3]).assertUndefined();
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_1300
     * @tc.name      testVector04Chapter0013
     * @tc.desc      insert boolean(null) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0013'
      let vector = new Vector<boolean>();
      for (let i = 0; i < 10; i++) {
        vector.add(true)
      }
      let length = vector.length;
      vector.insert(null, 3)
      expect(vector[3]).assertNull();
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_1400
     * @tc.name      testVector04Chapter0014
     * @tc.desc      insert boolean(!0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0014'
      let vector = new Vector<boolean>();
      for (let i = 0; i < 10; i++) {
        vector.add(true)
      }
      let length = vector.length;
      vector.insert(!0, 3)
      expect(vector[3]).assertEqual(true);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_1500
     * @tc.name      testVector04Chapter0015
     * @tc.desc      insert boolean(!'s') test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0015'
      let vector = new Vector<boolean>();
      for (let i = 0; i < 10; i++) {
        vector.add(true)
      }
      let length = vector.length;
      vector.insert(!'s', 3)
      expect(vector[3]).assertEqual(false);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_1600
     * @tc.name      testVector04Chapter0016
     * @tc.desc      insert unit8Array(HelloWorld123?) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0016'
      let vector = new Vector<number>();
      const asciiArray = [72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63];
      for (let i = 0; i < asciiArray.length; i++) {
        vector.insert(asciiArray[i], i)
      }
      const expectedStr = "HelloWorld123?";
      let convertedStr = "";
      for (let i = 0; i < vector.length; i++) {
        convertedStr += String.fromCharCode(vector[i]);
      }
      expect(convertedStr).assertEqual(expectedStr);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_1700
     * @tc.name      testVector04Chapter0017
     * @tc.desc      insert Array(more zero) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0017'
      let vector = new Vector<number>();
      let array = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63]
      for (let i = 0; i < array.length; i++) {
        vector.insert(array[i], i)
      }
      expect(vector.length).assertEqual(array.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_1800
     * @tc.name      testVector04Chapter0018
     * @tc.desc      insert Array(includes negative numbers) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0018'
      let vector = new Vector<number>();
      const negativeArray = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      const expectedStr = "HelloWorld123?";
      for (let i = 0; i < negativeArray.length; i++) {
        vector.insert(negativeArray[i], i)
      }
      let convertedStr = "";
      for (let i = 0; i < vector.length; i++) {
        convertedStr += String.fromCharCode(vector[i]);
      }
      expect(convertedStr.slice(0, 6)).assertEqual(expectedStr.slice(0, 6));
      expect(convertedStr.slice(7, 10)).assertEqual(expectedStr.slice(7, 10));
      expect(convertedStr.slice(11, 13)).assertEqual(expectedStr.slice(11, 13));
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_1900
     * @tc.name      testVector04Chapter0019
     * @tc.desc      insert Array(includes positive numbers) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0019'
      let vector = new Vector<Array<never[]>>();
      const arr = []
      arr["abc"] = 111
      arr["aaa"] = 222
      vector.insert(arr, 0)
      expect(vector[0]).assertEqual(arr);
      expect(vector[0]["abc"]).assertEqual(111);
      expect(vector[0]["aaa"]).assertEqual(222);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_2000
     * @tc.name      testVector04Chapter0020
     * @tc.desc      insert Array(typedArray) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0020'
      const numberArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      const targetTypedArray = new Int8Array(numberArray);
      let vector = new Vector<Int8Array>();
      vector.insert(targetTypedArray, 0);
      for (let i = 0; i < numberArray.length; i++) {
        expect(targetTypedArray[i]).assertEqual(numberArray[i]);
      }
      expect(vector.length).assertEqual(1);
      expect(vector[0]).assertEqual(targetTypedArray);
      expect(vector[0][5]).assertEqual(6);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_2100
     * @tc.name      testVector04Chapter0021
     * @tc.desc      insert Array(NaN/Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0021'
      let vector = new Vector<number>();
      let array = [72, 101, NaN, Infinity, 108, 111]
      for (let i = 0; i < array.length; i++) {
        vector.insert(array[i], i)
      }
      expect(vector[2]).assertNaN();
      expect(vector[3]).assertEqual(Infinity);
      expect(vector.length).assertEqual(array.length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_2200
     * @tc.name      testVector04Chapter0022
     * @tc.desc      insert Array(undefined/null/"abc") test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0022'
      let vector = new Vector<Array<string | number | undefined | boolean>>();
      let array = [72, "abc", true, null, undefined, 108]
      vector.insert(array, 0)
      expect(vector[0]).assertEqual(array);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_2300
     * @tc.name      testVector04Chapter0023
     * @tc.desc      insert Array([]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0023'
      let vector = new Vector<Array<number>>();
      let array = []
      vector.insert(array, 0)
      expect(vector[0]).assertEqual(array);
      expect(vector.length).assertEqual(1);
      expect(vector[0].length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_2400
     * @tc.name      testVector04Chapter0024
     * @tc.desc      insert Array([256, 65536, 32768]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0024'
      let vector = new Vector<Uint8Array>();
      let array = [256, 65536, 32768]
      vector.insert(new Uint8Array(array), 0)
      expect(vector[0][0]).assertEqual(0);
      expect(vector[0][1]).assertEqual(0);
      expect(vector[0][2]).assertEqual(0);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_2500
     * @tc.name      testVector04Chapter0025
     * @tc.desc      insert object({a:1, b:"test", c:[1,2,3]}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0025'

      class C1 {
        a: number = 1
        b: string = "test"
        c: number[] = [1, 2, 3]
      }

      let vector = new Vector<C1>();
      let c1 = new C1();
      vector.insert(c1, 0)
      expect(vector[0].a).assertEqual(c1.a);
      expect(vector[0].b).assertEqual(c1.b);
      expect(vector[0].c).assertEqual(c1.c);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_2600
     * @tc.name      testVector04Chapter0026
     * @tc.desc      insert object({a:1, b:{c:2, d:{e:3}}}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0026'

      class C1 {
        a: number = 1
        b: C2 = new C2()
      }

      class C2 {
        c: number = 2
        d: C3 = new C3()
      }

      class C3 {
        e: number = 3
      }

      let vector = new Vector<C1>();
      let c1 = new C1();
      vector.insert(c1, 0)
      expect(vector[0].a).assertEqual(c1.a);
      expect(vector[0].b.c).assertEqual(c1.b.c);
      expect(vector[0].b.d.e).assertEqual(c1.b.d.e);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_2700
     * @tc.name      testVector04Chapter0027
     * @tc.desc      insert object({a:1, b:()=>{}}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0027'
      let result: boolean = false

      class C1 {
        a: number = 1
        b: () => void = () => {
          result = true
        }
      }

      let vector = new Vector<C1>();
      let c1 = new C1();
      vector.insert(c1, 0)
      c1.b()
      expect(result).assertTrue();
      expect(vector[0].a).assertEqual(c1.a);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_2800
     * @tc.name      testVector04Chapter0028
     * @tc.desc      insert object.create({parentProp:1}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0028'

      class C1 {
        parentProp: number = 1

        constructor() {
          this.parentProp = 2
        }
      }

      let vector = new Vector<C1>();

      class C2 extends C1 {
        childProp: number = 3
      }

      let obj = new C2()
      obj.childProp = 4
      vector.insert(obj, 0)
      expect(vector[0]).assertEqual(obj);
      expect(obj.parentProp).assertEqual(2);
      expect(obj.childProp).assertEqual(4);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_2900
     * @tc.name      testVector04Chapter0029
     * @tc.desc      insert object.defineProperty(obj, 'a', {enumerable:false, value:1}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0029'

      class StaticClass {
        private internalProp: number = 1;
        public publicProp: number = 2;

        getInternalProp(): number {
          return this.internalProp;
        }
      }

      let vector = new Vector<StaticClass>();
      const inst = new StaticClass();
      vector.insert(inst, 0)
      expect(vector[0].publicProp).assertEqual(2);
      expect(vector[0].getInternalProp()).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_3000
     * @tc.name      testVector04Chapter0030
     * @tc.desc      insert object({buffer: new ArrayBuffer(16)}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0030'

      class C1 {
        buffer: ArrayBuffer = new ArrayBuffer(16)
      }

      let vector = new Vector<C1>();
      let c1 = new C1();
      vector.insert(c1, 0)
      expect(vector.length).assertEqual(1);
      expect(vector[0].buffer).assertEqual(c1.buffer);
      expect(vector[0].buffer.byteLength).assertEqual(16);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_3100
     * @tc.name      testVector04Chapter0031
     * @tc.desc      insert object({view: new DataView(new ArrayBuffer(16))}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0031'

      class C1 {
        view: DataView = new DataView(new ArrayBuffer(16))
      }

      let vector = new Vector<C1>();
      let c1 = new C1();
      vector.insert(c1, 0)
      expect(vector.length).assertEqual(1);
      expect(vector[0].view).assertEqual(c1.view);
      expect(vector[0].view.byteLength).assertEqual(16);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_3200
     * @tc.name      testVector04Chapter0032
     * @tc.desc      insert object({}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0032'

      class C1 {
      }

      let vector = new Vector<C1>();
      let c1 = new C1();
      vector.insert(c1, 0)
      expect(vector[0]).assertEqual(c1);
      expect(vector.length).assertEqual(1);
      expect(vector[0].constructor).assertEqual(C1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_3300
     * @tc.name      testVector04Chapter0033
     * @tc.desc      insert object({a:undefined, b:1}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0033'

      class C1 {
        a: undefined = undefined
        b: number = 1
      }

      let vector = new Vector<C1>();
      let c1 = new C1();
      vector.insert(c1, 0)
      expect(vector[0].b).assertEqual(1);
      expect(vector[0].a).assertUndefined();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_3400
     * @tc.name      testVector04Chapter0034
     * @tc.desc      insert object({a:null, b:1}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0034'

      class C1 {
        a: null = null
        b: number = 1
      }

      let vector = new Vector<C1>();
      let c1 = new C1();
      vector.insert(c1, 0)
      expect(vector[0].b).assertEqual(1);
      expect(vector[0].a).assertNull();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_3500
     * @tc.name      testVector04Chapter0035
     * @tc.desc      insert object({a:NaN, b:1}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0035'

      class C1 {
        a: number = NaN
        b: number = 1
      }

      let vector = new Vector<C1>();
      let c1 = new C1();
      vector.insert(c1, 0)
      expect(vector[0].a).assertNaN();
      expect(vector[0].b).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_3600
     * @tc.name      testVector04Chapter0036
     * @tc.desc      insert object({a:Infinity, b:1}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0036'

      class C1 {
        a: number = Infinity
        b: number = 1
      }

      let vector = new Vector<C1>();
      let c1 = new C1();
      vector.insert(c1, 0)
      expect(vector[0].b).assertEqual(1);
      expect(vector[0].a).assertEqual(Infinity);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_3700
     * @tc.name      testVector04Chapter0037
     * @tc.desc      insert object({buffer: new Uint8Array([72,101,108,108,111])}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0037'

      class C1 {
        buffer: Uint8Array = new Uint8Array([72, 101, 108, 108, 111])
      }

      let vector = new Vector<C1>();
      let c1 = new C1();
      vector.insert(c1, 0)
      expect(vector.length).assertEqual(1);
      expect(vector[0].buffer).assertEqual(c1.buffer);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_3800
     * @tc.name      testVector04Chapter0038
     * @tc.desc      insert object({map: new Map([['key1', 'value1'], ['key2', {a:1}]])}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0038'

      class C1 {
        map: Map<string, string | C2> = new Map<string, string | C2>([['key1', 'value1'], ['key2', new C2()]])
      }

      class C2 {
        a: number = 1
      }

      let vector = new Vector<C1>();
      let c1 = new C1();
      vector.insert(c1, 0)
      expect(vector.length).assertEqual(1);
      expect(vector[0].map.get('key1')).assertEqual('value1');
      expect(vector[0].map.get('key2').a).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_3900
     * @tc.name      testVector04Chapter0039
     * @tc.desc      insert object({set: new Set([1, 2, 3])}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0039'

      class C1 {
        set: Set<number> = new Set<number>([1, 2, 3, 2, 1])
      }

      let vector = new Vector<C1>();
      let c1 = new C1();
      vector.insert(c1, 0)
      expect(vector.length).assertEqual(1);
      expect(vector[0].set.size).assertEqual(3);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_4000
     * @tc.name      testVector04Chapter0040
     * @tc.desc      insert object({promise: new Promise((resolve) => setTimeout(() => resolve('done'), 100))}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0040'

      class C1 {
        promise: Promise<string> = new Promise((resolve) => setTimeout(() => resolve('done'), 100))
      }

      let vector = new Vector<C1>();
      let c1 = new C1();
      vector.insert(c1, 0)
      expect(vector.length).assertEqual(1);
      c1.promise.then((value) => {
        expect(value).assertEqual('done');
      })
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_4100
     * @tc.name      testVector04Chapter0041
     * @tc.desc      insert object({regex: /abc/gi, flags: /def/m}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0041'

      class C1 {
        regex: RegExp = /abc/gi
        flags: RegExp = /def/m
      }

      let vector = new Vector<C1>();
      let c1 = new C1();
      vector.insert(c1, 0)
      expect(vector.length).assertEqual(1);
      expect(vector[0].regex.flags).assertEqual('gi');
      expect(vector[0].flags.flags).assertEqual('m');
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_4200
     * @tc.name      testVector04Chapter0042
     * @tc.desc      has Int8Array(-128) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0042'
      let vector = new Vector<Int8Array>();
      let number = new Int8Array([-128])
      vector.add(number)
      let result = vector.has(number)
      expect(result).assertTrue()
      expect(vector[0][0]).assertEqual(-128)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_4300
     * @tc.name      testVector04Chapter0043
     * @tc.desc      has Float32Array(Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0043'
      let vector = new Vector<Float32Array>();
      let number = new Float32Array([Infinity])
      vector.add(number)
      let result = vector.has(number)
      expect(result).assertTrue()
      expect(vector[0][0]).assertEqual(Infinity)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_4400
     * @tc.name      testVector04Chapter0044
     * @tc.desc      has Float32Array(-Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0044'
      let vector = new Vector<Float32Array>();
      let number = new Float32Array([-Infinity])
      vector.add(number)
      let result = vector.has(number)
      expect(result).assertTrue()
      expect(vector[0][0]).assertEqual(-Infinity)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_4500
     * @tc.name      testVector04Chapter0045
     * @tc.desc      has Float32Array(NaN) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0045'
      let vector = new Vector<Float32Array>();
      let number = new Float32Array([NaN])
      vector.add(number)
      let result = vector.has(number)
      expect(result).assertTrue()
      expect(vector[0][0]).assertNaN()
    })


    /**
     * @tc.number    SUB_VECTOR_TEST04_4600
     * @tc.name      testVector04Chapter0046
     * @tc.desc      has string("👆") test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0046'
      let vector = new Vector<string>();
      vector.add('👆')
      let result = vector.has('\ud83d\udc46')
      expect(result).assertTrue()
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_4700
     * @tc.name      testVector04Chapter0047
     * @tc.desc      has number(0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0047'
      let vector = new Vector<number>();
      vector.add(0)
      let result = vector.has(0)
      expect(result).assertTrue()
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_4800
     * @tc.name      testVector04Chapter0048
     * @tc.desc      has boolean(true) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0048'
      let vector = new Vector<boolean>();
      vector.add(true)
      let result = vector.has(true)
      expect(result).assertTrue()
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_4900
     * @tc.name      testVector04Chapter0049
     * @tc.desc      has array(undefined/null/"abc") test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0049'
      let vector = new Vector<Array<string | number | undefined | boolean>>();
      let arr = [72, "abc", true, null, undefined, 108]
      vector.add(arr)
      expect(vector.has(arr)).assertTrue()
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_5000
     * @tc.name      testVector04Chapter0050
     * @tc.desc      has object({a:1, b:"test", c:[1,2,3]}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0050'
      let vector = new Vector<object>();

      class C1 {
        a: number = 1;
        b: string = "test";
        c: number[] = [1, 2, 3];
      }

      let obj = new C1();
      vector.add(obj)
      expect(vector.has(obj)).assertTrue()
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_5100
     * @tc.name      testVector04Chapter0051
     * @tc.desc      getIndexOf Int8Array([-128]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0051'
      let vector = new Vector<Int8Array>();
      vector.add(new Int8Array([13]))
      let num = new Int8Array([-128])
      vector.add(num)
      vector.add(num)
      let result = vector.getIndexOf(num)
      expect(result).assertEqual(1)
      expect(vector.getIndexOf(new Int8Array([-128]))).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_5200
     * @tc.name      testVector04Chapter0052
     * @tc.desc      getIndexOf Float32Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0052'
      let vector = new Vector<Float32Array>();
      vector.add(new Float32Array([13]))
      let num = new Float32Array([Infinity])
      vector.add(num)
      vector.add(num)
      let result = vector.getIndexOf(num)
      expect(result).assertEqual(1)
      expect(vector.getIndexOf(new Float32Array([Infinity]))).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_5300
     * @tc.name      testVector04Chapter0053
     * @tc.desc      getIndexOf Float32Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0053'
      let vector = new Vector<Float32Array>();
      vector.add(new Float32Array([13]))
      let num = new Float32Array([-Infinity])
      vector.add(num)
      vector.add(num)
      let result = vector.getIndexOf(num)
      expect(result).assertEqual(1)
      expect(vector.getIndexOf(new Float32Array([-Infinity]))).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_5400
     * @tc.name      testVector04Chapter0054
     * @tc.desc      getIndexOf Float32Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0054'
      let vector = new Vector<Float32Array>();
      vector.add(new Float32Array([13]))
      let num = new Float32Array([NaN])
      vector.add(num)
      vector.add(num)
      let result = vector.getIndexOf(num)
      expect(result).assertEqual(1)
      expect(vector.getIndexOf(new Float32Array([NaN]))).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_5500
     * @tc.name      testVector04Chapter0055
     * @tc.desc      getIndexOf string("👆") test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0055'
      let vector = new Vector<string>();
      vector.add('hello')
      vector.add('👆')
      vector.add('👆')
      let result = vector.getIndexOf('\ud83d\udc46')
      expect(result).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_5600
     * @tc.name      testVector04Chapter0056
     * @tc.desc      getIndexOf number(0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0056'
      let vector = new Vector<number>();
      vector.add(13)
      vector.add(0)
      vector.add(0)
      let result = vector.getIndexOf(0)
      expect(result).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_5700
     * @tc.name      testVector04Chapter0057
     * @tc.desc      getIndexOf boolean(true) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0057'
      let vector = new Vector<boolean>();
      vector.add(false)
      vector.add(true)
      vector.add(true)
      let result = vector.getIndexOf(true)
      expect(result).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_5800
     * @tc.name      testVector04Chapter0058
     * @tc.desc      getIndexOf Array(more zero) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0058'
      let vector = new Vector<number>();
      let arr = [72, 101, 108, 108, 0, 0, 63]
      for (let i = 0; i < arr.length; i++) {
        vector.add(arr[i])
      }
      let result = vector.getIndexOf(0)
      expect(result).assertEqual(4)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_5900
     * @tc.name      testVector04Chapter0059
     * @tc.desc      getIndexOf object({a:1, b:"test", c:[1,2,3]}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0059'
      let vector = new Vector<object>();

      class C1 {
        a: number = 1
        b: string = "test"
        c: Array<number> = [1, 2, 3]
      }

      let obj = new C1()
      vector.add({
        a: "hello world"
      })
      vector.add(obj)
      vector.add(obj)
      let result = vector.getIndexOf(obj)
      expect(result).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_6000
     * @tc.name      testVector04Chapter0060
     * @tc.desc      getLastIndexOf Int8Array([-128]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0060'
      let vector = new Vector<Int8Array>();
      vector.add(new Int8Array([13]))
      let num = new Int8Array([-128])
      vector.add(num)
      vector.add(num)
      let result = vector.getLastIndexOf(num)
      expect(result).assertEqual(2)
      expect(vector.getLastIndexOf(new Int8Array([-128]))).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_6100
     * @tc.name      testVector04Chapter0061
     * @tc.desc      getLastIndexOf Float32Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0061'
      let vector = new Vector<Float32Array>();
      vector.add(new Float32Array([13]))
      let num = new Float32Array([Infinity])
      vector.add(num)
      vector.add(num)
      let result = vector.getLastIndexOf(num)
      expect(result).assertEqual(2)
      expect(vector.getLastIndexOf(new Float32Array([Infinity]))).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_6200
     * @tc.name      testVector04Chapter0062
     * @tc.desc      getLastIndexOf Float32Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0062'
      let vector = new Vector<Float32Array>();
      vector.add(new Float32Array([13]))
      let num = new Float32Array([-Infinity])
      vector.add(num)
      vector.add(num)
      let result = vector.getLastIndexOf(num)
      expect(result).assertEqual(2)
      expect(vector.getLastIndexOf(new Float32Array([-Infinity]))).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_6300
     * @tc.name      testVector04Chapter0063
     * @tc.desc      getLastIndexOf Float32Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0063'
      let vector = new Vector<Float32Array>();
      vector.add(new Float32Array([13]))
      let num = new Float32Array([NaN])
      vector.add(num)
      vector.add(num)
      let result = vector.getLastIndexOf(num)
      expect(result).assertEqual(2)
      expect(vector.getLastIndexOf(new Float32Array([NaN]))).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_6400
     * @tc.name      testVector04Chapter0064
     * @tc.desc      getLastIndexOf string("👆") test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0064'
      let vector = new Vector<string>();
      vector.add('hello')
      vector.add('👆')
      vector.add('👆')
      let result = vector.getLastIndexOf('\ud83d\udc46')
      expect(result).assertEqual(2)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_6500
     * @tc.name      testVector04Chapter0065
     * @tc.desc      getLastIndexOf number(0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0065'
      let vector = new Vector<number>();
      vector.add(13)
      vector.add(0)
      vector.add(0)
      let result = vector.getLastIndexOf(0)
      expect(result).assertEqual(2)
    })


    /**
     * @tc.number    SUB_VECTOR_TEST04_6600
     * @tc.name      testVector04Chapter0066
     * @tc.desc      getLastIndexOf boolean(true) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0066'
      let vector = new Vector<boolean>();
      vector.add(false)
      vector.add(true)
      vector.add(true)
      let result = vector.getLastIndexOf(true)
      expect(result).assertEqual(2)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_6700
     * @tc.name      testVector04Chapter0067
     * @tc.desc      getLastIndexOf Array(Special array) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0067'
      let vector = new Vector<Array<number>>();
      let arr = []
      arr["abc"] = 111
      arr["aaa"] = 222
      vector.add([1, 2, 3])
      vector.add(arr)
      vector.add(arr)
      let result = vector.getLastIndexOf(arr)
      expect(result).assertEqual(2)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_6800
     * @tc.name      testVector04Chapter0068
     * @tc.desc      getLastIndexOf object({a:1, b:"test", c:[1,2,3]}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0068'
      let vector = new Vector<object>();

      class C1 {
        a: number = 1
        b: string = "test"
        c: Array<number> = [1, 2, 3]
      }

      let obj = new C1()
      vector.add({
        a: "hello world"
      })
      vector.add(obj)
      vector.add(obj)
      let result = vector.getLastIndexOf(obj)
      expect(result).assertEqual(2)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_6900
     * @tc.name      testVector04Chapter0069
     * @tc.desc      removeByIndex index(-1) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0069'
      try {
        let vector = new Vector<string>();
        vector.add("hello world")
        vector.add("hello world")
        vector.add("hello world")
        vector.removeByIndex(-1)
        expect().assertFalse()
      } catch (error) {
        console.log(`${TAG} success: ${error}`)
        expect(error !== null).assertTrue()
      }
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_7000
     * @tc.name      testVector04Chapter0070
     * @tc.desc      removeByIndex Int8Array(-128) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0070'
      let vector = new Vector<Int8Array>();
      let num1 = new Int8Array([-128]);
      let num2 = new Int8Array([13]);
      vector.add(num1)
      vector.add(num2)
      let result = vector.removeByIndex(0)
      expect(result).assertEqual(num1)
      expect(vector[0]).assertEqual(num2)
      expect(vector.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_7100
     * @tc.name      testVector04Chapter0071
     * @tc.desc      removeByIndex Float32Array(Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0071'
      let vector = new Vector<Float32Array>();
      let num1 = new Float32Array([Infinity]);
      let num2 = new Float32Array([13]);
      vector.add(num1)
      vector.add(num2)
      let result = vector.removeByIndex(0)
      expect(result).assertEqual(num1)
      expect(vector[0]).assertEqual(num2)
      expect(vector.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_7200
     * @tc.name      testVector04Chapter0072
     * @tc.desc      removeByIndex Float32Array(-Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0072'
      let vector = new Vector<Float32Array>();
      let num1 = new Float32Array([-Infinity]);
      let num2 = new Float32Array([13]);
      vector.add(num1)
      vector.add(num2)
      let result = vector.removeByIndex(0)
      expect(result).assertEqual(num1)
      expect(vector[0]).assertEqual(num2)
      expect(vector.length).assertEqual(1)
    })


    /**
     * @tc.number    SUB_VECTOR_TEST04_7300
     * @tc.name      testVector04Chapter0073
     * @tc.desc      removeByIndex Float32Array(NaN) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0073'
      let vector = new Vector<Float32Array>();
      let num1 = new Float32Array([NaN]);
      let num2 = new Float32Array([13]);
      vector.add(num1)
      vector.add(num2)
      let result = vector.removeByIndex(0)
      expect(result).assertEqual(num1)
      expect(vector[0]).assertEqual(num2)
      expect(vector.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_7400
     * @tc.name      testVector04Chapter0074
     * @tc.desc      removeByIndex string("") test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0074'
      let vector = new Vector<string>();
      let num1 = "";
      let num2 = '13';
      vector.add(num1)
      vector.add(num2)
      let result = vector.removeByIndex(0)
      expect(result).assertEqual(num1)
      expect(vector[0]).assertEqual(num2)
      expect(vector.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_7500
     * @tc.name      testVector04Chapter0075
     * @tc.desc      removeByIndex number(0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0075'
      let vector = new Vector<number>();
      let num1 = 0;
      let num2 = 13;
      vector.add(num1)
      vector.add(num2)
      let result = vector.removeByIndex(0)
      expect(result).assertEqual(0)
      expect(vector[0]).assertEqual(num2)
      expect(vector.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_7600
     * @tc.name      testVector04Chapter0076
     * @tc.desc      removeByIndex boolean(true) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0076'
      let vector = new Vector<boolean>();
      let bool1 = true;
      let bool2 = false;
      vector.add(bool1)
      vector.add(bool2)
      let result = vector.removeByIndex(0)
      expect(result).assertEqual(true)
      expect(vector[0]).assertEqual(false)
      expect(vector.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_7700
     * @tc.name      testVector04Chapter0077
     * @tc.desc      removeByIndex Array(Contains non-numeric types) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0077'
      let vector = new Vector<Array<string | number | undefined | boolean>>();
      let arr1 = [72, "abc", true, null, undefined, 108]
      let arr2 = [13];
      vector.add(arr1)
      vector.add(arr2)
      let result = vector.removeByIndex(0)
      expect(result).assertEqual(arr1)
      expect(vector[0]).assertEqual(arr2)
      expect(vector.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_7800
     * @tc.name      testVector04Chapter0078
     * @tc.desc      removeByIndex object({a:1, b:"test", c:[1,2,3]}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0078'
      let vector = new Vector<object>();

      class C1 {
        a: number = 1
        b: string = "test"
        c: Array<number> = [1, 2, 3]
      }

      let obj = new C1()
      vector.add(obj)
      vector.add({
        a: "hello world"
      })
      let result = vector.removeByIndex(0)
      expect(result).assertEqual(obj)
      expect(vector.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_7900
     * @tc.name      testVector04Chapter0079
     * @tc.desc      remove element test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0079'
      let vector = new Vector<number>();
      vector.add(1)
      vector.add(2)
      vector.add(1)
      let result = vector.remove(1)
      expect(result).assertEqual(true)
      expect(vector[0]).assertEqual(2)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_8000
     * @tc.name      testVector04Chapter0080
     * @tc.desc      remove Deletion failed test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0080'
      let vector = new Vector<number>();
      vector.add(1)
      vector.add(2)
      vector.add(1)
      let result = vector.remove(3)
      expect(result).assertEqual(false)
      expect(vector.length).assertEqual(3)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_8100
     * @tc.name      testVector04Chapter0081
     * @tc.desc      remove Int8Array(-128) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0081'
      let vector = new Vector<Int8Array>();
      let res1= new Int8Array([-128])
      let res2= new Int8Array([13])
      vector.add(res1)
      vector.add(res2)
      vector.add(res1)
      let result = vector.remove(res1)
      expect(result).assertEqual(true)
      expect(vector[0]).assertEqual(res2)
    })


    /**
     * @tc.number    SUB_VECTOR_TEST04_8200
     * @tc.name      testVector04Chapter0082
     * @tc.desc      remove Float32Array(Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0082'
      let vector = new Vector<Float32Array>();
      let res1= new Float32Array([Infinity])
      let res2= new Float32Array([13])
      vector.add(res1)
      vector.add(res2)
      vector.add(res1)
      let result = vector.remove(res1)
      expect(result).assertEqual(true)
      expect(vector[0]).assertEqual(res2)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_8300
     * @tc.name      testVector04Chapter0083
     * @tc.desc      remove Float32Array(-Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0083'
      let vector = new Vector<Float32Array>();
      let res1= new Float32Array([-Infinity])
      let res2= new Float32Array([13])
      vector.add(res1)
      vector.add(res2)
      vector.add(res1)
      let result = vector.remove(res1)
      expect(result).assertEqual(true)
      expect(vector[0]).assertEqual(res2)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_8400
     * @tc.name      testVector04Chapter0084
     * @tc.desc      remove Float32Array(NaN) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0084'
      let vector = new Vector<Float32Array>();
      let res1= new Float32Array([NaN])
      let res2= new Float32Array([13])
      vector.add(res1)
      vector.add(res2)
      vector.add(res1)
      let result = vector.remove(res1)
      expect(result).assertEqual(true)
      expect(vector[0]).assertEqual(res2)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_8500
     * @tc.name      testVector04Chapter0085
     * @tc.desc      remove string('👆') test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0085'
      let vector = new Vector<string>();
      let res1= '👆';
      let res2= '13';
      vector.add(res1)
      vector.add(res2)
      vector.add(res1)
      let result = vector.remove('\ud83d\udc46')
      expect(result).assertEqual(true)
      expect(vector[0]).assertEqual(res2)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_8600
     * @tc.name      testVector04Chapter0086
     * @tc.desc      remove number(0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0086'
      let vector = new Vector<number>();
      let res1= 0;
      let res2= 13;
      vector.add(res1)
      vector.add(res2)
      vector.add(res1)
      let result = vector.remove(res1)
      expect(result).assertEqual(true)
      expect(vector[0]).assertEqual(res2)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_8700
     * @tc.name      testVector04Chapter0087
     * @tc.desc      remove boolean(true) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0087'
      let vector = new Vector<boolean>();
      let bool1= true;
      let bool2= false;
      vector.add(bool1)
      vector.add(bool2)
      vector.add(bool1)
      let result = vector.remove(bool1)
      expect(result).assertEqual(true)
      expect(vector[0]).assertEqual(bool2)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST04_8800
     * @tc.name      testVector04Chapter0088
     * @tc.desc      remove Array(Contains non-numeric types) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector04Chapter0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector04Chapter0088'
      let vector = new Vector<Array<string | number | undefined | boolean>>();
      let arr1 = [72, "abc", true, null, undefined, 108]
      let arr2 = [13];
      vector.add(arr1)
      vector.add(arr2)
      vector.add(arr1)
      let result = vector.remove(arr1)
      expect(result).assertEqual(true)
      expect(vector[0]).assertEqual(arr2)
    })

  })
}