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
import { ArkTSUtils, collections, lang} from '@kit.ArkTS';
function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

interface GeneratedObjectLiteralInterface_1 {
  y: number;
}

export default function Ason2Test() {
  describe('Ason2Test', () => {
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
      await sleep(30);
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_0100
     * @tc.name Ason2Test001
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        name: string,
        age: number
      }

      const obj: Obj = { name: "Alice", age: 25 };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"name":"Alice","age":25}');
    });
    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_0200
     * @tc.name Ason2Test002
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: number,
        b: number,
        c: number,
      }

      const obj: Obj = { a: 1, b: 2, c: 3 };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"a":1,"b":2,"c":3}');
    });
    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_0300
     * @tc.name Ason2Test003
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        x: number
      }

      const obj: Obj = { x: 10 };
      const jsonStr = ArkTSUtils.ASON.stringify([obj,null,2]);
      expect(jsonStr).assertEqual("[{\"x\":10},null,2]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_0400
     * @tc.name Ason2Test004
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const boolVal = true;
      const jsonStr = ArkTSUtils.ASON.stringify(boolVal);
      expect(jsonStr).assertEqual("true");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_0500
     * @tc.name Ason2Test005
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        str: string,
        num: number
      }

      const obj: Obj = { str: "test", num: 5 };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"str":"test","num":5}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_0600
     * @tc.name Ason2Test006
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        y: number
      }

      const obj: Obj = { y: 20 };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, null, "--"]);
      expect(jsonStr).assertEqual("[{\"y\":20},null,\"--\"]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_0700
     * @tc.name Ason2Test007
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const nullVal = null;
      const jsonStr = ArkTSUtils.ASON.stringify(nullVal);
      expect(jsonStr).assertEqual("null");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_0800
     * @tc.name Ason2Test008
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        z: number
      }

      const obj: Obj = { z: 30 };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, null, 15]);
      const expected = "[{\"z\":30},null,15]";
      expect(jsonStr).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_0900
     * @tc.name Ason2Test009
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, undefined, 3];
      const jsonStr = ArkTSUtils.ASON.stringify(arr);
      expect(jsonStr).assertEqual("[1,null,3]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_1000
     * @tc.name Ason2Test010
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let topKey = "1";
      let a = 1;
      ArkTSUtils.ASON.stringify(a);
      expect(topKey).assertEqual("1");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_1100
     * @tc.name Ason2Test011
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        m: number
      }

      const obj: Obj = { m: 5 };
      const spaceStr = "1234567890123";
      const jsonStr = ArkTSUtils.ASON.stringify([obj, null, spaceStr]);
      const expected = "[{\"m\":5},null,\"1234567890123\"]";
      expect(jsonStr).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_1200
     * @tc.name Ason2Test012
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: number
      }

      const obj: Obj = { a: 1 };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"a":1}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_1300
     * @tc.name Ason2Test013
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date("2024-01-01T00:00:00.000Z");
      const jsonStr = ArkTSUtils.ASON.stringify(date);
      expect(jsonStr).assertEqual('"2024-01-01T00:00:00.000Z"');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_1400
     * @tc.name Ason2Test014
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        p: number
      }

      const obj: Obj = { p: 15 };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, null, 0]);
      expect(jsonStr).assertEqual('[{"p":15},null,0]');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_1500
     * @tc.name Ason2Test015
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const nanVal = NaN;
      const jsonStr = ArkTSUtils.ASON.stringify(nanVal);
      expect(jsonStr).assertEqual("null");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_1600
     * @tc.name Ason2Test016
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: A
      }

      interface A {
        b: number,
        c: string
      }

      const obj: Obj = { a: { b: 2, c: "str" } };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"a":{"b":2,"c":"str"}}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_1700
     * @tc.name Ason2Test017
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const infVal = Infinity;
      const jsonStr = ArkTSUtils.ASON.stringify(infVal);
      expect(jsonStr).assertEqual("null");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_1800
     * @tc.name Ason2Test018
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        x: X
      }

      interface X {
        y: number
      }

      const obj: Obj = { x: { y: 3 } };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"x":{"y":3}}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_1900
     * @tc.name Ason2Test019
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, () => {
      }, 3];
      const jsonStr = ArkTSUtils.ASON.stringify(arr);
      expect(jsonStr).assertEqual("[1,null,3]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_2000
     * @tc.name Ason2Test020
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: number,
        b: number
      }

      const obj: Obj = { a: 1, b: 2 };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"a":1,"b":2}');
    });
    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_2100
     * @tc.name Ason2Test021
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const strObj = new String("test");
      const jsonStr = ArkTSUtils.ASON.stringify(strObj);
      expect(jsonStr).assertEqual('"test"');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_2200
     * @tc.name Ason2Test022
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: number,
        b: number,
      }

      const obj: Obj = { a: 1, b: 2 };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"a":1,"b":2}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_2300
     * @tc.name Ason2Test023
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const numObj = new Number(10);
      const jsonStr = ArkTSUtils.ASON.stringify(numObj);
      expect(jsonStr).assertEqual("10");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_2400
     * @tc.name Ason2Test024
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([["a", 1]]);
      const jsonStr = ArkTSUtils.ASON.stringify(map);
      expect(jsonStr).assertEqual("{\"a\":1}");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_2500
     * @tc.name Ason2Test025
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const jsonStr = ArkTSUtils.ASON.stringify([arr,1]);
      expect(jsonStr).assertEqual("[[1,2,3],1]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_2600
     * @tc.name Ason2Test026
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        num: number,
        flag: boolean
      }

      const obj: Obj = { num: -15, flag: true };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"num":-15,"flag":true}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_2700
     * @tc.name Ason2Test027
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        parent: Parent,
        other: number
      }

      interface Parent {
        child1: number,
        child2: number,
      }

      const obj: Obj = { parent: { child1: 10, child2: 20 }, other: 30 };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, ["parent", "child1"]]);
      expect(jsonStr).assertEqual('[{"parent":{"child1":10,"child2":20},"other":30},["parent","child1"]]');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_2800
     * @tc.name Ason2Test028
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: number
      }

      const obj: Obj = { a: 5 };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, null, "\t"]);
      expect(jsonStr).assertEqual("[{\"a\":5},null,\"\\t\"]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_2900
     * @tc.name Ason2Test029
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const boolObj = new Boolean(false);
      const jsonStr = ArkTSUtils.ASON.stringify(boolObj);
      expect(jsonStr).assertEqual("false");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_3000
     * @tc.name Ason2Test030
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        x: X
      }

      interface X {
        str: string,
        num: number
      }

      const obj: Obj = { x: { str: "test", num: 5 } };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"x":{"str":"test","num":5}}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_3100
     * @tc.name Ason2Test031
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        b: number
      }

      const obj: Obj = { b: 8 };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, null, "/* "]);
      expect(jsonStr).assertEqual("[{\"b\":8},null,\"/* \"]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_3200
     * @tc.name Ason2Test032
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {}

      const emptyObj: Obj = {};
      const jsonStr = ArkTSUtils.ASON.stringify(emptyObj);
      expect(jsonStr).assertEqual("{}");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_3300
     * @tc.name Ason2Test033
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [null, 2, 3];
      const jsonStr = ArkTSUtils.ASON.stringify(arr);
      expect(jsonStr).assertEqual("[null,2,3]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_3400
     * @tc.name Ason2Test034
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        c: number
      }

      const obj: Obj = { c: 12 };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, null, 1]);
      expect(jsonStr).assertEqual("[{\"c\":12},null,1]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_3500
     * @tc.name Ason2Test035
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        flag: number
      }

      const obj: Obj = { flag: 0 };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"flag":0}');

    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_3600
     * @tc.name Ason2Test036
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: number,
        b: number
      }

      const obj: Obj = { a: 1, b: 2 };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual("{\"a\":1,\"b\":2}");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_3700
     * @tc.name Ason2Test037
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date("2024-06-01T12:34:56+08:00");
      const jsonStr = ArkTSUtils.ASON.stringify(date);
      expect(jsonStr).assertEqual('"2024-06-01T04:34:56.000Z"');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_3800
     * @tc.name Ason2Test038
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let initialKey = "";
      ArkTSUtils.ASON.stringify([1, 2]);
      expect(initialKey).assertEqual("");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_3900
     * @tc.name Ason2Test039
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        d: number
      }

      const obj: Obj = { d: 15 };
      const jsonStr = ArkTSUtils.ASON.stringify([obj,null, "\n"]);
      expect(jsonStr).assertEqual("[{\"d\":15},null,\"\\n\"]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_4000
     * @tc.name Ason2Test040
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, NaN, 3];
      const jsonStr = ArkTSUtils.ASON.stringify(arr);
      expect(jsonStr).assertEqual("[1,null,3]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_4100
     * @tc.name Ason2Test041
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"a":{"b":{"c":"str","d":5}}}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_4200
     * @tc.name Ason2Test042
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [Infinity, 2, -Infinity];
      const jsonStr = ArkTSUtils.ASON.stringify(arr);
      expect(jsonStr).assertEqual("[null,2,null]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_4300
     * @tc.name Ason2Test043
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        num: string
      }

      const obj: Obj = { num: "5" };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"num":"5"}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_4400
     * @tc.name Ason2Test044
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [undefined, () => {
      }, 3];
      const jsonStr = ArkTSUtils.ASON.stringify(arr);
      expect(jsonStr).assertEqual("[null,null,3]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_4500
     * @tc.name Ason2Test045
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        x: number,
        y: number
      }

      const obj: Obj = { x: 10, y: 20 };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, null, 2]);
      expect(jsonStr).assertEqual("[{\"x\":10,\"y\":20},null,2]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_4600
     * @tc.name Ason2Test046
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        str: string
      }

      const obj: Obj = { str: "a\"b\nc" };
      const jsonStr =ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"str":"a\\"b\\nc"}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_4700
     * @tc.name Ason2Test047
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        num: number
      }

      const obj: Obj = { num: 5 };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"num":5}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_4800
     * @tc.name Ason2Test048
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const set = new Set([1, 2]);
      const jsonStr = ArkTSUtils.ASON.stringify(set);
      expect(jsonStr).assertEqual("[1,2]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_4900
     * @tc.name Ason2Test049
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const jsonStr = ArkTSUtils.ASON.stringify(arr);
      expect(jsonStr).assertEqual("[1,2,3]");
    });
`1`
    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_5000
     * @tc.name Ason2Test050
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        name: string,
        age: number
      }

      const obj: Obj = { name: "张三", age: 30 };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"name":"张三","age":30}');
    });
    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_5100
     * @tc.name Ason2Test051
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: number,
        b: number
      }

      const obj: Obj = { a: 1, b: 2 };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"a":1,"b":2}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_5200
     * @tc.name Ason2Test052
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        z: number
      }

      const obj: Obj = { z: 25 };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, null, 10]);
      const expected = "[{\"z\":25},null,10]";
      expect(jsonStr).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_5300
     * @tc.name Ason2Test053
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        pi: number,
        count: number
      }

      const obj: Obj = { pi: 3.14159, count: 10 };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"pi":3.14159,"count":10}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_5400
     * @tc.name Ason2Test054
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
      const jsonStr = ArkTSUtils.ASON.stringify([obj, ["a", "b", "d"]]);
      expect(jsonStr).assertEqual('[{"a":{"b":{"c":5,"d":6}},"e":7},["a","b","d"]]');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_5500
     * @tc.name Ason2Test055
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        x: number
      }

      const obj: Obj = { x: 8 };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, null, "-"]);
      expect(jsonStr).assertEqual("[{\"x\":8},null,\"-\"]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_5600
     * @tc.name Ason2Test056
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emptyArr: never[] = [];
      const jsonStr = ArkTSUtils.ASON.stringify(emptyArr);
      expect(jsonStr).assertEqual("[]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_5700
     * @tc.name Ason2Test057
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4];
      const jsonStr = ArkTSUtils.ASON.stringify(arr);
      expect(jsonStr).assertEqual("[1,2,3,4]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_5800
     * @tc.name Ason2Test058
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        y: number
      }

      const obj: Obj = { y: 12 };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, null, "  >"]);
      expect(jsonStr).assertEqual("[{\"y\":12},null,\"  >\"]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_5900
     * @tc.name Ason2Test059
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: undefined,
        b: number
      }

      const obj: Obj = { a: undefined, b: 5 };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"b":5}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_6000
     * @tc.name Ason2Test060
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        z: number
      }

      const obj: Obj = { z: 15 };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, null, -5]);
      expect(jsonStr).assertEqual('[{"z":15},null,-5]');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_6100
     * @tc.name Ason2Test061
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date("2024-01-01T00:00:00.123Z");
      const jsonStr = ArkTSUtils.ASON.stringify(date);
      expect(jsonStr).assertEqual('"2024-01-01T00:00:00.123Z"');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_6200
     * @tc.name Ason2Test062
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: number,
        b: number
      }

      const obj: Obj = { a: 1, b: 2 };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"a":1,"b":2}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_6300
     * @tc.name Ason2Test063
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        m: number
      }

      const obj: Obj = { m: 7 };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, null, 10]);
      const expected = "[{\"m\":7},null,10]"; // 10个空格
      expect(jsonStr).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_6400
     * @tc.name Ason2Test064
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        func: Function,
        val: number
      }

      const obj: Obj = {
        func: () => {
        }, val: 5
      };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"val":5}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_6500
     * @tc.name Ason2Test065
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface A {
        a: string,
        b: number
      }

      interface Obj {
        c: number
      }

      const arr = [{ a: "str", b: 5 } as A, { c: 10 } as Obj];
      const jsonStr = ArkTSUtils.ASON.stringify(arr);
      expect(jsonStr).assertEqual('[{"a":"str","b":5},{"c":10}]');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_6600
     * @tc.name Ason2Test066
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        n: number
      }

      const obj: Obj = { n: 9 };
      const spaceStr = "abcdefghijkl";
      const jsonStr = ArkTSUtils.ASON.stringify([obj, null, spaceStr]);
      const expected = "[{\"n\":9},null,\"abcdefghijkl\"]";
      expect(jsonStr).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_6700
     * @tc.name Ason2Test067
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: null,
        b: number
      }

      const obj: Obj = { a: null, b: 5 };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"a":null,"b":5}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_6800
     * @tc.name Ason2Test068
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        flag: number
      }

      const obj: Obj = { flag: 1 };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"flag":1}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_6900
     * @tc.name Ason2Test069
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        key: string
      }

      const weakMap = new WeakMap([[{ key: "val" } as Obj, 10]]);
      const jsonStr = ArkTSUtils.ASON.stringify(weakMap); // WeakMap无默认可枚举属性
      expect(jsonStr).assertEqual("{}");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_7000
     * @tc.name Ason2Test070
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        p: number
      }

      const obj: Obj = { p: 11 };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, null, "\t "]);
      expect(jsonStr).assertEqual("[{\"p\":11},null,\"\\t \"]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_7100
     * @tc.name Ason2Test071
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = ["a\\b", "c'd"];
      const jsonStr = ArkTSUtils.ASON.stringify(arr);
      expect(jsonStr).assertEqual('["a\\\\b","c\'d"]');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_7200
     * @tc.name Ason2Test072
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4];
      const jsonStr = ArkTSUtils.ASON.stringify(arr);
      expect(jsonStr).assertEqual("[1,2,3,4]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_7300
     * @tc.name Ason2Test073
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = ["张三", "李四", 25];
      const jsonStr = ArkTSUtils.ASON.stringify(arr);
      expect(jsonStr).assertEqual('["张三","李四",25]');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_7400
     * @tc.name Ason2Test074
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: number,
        b: number,
        c: number
      }

      const obj: Obj = { a: 1, b: 2, c: 3 };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, ["a", "c"], 2]);
      expect(jsonStr).assertEqual("[{\"a\":1,\"b\":2,\"c\":3},[\"a\",\"c\"],2]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_7500
     * @tc.name Ason2Test075
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const numObj = new Number(0);
      const jsonStr = ArkTSUtils.ASON.stringify(numObj);
      expect(jsonStr).assertEqual("0");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_7600
     * @tc.name Ason2Test076
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        x: number
      }

      interface Z {
        z: number
      }

      const obj: Obj = { x: 5 };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"x":5}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_7700
     * @tc.name Ason2Test077
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        temp: number,
        status: string
      }

      const obj: Obj = { temp: -12.5, status: "ok" };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"temp":-12.5,"status":"ok"}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_7800
     * @tc.name Ason2Test078
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        id: number,
        name: string
      }

      const arr = [{ id: 1, name: "A" } as Obj, { id: 2, name: "B" } as Obj];
      const jsonStr = ArkTSUtils.ASON.stringify([arr, ["id"]]);
      expect(jsonStr).assertEqual('[[{"id":1,"name":"A"},{"id":2,"name":"B"}],["id"]]');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_7900
     * @tc.name Ason2Test079
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        key: string
      }

      const obj: Obj = { key: "val" };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, null, "||"]);
      expect(jsonStr).assertEqual("[{\"key\":\"val\"},null,\"||\"]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_8000
     * @tc.name Ason2Test080
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const undefVal = undefined;
      const jsonStr = ArkTSUtils.ASON.stringify(undefVal);
      expect(jsonStr).assertEqual(undefined);
    });
    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_8100
     * @tc.name Ason2Test081
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        count: number
      }

      const obj: Obj = { count: 100 };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"count":100}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_8200
     * @tc.name Ason2Test082
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        num: number
      }

      const obj: Obj = { num: 7 };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, null, 5]);
      expect(jsonStr).assertEqual("[{\"num\":7},null,5]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_8300
     * @tc.name Ason2Test083
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        data: string
      }

      const obj: Obj = { data: "test" };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, null, "  - "]);
      expect(jsonStr).assertEqual("[{\"data\":\"test\"},null,\"  - \"]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_8400
     * @tc.name Ason2Test084
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [["str1", 5], ["str2", 10]];
      const jsonStr = ArkTSUtils.ASON.stringify(arr);
      expect(jsonStr).assertEqual("[[\"str1\",5],[\"str2\",10]]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_8500
     * @tc.name Ason2Test085
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: A
      }

      interface A {
        b: number
      }

      const obj: Obj = { a: { b: 5 } as A };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, ["a", "c"]]);
      expect(jsonStr).assertEqual('[{"a":{"b":5}},["a","c"]]');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_8600
     * @tc.name Ason2Test086
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date("2024-02-29T00:00:00.000Z");
      const jsonStr = ArkTSUtils.ASON.stringify(date);
      expect(jsonStr).assertEqual('"2024-02-29T00:00:00.000Z"');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_8700
     * @tc.name Ason2Test087
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: number,
        b: number
      }

      const obj: Obj = { a: 1, b: 2 };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"a":1,"b":2}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_8800
     * @tc.name Ason2Test088
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        val: number
      }

      const obj: Obj = { val: 3 };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, null, 11]);
      const expected = "[{\"val\":3},null,11]";
      expect(jsonStr).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_8900
     * @tc.name Ason2Test089
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [() => {
      }, 2, 3];
      const jsonStr = ArkTSUtils.ASON.stringify(arr);
      expect(jsonStr).assertEqual("[null,2,3]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_9000
     * @tc.name Ason2Test090
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Z {
        z: number
      }

      interface X {
        x: string,
        y: number
      }

      const arr = [{ x: "str", y: 5 } as X, { z: 10 } as Z];
      const jsonStr = ArkTSUtils.ASON.stringify(arr);
      expect(jsonStr).assertEqual('[{"x":"str","y":5},{"z":10}]');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_9100
     * @tc.name Ason2Test091
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3n];
      let isErr = false;
      try {
        ArkTSUtils.ASON.stringify(arr);
      } catch (e) {
        isErr = e instanceof TypeError;
      }
      expect(isErr).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_9200
     * @tc.name Ason2Test092
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        code: number
      }

      const obj = { code: 123 } as Obj;
      const spaceStr = "01234567890";
      const jsonStr = ArkTSUtils.ASON.stringify([obj, null, spaceStr]);
      const expected = "[{\"code\":123},null,\"01234567890\"]";
      expect(jsonStr).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_9300
     * @tc.name Ason2Test093
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, [null, 3], 5];
      const jsonStr = ArkTSUtils.ASON.stringify(arr);
      expect(jsonStr).assertEqual("[1,[null,3],5]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_9400
     * @tc.name Ason2Test094
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        isActive: number
      }
      const obj: Obj = { isActive: 0 };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"isActive":0}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_9500
     * @tc.name Ason2Test095
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        item: string
      }

      const weakSet = new WeakSet([{ item: "val" } as Obj]);
      const jsonStr = ArkTSUtils.ASON.stringify(weakSet); // WeakSet无默认可枚举属性
      expect(jsonStr).assertEqual("{}");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_9600
     * @tc.name Ason2Test096
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const jsonStr = ArkTSUtils.ASON.stringify(arr);
      expect(jsonStr).assertEqual('[1,2,3]');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_9700
     * @tc.name Ason2Test097
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        quote: string
      }

      const obj: Obj = { quote: 'He said "hi"' };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"quote":"He said \\"hi\\""}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_9800
     * @tc.name Ason2Test098
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [10, 20, 30];
      const jsonStr = ArkTSUtils.ASON.stringify(arr);
      expect(jsonStr).assertEqual("[10,20,30]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_9900
     * @tc.name Ason2Test099
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        symbol: string
      }

      const obj: Obj = { symbol: "!@#$%^" };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"symbol":"!@#$%^"}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_10000
     * @tc.name Ason2Test100
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        name: string,
        age: number,
        city: string
      }

      const obj: Obj = { name: "Bob", age: 30, city: "NY" };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, ["name", "city"], "\t"]);
      expect(jsonStr).assertEqual("[{\"name\":\"Bob\",\"age\":30,\"city\":\"NY\"},[\"name\",\"city\"],\"\\t\"]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_10100
     * @tc.name Ason2Test101
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const boolObj = new Boolean(true);
      const jsonStr = ArkTSUtils.ASON.stringify(boolObj);
      expect(jsonStr).assertEqual("true");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_10200
     * @tc.name Ason2Test102
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        num: number
      }

      const obj: Obj = { num: 4 };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual("{\"num\":4}");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_10300
     * @tc.name Ason2Test103
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        count: number,
        active: boolean
      }

      const obj: Obj = { count: 100, active: true };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"count":100,"active":true}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_10400
     * @tc.name Ason2Test104
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        list: Array<number>,
        info: string
      }

      const obj: Obj = { list: [1, 2, 3], info: "test" };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, ["list"]]);
      expect(jsonStr).assertEqual('[{"list":[1,2,3],"info":"test"},["list"]]');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_10500
     * @tc.name Ason2Test105
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        x: number
      }

      const obj: Obj = { x: 15 };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, null, 3]);
      expect(jsonStr).assertEqual("[{\"x\":15},null,3]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_10600
     * @tc.name Ason2Test106
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const func = () => {
      };
      const jsonStr = ArkTSUtils.ASON.stringify(func);
      expect(jsonStr).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_10700
     * @tc.name Ason2Test107
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        text: string
      }

      const obj: Obj = { text: "hello" };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"text":"hello"}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_10800
     * @tc.name Ason2Test108
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        y: number
      }
      const obj: Obj = { y: 20 };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, null, "->"]);
      expect(jsonStr).assertEqual("[{\"y\":20},null,\"->\"]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_10900
     * @tc.name Ason2Test109
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        z: number
      }
      const obj: Obj = { z: 25 };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, null, 0]);
      expect(jsonStr).assertEqual('[{"z":25},null,0]');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_11000
     * @tc.name Ason2Test110
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, null, 3];
      const jsonStr = ArkTSUtils.ASON.stringify(arr);
      expect(jsonStr).assertEqual("[1,null,3]");
    });
    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_11100
     * @tc.name Ason2Test111
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
      const jsonStr = ArkTSUtils.ASON.stringify([obj, ["a", "b", "c"]]);
      expect(jsonStr).assertEqual('[{"a":{"b":{"c":5,"d":6},"e":7}},["a","b","c"]]');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_11200
     * @tc.name Ason2Test112
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date("2024-05-01T18:00:00+08:00");
      const jsonStr = ArkTSUtils.ASON.stringify(date);
      expect(jsonStr).assertEqual('"2024-05-01T10:00:00.000Z"');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_11300
     * @tc.name Ason2Test113
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        num: number
      }
      const obj: Obj = { num: 123 };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"num":123}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_11400
     * @tc.name Ason2Test114
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        m: number
      }
      const obj: Obj = { m: 30 };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, null, 10]);
      const expected = "[{\"m\":30},null,10]";
      expect(jsonStr).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_11500
     * @tc.name Ason2Test115
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [undefined, 2, 3];
      const jsonStr = ArkTSUtils.ASON.stringify(arr);
      expect(jsonStr).assertEqual("[null,2,3]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_11600
     * @tc.name Ason2Test116
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[[1, "str"], 3], 4];
      const jsonStr = ArkTSUtils.ASON.stringify(arr);
      expect(jsonStr).assertEqual("[[[1,\"str\"],3],4]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_11700
     * @tc.name Ason2Test117
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        n: number
      }
      const obj: Obj = { n: 35 };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, null, "abc123"]);
      expect(jsonStr).assertEqual("[{\"n\":35},null,\"abc123\"]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_11800
     * @tc.name Ason2Test118
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface A {
        a: null,
        b: number
      }

      interface C {
        c: number
      }

      const arr = [{ a: null, b: 5 } as A, { c: 10 } as C];
      const jsonStr = ArkTSUtils.ASON.stringify(arr);
      expect(jsonStr).assertEqual('[{"a":null,"b":5},{"c":10}]');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_11900
     * @tc.name Ason2Test119
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [0, 1, 2];
      const jsonStr = ArkTSUtils.ASON.stringify(arr);
      expect(jsonStr).assertEqual("[0,1,2]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_12000
     * @tc.name Ason2Test120
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        p: number
      }

      const obj: Obj = { p: 40 };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, null, "\t-"]);
      expect(jsonStr).assertEqual("[{\"p\":40},null,\"\\t-\"]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_12100
     * @tc.name Ason2Test121
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        line: string
      }

      const obj: Obj = { line: "first\nsecond" };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"line":"first\\nsecond"}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_12200
     * @tc.name Ason2Test122
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: A,
        d: number
      }
      interface A {
        b: number,
        c: number
      }
      const obj: Obj = { a: { b: 5, c: 6 } as A, d: 7 };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"a":{"b":5,"c":6},"d":7}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_12300
     * @tc.name Ason2Test123
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        name: string,
        age: number,
        score: number
      }
      const obj: Obj = { name: "王五", age: 28, score: 95.5 };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"name":"王五","age":28,"score":95.5}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_12400
     * @tc.name Ason2Test124
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        id: number,
        name: string,
        status: string
      }

      const obj: Obj = { id: 101, name: "Test", status: "active" };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, ["id", "status"], 4]);
      expect(jsonStr).assertEqual("[{\"id\":101,\"name\":\"Test\",\"status\":\"active\"},[\"id\",\"status\"],4]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_12500
     * @tc.name Ason2Test125
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const strObj = new String("test");
      const jsonStr = ArkTSUtils.ASON.stringify(strObj);
      expect(jsonStr).assertEqual('"test"');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_12600
     * @tc.name Ason2Test126
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        val: number
      }

      const obj: Obj = { val: 3 };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"val":3}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_12700
     * @tc.name Ason2Test127
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        price: number,
        inStock: boolean
      }

      const obj: Obj = { price: 99.99, inStock: true };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"price":99.99,"inStock":true}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_12800
     * @tc.name Ason2Test128
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        id: number,
        name: string
      }

      interface Arr {
        user: Obj
      }

      const arr = [{ user: { id: 1, name: "A" } } as Arr, { user: { id: 2, name: "B" } } as Arr];
      const jsonStr = ArkTSUtils.ASON.stringify([arr, ["user", "id"]]);
      expect(jsonStr).assertEqual('[[{"user":{"id":1,"name":"A"}},{"user":{"id":2,"name":"B"}}],["user","id"]]');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_12900
     * @tc.name Ason2Test129
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        key: number
      }

      const obj: Obj = { key: 5 };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, null, 6]);
      expect(jsonStr).assertEqual("[{\"key\":5},null,6]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_13000
     * @tc.name Ason2Test130
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        count: number
      }

      const obj: Obj = { count: 0 };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"count":0}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_13100
     * @tc.name Ason2Test131
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        val: number
      }

      const obj: Obj = { val: 10 };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, null, "  *  "]);
      expect(jsonStr).assertEqual("[{\"val\":10},null,\"  *  \"]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_13200
     * @tc.name Ason2Test132
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        data: number
      }

      const obj: Obj = { data: 15 };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, null, -1]);
      expect(jsonStr).assertEqual('[{"data":15},null,-1]');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_13300
     * @tc.name Ason2Test133
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = ["old1", "old2", 3];
      const jsonStr = ArkTSUtils.ASON.stringify(arr);
      expect(jsonStr).assertEqual('["old1","old2",3]');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_13400
     * @tc.name Ason2Test134
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        a: number,
        b: number
      }

      const obj: Obj = { a: 1, b: 2 };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, ["a", "a", "b"]]);
      expect(jsonStr).assertEqual('[{"a":1,"b":2},["a","a","b"]]');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_13500
     * @tc.name Ason2Test135
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date("2024-03-15T12:34:56.123456Z");
      const jsonStr = ArkTSUtils.ASON.stringify(date);
      expect(jsonStr).assertEqual('"2024-03-15T12:34:56.123Z"');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_13600
     * @tc.name Ason2Test136
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface XObj {
        y: number,
        z: number
      }

      interface Obj {
        x: XObj,
        w: number
      }

      const obj: Obj = { x: { y: 5, z: 6 }, w: 7 };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"x":{"y":5,"z":6},"w":7}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_13700
     * @tc.name Ason2Test137
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface bObj {
        b: number,
      }

      interface Obj {
        a: bObj,
      }

      const obj: Obj = { a: { b: 5 } };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, null, 10]);
      const expected = "{\n          \"a\": {\n                    \"b\": 5\n          }\n}";
      expect(jsonStr).assertEqual('[{"a":{"b":5}},null,10]');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_13800
     * @tc.name Ason2Test138
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface bObj {
        str: string,
        num: number
      }

      interface Obj {
        nested: bObj
      }

      const arr = [{ nested: { str: "test", num: 5 } } as Obj];
      const jsonStr = ArkTSUtils.ASON.stringify(arr);
      expect(jsonStr).assertEqual('[{"nested":{"str":"test","num":5}}]');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_13900
     * @tc.name Ason2Test139
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        code: number
      }

      const obj: Obj = { code: 404 };
      const spaceStr = "~!@#$%^&*()_+";
      const jsonStr = ArkTSUtils.ASON.stringify([obj, null, spaceStr]);
      const expected = "{\n~!@#$%^&*(\"code\": 404\n}";
      expect(jsonStr).assertEqual('[{"code":404},null,"~!@#$%^&*()_+"]');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_14000
     * @tc.name Ason2Test140
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"a":{"b":null,"c":{"d":5}}}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_14100
     * @tc.name Ason2Test141
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        num: number
      }
      const obj: Obj = { num: 2 };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual("{\"num\":2}");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_14200
     * @tc.name Ason2Test142
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        msg: string
      }

      const obj: Obj = { msg: "test" };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, null, "\t\t"]);
      expect(jsonStr).assertEqual("[{\"msg\":\"test\"},null,\"\\t\\t\"]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_14300
     * @tc.name Ason2Test143
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        line: string
      }

      const obj: Obj = { line: "line1\rline2" };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"line":"line1\\rline2"}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_14400
     * @tc.name Ason2Test144
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, () => {
      }, 3];
      const jsonStr = ArkTSUtils.ASON.stringify(arr);
      expect(jsonStr).assertEqual("[1,null,3]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_14500
     * @tc.name Ason2Test145
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        desc: string
      }

      const obj: Obj = { desc: "测试：中文符号，。！" };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"desc":"测试：中文符号，。！"}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_14600
     * @tc.name Ason2Test146
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        parent: Parent
      }

      interface Parent {
        child1: number,
        child2: number,
      }

      const obj: Obj = { parent: { child1: 10, child2: 20 } };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, ["parent", "child2"], "\t"]);
      expect(jsonStr).assertEqual("[{\"parent\":{\"child1\":10,\"child2\":20}},[\"parent\",\"child2\"],\"\\t\"]");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_14700
     * @tc.name Ason2Test147
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {

      const boolObj = new Boolean(false);
      const jsonStr = ArkTSUtils.ASON.stringify(boolObj);
      expect(jsonStr).assertEqual("false");
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_14800
     * @tc.name Ason2Test148
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"x":4}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_14900
     * @tc.name Ason2Test149
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        largeNum: number,
        smallNum: number
      }

      const obj: Obj = { largeNum: 1.23e5, smallNum: 4.5e-2 };
      const jsonStr = ArkTSUtils.ASON.stringify(obj);
      expect(jsonStr).assertEqual('{"largeNum":123000,"smallNum":0.045}');
    });

    /**
     * @tc.number SUB_BUILTINS_Ason2_TEST_15000
     * @tc.name Ason2Test150
     * @tc.desc test Ason stringify()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason2Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        date: Date,
        name: string
      }

      const obj: Obj = { date: new Date("2024-01-01"), name: "Test" };
      const jsonStr = ArkTSUtils.ASON.stringify([obj, ["date"]]);
      expect(jsonStr).assertEqual('[{"date":"2024-01-01T00:00:00.000Z","name":"Test"},["date"]]');
    });
  })
}