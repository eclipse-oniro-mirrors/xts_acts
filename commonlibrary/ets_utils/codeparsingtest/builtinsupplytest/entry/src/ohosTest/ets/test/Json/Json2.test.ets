/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function Json2Test() {
  describe('Json2Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      await sleep(20);
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   Json2Test001
     * @tc.number SUB_BUILTINS_Json2_TEST_0100
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        name: string,
        age: number
      }

      const obj: Obj = { name: "Alice", age: 25 };
      const jsonStr = JSON.stringify(obj);
      expect(jsonStr).assertEqual('{"name":"Alice","age":25}');
    });
    /**
     * @tc.name   Json2Test002
     * @tc.number SUB_BUILTINS_Json2_TEST_0200
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: number,
        b: number,
        c: number,
      }

      const obj: Obj = { a: 1, b: 2, c: 3 };
      const jsonStr = JSON.stringify(obj, ["a", "c"]);
      expect(jsonStr).assertEqual('{"a":1,"c":3}');
    });
    /**
     * @tc.name   Json2Test003
     * @tc.number SUB_BUILTINS_Json2_TEST_0300
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        x: number
      }

      const obj: Obj = { x: 10 };
      const jsonStr = JSON.stringify(obj, null, 2);
      expect(jsonStr).assertEqual("{\n  \"x\": 10\n}");
    });

    /**
     * @tc.name   Json2Test004
     * @tc.number SUB_BUILTINS_Json2_TEST_0400
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const boolVal = true;
      const jsonStr = JSON.stringify(boolVal);
      expect(jsonStr).assertEqual("true");
    });

    /**
     * @tc.name   Json2Test005
     * @tc.number SUB_BUILTINS_Json2_TEST_0500
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        str: string,
        num: number
      }

      const obj: Obj = { str: "test", num: 5 };
      const jsonStr = JSON.stringify(obj, (k, v: string) => typeof v === "string" ? undefined : v);
      expect(jsonStr).assertEqual('{"num":5}');
    });

    /**
     * @tc.name   Json2Test006
     * @tc.number SUB_BUILTINS_Json2_TEST_0600
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        y: number
      }

      const obj: Obj = { y: 20 };
      const jsonStr = JSON.stringify(obj, null, "--");
      expect(jsonStr).assertEqual("{\n--\"y\": 20\n}");
    });

    /**
     * @tc.name   Json2Test007
     * @tc.number SUB_BUILTINS_Json2_TEST_0700
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const nullVal = null;
      const jsonStr = JSON.stringify(nullVal);
      expect(jsonStr).assertEqual("null");
    });

    /**
     * @tc.name   Json2Test008
     * @tc.number SUB_BUILTINS_Json2_TEST_0800
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        z: number
      }

      const obj: Obj = { z: 30 };
      const jsonStr = JSON.stringify(obj, null, 15);
      const expected = "{\n          \"z\": 30\n}";
      expect(jsonStr).assertEqual(expected);
    });

    /**
     * @tc.name   Json2Test009
     * @tc.number SUB_BUILTINS_Json2_TEST_0900
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, undefined, 3];
      const jsonStr = JSON.stringify(arr);
      expect(jsonStr).assertEqual("[1,null,3]");
    });

    /**
     * @tc.name   Json2Test010
     * @tc.number SUB_BUILTINS_Json2_TEST_1000
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let topKey = "";
      JSON.stringify({ a: 1 }, (k, v: string) => {
        topKey = k;
        return v;
      });
      expect(topKey).assertEqual("a");
    });

    /**
     * @tc.name   Json2Test011
     * @tc.number SUB_BUILTINS_Json2_TEST_1100
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        m: number
      }

      const obj: Obj = { m: 5 };
      const spaceStr = "1234567890123";
      const jsonStr = JSON.stringify(obj, null, spaceStr);
      const expected = "{\n1234567890\"m\": 5\n}";
      expect(jsonStr).assertEqual(expected);
    });

    /**
     * @tc.name   Json2Test012
     * @tc.number SUB_BUILTINS_Json2_TEST_1200
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: number
      }

      const obj: Obj = { a: 1 };
      const jsonStr = JSON.stringify(obj, ["b", "a"]);
      expect(jsonStr).assertEqual('{"a":1}');
    });

    /**
     * @tc.name   Json2Test013
     * @tc.number SUB_BUILTINS_Json2_TEST_1300
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date("2024-01-01T00:00:00.000Z");
      const jsonStr = JSON.stringify(date);
      expect(jsonStr).assertEqual('"2024-01-01T00:00:00.000Z"');
    });

    /**
     * @tc.name   Json2Test014
     * @tc.number SUB_BUILTINS_Json2_TEST_1400
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        p: number
      }

      const obj: Obj = { p: 15 };
      const jsonStr = JSON.stringify(obj, null, 0);
      expect(jsonStr).assertEqual('{"p":15}');
    });

    /**
     * @tc.name   Json2Test015
     * @tc.number SUB_BUILTINS_Json2_TEST_1500
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const nanVal = NaN;
      const jsonStr = JSON.stringify(nanVal);
      expect(jsonStr).assertEqual("null");
    });

    /**
     * @tc.name   Json2Test016
     * @tc.number SUB_BUILTINS_Json2_TEST_1600
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: A
      }

      interface A {
        b: number,
        c: string
      }

      const obj: Obj = { a: { b: 2, c: "str" } };
      const jsonStr = JSON.stringify(obj, (k, v: string) => typeof v === "string" ? undefined : v);
      expect(jsonStr).assertEqual('{"a":{"b":2}}');
    });

    /**
     * @tc.name   Json2Test017
     * @tc.number SUB_BUILTINS_Json2_TEST_1700
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const infVal = Infinity;
      const jsonStr = JSON.stringify(infVal);
      expect(jsonStr).assertEqual("null");
    });

    /**
     * @tc.name   Json2Test018
     * @tc.number SUB_BUILTINS_Json2_TEST_1800
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        x: X
      }

      interface X {
        y: number
      }

      const obj: Obj = { x: { y: 3 } };
      const jsonStr = JSON.stringify(obj, (k: string, v: X) => k === "x" ? { y: v.y * 2 } : v);
      expect(jsonStr).assertEqual('{"x":{"y":6}}');
    });

    /**
     * @tc.name   Json2Test019
     * @tc.number SUB_BUILTINS_Json2_TEST_1900
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, () => {
      }, 3];
      const jsonStr = JSON.stringify(arr);
      expect(jsonStr).assertEqual("[1,null,3]");
    });

    /**
     * @tc.name   Json2Test020
     * @tc.number SUB_BUILTINS_Json2_TEST_2000
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: number,
        b: number
      }

      const obj: Obj = { a: 1, b: 2 };
      const jsonStr = JSON.stringify(obj, null);
      expect(jsonStr).assertEqual('{"a":1,"b":2}');
    });
    /**
     * @tc.name   Json2Test021
     * @tc.number SUB_BUILTINS_Json2_TEST_2100
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const strObj = new String("test");
      const jsonStr = JSON.stringify(strObj);
      expect(jsonStr).assertEqual('"test"');
    });

    /**
     * @tc.name   Json2Test022
     * @tc.number SUB_BUILTINS_Json2_TEST_2200
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: number,
        b: number,
      }

      const obj: Obj = { a: 1, b: 2 };
      const jsonStr = JSON.stringify(obj, (k, v: string) => k === "b" ? undefined : v);
      expect(jsonStr).assertEqual('{"a":1}');
    });

    /**
     * @tc.name   Json2Test023
     * @tc.number SUB_BUILTINS_Json2_TEST_2300
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const numObj = new Number(10);
      const jsonStr = JSON.stringify(numObj);
      expect(jsonStr).assertEqual("10");
    });

    /**
     * @tc.name   Json2Test024
     * @tc.number SUB_BUILTINS_Json2_TEST_2400
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([["a", 1]]);
      const jsonStr = JSON.stringify(map);
      expect(jsonStr).assertEqual("{}");
    });

    /**
     * @tc.name   Json2Test025
     * @tc.number SUB_BUILTINS_Json2_TEST_2500
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const jsonStr = JSON.stringify(arr, (k, v: number) => Number(k) === 1 ? undefined : v);
      expect(jsonStr).assertEqual("[1,null,3]");
    });

    /**
     * @tc.name   Json2Test026
     * @tc.number SUB_BUILTINS_Json2_TEST_2600
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        num: number,
        flag: boolean
      }

      const obj: Obj = { num: -15, flag: true };
      const jsonStr = JSON.stringify(obj);
      expect(jsonStr).assertEqual('{"num":-15,"flag":true}');
    });

    /**
     * @tc.name   Json2Test027
     * @tc.number SUB_BUILTINS_Json2_TEST_2700
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        parent: Parent,
        other: number
      }

      interface Parent {
        child1: number,
        child2: number,
      }

      const obj: Obj = { parent: { child1: 10, child2: 20 }, other: 30 };
      const jsonStr = JSON.stringify(obj, ["parent", "child1"]);
      expect(jsonStr).assertEqual('{"parent":{"child1":10}}');
    });

    /**
     * @tc.name   Json2Test028
     * @tc.number SUB_BUILTINS_Json2_TEST_2800
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: number
      }

      const obj: Obj = { a: 5 };
      const jsonStr = JSON.stringify(obj, null, "\t");
      expect(jsonStr).assertEqual("{\n\t\"a\": 5\n}");
    });

    /**
     * @tc.name   Json2Test029
     * @tc.number SUB_BUILTINS_Json2_TEST_2900
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const boolObj = new Boolean(false);
      const jsonStr = JSON.stringify(boolObj);
      expect(jsonStr).assertEqual("false");
    });

    /**
     * @tc.name   Json2Test030
     * @tc.number SUB_BUILTINS_Json2_TEST_3000
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        x: X
      }

      interface X {
        str: string,
        num: number
      }

      const obj: Obj = { x: { str: "test", num: 5 } };
      const jsonStr = JSON.stringify(obj, (k, v: string) => typeof v === "string" ? undefined : v);
      expect(jsonStr).assertEqual('{"x":{"num":5}}');
    });

    /**
     * @tc.name   Json2Test031
     * @tc.number SUB_BUILTINS_Json2_TEST_3100
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        b: number
      }

      const obj: Obj = { b: 8 };
      const jsonStr = JSON.stringify(obj, null, "/* ");
      expect(jsonStr).assertEqual("{\n/* \"b\": 8\n}");
    });

    /**
     * @tc.name   Json2Test032
     * @tc.number SUB_BUILTINS_Json2_TEST_3200
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {}

      const emptyObj: Obj = {};
      const jsonStr = JSON.stringify(emptyObj);
      expect(jsonStr).assertEqual("{}");
    });

    /**
     * @tc.name   Json2Test033
     * @tc.number SUB_BUILTINS_Json2_TEST_3300
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [null, 2, 3];
      const jsonStr = JSON.stringify(arr);
      expect(jsonStr).assertEqual("[null,2,3]");
    });

    /**
     * @tc.name   Json2Test034
     * @tc.number SUB_BUILTINS_Json2_TEST_3400
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        c: number
      }

      const obj: Obj = { c: 12 };
      const jsonStr = JSON.stringify(obj, null, 1);
      expect(jsonStr).assertEqual("{\n \"c\": 12\n}");
    });

    /**
     * @tc.name   Json2Test035
     * @tc.number SUB_BUILTINS_Json2_TEST_3500
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        flag: number
      }

      const obj: Obj = { flag: 0 };
      const jsonStr = JSON.stringify(obj, (k: string, v: number) => k === "flag" ? v === 0 : v);
      expect(jsonStr).assertEqual('{"flag":true}');

    });

    /**
     * @tc.name   Json2Test036
     * @tc.number SUB_BUILTINS_Json2_TEST_3600
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: number,
        b: number
      }

      const obj: Obj = { a: 1, b: 2 };
      const jsonStr = JSON.stringify(obj, []);
      expect(jsonStr).assertEqual("{}");
    });

    /**
     * @tc.name   Json2Test037
     * @tc.number SUB_BUILTINS_Json2_TEST_3700
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date("2024-06-01T12:34:56+08:00");
      const jsonStr = JSON.stringify(date);
      expect(jsonStr).assertEqual('"2024-06-01T04:34:56.000Z"');
    });

    /**
     * @tc.name   Json2Test038
     * @tc.number SUB_BUILTINS_Json2_TEST_3800
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let initialKey = "";
      JSON.stringify([1, 2], (k, v: string) => {
        if (initialKey === "") {
          initialKey = k;
        }
        return v;
      });
      expect(initialKey).assertEqual("0");
    });

    /**
     * @tc.name   Json2Test039
     * @tc.number SUB_BUILTINS_Json2_TEST_3900
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        d: number
      }

      const obj: Obj = { d: 15 };
      const jsonStr = JSON.stringify(obj, null, "\n");
      expect(jsonStr).assertEqual("{\n\n\"d\": 15\n}");
    });

    /**
     * @tc.name   Json2Test040
     * @tc.number SUB_BUILTINS_Json2_TEST_4000
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, NaN, 3];
      const jsonStr = JSON.stringify(arr);
      expect(jsonStr).assertEqual("[1,null,3]");
    });

    /**
     * @tc.name   Json2Test041
     * @tc.number SUB_BUILTINS_Json2_TEST_4100
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: A
      }

      interface A {
        b: B
      }

      interface B {
        c: string,
        d: number
      }

      const obj: Obj = { a: { b: { c: "str", d: 5 } } };
      const jsonStr = JSON.stringify(obj, (k, v: string) => typeof v === "string" ? undefined : v);
      expect(jsonStr).assertEqual('{"a":{"b":{"d":5}}}');
    });

    /**
     * @tc.name   Json2Test042
     * @tc.number SUB_BUILTINS_Json2_TEST_4200
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [Infinity, 2, -Infinity];
      const jsonStr = JSON.stringify(arr);
      expect(jsonStr).assertEqual("[null,2,null]");
    });

    /**
     * @tc.name   Json2Test043
     * @tc.number SUB_BUILTINS_Json2_TEST_4300
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        num: string
      }

      const obj: Obj = { num: "5" };
      const jsonStr = JSON.stringify(obj, (k: string, v: number) => k === "num" ? Number(v) : v);
      expect(jsonStr).assertEqual('{"num":5}');
    });

    /**
     * @tc.name   Json2Test044
     * @tc.number SUB_BUILTINS_Json2_TEST_4400
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [undefined, () => {
      }, 3];
      const jsonStr = JSON.stringify(arr);
      expect(jsonStr).assertEqual("[null,null,3]");
    });

    /**
     * @tc.name   Json2Test045
     * @tc.number SUB_BUILTINS_Json2_TEST_4500
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        x: number,
        y: number
      }

      const obj: Obj = { x: 10, y: 20 };
      const jsonStr = JSON.stringify(obj, null, 2);
      expect(jsonStr).assertEqual("{\n  \"x\": 10,\n  \"y\": 20\n}");
    });

    /**
     * @tc.name   Json2Test046
     * @tc.number SUB_BUILTINS_Json2_TEST_4600
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        str: string
      }

      const obj: Obj = { str: "a\"b\nc" };
      const jsonStr = JSON.stringify(obj);
      expect(jsonStr).assertEqual('{"str":"a\\"b\\nc"}');
    });

    /**
     * @tc.name   Json2Test047
     * @tc.number SUB_BUILTINS_Json2_TEST_4700
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        num: number
      }

      const obj: Obj = { num: 5 };
      const jsonStr = JSON.stringify(obj, (k: string, v: number) => k === "num" ? v.toString() : v);
      expect(jsonStr).assertEqual('{"num":"5"}');
    });

    /**
     * @tc.name   Json2Test048
     * @tc.number SUB_BUILTINS_Json2_TEST_4800
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const set = new Set([1, 2]);
      const jsonStr = JSON.stringify(set);
      expect(jsonStr).assertEqual("{}");
    });

    /**
     * @tc.name   Json2Test049
     * @tc.number SUB_BUILTINS_Json2_TEST_4900
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const jsonStr = JSON.stringify(arr, (k, v: number) => Number(k) === 1 ? () => {
      } : v);
      expect(jsonStr).assertEqual("[1,null,3]");
    });

    /**
     * @tc.name   Json2Test050
     * @tc.number SUB_BUILTINS_Json2_TEST_5000
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        name: string,
        age: number
      }

      const obj: Obj = { name: "张三", age: 30 };
      const jsonStr = JSON.stringify(obj);
      expect(jsonStr).assertEqual('{"name":"张三","age":30}');
    });
    /**
     * @tc.name   Json2Test051
     * @tc.number SUB_BUILTINS_Json2_TEST_5100
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: number,
        b: number
      }

      const obj: Obj = { a: 1, b: 2 };
      const jsonStr = JSON.stringify(obj, (k: string, v: Obj) => k === "" ? { a: v.a } : v);
      expect(jsonStr).assertEqual('{"a":1}');
    });

    /**
     * @tc.name   Json2Test052
     * @tc.number SUB_BUILTINS_Json2_TEST_5200
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        z: number
      }

      const obj: Obj = { z: 25 };
      const jsonStr = JSON.stringify(obj, null, 10);
      const expected = "{\n          \"z\": 25\n}";
      expect(jsonStr).assertEqual(expected);
    });

    /**
     * @tc.name   Json2Test053
     * @tc.number SUB_BUILTINS_Json2_TEST_5300
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        pi: number,
        count: number
      }

      const obj: Obj = { pi: 3.14159, count: 10 };
      const jsonStr = JSON.stringify(obj);
      expect(jsonStr).assertEqual('{"pi":3.14159,"count":10}');
    });

    /**
     * @tc.name   Json2Test054
     * @tc.number SUB_BUILTINS_Json2_TEST_5400
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: A,
        e: number
      }

      interface A {
        b: B
      }

      interface B {
        c: number,
        d: number
      }

      const obj: Obj = { a: { b: { c: 5, d: 6 } }, e: 7 };
      const jsonStr = JSON.stringify(obj, ["a", "b", "d"]);
      expect(jsonStr).assertEqual('{"a":{"b":{"d":6}}}');
    });

    /**
     * @tc.name   Json2Test055
     * @tc.number SUB_BUILTINS_Json2_TEST_5500
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        x: number
      }

      const obj: Obj = { x: 8 };
      const jsonStr = JSON.stringify(obj, null, "-");
      expect(jsonStr).assertEqual("{\n-\"x\": 8\n}");
    });

    /**
     * @tc.name   Json2Test056
     * @tc.number SUB_BUILTINS_Json2_TEST_5600
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emptyArr: never[] = [];
      const jsonStr = JSON.stringify(emptyArr);
      expect(jsonStr).assertEqual("[]");
    });

    /**
     * @tc.name   Json2Test057
     * @tc.number SUB_BUILTINS_Json2_TEST_5700
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4];
      const jsonStr = JSON.stringify(arr, (k, v: number) => Number(v) % 2 === 0 ? undefined : v);
      expect(jsonStr).assertEqual("[1,null,3,null]");
    });

    /**
     * @tc.name   Json2Test058
     * @tc.number SUB_BUILTINS_Json2_TEST_5800
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        y: number
      }

      const obj: Obj = { y: 12 };
      const jsonStr = JSON.stringify(obj, null, "  >");
      expect(jsonStr).assertEqual("{\n  >\"y\": 12\n}");
    });

    /**
     * @tc.name   Json2Test059
     * @tc.number SUB_BUILTINS_Json2_TEST_5900
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: undefined,
        b: number
      }

      const obj: Obj = { a: undefined, b: 5 };
      const jsonStr = JSON.stringify(obj);
      expect(jsonStr).assertEqual('{"b":5}');
    });

    /**
     * @tc.name   Json2Test060
     * @tc.number SUB_BUILTINS_Json2_TEST_6000
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        z: number
      }

      const obj: Obj = { z: 15 };
      const jsonStr = JSON.stringify(obj, null, -5);
      expect(jsonStr).assertEqual('{"z":15}');
    });

    /**
     * @tc.name   Json2Test061
     * @tc.number SUB_BUILTINS_Json2_TEST_6100
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date("2024-01-01T00:00:00.123Z");
      const jsonStr = JSON.stringify(date);
      expect(jsonStr).assertEqual('"2024-01-01T00:00:00.123Z"');
    });

    /**
     * @tc.name   Json2Test062
     * @tc.number SUB_BUILTINS_Json2_TEST_6200
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: number,
        b: number
      }

      const obj: Obj = { a: 1, b: 2 };
      const jsonStr = JSON.stringify(obj, (k, v: Obj) => k === "b" ? null : v);
      expect(jsonStr).assertEqual('{"a":1,"b":null}');
    });

    /**
     * @tc.name   Json2Test063
     * @tc.number SUB_BUILTINS_Json2_TEST_6300
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        m: number
      }

      const obj: Obj = { m: 7 };
      const jsonStr = JSON.stringify(obj, null, 10);
      const expected = "{\n          \"m\": 7\n}"; // 10个空格
      expect(jsonStr).assertEqual(expected);
    });

    /**
     * @tc.name   Json2Test064
     * @tc.number SUB_BUILTINS_Json2_TEST_6400
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        func: Function,
        val: number
      }

      const obj: Obj = {
        func: () => {
        }, val: 5
      };
      const jsonStr = JSON.stringify(obj);
      expect(jsonStr).assertEqual('{"val":5}');
    });

    /**
     * @tc.name   Json2Test065
     * @tc.number SUB_BUILTINS_Json2_TEST_6500
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface A {
        a: string,
        b: number
      }

      interface Obj {
        c: number
      }

      const arr = [{ a: "str", b: 5 } as A, { c: 10 } as Obj];
      const jsonStr = JSON.stringify(arr, (k, v: string | number) => typeof v === "string" ? undefined : v);
      expect(jsonStr).assertEqual('[{"b":5},{"c":10}]');
    });

    /**
     * @tc.name   Json2Test066
     * @tc.number SUB_BUILTINS_Json2_TEST_6600
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        n: number
      }

      const obj: Obj = { n: 9 };
      const spaceStr = "abcdefghijkl";
      const jsonStr = JSON.stringify(obj, null, spaceStr);
      const expected = "{\nabcdefghij\"n\": 9\n}";
      expect(jsonStr).assertEqual(expected);
    });

    /**
     * @tc.name   Json2Test067
     * @tc.number SUB_BUILTINS_Json2_TEST_6700
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: null,
        b: number
      }

      const obj: Obj = { a: null, b: 5 };
      const jsonStr = JSON.stringify(obj);
      expect(jsonStr).assertEqual('{"a":null,"b":5}');
    });

    /**
     * @tc.name   Json2Test068
     * @tc.number SUB_BUILTINS_Json2_TEST_6800
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        flag: number
      }

      const obj: Obj = { flag: 1 };
      const jsonStr = JSON.stringify(obj, (k: string, v: number) => k === "flag" ? v === 1 : v);
      expect(jsonStr).assertEqual('{"flag":true}');
    });

    /**
     * @tc.name   Json2Test069
     * @tc.number SUB_BUILTINS_Json2_TEST_6900
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        key: string
      }

      const weakMap = new WeakMap([[{ key: "val" } as Obj, 10]]);
      const jsonStr = JSON.stringify(weakMap); // WeakMap无默认可枚举属性
      expect(jsonStr).assertEqual("{}");
    });

    /**
     * @tc.name   Json2Test070
     * @tc.number SUB_BUILTINS_Json2_TEST_7000
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        p: number
      }

      const obj: Obj = { p: 11 };
      const jsonStr = JSON.stringify(obj, null, "\t ");
      expect(jsonStr).assertEqual("{\n\t \"p\": 11\n}");
    });

    /**
     * @tc.name   Json2Test071
     * @tc.number SUB_BUILTINS_Json2_TEST_7100
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = ["a\\b", "c'd"];
      const jsonStr = JSON.stringify(arr);
      expect(jsonStr).assertEqual('["a\\\\b","c\'d"]');
    });

    /**
     * @tc.name   Json2Test072
     * @tc.number SUB_BUILTINS_Json2_TEST_7200
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4];
      const jsonStr = JSON.stringify(arr, (k, v: number) => Number(k) === 2 ? undefined : v);
      expect(jsonStr).assertEqual("[1,2,null,4]");
    });

    /**
     * @tc.name   Json2Test073
     * @tc.number SUB_BUILTINS_Json2_TEST_7300
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = ["张三", "李四", 25];
      const jsonStr = JSON.stringify(arr);
      expect(jsonStr).assertEqual('["张三","李四",25]');
    });

    /**
     * @tc.name   Json2Test074
     * @tc.number SUB_BUILTINS_Json2_TEST_7400
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: number,
        b: number,
        c: number
      }

      const obj: Obj = { a: 1, b: 2, c: 3 };
      const jsonStr = JSON.stringify(obj, ["a", "c"], 2);
      expect(jsonStr).assertEqual("{\n  \"a\": 1,\n  \"c\": 3\n}");
    });

    /**
     * @tc.name   Json2Test075
     * @tc.number SUB_BUILTINS_Json2_TEST_7500
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const numObj = new Number(0);
      const jsonStr = JSON.stringify(numObj);
      expect(jsonStr).assertEqual("0");
    });

    /**
     * @tc.name   Json2Test076
     * @tc.number SUB_BUILTINS_Json2_TEST_7600
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        x: number
      }

      interface Z {
        z: number
      }

      const obj: Obj = { x: 5 };
      const jsonStr = JSON.stringify(obj, (k: string, v: Obj) => k === "" ? { y: { z: v.x * 2 } as Z } : v);
      expect(jsonStr).assertEqual('{"y":{"z":10}}');
    });

    /**
     * @tc.name   Json2Test077
     * @tc.number SUB_BUILTINS_Json2_TEST_7700
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        temp: number,
        status: string
      }

      const obj: Obj = { temp: -12.5, status: "ok" };
      const jsonStr = JSON.stringify(obj);
      expect(jsonStr).assertEqual('{"temp":-12.5,"status":"ok"}');
    });

    /**
     * @tc.name   Json2Test078
     * @tc.number SUB_BUILTINS_Json2_TEST_7800
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        id: number,
        name: string
      }

      const arr = [{ id: 1, name: "A" } as Obj, { id: 2, name: "B" } as Obj];
      const jsonStr = JSON.stringify(arr, ["id"]);
      expect(jsonStr).assertEqual('[{"id":1},{"id":2}]');
    });

    /**
     * @tc.name   Json2Test079
     * @tc.number SUB_BUILTINS_Json2_TEST_7900
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        key: string
      }

      const obj: Obj = { key: "val" };
      const jsonStr = JSON.stringify(obj, null, "||");
      expect(jsonStr).assertEqual("{\n||\"key\": \"val\"\n}");
    });

    /**
     * @tc.name   Json2Test080
     * @tc.number SUB_BUILTINS_Json2_TEST_8000
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const undefVal = undefined;
      const jsonStr = JSON.stringify(undefVal);
      expect(jsonStr).assertEqual(undefined);
    });
    /**
     * @tc.name   Json2Test081
     * @tc.number SUB_BUILTINS_Json2_TEST_8100
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        count: number
      }

      const obj: Obj = { count: 100 };
      const jsonStr = JSON.stringify(obj, (k: string, v: number) => k === "count" ? v.toString() : v);
      expect(jsonStr).assertEqual('{"count":"100"}');
    });

    /**
     * @tc.name   Json2Test082
     * @tc.number SUB_BUILTINS_Json2_TEST_8200
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        num: number
      }

      const obj: Obj = { num: 7 };
      const jsonStr = JSON.stringify(obj, null, 5);
      expect(jsonStr).assertEqual("{\n     \"num\": 7\n}");
    });

    /**
     * @tc.name   Json2Test083
     * @tc.number SUB_BUILTINS_Json2_TEST_8300
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        data: string
      }

      const obj: Obj = { data: "test" };
      const jsonStr = JSON.stringify(obj, null, "  - ");
      expect(jsonStr).assertEqual("{\n  - \"data\": \"test\"\n}");
    });

    /**
     * @tc.name   Json2Test084
     * @tc.number SUB_BUILTINS_Json2_TEST_8400
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [["str1", 5], ["str2", 10]];
      const jsonStr = JSON.stringify(arr, (k, v: string) => typeof v === "string" ? undefined : v);
      expect(jsonStr).assertEqual("[[null,5],[null,10]]");
    });

    /**
     * @tc.name   Json2Test085
     * @tc.number SUB_BUILTINS_Json2_TEST_8500
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: A
      }

      interface A {
        b: number
      }

      const obj: Obj = { a: { b: 5 } as A };
      const jsonStr = JSON.stringify(obj, ["a", "c"]);
      expect(jsonStr).assertEqual('{"a":{}}');
    });

    /**
     * @tc.name   Json2Test086
     * @tc.number SUB_BUILTINS_Json2_TEST_8600
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date("2024-02-29T00:00:00.000Z");
      const jsonStr = JSON.stringify(date);
      expect(jsonStr).assertEqual('"2024-02-29T00:00:00.000Z"');
    });

    /**
     * @tc.name   Json2Test087
     * @tc.number SUB_BUILTINS_Json2_TEST_8700
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: number,
        b: number
      }

      const obj: Obj = { a: 1, b: 2 };
      const jsonStr = JSON.stringify(obj, (k: string, v: number) => k === "a" ? undefined : v);
      expect(jsonStr).assertEqual('{"b":2}');
    });

    /**
     * @tc.name   Json2Test088
     * @tc.number SUB_BUILTINS_Json2_TEST_8800
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        val: number
      }

      const obj: Obj = { val: 3 };
      const jsonStr = JSON.stringify(obj, null, 11);
      const expected = "{\n          \"val\": 3\n}"; // 10个空格
      expect(jsonStr).assertEqual(expected);
    });

    /**
     * @tc.name   Json2Test089
     * @tc.number SUB_BUILTINS_Json2_TEST_8900
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [() => {
      }, 2, 3];
      const jsonStr = JSON.stringify(arr);
      expect(jsonStr).assertEqual("[null,2,3]");
    });

    /**
     * @tc.name   Json2Test090
     * @tc.number SUB_BUILTINS_Json2_TEST_9000
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Z {
        z: number
      }

      interface X {
        x: string,
        y: number
      }

      const arr = [{ x: "str", y: 5 } as X, { z: 10 } as Z];
      const jsonStr = JSON.stringify(arr, (k, v: string | number) => typeof v === "string" ? "new-str" : v);
      expect(jsonStr).assertEqual('[{"x":"new-str","y":5},{"z":10}]');
    });

    /**
     * @tc.name   Json2Test091
     * @tc.number SUB_BUILTINS_Json2_TEST_9100
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3n];
      let isErr = false;
      try {
        JSON.stringify(arr);
      } catch (e) {
        isErr = e instanceof TypeError;
      }
      expect(isErr).assertEqual(true);
    });

    /**
     * @tc.name   Json2Test092
     * @tc.number SUB_BUILTINS_Json2_TEST_9200
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        code: number
      }

      const obj = { code: 123 } as Obj;
      const spaceStr = "01234567890"; // 前10个为"0123456789"
      const jsonStr = JSON.stringify(obj, null, spaceStr);
      const expected = "{\n0123456789\"code\": 123\n}";
      expect(jsonStr).assertEqual(expected);
    });

    /**
     * @tc.name   Json2Test093
     * @tc.number SUB_BUILTINS_Json2_TEST_9300
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, [null, 3], 5];
      const jsonStr = JSON.stringify(arr);
      expect(jsonStr).assertEqual("[1,[null,3],5]");
    });

    /**
     * @tc.name   Json2Test094
     * @tc.number SUB_BUILTINS_Json2_TEST_9400
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        isActive: number
      }

      const obj: Obj = { isActive: 0 };
      const jsonStr = JSON.stringify(obj, (k: string, v: number) => k === "isActive" ? v !== 1 : v);
      expect(jsonStr).assertEqual('{"isActive":true}');
    });

    /**
     * @tc.name   Json2Test095
     * @tc.number SUB_BUILTINS_Json2_TEST_9500
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        item: string
      }

      const weakSet = new WeakSet([{ item: "val" } as Obj]);
      const jsonStr = JSON.stringify(weakSet); // WeakSet无默认可枚举属性
      expect(jsonStr).assertEqual("{}");
    });

    /**
     * @tc.name   Json2Test096
     * @tc.number SUB_BUILTINS_Json2_TEST_9600
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const jsonStr = JSON.stringify(arr, (k, v: number) => typeof v === "number" ? v.toString() : v);
      expect(jsonStr).assertEqual('["1","2","3"]');
    });

    /**
     * @tc.name   Json2Test097
     * @tc.number SUB_BUILTINS_Json2_TEST_9700
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        quote: string
      }

      const obj: Obj = { quote: 'He said "hi"' };
      const jsonStr = JSON.stringify(obj);
      expect(jsonStr).assertEqual('{"quote":"He said \\"hi\\""}');
    });

    /**
     * @tc.name   Json2Test098
     * @tc.number SUB_BUILTINS_Json2_TEST_9800
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [10, 20, 30];
      const jsonStr = JSON.stringify(arr, (k, v: number) => Number(k) === 0 ? v + 5 : v);
      expect(jsonStr).assertEqual("\"10,20,305\"");
    });

    /**
     * @tc.name   Json2Test099
     * @tc.number SUB_BUILTINS_Json2_TEST_9900
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        symbol: string
      }

      const obj: Obj = { symbol: "!@#$%^" };
      const jsonStr = JSON.stringify(obj);
      expect(jsonStr).assertEqual('{"symbol":"!@#$%^"}');
    });

    /**
     * @tc.name   Json2Test100
     * @tc.number SUB_BUILTINS_Json2_TEST_10000
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        name: string,
        age: number,
        city: string
      }

      const obj: Obj = { name: "Bob", age: 30, city: "NY" };
      const jsonStr = JSON.stringify(obj, ["name", "city"], "\t");
      expect(jsonStr).assertEqual("{\n\t\"name\": \"Bob\",\n\t\"city\": \"NY\"\n}");
    });

    /**
     * @tc.name   Json2Test101
     * @tc.number SUB_BUILTINS_Json2_TEST_10100
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const boolObj = new Boolean(true);
      const jsonStr = JSON.stringify(boolObj);
      expect(jsonStr).assertEqual("true");
    });

    /**
     * @tc.name   Json2Test102
     * @tc.number SUB_BUILTINS_Json2_TEST_10200
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        num: number
      }

      const obj: Obj = { num: 4 };
      const jsonStr = JSON.stringify(obj, (k: string, v: Obj) => k === "" ? [v.num, v.num * 2] : v);
      expect(jsonStr).assertEqual("[4,8]");
    });

    /**
     * @tc.name   Json2Test103
     * @tc.number SUB_BUILTINS_Json2_TEST_10300
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        count: number,
        active: boolean
      }

      const obj: Obj = { count: 100, active: true };
      const jsonStr = JSON.stringify(obj);
      expect(jsonStr).assertEqual('{"count":100,"active":true}');
    });

    /**
     * @tc.name   Json2Test104
     * @tc.number SUB_BUILTINS_Json2_TEST_10400
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        list: Array<number>,
        info: string
      }

      const obj: Obj = { list: [1, 2, 3], info: "test" };
      const jsonStr = JSON.stringify(obj, ["list"]);
      expect(jsonStr).assertEqual('{"list":[1,2,3]}');
    });

    /**
     * @tc.name   Json2Test105
     * @tc.number SUB_BUILTINS_Json2_TEST_10500
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        x: number
      }

      const obj: Obj = { x: 15 };
      const jsonStr = JSON.stringify(obj, null, 3);
      expect(jsonStr).assertEqual("{\n   \"x\": 15\n}");
    });

    /**
     * @tc.name   Json2Test106
     * @tc.number SUB_BUILTINS_Json2_TEST_10600
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const func = () => {
      };
      const jsonStr = JSON.stringify(func);
      expect(jsonStr).assertEqual(undefined);
    });

    /**
     * @tc.name   Json2Test107
     * @tc.number SUB_BUILTINS_Json2_TEST_10700
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        text: string
      }

      const obj: Obj = { text: "hello" };
      const jsonStr = JSON.stringify(obj, (k, v: string) => k === "text" ? (v as string).toUpperCase() : v);
      expect(jsonStr).assertEqual('{"text":"HELLO"}');
    });

    /**
     * @tc.name   Json2Test108
     * @tc.number SUB_BUILTINS_Json2_TEST_10800
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        y: number
      }

      const obj: Obj = { y: 20 };
      const jsonStr = JSON.stringify(obj, null, "->");
      expect(jsonStr).assertEqual("{\n->\"y\": 20\n}");
    });

    /**
     * @tc.name   Json2Test109
     * @tc.number SUB_BUILTINS_Json2_TEST_10900
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        z: number
      }

      const obj: Obj = { z: 25 };
      const jsonStr = JSON.stringify(obj, null, 0);
      expect(jsonStr).assertEqual('{"z":25}');
    });

    /**
     * @tc.name   Json2Test110
     * @tc.number SUB_BUILTINS_Json2_TEST_11000
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, null, 3];
      const jsonStr = JSON.stringify(arr, (k, v: number | null) => v === null ? 0 : v);
      expect(jsonStr).assertEqual("[1,0,3]");
    });
    /**
     * @tc.name   Json2Test111
     * @tc.number SUB_BUILTINS_Json2_TEST_11100
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: A,

      }

      interface A {
        b: B,
        e: number
      }

      interface B {
        c: number,
        d: number
      }

      const obj: Obj = { a: { b: { c: 5, d: 6 } as B, e: 7 } as A };
      const jsonStr = JSON.stringify(obj, ["a", "b", "c"]);
      expect(jsonStr).assertEqual('{"a":{"b":{"c":5}}}');
    });

    /**
     * @tc.name   Json2Test112
     * @tc.number SUB_BUILTINS_Json2_TEST_11200
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date("2024-05-01T18:00:00+08:00");
      const jsonStr = JSON.stringify(date);
      expect(jsonStr).assertEqual('"2024-05-01T10:00:00.000Z"');
    });

    /**
     * @tc.name   Json2Test113
     * @tc.number SUB_BUILTINS_Json2_TEST_11300
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        num: number
      }

      const obj: Obj = { num: 123 };
      const jsonStr = JSON.stringify(obj, (k: string, v: number) => k === "num" ? `#${v}` : v);
      expect(jsonStr).assertEqual('{"num":"#123"}');
    });

    /**
     * @tc.name   Json2Test114
     * @tc.number SUB_BUILTINS_Json2_TEST_11400
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        m: number
      }

      const obj: Obj = { m: 30 };
      const jsonStr = JSON.stringify(obj, null, 10);
      const expected = "{\n          \"m\": 30\n}";
      expect(jsonStr).assertEqual(expected);
    });

    /**
     * @tc.name   Json2Test115
     * @tc.number SUB_BUILTINS_Json2_TEST_11500
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [undefined, 2, 3];
      const jsonStr = JSON.stringify(arr);
      expect(jsonStr).assertEqual("[null,2,3]");
    });

    /**
     * @tc.name   Json2Test116
     * @tc.number SUB_BUILTINS_Json2_TEST_11600
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[[1, "str"], 3], 4];
      const jsonStr = JSON.stringify(arr, (k, v: string) => typeof v === "string" ? undefined : v);
      expect(jsonStr).assertEqual("[[[1,null],3],4]");
    });

    /**
     * @tc.name   Json2Test117
     * @tc.number SUB_BUILTINS_Json2_TEST_11700
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        n: number
      }

      const obj: Obj = { n: 35 };
      const jsonStr = JSON.stringify(obj, null, "abc123");
      expect(jsonStr).assertEqual("{\nabc123\"n\": 35\n}");
    });

    /**
     * @tc.name   Json2Test118
     * @tc.number SUB_BUILTINS_Json2_TEST_11800
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface A {
        a: null,
        b: number
      }

      interface C {
        c: number
      }

      const arr = [{ a: null, b: 5 } as A, { c: 10 } as C];
      const jsonStr = JSON.stringify(arr);
      expect(jsonStr).assertEqual('[{"a":null,"b":5},{"c":10}]');
    });

    /**
     * @tc.name   Json2Test119
     * @tc.number SUB_BUILTINS_Json2_TEST_11900
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [0, 1, 2];
      const jsonStr = JSON.stringify(arr, (k, v: number) => Number(k) === 1 ? true : v);
      expect(jsonStr).assertEqual("[0,true,2]");
    });

    /**
     * @tc.name   Json2Test120
     * @tc.number SUB_BUILTINS_Json2_TEST_12000
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        p: number
      }

      const obj: Obj = { p: 40 };
      const jsonStr = JSON.stringify(obj, null, "\t-");
      expect(jsonStr).assertEqual("{\n\t-\"p\": 40\n}");
    });

    /**
     * @tc.name   Json2Test121
     * @tc.number SUB_BUILTINS_Json2_TEST_12100
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        line: string
      }

      const obj: Obj = { line: "first\nsecond" };
      const jsonStr = JSON.stringify(obj);
      expect(jsonStr).assertEqual('{"line":"first\\nsecond"}');
    });

    /**
     * @tc.name   Json2Test122
     * @tc.number SUB_BUILTINS_Json2_TEST_12200
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: A,
        d: number
      }

      interface A {
        b: number,
        c: number
      }

      const obj: Obj = { a: { b: 5, c: 6 } as A, d: 7 };
      const jsonStr = JSON.stringify(obj, (k: string, v: number) => k === "b" ? undefined : v);
      expect(jsonStr).assertEqual('{"a":{"c":6},"d":7}');
    });

    /**
     * @tc.name   Json2Test123
     * @tc.number SUB_BUILTINS_Json2_TEST_12300
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        name: string,
        age: number,
        score: number
      }

      const obj: Obj = { name: "王五", age: 28, score: 95.5 };
      const jsonStr = JSON.stringify(obj);
      expect(jsonStr).assertEqual('{"name":"王五","age":28,"score":95.5}');
    });

    /**
     * @tc.name   Json2Test124
     * @tc.number SUB_BUILTINS_Json2_TEST_12400
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        id: number,
        name: string,
        status: string
      }

      const obj: Obj = { id: 101, name: "Test", status: "active" };
      const jsonStr = JSON.stringify(obj, ["id", "status"], 4);
      expect(jsonStr).assertEqual("{\n    \"id\": 101,\n    \"status\": \"active\"\n}");
    });

    /**
     * @tc.name   Json2Test125
     * @tc.number SUB_BUILTINS_Json2_TEST_12500
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const strObj = new String("test");
      const jsonStr = JSON.stringify(strObj);
      expect(jsonStr).assertEqual('"test"');
    });

    /**
     * @tc.name   Json2Test126
     * @tc.number SUB_BUILTINS_Json2_TEST_12600
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        val: number
      }

      const obj: Obj = { val: 3 };
      const jsonStr = JSON.stringify(obj, (k: string, v: Obj) => k === "" ? [{ x: v.val }, { y: v.val * 2 }] : v);
      expect(jsonStr).assertEqual('[{"x":3},{"y":6}]');
    });

    /**
     * @tc.name   Json2Test127
     * @tc.number SUB_BUILTINS_Json2_TEST_12700
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        price: number,
        inStock: boolean
      }

      const obj: Obj = { price: 99.99, inStock: true };
      const jsonStr = JSON.stringify(obj);
      expect(jsonStr).assertEqual('{"price":99.99,"inStock":true}');
    });

    /**
     * @tc.name   Json2Test128
     * @tc.number SUB_BUILTINS_Json2_TEST_12800
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        id: number,
        name: string
      }

      interface Arr {
        user: Obj
      }

      const arr = [{ user: { id: 1, name: "A" } } as Arr, { user: { id: 2, name: "B" } } as Arr];
      const jsonStr = JSON.stringify(arr, ["user", "id"]);
      expect(jsonStr).assertEqual('[{"user":{"id":1}},{"user":{"id":2}}]');
    });

    /**
     * @tc.name   Json2Test129
     * @tc.number SUB_BUILTINS_Json2_TEST_12900
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        key: number
      }

      const obj: Obj = { key: 5 };
      const jsonStr = JSON.stringify(obj, null, 6);
      expect(jsonStr).assertEqual("{\n      \"key\": 5\n}");
    });

    /**
     * @tc.name   Json2Test130
     * @tc.number SUB_BUILTINS_Json2_TEST_13000
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        count: number
      }

      const obj: Obj = { count: 0 };
      const jsonStr = JSON.stringify(obj, (k: string, v: number) => k === "count" ? v > 0 : v);
      expect(jsonStr).assertEqual('{"count":false}');
    });

    /**
     * @tc.name   Json2Test131
     * @tc.number SUB_BUILTINS_Json2_TEST_13100
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        val: number
      }

      const obj: Obj = { val: 10 };
      const jsonStr = JSON.stringify(obj, null, "  *  ");
      expect(jsonStr).assertEqual("{\n  *  \"val\": 10\n}");
    });

    /**
     * @tc.name   Json2Test132
     * @tc.number SUB_BUILTINS_Json2_TEST_13200
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        data: number
      }

      const obj: Obj = { data: 15 };
      const jsonStr = JSON.stringify(obj, null, -1);
      expect(jsonStr).assertEqual('{"data":15}');
    });

    /**
     * @tc.name   Json2Test133
     * @tc.number SUB_BUILTINS_Json2_TEST_13300
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = ["old1", "old2", 3];
      const jsonStr = JSON.stringify(arr, (k, v: string) => typeof v === "string" ? "new" : v);
      expect(jsonStr).assertEqual('["new","new",3]');
    });

    /**
     * @tc.name   Json2Test134
     * @tc.number SUB_BUILTINS_Json2_TEST_13400
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: number,
        b: number
      }

      const obj: Obj = { a: 1, b: 2 };
      const jsonStr = JSON.stringify(obj, ["a", "a", "b"]);
      expect(jsonStr).assertEqual('{"a":1,"b":2}');
    });

    /**
     * @tc.name   Json2Test135
     * @tc.number SUB_BUILTINS_Json2_TEST_13500
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date("2024-03-15T12:34:56.123456Z");
      const jsonStr = JSON.stringify(date);
      expect(jsonStr).assertEqual('"2024-03-15T12:34:56.123Z"');
    });

    /**
     * @tc.name   Json2Test136
     * @tc.number SUB_BUILTINS_Json2_TEST_13600
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface XObj {
        y: number,
        z: number
      }

      interface Obj {
        x: XObj,
        w: number
      }

      const obj: Obj = { x: { y: 5, z: 6 }, w: 7 };
      const jsonStr = JSON.stringify(obj, (k: string, v: XObj | number) => k === "z" ? undefined : v);
      expect(jsonStr).assertEqual('{"x":{"y":5},"w":7}');
    });

    /**
     * @tc.name   Json2Test137
     * @tc.number SUB_BUILTINS_Json2_TEST_13700
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface bObj {
        b: number,
      }

      interface Obj {
        a: bObj,
      }

      const obj: Obj = { a: { b: 5 } };
      const jsonStr = JSON.stringify(obj, null, 10);
      const expected = "{\n          \"a\": {\n                    \"b\": 5\n          }\n}";
      expect(jsonStr).assertEqual(expected);
    });

    /**
     * @tc.name   Json2Test138
     * @tc.number SUB_BUILTINS_Json2_TEST_13800
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface bObj {
        str: string,
        num: number
      }

      interface Obj {
        nested: bObj
      }

      const arr = [{ nested: { str: "test", num: 5 } } as Obj];
      const jsonStr = JSON.stringify(arr, (k, v: string | number | bObj) => typeof v === "string" ? undefined : v);
      expect(jsonStr).assertEqual('[{"nested":{"num":5}}]');
    });

    /**
     * @tc.name   Json2Test139
     * @tc.number SUB_BUILTINS_Json2_TEST_13900
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        code: number
      }

      const obj: Obj = { code: 404 };
      const spaceStr = "~!@#$%^&*()_+";
      const jsonStr = JSON.stringify(obj, null, spaceStr);
      const expected = "{\n~!@#$%^&*(\"code\": 404\n}";
      expect(jsonStr).assertEqual(expected);
    });

    /**
     * @tc.name   Json2Test140
     * @tc.number SUB_BUILTINS_Json2_TEST_14000
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: A
      }

      interface A {
        b: null,
        c: C
      }

      interface C {
        d: number
      }

      const obj: Obj = { a: { b: null, c: { d: 5 } } };
      const jsonStr = JSON.stringify(obj);
      expect(jsonStr).assertEqual('{"a":{"b":null,"c":{"d":5}}}');
    });

    /**
     * @tc.name   Json2Test141
     * @tc.number SUB_BUILTINS_Json2_TEST_14100
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        num: number
      }

      const obj: Obj = { num: 2 };
      const jsonStr = JSON.stringify(obj, (k: string, v: Obj) => k === "" ? [v.num, v.num + 1] : v);
      expect(jsonStr).assertEqual("[2,3]");
    });

    /**
     * @tc.name   Json2Test142
     * @tc.number SUB_BUILTINS_Json2_TEST_14200
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        msg: string
      }

      const obj: Obj = { msg: "test" };
      const jsonStr = JSON.stringify(obj, null, "\t\t");
      expect(jsonStr).assertEqual("{\n\t\t\"msg\": \"test\"\n}");
    });

    /**
     * @tc.name   Json2Test143
     * @tc.number SUB_BUILTINS_Json2_TEST_14300
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        line: string
      }

      const obj: Obj = { line: "line1\rline2" };
      const jsonStr = JSON.stringify(obj);
      expect(jsonStr).assertEqual('{"line":"line1\\rline2"}');
    });

    /**
     * @tc.name   Json2Test144
     * @tc.number SUB_BUILTINS_Json2_TEST_14400
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, () => {
      }, 3];
      const jsonStr = JSON.stringify(arr, (k, v: number | Function) => typeof v === "function" ? undefined : v);
      expect(jsonStr).assertEqual("[1,null,3]");
    });

    /**
     * @tc.name   Json2Test145
     * @tc.number SUB_BUILTINS_Json2_TEST_14500
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        desc: string
      }

      const obj: Obj = { desc: "测试：中文符号，。！" };
      const jsonStr = JSON.stringify(obj);
      expect(jsonStr).assertEqual('{"desc":"测试：中文符号，。！"}');
    });

    /**
     * @tc.name   Json2Test146
     * @tc.number SUB_BUILTINS_Json2_TEST_14600
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        parent: Parent
      }

      interface Parent {
        child1: number,
        child2: number,
      }

      const obj: Obj = { parent: { child1: 10, child2: 20 } };
      const jsonStr = JSON.stringify(obj, ["parent", "child2"], "\t");
      expect(jsonStr).assertEqual("{\n\t\"parent\": {\n\t\t\"child2\": 20\n\t}\n}");
    });

    /**
     * @tc.name   Json2Test147
     * @tc.number SUB_BUILTINS_Json2_TEST_14700
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {

      const boolObj = new Boolean(false);
      const jsonStr = JSON.stringify(boolObj);
      expect(jsonStr).assertEqual("false");
    });

    /**
     * @tc.name   Json2Test148
     * @tc.number SUB_BUILTINS_Json2_TEST_14800
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        x: number
      }

      interface A {
        a: B
      }

      interface B {
        b: number
      }

      const obj: Obj = { x: 4 };
      const jsonStr = JSON.stringify(obj, (k, v: Obj) => k === "" ? { a: { b: v.x * 3 } } as A : v);
      expect(jsonStr).assertEqual('{"a":{"b":12}}');
    });

    /**
     * @tc.name   Json2Test149
     * @tc.number SUB_BUILTINS_Json2_TEST_14900
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        largeNum: number,
        smallNum: number
      }

      const obj: Obj = { largeNum: 1.23e5, smallNum: 4.5e-2 };
      const jsonStr = JSON.stringify(obj);
      expect(jsonStr).assertEqual('{"largeNum":123000,"smallNum":0.045}');
    });

    /**
     * @tc.name   Json2Test150
     * @tc.number SUB_BUILTINS_Json2_TEST_15000
     * @tc.desc   test Json stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json2Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        date: Date,
        name: string
      }

      const obj: Obj = { date: new Date("2024-01-01"), name: "Test" };
      const jsonStr = JSON.stringify(obj, ["date"]);
      expect(jsonStr).assertEqual('{"date":"2024-01-01T00:00:00.000Z"}');
    });
  })
}