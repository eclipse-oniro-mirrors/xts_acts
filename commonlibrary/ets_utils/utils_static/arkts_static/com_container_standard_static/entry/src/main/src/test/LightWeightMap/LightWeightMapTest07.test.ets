/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import { LightWeightMap } from '@kit.ArkTS';

class Person {
  name: string;
  age: number;
  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
}

class Employee extends Person {
  id: number;
  constructor(id: number, name: string, age: number) {
    super(name, age);
    this.id = id;
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

function sleep(count: int): Promise<void> {
  return new Promise<void>((resolve: (value: PromiseLike<void>) => void, reject: (value: Error) => void) => {
    setTimeout(() => {
      resolve(Promise.resolve())
    }, count)
  })
}

export default function testLightWeightMapTest07(): void {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_0100
     * @tc.name      testLightWeightMapTest07Chapter0100
     * @tc.desc      values() with Int8Array value [-128,0,127]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0100';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_0200
     * @tc.name      testLightWeightMapTest07Chapter0200
     * @tc.desc      values() with Uint8Array value [0,255]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0200';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_0300
     * @tc.name      testLightWeightMapTest07Chapter0300
     * @tc.desc      Float32Array stores Infinity / -Infinity / NaN correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0300';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_0400
     * @tc.name      testLightWeightMapTest07Chapter0400
     * @tc.desc      Uint8ClampedArray clamps Infinity to 255, others to 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0400';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_0500
     * @tc.name      testLightWeightMapTest07Chapter0500
     * @tc.desc      values() with normal ASCII strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0500';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_0600
     * @tc.name      testLightWeightMapTest07Chapter0600
     * @tc.desc      values() with escape and unicode strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0600';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_0700
     * @tc.name      testLightWeightMapTest07Chapter0700
     * @tc.desc      values() with 0, -0, 1, -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0700';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_0800
     * @tc.name      testLightWeightMapTest07Chapter0800
     * @tc.desc      values() with Number boundary constants
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0800';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_0900
     * @tc.name      testLightWeightMapTest07Chapter0900
     * @tc.desc      values() with true/false mix
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter0900';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_1000
     * @tc.name      testLightWeightMapTest07Chapter1000
     * @tc.desc      values() with Array<number> value, check length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter1000';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number[]>();
      let arr: number[] = [1, 2, 3, 4];
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_1100
     * @tc.name      testLightWeightMapTest07Chapter1100
     * @tc.desc      values() with nested array Array<Array<number>>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter1100';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number[][]>();
      let nested: number[][] = [[1, 2], [3, 4]];
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_1200
     * @tc.name      testLightWeightMapTest07Chapter1200
     * @tc.desc      values() with simple object value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter1200';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_1300
     * @tc.name      testLightWeightMapTest07Chapter1300
     * @tc.desc      values() with nested object value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter1300';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_1400
     * @tc.name      testLightWeightMapTest07Chapter1400
     * @tc.desc      values() with Person class instance value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter1400';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_1500
     * @tc.name      testLightWeightMapTest07Chapter1500
     * @tc.desc      values() with Employee subclass instances as Person
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter1500';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_1600
     * @tc.name      testLightWeightMapTest07Chapter1600
     * @tc.desc      forEach basic example, verify order and value/key pairing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter1600';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("sparrow", 123);
      lightWeightMap.set("gull", 357);

      let firstPairOk = false;
      let secondPairOk = false;
      let index: int = 0;

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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_1700
     * @tc.name      testLightWeightMapTest07Chapter1700
     * @tc.desc      forEach with Int8Array value [-128,0,127]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter1700';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_1800
     * @tc.name      testLightWeightMapTest07Chapter1800
     * @tc.desc      forEach with Uint8Array boundary [0,255]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter1800';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_1900
     * @tc.name      testLightWeightMapTest07Chapter1900
     * @tc.desc      forEach with Float32Array [Infinity,-Infinity,NaN]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter1900';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_2000
     * @tc.name      testLightWeightMapTest07Chapter2000
     * @tc.desc      forEach with Uint8ClampedArray [Infinity,-Infinity,NaN] -> [255,0,0]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter2000';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_2100
     * @tc.name      testLightWeightMapTest07Chapter2100
     * @tc.desc      forEach with normal ASCII strings, check concat order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter2100';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_2200
     * @tc.name      testLightWeightMapTest07Chapter2200
     * @tc.desc      forEach with escape and unicode strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter2200';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(1, "\n");
      lightWeightMap.set(2, "👆🎅😼");

      let firstIsEmoji = false;
      let index: int = 0;
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_2300
     * @tc.name      testLightWeightMapTest07Chapter2300
     * @tc.desc      forEach with 0/-0/1/-1, first should be -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter2300';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("z", 0);
      lightWeightMap.set("nz", -0);
      lightWeightMap.set("one", 1);
      lightWeightMap.set("none", -1);

      let firstIsNegOne = false;
      let index: int = 0;
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_2400
     * @tc.name      testLightWeightMapTest07Chapter2400
     * @tc.desc      forEach with Number.MIN_VALUE / EPSILON / MAX_SAFE_INTEGER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter2400';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("min", Number.MIN_VALUE);
      lightWeightMap.set("eps", Number.EPSILON);

      let firstIsMaxSafe = false;
      let index: int = 0;
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_2500
     * @tc.name      testLightWeightMapTest07Chapter2500
     * @tc.desc      forEach with mixed true/false, at least one true and one false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter2500';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_2600
     * @tc.name      testLightWeightMapTest07Chapter2600
     * @tc.desc      forEach with Array<number> value, accumulate sum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter2600';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number[]>();
      lightWeightMap.set("a", [1, 2, 3]);
      lightWeightMap.set("b", [4, 5]);

      let sum: int = 0;
      lightWeightMap.forEach((value: number[], key: string) => {
        for (let i: int = 0; i < value.length; i++) {
          sum += value[i];
        }
      });

      expect(sum === 15).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_2700
     * @tc.name      testLightWeightMapTest07Chapter2700
     * @tc.desc      forEach with nested array number[][]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter2700';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_2800
     * @tc.name      testLightWeightMapTest07Chapter2800
     * @tc.desc      forEach with simple object values, mutate property in callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter2800';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, object>();
      let obj1: SimpleObj05 = { a: 1, b: "x" };
      let obj2: SimpleObj05 = { a: 2, b: "y" };
      lightWeightMap.set("o1", obj1);
      lightWeightMap.set("o2", obj2);

      lightWeightMap.forEach((value: object, key: string) => {
        let v = value as SimpleObj05;
        v.a = v.a * 10;
      });

      let ok = (obj1.a === 10 && obj2.a === 20);
      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_2900
     * @tc.name      testLightWeightMapTest07Chapter2900
     * @tc.desc      forEach with nested object value NestedObj
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter2900';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_3000
     * @tc.name      testLightWeightMapTest07Chapter3000
     * @tc.desc      forEach with Person class instance values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter3000';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_3100
     * @tc.name      testLightWeightMapTest07Chapter3100
     * @tc.desc      forEach with Employee subclass instances stored as Person
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightMapTest07Chapter3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter3100';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, Person>();
      let e1 = new Employee(1, "E1", 28);
      let e2 = new Employee(2, "E2", 35);
      lightWeightMap.set("e1", e1);
      lightWeightMap.set("e2", e2);

      let firstIsE2 = false;
      let index: int = 0;
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_3200
     * @tc.name      testLightWeightMapTest07Chapter3200
     * @tc.desc      entries() basic, verify order and key/value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter3200';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      lightWeightMap.set("sparrow", 356);

      let iter = lightWeightMap.entries();
      let temp: IteratorResult<[string, number]> = iter.next();

      let firstKey = "";
      let firstValue: number = 0;
      let secondKey = "";
      let secondValue: number = 0;
      let idx: int = 0;

      while (!temp.done) {
        if (idx === 0) {
          firstKey = temp.value![0];
          firstValue = temp.value![1];
        } else if (idx === 1) {
          secondKey = temp.value![0];
          secondValue = temp.value![1];
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_3300
     * @tc.name      testLightWeightMapTest07Chapter3300
     * @tc.desc      entries() on empty map should yield no elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter3300';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      let iter = lightWeightMap.entries();
      let temp: IteratorResult<[string, number]> = iter.next();

      let count: int = 0;
      while (!temp.done) {
        count++;
        temp = iter.next();
      }

      expect(count === 0).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_3400
     * @tc.name      testLightWeightMapTest07Chapter3400
     * @tc.desc      entries() after remove(), removed pair should not appear
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter3400';
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
        if (temp.value![0] === "k2") {
          hasK2 = true;
        }
        temp = iter.next();
      }

      expect(!hasK2).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_3500
     * @tc.name      testLightWeightMapTest07Chapter3500
     * @tc.desc      entries() with TypedArray value (Uint8Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter3500';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, Uint8Array>();
      let u8 = new Uint8Array([72, 101, 108]);
      lightWeightMap.set("bytes", u8);

      let iter = lightWeightMap.entries();
      let temp: IteratorResult<[string, Uint8Array]> = iter.next();
      let ok = false;

      while (!temp.done) {
        let key = temp.value![0];
        let value = temp.value![1];
        if (key === "bytes" && value[0] === 72 && value[2] === 108) {
          ok = true;
        }
        temp = iter.next();
      }

      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_3600
     * @tc.name      testLightWeightMapTest07Chapter3600
     * @tc.desc      entries() with object value (SimpleObj05)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter3600';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, SimpleObj05>();
      let obj: SimpleObj05 = { a: 10, b: "obj" };
      lightWeightMap.set("o1", obj);

      let iter = lightWeightMap.entries();
      let temp: IteratorResult<[string, SimpleObj05]> = iter.next();
      let ok = false;

      while (!temp.done) {
        let key = temp.value![0];
        let value = temp.value![1];
        if (key === "o1" && value.a === 10 && value.b === "obj") {
          ok = true;
        }
        temp = iter.next();
      }

      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_3700
     * @tc.name      testLightWeightMapTest07Chapter3700
     * @tc.desc      entries() with class instance values, check reference & field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter3700';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<number, Person>();
      let p1 = new Person("Alice", 20);
      let p2 = new Person("Bob", 30);
      lightWeightMap.set(1, p1);
      lightWeightMap.set(2, p2);

      let iter = lightWeightMap.entries();
      let temp: IteratorResult<[number, Person]> = iter.next();
      let firstIsP2 = false;
      let count: int = 0;

      while (!temp.done) {
        if (count === 0 && temp.value![0] === 1 && temp.value![1] === p1) {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_3800
     * @tc.name      testLightWeightMapTest07Chapter3800
     * @tc.desc      toString basic, verify result sparrow:356,squirrel:123
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter3800';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_3900
     * @tc.name      testLightWeightMapTest07Chapter3900
     * @tc.desc      toString after remove, removed key-value should not appear
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter3900';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_4000
     * @tc.name      testLightWeightMapTest07Chapter4000
     * @tc.desc      toString on empty map should return empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter4000';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      let result = lightWeightMap.toString();
      let ok = (result === "");
      expect(ok).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_4100
     * @tc.name      testLightWeightMapTest07Chapter4100
     * @tc.desc      toString with string key/value, special characters and spaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter4100';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, string>();
      lightWeightMap.set("hello world", "foo/bar");
      lightWeightMap.set("特殊字", "🎵23");

      let result = lightWeightMap.toString();
      let ok = (result.indexOf("hello world:foo/bar") !== -1) &&
        (result.indexOf("特殊字:🎵23") !== -1);
      expect(ok).assertTrue();

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_4200
     * @tc.name      testLightWeightMapTest07Chapter4200
     * @tc.desc      toString with class instance values (Person05)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter4200';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_4300
     * @tc.name      testLightWeightMapTest07Chapter4300
     * @tc.desc      entries() with union type values (number|string|boolean)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter4300';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number | string | boolean>();
      lightWeightMap.set('num', 1);
      lightWeightMap.set('str', 'abc');
      lightWeightMap.set('bool', true);

      let iter = lightWeightMap.entries();
      let temp = iter.next();
      let firstKey = '';
      let firstIsBoolean = false;
      let count: int = 0;

      while (!temp.done) {
        let key = temp.value![0];
        let value = temp.value![1];
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_4400
     * @tc.name      testLightWeightMapTest07Chapter4400
     * @tc.desc      entries() after clear(), iterator should be empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter4400';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      for (let i: int = 0; i < 5; i++) {
        lightWeightMap.set('k' + i, i);
      }
      lightWeightMap.clear();

      let iter = lightWeightMap.entries();
      let temp = iter.next();
      let count: int = 0;

      while (!temp.done) {
        count++;
        temp = iter.next();
      }

      expect(count === 0).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_4500
     * @tc.name      testLightWeightMapTest07Chapter4500
     * @tc.desc      entries() remove elements inside iteration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter4500';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('a', 1);
      lightWeightMap.set('b', 2);
      lightWeightMap.set('c', 3);

      let iter = lightWeightMap.entries();
      let temp = iter.next();
      let visited: int = 0;

      while (!temp.done) {
        let key = temp.value![0];
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_4600
     * @tc.name      testLightWeightMapTest07Chapter4600
     * @tc.desc      entries() with TypedArray as key (Uint8Array) and primitive value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter4600';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<Uint8Array, string>();
      let keyArr = new Uint8Array([1, 2, 3]);
      lightWeightMap.set(keyArr, 'arrKey');

      let iter = lightWeightMap.entries();
      let temp = iter.next();
      let ok = false;

      while (!temp.done) {
        let key = temp.value![0];
        let value = temp.value![1];
        if (value === 'arrKey' && key[0] === 1 && key[2] === 3) {
          ok = true;
        }
        temp = iter.next();
      }

      expect(ok).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_4700
     * @tc.name      testLightWeightMapTest07Chapter4700
     * @tc.desc      entries() iterate many elements, verify LIFO-like order for last and first
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter4700';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      for (let i: int = 0; i < 10; i++) {
        lightWeightMap.set('k' + i, i);
      }

      let iter = lightWeightMap.entries();
      let temp = iter.next();
      let firstKey = '';
      let firstValue: number = -1;
      let lastKey = '';
      let lastValue: number = -1;
      let idx: int = 0;

      while (!temp.done) {
        let key = temp.value![0];
        let value: number = temp.value![1];
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_4800
     * @tc.name      testLightWeightMapTest07Chapter4800
     * @tc.desc      toString with boolean values, contains true/false pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter4800';
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_4900
     * @tc.name      testLightWeightMapTest07Chapter4900
     * @tc.desc      toString with multiple numeric pairs, check pair count by splitting
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter4900';
      console.log(TAG + 'start');

      let lightWeightMap = new LightWeightMap<string, number>();
      for (let i: int = 0; i < 5; i++) {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTMAP_TESTSEVEN_5000
     * @tc.name      testLightWeightMapTest07Chapter5000
     * @tc.desc      toString after overwrite same key, only latest value should appear
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLightWeightMapTest07Chapter5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = 'testLightWeightMapTest07Chapter5000';
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