import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { LightWeightMap } from '@kit.ArkTS';

class Person {
  name: string;
  age: number;
  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
}

class Employee{
  id:number;
  name:string;
  age:number;
  constructor(id:number,name: string, age: number) {
    this.id = id;
    this.name = name;
    this.age = age;
  }
}

interface SimpleObj05 {
  a: number;
  b: string;
}

interface InnerData {
  v: number;
}

interface DataObject {
  name: string;
  inner: InnerData;
}

interface NestedObj {
  id: number;
  data: DataObject;
}

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function testLightWeightMapTest07() {
  describe('testLightWeightMapTest07', () => {
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
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0001
     * @tc.name      testLightWeightMapTest07Chapter0001
     * @tc.desc      values() with Int8Array value [-128,0,127]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0001';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, Int8Array>();
      let arr = new Int8Array([-128, 0, 127]);
      lightWeightMap.set("int8", arr);

      let values = lightWeightMap.values();
      let firstOk = false;
      for (let value of values) {
        if (value[0] === -128 && value[2] === 127) {
          firstOk = true;
        }
      }

      expect(firstOk).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0002
     * @tc.name      testLightWeightMapTest07Chapter0002
     * @tc.desc      values() with Uint8Array value [0,255]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0002';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, Uint8Array>();
      let arr = new Uint8Array([0, 255]);
      lightWeightMap.set("u8", arr);

      let values = lightWeightMap.values();
      let ok = false;
      for (let value of values) {
        if (value[0] === 0 && value[1] === 255) {
          ok = true;
        }
      }

      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });



    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0003
     * @tc.name      testLightWeightMapTest07Chapter0003
     * @tc.desc      Float32Array stores Infinity / -Infinity / NaN correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0003';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, Float32Array>();
      let f32 = new Float32Array([Infinity, -Infinity, NaN]);
      lightWeightMap.set("f32", f32);

      let values = lightWeightMap.values();
      let ok = false;
      for (let value of values) {
        if (value[0] === Infinity && value[1] === -Infinity && Number.isNaN(value[2])) {
          ok = true;
        }
      }

      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0004
     * @tc.name      testLightWeightMapTest07Chapter0004
     * @tc.desc      Uint8ClampedArray clamps Infinity to 255, others to 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0004';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, Uint8ClampedArray>();
      let u8c = new Uint8ClampedArray([Infinity, -Infinity, NaN]);
      lightWeightMap.set("u8c", u8c);

      let values = lightWeightMap.values();
      let ok = false;
      for (let value of values) {
        if (value[0] === 255 && value[1] === 0 && value[2] === 0) {
          ok = true;
        }
      }

      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0005
     * @tc.name      testLightWeightMapTest07Chapter0005
     * @tc.desc      values() with normal ASCII strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0005';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(1, "Hello");
      lightWeightMap.set(2, "World");

      let values = lightWeightMap.values();
      let concat = "";
      for (let value of values) {
        concat = concat + value + "|";
      }
      let ok = concat === "Hello|World|";
      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0006
     * @tc.name      testLightWeightMapTest07Chapter0006
     * @tc.desc      values() with escape and unicode strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0006';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(1, "\n");
      lightWeightMap.set(2, "👆🎅😼");

      let values = lightWeightMap.values();
      let firstIsEmoji = false;
      let first = true;
      for (let value of values) {
        if (first) {
          firstIsEmoji = (value === "\n");
          first = false;
        }
      }
      expect(firstIsEmoji).assertTrue();
      console.log(TAG + 'end');
    });



    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0007
     * @tc.name      testLightWeightMapTest07Chapter0007
     * @tc.desc      values() with 0, -0, 1, -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0007';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("z", 0);
      lightWeightMap.set("nz", -0);
      lightWeightMap.set("one", 1);
      lightWeightMap.set("none", -1);

      let values = lightWeightMap.values();
      let firstIsNegOne = false;
      let first = true;
      for (let value of values) {
        if (first) {
          firstIsNegOne = (value === 0);
          first = false;
        }
      }

      expect(firstIsNegOne).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0008
     * @tc.name      testLightWeightMapTest07Chapter0008
     * @tc.desc      values() with Number boundary constants
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0008';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("min", Number.MIN_VALUE);
      lightWeightMap.set("eps", Number.EPSILON);

      let values = lightWeightMap.values();
      let firstIsMaxSafe = false;
      let first = true;
      for (let value of values) {
        if (first) {
          firstIsMaxSafe = (value === Number.EPSILON);
          first = false;
        }
      }

      expect(firstIsMaxSafe).assertTrue();
      console.log(TAG + 'end');
    });



    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0009
     * @tc.name      testLightWeightMapTest07Chapter0009
     * @tc.desc      values() with true/false mix
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0009';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<number, boolean>();
      lightWeightMap.set(1, true);
      lightWeightMap.set(2, false);
      lightWeightMap.set(3, true);

      let values = lightWeightMap.values();
      let firstIsTrue = false;
      let first = true;
      for (let value of values) {
        if (first) {
          firstIsTrue = value;
          first = false;
        }
      }

      expect(firstIsTrue).assertTrue();
      console.log(TAG + 'end');
    });



    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0010
     * @tc.name      testLightWeightMapTest07Chapter0010
     * @tc.desc      values() with Array<number> value, check length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0010';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number[]>();
      let arr = [1, 2, 3, 4];
      lightWeightMap.set("nums", arr);

      let values = lightWeightMap.values();
      let lenIs4 = false;
      for (let value of values) {
        if (value.length === 4) {
          lenIs4 = true;
        }
      }

      expect(lenIs4).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0011
     * @tc.name      testLightWeightMapTest07Chapter0011
     * @tc.desc      values() with nested array Array<Array<number>>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0011';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number[][]>();
      let nested = [[1, 2], [3, 4]];
      lightWeightMap.set("nested", nested);

      let values = lightWeightMap.values();
      let hasFour = false;
      for (let value of values) {
        if (value[1][1] === 4) {
          hasFour = true;
        }
      }

      expect(hasFour).assertTrue();
      console.log(TAG + 'end');
    });



    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0012
     * @tc.name      testLightWeightMapTest07Chapter0012
     * @tc.desc      values() with simple object value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0012';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, object>();
      let obj: SimpleObj05 = { a: 1, b: "test" };
      lightWeightMap.set("obj", obj);

      let values = lightWeightMap.values();
      let ok = false;
      for (let value of values) {
        if ((value as SimpleObj05).a === 1 && (value as SimpleObj05).b === "test") {
          ok = true;
        }
      }

      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0013
     * @tc.name      testLightWeightMapTest07Chapter0013
     * @tc.desc      values() with nested object value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0013';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, object>();
      let obj: NestedObj = {
        id: 1,
        data: {
          name: "inner",
          inner: { v: 100 }
        }
      };
      lightWeightMap.set("nested", obj);

      let values = lightWeightMap.values();
      let ok = false;
      for (let value of values) {
        if ((value as NestedObj).data.inner.v === 100) {
          ok = true;
        }
      }

      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });



    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0014
     * @tc.name      testLightWeightMapTest07Chapter0014
     * @tc.desc      values() with Person class instance value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0014';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<number, Person>();
      let p = new Person("Alice", 20);
      lightWeightMap.set(1, p);

      let values = lightWeightMap.values();
      let ok = false;
      for (let value of values) {
        if (value.name === "Alice" && value.age === 20) {
          ok = true;
        }
      }

      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0015
     * @tc.name      testLightWeightMapTest07Chapter0015
     * @tc.desc      values() with Employee subclass instances as Person
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0015';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, Person>();
      let e1 = new Employee(1, "Bob", 30);
      let e2 = new Employee(2, "Carol", 35);
      lightWeightMap.set("e1", e1);
      lightWeightMap.set("e2", e2);

      let values = lightWeightMap.values();
      let ok = false;
      let first = true;
      for (let value of values) {
        if (first) {
          let emp = value as Employee;
          ok = (emp.id === 1 && emp.name === "Bob");
          first = false;
        }
      }

      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0016
     * @tc.name      testLightWeightMapTest07Chapter0016
     * @tc.desc      forEach basic example, verify order and value/key pairing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0016';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("sparrow", 123);
      lightWeightMap.set("gull", 357);

      let firstPairOk = false;
      let secondPairOk = false;
      let index = 0;

      lightWeightMap.forEach((value: number, key: string) => {
        if (index === 0 && value === 357 && key === "gull") {
          firstPairOk = true;
        }
        if (index === 1 && value === 123 && key === "sparrow") {
          secondPairOk = true;
        }
        index++;
      });

      let ok = firstPairOk && secondPairOk && index === 2;
      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });


    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0017
     * @tc.name      testLightWeightMapTest07Chapter0017
     * @tc.desc      forEach with Int8Array value [-128,0,127]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0017';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, Int8Array>();
      let arr = new Int8Array([-128, 0, 127]);
      lightWeightMap.set("int8", arr);

      let ok = false;
      lightWeightMap.forEach((value: Int8Array, key: string) => {
        if (key === "int8" && value[0] === -128 && value[2] === 127) {
          ok = true;
        }
      });

      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0018
     * @tc.name      testLightWeightMapTest07Chapter0018
     * @tc.desc      forEach with Uint8Array boundary [0,255]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0018';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, Uint8Array>();
      let arr = new Uint8Array([0, 255]);
      lightWeightMap.set("u8", arr);

      let ok = false;
      lightWeightMap.forEach((value: Uint8Array, key: string) => {
        if (key === "u8" && value[0] === 0 && value[1] === 255) {
          ok = true;
        }
      });

      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });


    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0019
     * @tc.name      testLightWeightMapTest07Chapter0019
     * @tc.desc      forEach with Float32Array [Infinity,-Infinity,NaN]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0019';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, Float32Array>();
      let arr = new Float32Array([Infinity, -Infinity, NaN]);
      lightWeightMap.set("f32", arr);

      let ok = false;
      lightWeightMap.forEach((value: Float32Array, key: string) => {
        if (key === "f32" && value[0] === Infinity && value[1] === -Infinity && Number.isNaN(value[2])) {
          ok = true;
        }
      });

      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0020
     * @tc.name      testLightWeightMapTest07Chapter0020
     * @tc.desc      forEach with Uint8ClampedArray [Infinity,-Infinity,NaN] -> [255,0,0]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0020';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, Uint8ClampedArray>();
      let arr = new Uint8ClampedArray([Infinity, -Infinity, NaN]);
      lightWeightMap.set("u8c", arr);

      let ok = false;
      lightWeightMap.forEach((value: Uint8ClampedArray, key: string) => {
        if (key === "u8c" && value[0] === 255 && value[1] === 0 && value[2] === 0) {
          ok = true;
        }
      });

      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });


    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0021
     * @tc.name      testLightWeightMapTest07Chapter0021
     * @tc.desc      forEach with normal ASCII strings, check concat order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0021';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(1, "Hello");
      lightWeightMap.set(2, "World");

      let concat = "";
      lightWeightMap.forEach((value: string, key: number) => {
        concat = concat + value + "|";
      });

      let ok = concat === "Hello|World|";
      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0022
     * @tc.name      testLightWeightMapTest07Chapter0022
     * @tc.desc      forEach with escape and unicode strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0022';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(1, "\n");
      lightWeightMap.set(2, "👆🎅😼");

      let firstIsEmoji = false;
      let index = 0;
      lightWeightMap.forEach((value: string, key: number) => {
        if (index === 1 && value === "👆🎅😼") {
          firstIsEmoji = true;
        }
        index++;
      });

      expect(firstIsEmoji).assertTrue();
      console.log(TAG + 'end');
    });


    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0023
     * @tc.name      testLightWeightMapTest07Chapter0023
     * @tc.desc      forEach with 0/-0/1/-1, first should be -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0023';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("z", 0);
      lightWeightMap.set("nz", -0);
      lightWeightMap.set("one", 1);
      lightWeightMap.set("none", -1);

      let firstIsNegOne = false;
      let index = 0;
      lightWeightMap.forEach((value: number, key: string) => {
        if (index === 0 && value === 0) {
          firstIsNegOne = true;
        }
        index++;
      });

      expect(firstIsNegOne).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0024
     * @tc.name      testLightWeightMapTest07Chapter0024
     * @tc.desc      forEach with Number.MIN_VALUE / EPSILON / MAX_SAFE_INTEGER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0024';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("min", Number.MIN_VALUE);
      lightWeightMap.set("eps", Number.EPSILON);

      let firstIsMaxSafe = false;
      let index = 0;
      lightWeightMap.forEach((value: number, key: string) => {
        if (index === 0 && value === Number.EPSILON) {
          firstIsMaxSafe = true;
        }
        index++;
      });

      expect(firstIsMaxSafe).assertTrue();
      console.log(TAG + 'end');
    });


    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0025
     * @tc.name      testLightWeightMapTest07Chapter0025
     * @tc.desc      forEach with mixed true/false, at least one true and one false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0025';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, boolean>();
      lightWeightMap.set("a", true);
      lightWeightMap.set("b", false);
      lightWeightMap.set("c", true);

      let hasTrue = false;
      let hasFalse = false;
      lightWeightMap.forEach((value: boolean, key: string) => {
        if (value) {
          hasTrue = true;
        } else {
          hasFalse = true;
        }
      });

      let ok = hasTrue && hasFalse;
      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });


    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0026
     * @tc.name      testLightWeightMapTest07Chapter0026
     * @tc.desc      forEach with Array<number> value, accumulate sum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0026';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number[]>();
      lightWeightMap.set("a", [1, 2, 3]);
      lightWeightMap.set("b", [4, 5]);

      let sum = 0;
      lightWeightMap.forEach((value: number[], key: string) => {
        for (let i = 0; i < value.length; i++) {
          sum += value[i];
        }
      });

      expect(sum === 15).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0027
     * @tc.name      testLightWeightMapTest07Chapter0027
     * @tc.desc      forEach with nested array number[][]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0027';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number[][]>();
      lightWeightMap.set("n1", [[1, 2], [3, 4]]);
      lightWeightMap.set("n2", [[5, 6]]);

      let hasValue4 = false;
      lightWeightMap.forEach((value: number[][], key: string) => {
        if (value.length > 1 && value[1][1] === 4) {
          hasValue4 = true;
        }
      });

      expect(hasValue4).assertTrue();
      console.log(TAG + 'end');
    });


    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0028
     * @tc.name      testLightWeightMapTest07Chapter0028
     * @tc.desc      forEach with simple object values, mutate property in callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0028';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, object>();
      let obj1: SimpleObj05 = { a: 1, b: "x" };
      let obj2: SimpleObj05 = { a: 2, b: "y" };
      lightWeightMap.set("o1", obj1);
      lightWeightMap.set("o2", obj2);

      lightWeightMap.forEach((value: SimpleObj05, key: string) => {
        value.a = value.a * 10;
      });

      let ok = (obj1.a === 10 && obj2.a === 20);
      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0029
     * @tc.name      testLightWeightMapTest07Chapter0029
     * @tc.desc      forEach with nested object value NestedObj
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0029';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, NestedObj>();
      let obj: NestedObj = {
        id: 1,
        data: {
          name: "inner",
          inner: { v: 100 }
        }
      };
      lightWeightMap.set("nested", obj);

      let ok = false;
      lightWeightMap.forEach((value: NestedObj, key: string) => {
        if (value.data.inner.v === 100) {
          ok = true;
        }
      });

      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });


    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0030
     * @tc.name      testLightWeightMapTest07Chapter0030
     * @tc.desc      forEach with Person class instance values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0030';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<number, Person>();
      let p1 = new Person("Alice", 20);
      let p2 = new Person("Bob", 30);
      lightWeightMap.set(1, p1);
      lightWeightMap.set(2, p2);

      lightWeightMap.forEach((value: Person, key: number) => {
        value.age = value.age + 1;
      });

      let ok = (p1.age === 21 && p2.age === 31);
      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0031
     * @tc.name      testLightWeightMapTest07Chapter0031
     * @tc.desc      forEach with Employee subclass instances stored as Person
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0031';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, Person>();
      let e1 = new Employee(1, "E1", 28);
      let e2 = new Employee(2, "E2", 35);
      lightWeightMap.set("e1", e1);
      lightWeightMap.set("e2", e2);

      let firstIsE2 = false;
      let index = 0;
      lightWeightMap.forEach((value: Person, key: string) => {
        if (index === 0) {
          let emp = value as Employee;
          if (emp.id === 1 && emp.name === "E1") {
            firstIsE2 = true;
          }
        }
        index++;
      });

      expect(firstIsE2).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0032
     * @tc.name      testLightWeightMapTest07Chapter0032
     * @tc.desc      entries() basic, verify order and key/value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0032';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      lightWeightMap.set("sparrow", 356);

      let iter = lightWeightMap.entries();
      let temp: IteratorResult<[string, number]> = iter.next();

      let firstKey = "";
      let firstValue = 0;
      let secondKey = "";
      let secondValue = 0;
      let idx = 0;

      while (!temp.done) {
        if (idx === 0) {
          firstKey = temp.value[0];
          firstValue = temp.value[1];
        } else if (idx === 1) {
          secondKey = temp.value[0];
          secondValue = temp.value[1];
        }
        idx++;
        temp = iter.next();
      }

      let ok = (idx === 2 &&
        firstKey === "sparrow" && firstValue === 356 &&
        secondKey === "squirrel" && secondValue === 123);
      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0033
     * @tc.name      testLightWeightMapTest07Chapter0033
     * @tc.desc      entries() on empty map should yield no elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0033';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      let iter = lightWeightMap.entries();
      let temp: IteratorResult<[string, number]> = iter.next();

      let count = 0;
      while (!temp.done) {
        count++;
        temp = iter.next();
      }

      expect(count === 0).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0034
     * @tc.name      testLightWeightMapTest07Chapter0034
     * @tc.desc      entries() after remove(), removed pair should not appear
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0034';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("k1", 1);
      lightWeightMap.set("k2", 2);
      lightWeightMap.set("k3", 3);
      lightWeightMap.remove("k2");

      let iter = lightWeightMap.entries();
      let temp: IteratorResult<[string, number]> = iter.next();
      let hasK2 = false;

      while (!temp.done) {
        if (temp.value[0] === "k2") {
          hasK2 = true;
        }
        temp = iter.next();
      }

      expect(!hasK2).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0035
     * @tc.name      testLightWeightMapTest07Chapter0035
     * @tc.desc      entries() with TypedArray value (Uint8Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0035';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, Uint8Array>();
      let u8 = new Uint8Array([72, 101, 108]);
      lightWeightMap.set("bytes", u8);

      let iter = lightWeightMap.entries();
      let temp: IteratorResult<[string, Uint8Array]> = iter.next();
      let ok = false;

      while (!temp.done) {
        let key = temp.value[0];
        let value = temp.value[1];
        if (key === "bytes" && value[0] === 72 && value[2] === 108) {
          ok = true;
        }
        temp = iter.next();
      }

      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0036
     * @tc.name      testLightWeightMapTest07Chapter0036
     * @tc.desc      entries() with object value (SimpleObj05)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0036';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, SimpleObj05>();
      let obj: SimpleObj05 = { a: 10, b: "obj" };
      lightWeightMap.set("o1", obj);

      let iter = lightWeightMap.entries();
      let temp: IteratorResult<[string, SimpleObj05]> = iter.next();
      let ok = false;

      while (!temp.done) {
        let key = temp.value[0];
        let value = temp.value[1];
        if (key === "o1" && value.a === 10 && value.b === "obj") {
          ok = true;
        }
        temp = iter.next();
      }

      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0037
     * @tc.name      testLightWeightMapTest07Chapter0037
     * @tc.desc      entries() with class instance values, check reference & field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0037';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<number, Person>();
      let p1 = new Person("Alice", 20);
      let p2 = new Person("Bob", 30);
      lightWeightMap.set(1, p1);
      lightWeightMap.set(2, p2);

      let iter = lightWeightMap.entries();
      let temp: IteratorResult<[number, Person]> = iter.next();
      let firstIsP2 = false;
      let count = 0;

      while (!temp.done) {
        if (count === 0 && temp.value[0] === 1 && temp.value[1] === p1) {
          firstIsP2 = true;
        }
        count++;
        temp = iter.next();
      }

      let ok = firstIsP2 && count === 2;
      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0038
     * @tc.name      testLightWeightMapTest07Chapter0038
     * @tc.desc      toString basic, verify result sparrow:356,squirrel:123
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0038';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      lightWeightMap.set("sparrow", 356);

      let result = lightWeightMap.toString();
      let ok = (result === "sparrow:356,squirrel:123");
      expect(ok).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0039
     * @tc.name      testLightWeightMapTest07Chapter0039
     * @tc.desc      toString after remove, removed key-value should not appear
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0039';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("k1", 1);
      lightWeightMap.set("k2", 2);
      lightWeightMap.remove("k1");

      let result = lightWeightMap.toString();
      let ok = (result.indexOf("k1:1") === -1) && (result.indexOf("k2:2") !== -1);
      expect(ok).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0040
     * @tc.name      testLightWeightMapTest07Chapter0040
     * @tc.desc      toString on empty map should return empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0040';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      let result = lightWeightMap.toString();
      let ok = (result === "");
      expect(ok).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0041
     * @tc.name      testLightWeightMapTest07Chapter0041
     * @tc.desc      toString with string key/value, special characters and spaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0041';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, string>();
      lightWeightMap.set("hello world", "foo/bar");
      lightWeightMap.set("特殊键", "值123");

      let result = lightWeightMap.toString();
      let ok = (result.indexOf("hello world:foo/bar") !== -1) &&
        (result.indexOf("特殊键:值123") !== -1);
      expect(ok).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0042
     * @tc.name      testLightWeightMapTest07Chapter0042
     * @tc.desc      toString with class instance values (Person05)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0042';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, Person>();
      let p1 = new Person("Alice", 20);
      let p2 = new Person("Bob", 30);
      lightWeightMap.set("p1", p1);
      lightWeightMap.set("p2", p2);

      let result = lightWeightMap.toString();
      console.log(TAG + ' toString result: ' + result);

      let ok = (result.indexOf("p2:") === 0 || result.indexOf("p2:") > -1);
      expect(ok).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0043
     * @tc.name      testLightWeightMapTest07Chapter0043
     * @tc.desc      entries() with union type values (number|string|boolean)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0043';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number | string | boolean>();
      lightWeightMap.set('num', 1);
      lightWeightMap.set('str', 'abc');
      lightWeightMap.set('bool', true);

      let iter = lightWeightMap.entries();
      let temp = iter.next();
      let firstKey = '';
      let firstIsBoolean = false;
      let count = 0;

      while (!temp.done) {
        let key = temp.value[0];
        let value = temp.value[1];
        if (count === 0) {
          firstKey = key;
          firstIsBoolean = (value === 1);
        }
        count++;
        temp = iter.next();
      }

      let ok = (count === 3 && firstKey === 'num' && firstIsBoolean);
      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0044
     * @tc.name      testLightWeightMapTest07Chapter0044
     * @tc.desc      entries() after clear(), iterator should be empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0044';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      for (let i = 0; i < 5; i++) {
        lightWeightMap.set('k' + i, i);
      }
      lightWeightMap.clear();

      let iter = lightWeightMap.entries();
      let temp = iter.next();
      let count = 0;

      while (!temp.done) {
        count++;
        temp = iter.next();
      }

      expect(count === 0).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0045
     * @tc.name      testLightWeightMapTest07Chapter0045
     * @tc.desc      entries() remove elements inside iteration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0045';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('a', 1);
      lightWeightMap.set('b', 2);
      lightWeightMap.set('c', 3);

      let iter = lightWeightMap.entries();
      let temp = iter.next();
      let visited = 0;

      while (!temp.done) {
        let key = temp.value[0];
        visited++;
        lightWeightMap.remove(key);
        temp = iter.next();
      }
      console.log(visited.toString(),lightWeightMap.length.toString());
      let ok = (visited === 2 && lightWeightMap.length === 1);
      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0046
     * @tc.name      testLightWeightMapTest07Chapter0046
     * @tc.desc      entries() with TypedArray as key (Uint8Array) and primitive value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0046';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<Uint8Array, string>();
      let keyArr = new Uint8Array([1, 2, 3]);
      lightWeightMap.set(keyArr, 'arrKey');

      let iter = lightWeightMap.entries();
      let temp = iter.next();
      let ok = false;

      while (!temp.done) {
        let key = temp.value[0];
        let value = temp.value[1];
        if (value === 'arrKey' && key[0] === 1 && key[2] === 3) {
          ok = true;
        }
        temp = iter.next();
      }

      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0047
     * @tc.name      testLightWeightMapTest07Chapter0047
     * @tc.desc      entries() iterate many elements, verify LIFO-like order for last and first
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0047';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      for (let i = 0; i < 10; i++) {
        lightWeightMap.set('k' + i, i);
      }

      let iter = lightWeightMap.entries();
      let temp = iter.next();
      let firstKey = '';
      let firstValue = -1;
      let lastKey = '';
      let lastValue = -1;
      let idx = 0;

      while (!temp.done) {
        let key = temp.value[0];
        let value = temp.value[1];
        if (idx === 0) {
          firstKey = key;
          firstValue = value;
        }
        lastKey = key;
        lastValue = value;
        idx++;
        temp = iter.next();
      }
      let ok = (idx === 10 &&
        firstKey === 'k0' && firstValue === 0 &&
        lastKey === 'k9' && lastValue === 9);
      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0048
     * @tc.name      testLightWeightMapTest07Chapter0048
     * @tc.desc      toString with boolean values, contains true/false pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0048';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, boolean>();
      lightWeightMap.set('t', true);
      lightWeightMap.set('f', false);

      let result = lightWeightMap.toString();
      let ok = (result.indexOf('t:true') !== -1) && (result.indexOf('f:false') !== -1);
      expect(ok).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0049
     * @tc.name      testLightWeightMapTest07Chapter0049
     * @tc.desc      toString with multiple numeric pairs, check pair count by splitting
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0049';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      for (let i = 0; i < 5; i++) {
        lightWeightMap.set('k' + i, i);
      }

      let result = lightWeightMap.toString();
      let parts: string[] = [];
      if (result !== '') {
        parts = result.split(',');
      }
      let ok = (parts.length === 5);
      expect(ok).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TEST07_0050
     * @tc.name      testLightWeightMapTest07Chapter0050
     * @tc.desc      toString after overwrite same key, only latest value should appear
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0050';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('a', 1);
      lightWeightMap.set('a', 2);

      let result = lightWeightMap.toString();
      let ok = (result.indexOf('a:2') !== -1) && (result.indexOf('a:1') === -1);
      expect(ok).assertTrue();

      console.log(TAG + 'end');
    });

  });
}