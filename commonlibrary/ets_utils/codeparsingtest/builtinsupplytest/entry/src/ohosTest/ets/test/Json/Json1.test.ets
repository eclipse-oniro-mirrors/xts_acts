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

export default function Json1Test() {
  describe('Json1Test', () => {
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
     * @tc.name   Json1Test001
     * @tc.number SUB_BUILTINS_Json1_TEST_0100
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = "{}";
      const result: object = JSON.parse(jsonStr);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify({}));
    });
    /**
     * @tc.name   Json1Test002
     * @tc.number SUB_BUILTINS_Json1_TEST_0200
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = "true";
      const result: boolean = JSON.parse(jsonStr);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Json1Test003
     * @tc.number SUB_BUILTINS_Json1_TEST_0300
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '"typescript"';
      const result: string = JSON.parse(jsonStr);
      expect(result).assertEqual("typescript");
    });

    /**
     * @tc.name   Json1Test004
     * @tc.number SUB_BUILTINS_Json1_TEST_0400
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = "[10, 20, 30.5]";
      const result: number[] = JSON.parse(jsonStr);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([10, 20, 30.5]));
    });

    /**
     * @tc.name   Json1Test005
     * @tc.number SUB_BUILTINS_Json1_TEST_0500
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = "null";
      const result: null = JSON.parse(jsonStr);
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name   Json1Test006
     * @tc.number SUB_BUILTINS_Json1_TEST_0600
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Info {
        name: string;
        age: number
      }

      interface NestedData {
        id: number;
        info: Info
      }

      const jsonStr: string = '{"id": 1, "info": {"name": "Alice", "age": 25}}';
      const result: NestedData = JSON.parse(jsonStr);
      expect(result.id).assertEqual(1);
    });

    /**
     * @tc.name   Json1Test007
     * @tc.number SUB_BUILTINS_Json1_TEST_0700
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface NegNumData {
        negInt: number;
        negFloat: number;
      }

      const jsonStr: string = '{"negInt": -100, "negFloat": -15.7}';
      const result: NegNumData = JSON.parse(jsonStr);
      expect(result.negInt).assertEqual(-100);
    });

    /**
     * @tc.name   Json1Test008
     * @tc.number SUB_BUILTINS_Json1_TEST_0800
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '{"a":1, "b":{"c":2, "d":{"e":3}}}';
      const keys: string[] = [];
      JSON.parse(jsonStr, (key: string) => {
        keys.push(key);
        return key;
      });
      expect(JSON.stringify(keys)).assertEqual(JSON.stringify(["a", "c", "e", "d", "b", ""]));
    });

    /**
     * @tc.name   Json1Test009
     * @tc.number SUB_BUILTINS_Json1_TEST_0900
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = "[1, 2, 3, ]";
      let isSyntaxError: boolean = false;
      try {
        JSON.parse(jsonStr);
      } catch (error) {
        isSyntaxError = error instanceof SyntaxError;
      }
      expect(isSyntaxError).assertEqual(true);
    });

    /**
     * @tc.name   Json1Test010
     * @tc.number SUB_BUILTINS_Json1_TEST_1000
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '{"key": "value", }';
      let isSyntaxError: boolean = false;
      try {
        JSON.parse(jsonStr);
      } catch (error) {
        isSyntaxError = error instanceof SyntaxError;
      }
      expect(isSyntaxError).assertEqual(true);
    });

    /**
     * @tc.name   Json1Test011
     * @tc.number SUB_BUILTINS_Json1_TEST_1100
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '"line1\\nline2"';
      const result: string = JSON.parse(jsonStr);
      expect(result).assertEqual("line1\nline2");
    });

    /**
     * @tc.name   Json1Test012
     * @tc.number SUB_BUILTINS_Json1_TEST_1200
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = "[]";
      const result: never[] = JSON.parse(jsonStr);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
    });

    /**
     * @tc.name   Json1Test013
     * @tc.number SUB_BUILTINS_Json1_TEST_1300
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = "false";
      const result: boolean = JSON.parse(jsonStr);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Json1Test014
     * @tc.number SUB_BUILTINS_Json1_TEST_1400
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface ChineseData {
        title: string;
        content: string;
      }

      const jsonStr: string = '{"title": "测试"}';
      const result: ChineseData = JSON.parse(jsonStr);
      expect(result.title).assertEqual("测试");
    });

    /**
     * @tc.name   Json1Test015
     * @tc.number SUB_BUILTINS_Json1_TEST_1500
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = "123";
      const result: number = JSON.parse(jsonStr);
      expect(result).assertEqual(123);
    });

    /**
     * @tc.name   Json1Test016
     * @tc.number SUB_BUILTINS_Json1_TEST_1600
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface FloatData {
        price: number;
      }

      const jsonStr: string = '{"price": 99.99}';
      const result: FloatData = JSON.parse(jsonStr);
      expect(result.price).assertEqual(99.99);
    });

    /**
     * @tc.name   Json1Test017
     * @tc.number SUB_BUILTINS_Json1_TEST_1700
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = "[1, 2, 3, ]";
      let isSyntaxError: boolean = false;
      try {
        JSON.parse(jsonStr);
      } catch (e) {
        isSyntaxError = e instanceof SyntaxError;
      }
      expect(isSyntaxError).assertEqual(true);
    });

    /**
     * @tc.name   Json1Test018
     * @tc.number SUB_BUILTINS_Json1_TEST_1800
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = "false";
      const result: boolean = JSON.parse(jsonStr);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Json1Test019
     * @tc.number SUB_BUILTINS_Json1_TEST_1900
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface SciData {
        value: number;
      }

      const jsonStr: string = '{"value": 1.8e4}';
      const result: SciData = JSON.parse(jsonStr);
      expect(result.value).assertEqual(18000);
    });

    /**
     * @tc.name   Json1Test020
     * @tc.number SUB_BUILTINS_Json1_TEST_2000
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '[null, "a", "b"]';
      const result: (null | string)[] = JSON.parse(jsonStr);
      expect(result[0]).assertEqual(null);
    });

    /**
     * @tc.name   Json1Test021
     * @tc.number SUB_BUILTINS_Json1_TEST_2100
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '[-1, -3, -5]';
      const result: number[] = JSON.parse(jsonStr);
      expect(result[2]).assertEqual(-5);
    });

    /**
     * @tc.name   Json1Test022
     * @tc.number SUB_BUILTINS_Json1_TEST_2200
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '{key: "value"}';
      let isSyntaxError: boolean = false;
      try {
        JSON.parse(jsonStr);
      } catch (e) {
        isSyntaxError = e instanceof SyntaxError;
      }
      expect(isSyntaxError).assertEqual(true);
    });
    /**
     * @tc.name   Json1Test023
     * @tc.number SUB_BUILTINS_Json1_TEST_2300
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '"He said \\"JSON\\""';
      const result: string = JSON.parse(jsonStr);
      expect(result).assertEqual('He said "JSON"');
    });

    /**
     * @tc.name   Json1Test024
     * @tc.number SUB_BUILTINS_Json1_TEST_2400
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '[Infinity]';
      let isSyntaxError: boolean = false;
      try {
        JSON.parse(jsonStr);
      } catch (e) {
        isSyntaxError = e instanceof SyntaxError;
      }
      expect(isSyntaxError).assertEqual(true);
    });

    /**
     * @tc.name   Json1Test025
     * @tc.number SUB_BUILTINS_Json1_TEST_2500
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface LongNum {
        num: number;
      }

      const jsonStr: string = '{"num": 9007199254740991}';
      const result: LongNum = JSON.parse(jsonStr);
      expect(result.num).assertEqual(9007199254740991);
    });

    /**
     * @tc.name   Json1Test026
     * @tc.number SUB_BUILTINS_Json1_TEST_2600
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '{"a": 1 "b": 2}';
      let isSyntaxError: boolean = false;
      try {
        JSON.parse(jsonStr);
      } catch (e) {
        isSyntaxError = e instanceof SyntaxError;
      }
      expect(isSyntaxError).assertEqual(true);
    });

    /**
     * @tc.name   Json1Test027
     * @tc.number SUB_BUILTINS_Json1_TEST_2700
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface NoReturn {
        x?: number;
        y: number;
      }

      const jsonStr: string = '{"x": 10, "y": 20}';
      const result: NoReturn = JSON.parse(jsonStr, (k) => k === "x" ? undefined : k);
      expect(result.x).assertEqual(undefined);
    });

    /**
     * @tc.name   Json1Test028
     * @tc.number SUB_BUILTINS_Json1_TEST_2800
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Key {
        key: String
      }

      const jsonStr: string = '[{}, {"key": "val"}]';
      const result: (object | Key)[] = JSON.parse(jsonStr);
      expect(Object.keys(result[0]).length).assertEqual(0);
    });

    /**
     * @tc.name   Json1Test029
     * @tc.number SUB_BUILTINS_Json1_TEST_2900
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = "123";
      const result: number = JSON.parse(jsonStr, (k: string, v: number) => k === "" ? (v as number) + 77 : v);
      expect(result).assertEqual(200);
    });

    /**
     * @tc.name   Json1Test030
     * @tc.number SUB_BUILTINS_Json1_TEST_3000
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface ArrWithObj {
        id: number;
        name: string;
      }

      const jsonStr: string = '[{"id": 1, "name": "A"}, {"id": 2, "name": "B"}]';
      const result: ArrWithObj[] = JSON.parse(jsonStr);
      expect(result[1].name).assertEqual("B");
    });

    /**
     * @tc.name   Json1Test031
     * @tc.number SUB_BUILTINS_Json1_TEST_3100
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '[5, 10]';
      let isStrKey: boolean = true;
      JSON.parse(jsonStr, (k) => {
        if (k !== "" && typeof k !== "string") {
          isStrKey = false;
        }
        return k;
      });
      expect(isStrKey).assertEqual(true);
    });

    /**
     * @tc.name   Json1Test032
     * @tc.number SUB_BUILTINS_Json1_TEST_3200
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = "{'key': 'value'}";
      let isSyntaxError: boolean = false;
      try {
        JSON.parse(jsonStr);
      } catch (e) {
        isSyntaxError = e instanceof SyntaxError;
      }
      expect(isSyntaxError).assertEqual(true);
    });

    /**
     * @tc.name   Json1Test033
     * @tc.number SUB_BUILTINS_Json1_TEST_3300
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface ObjToArr {
        data: (number | string)[];
      }

      interface VObj {
        id: number | string,
        name: number | string
      }

      const jsonStr: string = '{"data": {"id": 1, "name": "test"}}';
      const result: ObjToArr = JSON.parse(jsonStr, (k: string, v: VObj) => k === "data" ? [v.id, v.name] : v);
      expect(result.data[0]).assertEqual(1);
    });

    /**
     * @tc.name   Json1Test034
     * @tc.number SUB_BUILTINS_Json1_TEST_3400
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '"C:\\\\Program Files"';
      const result: string = JSON.parse(jsonStr);
      expect(result).assertEqual("C:\\Program Files");
    });

    /**
     * @tc.name   Json1Test035
     * @tc.number SUB_BUILTINS_Json1_TEST_3500
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface ZeroVal {
        zero: number;
        negZero: number;
      }

      const jsonStr: string = '{"zero": 0, "negZero": -0}';
      const result: ZeroVal = JSON.parse(jsonStr);
      expect(result.zero).assertEqual(0);
    });

    /**
     * @tc.name   Json1Test036
     * @tc.number SUB_BUILTINS_Json1_TEST_3600
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '"col1\\tcol2\\tcol3"';
      const result: string = JSON.parse(jsonStr);
      expect(result).assertEqual("col1\tcol2\tcol3");
    });

    /**
     * @tc.name   Json1Test037
     * @tc.number SUB_BUILTINS_Json1_TEST_3700
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '{"a": {"b": 1}}';
      let lastKey: string = "";
      JSON.parse(jsonStr, (k) => {
        lastKey = k;
        return k;
      });
      expect(lastKey).assertEqual("");
    });

    /**
     * @tc.name   Json1Test038
     * @tc.number SUB_BUILTINS_Json1_TEST_3800
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '[-1.5, -2.5, -3.5]';
      const result: number[] = JSON.parse(jsonStr);
      expect(result[2]).assertEqual(-3.5);
    });

    /**
     * @tc.name   Json1Test039
     * @tc.number SUB_BUILTINS_Json1_TEST_3900
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface BoolToNum {
        success: number;
      }

      const jsonStr: string = '{"success": true}';
      const result: BoolToNum = JSON.parse(jsonStr, (k: string, v: number) => k === "success" ? (v ? 1 : 0) : v);
      expect(result.success).assertEqual(1);
    });

    /**
     * @tc.name   Json1Test040
     * @tc.number SUB_BUILTINS_Json1_TEST_4000
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface EmptyStr {
        str: string;
      }

      const jsonStr: string = '{"str": ""}';
      const result: EmptyStr = JSON.parse(jsonStr);
      expect(result.str).assertEqual("");
    });

    /**
     * @tc.name   Json1Test041
     * @tc.number SUB_BUILTINS_Json1_TEST_4100
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = "true";
      const result: boolean = JSON.parse(jsonStr);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Json1Test042
     * @tc.number SUB_BUILTINS_Json1_TEST_4200
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Level1 {
        level2: Level2
      }

      interface Level2 {
        level3: number,
      }

      interface DeepNested {
        level1: Level1
      }

      const jsonStr: string = '{"level1": {"level2": {"level3": 5}}}';
      const result: DeepNested = JSON.parse(jsonStr, (k: string, v: number) => k === "level3" ? (v as number) * 4 : v);
      expect(result.level1.level2.level3).assertEqual(20);
    });

    /**
     * @tc.name   Json1Test043
     * @tc.number SUB_BUILTINS_Json1_TEST_4300
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '"\\u4F60\\u597D"';
      const result: string = JSON.parse(jsonStr);
      expect(result).assertEqual("你好");
    });

    /**
     * @tc.name   Json1Test044
     * @tc.number SUB_BUILTINS_Json1_TEST_4400
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface InfStr {
        str: string;
      }

      const jsonStr: string = '{"str": "Infinity"}';
      const result: InfStr = JSON.parse(jsonStr);
      expect(result.str).assertEqual("Infinity");
    });

    /**
     * @tc.name   Json1Test045
     * @tc.number SUB_BUILTINS_Json1_TEST_4500
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '{"key": "value"';
      let isSyntaxError: boolean = false;
      try {
        JSON.parse(jsonStr);
      } catch (e) {
        isSyntaxError = e instanceof SyntaxError;
      }
      expect(isSyntaxError).assertEqual(true);
    });

    /**
     * @tc.name   Json1Test046
     * @tc.number SUB_BUILTINS_Json1_TEST_4600
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '[0, 0, 0]';
      const result: number[] = JSON.parse(jsonStr);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.name   Json1Test047
     * @tc.number SUB_BUILTINS_Json1_TEST_4700
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '"line1\\nline2\\nline3"';
      const result: string = JSON.parse(jsonStr);
      expect(result).assertEqual("line1\nline2\nline3");
    });

    /**
     * @tc.name   Json1Test048
     * @tc.number SUB_BUILTINS_Json1_TEST_4800
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface FuncStr {
        code: string;
      }

      const jsonStr: string = '{"code": "function() {}"}';
      const result: FuncStr = JSON.parse(jsonStr);
      expect(result.code).assertEqual("function() {}");
    });

    /**
     * @tc.name   Json1Test049
     * @tc.number SUB_BUILTINS_Json1_TEST_4900
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface ObjWithEmptyArr {
        list: never[];
      }

      const jsonStr: string = '{"list": []}';
      const result: ObjWithEmptyArr = JSON.parse(jsonStr);
      expect(result.list.length).assertEqual(0);
    });

    /**
     * @tc.name   Json1Test050
     * @tc.number SUB_BUILTINS_Json1_TEST_5000
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface NullVal {
        data: null;
      }

      const jsonStr: string = '{"data": null}';
      const result: NullVal = JSON.parse(jsonStr);
      expect(result.data).assertEqual(null);
    });
    /**
     * @tc.name   Json1Test051
     * @tc.number SUB_BUILTINS_Json1_TEST_5100
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '{"a": 1, "b": 2, }'; // 对象末尾多余逗号
      let isSyntaxError: boolean = false;
      try {
        JSON.parse(jsonStr);
      } catch (e) {
        isSyntaxError = e instanceof SyntaxError;
      }
      expect(isSyntaxError).assertEqual(true);
    });

    /**
     * @tc.name   Json1Test052
     * @tc.number SUB_BUILTINS_Json1_TEST_5200
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '"\\t\\n\\rtest"';
      const result: string = JSON.parse(jsonStr);
      expect(result).assertEqual("\t\n\rtest");
    });

    /**
     * @tc.name   Json1Test053
     * @tc.number SUB_BUILTINS_Json1_TEST_5300
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '{key: "value", num: 123}';
      let isSyntaxError: boolean = false;
      try {
        JSON.parse(jsonStr);
      } catch (e) {
        isSyntaxError = e instanceof SyntaxError;
      }
      expect(isSyntaxError).assertEqual(true);
    });

    /**
     * @tc.name   Json1Test054
     * @tc.number SUB_BUILTINS_Json1_TEST_5400
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '[[[1], [2]], [[3], [4]]]';
      const result: (number | number[] | number[][])[] = JSON.parse(jsonStr);
      expect(((result[1] as number[][])[0] as number[])[0]).assertEqual(3);
    });

    /**
     * @tc.name   Json1Test055
     * @tc.number SUB_BUILTINS_Json1_TEST_5500
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '"\\u263A\\u270C"';
      const result: string = JSON.parse(jsonStr);
      expect(result).assertEqual("☺✌");
    });

    /**
     * @tc.name   Json1Test056
     * @tc.number SUB_BUILTINS_Json1_TEST_5600
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface NaNStr {
        str: string;
      }

      const jsonStr: string = '{"str": "NaN"}';
      const result: NaNStr = JSON.parse(jsonStr);
      expect(result.str).assertEqual("NaN");
    });

    /**
     * @tc.name   Json1Test057
     * @tc.number SUB_BUILTINS_Json1_TEST_5700
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface B {}

      interface A {
        b: B
      }

      interface NestedEmptyObj {
        a: A
      }

      const jsonStr: string = '{"a": {"b": {}}}';
      const result: NestedEmptyObj = JSON.parse(jsonStr);
      expect(Object.keys(result.a.b).length).assertEqual(0);
    });

    /**
     * @tc.name   Json1Test058
     * @tc.number SUB_BUILTINS_Json1_TEST_5800
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '[1, 2, 3';
      let isSyntaxError: boolean = false;
      try {
        JSON.parse(jsonStr);
      } catch (e) {
        isSyntaxError = e instanceof SyntaxError;
      }
      expect(isSyntaxError).assertEqual(true);
    });

    /**
     * @tc.name   Json1Test059
     * @tc.number SUB_BUILTINS_Json1_TEST_5900
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '[-0, 0, -0]';
      const result: number[] = JSON.parse(jsonStr);
      expect(result[0]).assertEqual(-0);
    });

    /**
     * @tc.name   Json1Test060
     * @tc.number SUB_BUILTINS_Json1_TEST_6000
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '"line1\\rline2"';
      const result: string = JSON.parse(jsonStr);
      expect(result).assertEqual("line1\rline2");
    });

    /**
     * @tc.name   Json1Test061
     * @tc.number SUB_BUILTINS_Json1_TEST_6100
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '["function a(){}", "function b(){}"]';
      const result: string[] = JSON.parse(jsonStr);
      expect(result[1]).assertEqual("function b(){}");
    });

    /**
     * @tc.name   Json1Test062
     * @tc.number SUB_BUILTINS_Json1_TEST_6200
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '[1, [], [2, 3]]';
      const result: (number | number[])[] = JSON.parse(jsonStr);
      expect((result[1] as number[]).length).assertEqual(0);
    });

    /**
     * @tc.name   Json1Test063
     * @tc.number SUB_BUILTINS_Json1_TEST_6300
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface A {
        b: null
      }

      interface NestedNull {
        a: A;
      }

      const jsonStr: string = '{"a": {"b": null}}';
      const result: NestedNull = JSON.parse(jsonStr);
      expect(result.a.b).assertEqual(null);
    });

    /**
     * @tc.name   Json1Test064
     * @tc.number SUB_BUILTINS_Json1_TEST_6400
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '["a", "b", "c"]';
      let isAllStrIdx: boolean = true;
      JSON.parse(jsonStr, (k) => {
        if (k !== "" && isNaN(Number(k))) {
          isAllStrIdx = false;
        }
        return k;
      });
      expect(isAllStrIdx).assertEqual(true);
    });

    /**
     * @tc.name   Json1Test065
     * @tc.number SUB_BUILTINS_Json1_TEST_6500
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '"\\u4E2D\\u6587\\u6D4B\\u8BD5"'; // 中文测试
      const result: string = JSON.parse(jsonStr);
      expect(result).assertEqual("中文测试");
    });

    /**
     * @tc.name   Json1Test066
     * @tc.number SUB_BUILTINS_Json1_TEST_6600
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '"C:\\\\\\\\Users\\\\\\\\test"';
      const result: string = JSON.parse(jsonStr);
      expect(result).assertEqual(`C:\\\\Users\\\\test`);
    });

    /**
     * @tc.name   Json1Test067
     * @tc.number SUB_BUILTINS_Json1_TEST_6700
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '"line1\\u000bline2"';
      const result: string = JSON.parse(jsonStr);
      expect(result).assertEqual("line1\vline2");
    });

    /**
     * @tc.name   Json1Test068
     * @tc.number SUB_BUILTINS_Json1_TEST_6800
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface RegexStr {
        pattern: string;
      }

      const jsonStr: string = '{"pattern": "/^[a-z]+$/"}';
      const result: RegexStr = JSON.parse(jsonStr);
      expect(result.pattern).assertEqual("/^[a-z]+$/");
    });

    /**
     * @tc.name   Json1Test069
     * @tc.number SUB_BUILTINS_Json1_TEST_6900
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface A {
        b: never[]
      }

      interface ObjWithNestedEmptyArr {
        a: A;
      }

      const jsonStr: string = '{"a": {"b": []}}';
      const result: ObjWithNestedEmptyArr = JSON.parse(jsonStr);
      expect(result.a.b.length).assertEqual(0);
    });

    /**
     * @tc.name   Json1Test070
     * @tc.number SUB_BUILTINS_Json1_TEST_7000
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '[1, null, 3, null, 5]';
      const result: (number | null)[] = JSON.parse(jsonStr);
      expect(result[3]).assertEqual(null);
    });

    /**
     * @tc.name   Json1Test071
     * @tc.number SUB_BUILTINS_Json1_TEST_7100
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '"\\t\\u000b\\r\\ntest"';
      const result: string = JSON.parse(jsonStr);
      expect(result).assertEqual("\t\v\r\ntest");
    });

    /**
     * @tc.name   Json1Test072
     * @tc.number SUB_BUILTINS_Json1_TEST_7200
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '[1, 2, 3, 4, 5, 6]';
      const result: number[] = JSON.parse(jsonStr, (k: string, v: number[]) => {
        if (k === "") {
          return (v as number[]).filter(num => num % 2 === 0);
        }
        return v;
      });
      expect(result[1]).assertEqual(4);
    });

    /**
     * @tc.name   Json1Test073
     * @tc.number SUB_BUILTINS_Json1_TEST_7300
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface CurrencyStr {
        amount: string;
      }

      const jsonStr: string = '{"amount": 1234.56}';
      const result: CurrencyStr = JSON.parse(jsonStr, (k: string, v: number) => {
        if (k === "amount") {
          return `$${(v as number).toFixed(2)}`;
        }
        return v;
      });
      expect(result.amount).assertEqual("$1234.56");
    });

    /**
     * @tc.name   Json1Test074
     * @tc.number SUB_BUILTINS_Json1_TEST_7400
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface LongChineseStr {
        content: string;
      }

      const longContent: string = "这是一段用于测试JSON解析的超长中文字符串，包含多个汉字和标点符号。";
      const jsonStr: string = `{"content": "${longContent}"}`;
      const result: LongChineseStr = JSON.parse(jsonStr);

      expect(result.content).assertEqual(longContent);
    });

    /**
     * @tc.name   Json1Test075
     * @tc.number SUB_BUILTINS_Json1_TEST_7500
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        default: string
      }

      interface EmptyObjAddProp {
        obj: Obj;
      }

      const jsonStr: string = '{"obj": {}}';
      const result: EmptyObjAddProp = JSON.parse(jsonStr, (k: string, v: object) => {
        if (k === "obj" && Object.keys(v as object).length === 0) {
          return { default: "default-value" };
        }
        return v;
      });
      expect(result.obj.default).assertEqual("default-value");
    });

    /**
     * @tc.name   Json1Test076
     * @tc.number SUB_BUILTINS_Json1_TEST_7600
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '"He said: \'Hello!\'"';
      const result: string = JSON.parse(jsonStr);
      expect(result).assertEqual("He said: 'Hello!'");
    });

    /**
     * @tc.name   Json1Test077
     * @tc.number SUB_BUILTINS_Json1_TEST_7700
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '[3, 1, 2]';
      const result: number[] = JSON.parse(jsonStr, (k: string, v: number[]) => {
        if (k === "") {
          return (v as number[]).sort((a, b) => a - b);
        }
        return v;
      });
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.name   Json1Test078
     * @tc.number SUB_BUILTINS_Json1_TEST_7800
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '{user@id: "u123", price#tag: 99}';
      let isSyntaxError: boolean = false;
      try {
        JSON.parse(jsonStr);
      } catch (e) {
        isSyntaxError = e instanceof SyntaxError;
      }
      expect(isSyntaxError).assertEqual(true);
    });

    /**
     * @tc.name   Json1Test079
     * @tc.number SUB_BUILTINS_Json1_TEST_7900
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '[[[[[10], 20], 30], 40], 50]';
      const result: (number | number[] | number[][] | number[][][] | number[][][][])[] = JSON.parse(jsonStr);
      expect(((((result[0] as number[][][][])[0] as number[][][])[0] as number[][])[0] as number[])[0]).assertEqual(10);
    });

    /**
     * @tc.name   Json1Test080
     * @tc.number SUB_BUILTINS_Json1_TEST_8000
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '"\\u2603\\u2600"';
      const result: string = JSON.parse(jsonStr);
      expect(result).assertEqual("☃☀");
    });
    /**
     * @tc.name   Json1Test081
     * @tc.number SUB_BUILTINS_Json1_TEST_8100
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '["NaN", "123", "456"]';
      const result: string[] = JSON.parse(jsonStr);
      expect(result[0]).assertEqual("NaN");
    });

    /**
     * @tc.name   Json1Test082
     * @tc.number SUB_BUILTINS_Json1_TEST_8200
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '["-Infinity", "0", "Infinity"]';
      const result: string[] = JSON.parse(jsonStr);
      expect(result[0]).assertEqual("-Infinity");
    });

    /**
     * @tc.name   Json1Test083
     * @tc.number SUB_BUILTINS_Json1_TEST_8300
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '[[1, -0], [2, 3]]';
      const result: number[][] = JSON.parse(jsonStr);
      expect(result[0][1]).assertEqual(-0);
    });

    /**
     * @tc.name   Json1Test084
     * @tc.number SUB_BUILTINS_Json1_TEST_8400
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '"page1\\fpage2"';
      const result: string = JSON.parse(jsonStr);
      expect(result).assertEqual("page1\fpage2");
    });

    /**
     * @tc.name   Json1Test085
     * @tc.number SUB_BUILTINS_Json1_TEST_8500
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '[[], [1, []], [2, [3, []]]]';
      const result: number[][][] = JSON.parse(jsonStr);
      expect(result[1][1].length).assertEqual(0);
    });

    /**
     * @tc.name   Json1Test086
     * @tc.number SUB_BUILTINS_Json1_TEST_8600
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '"\\u5E26\\u7B26\\u53F7\\u7684\\u5B57\\u7B26\\u4E32：!@#"';
      const result: string = JSON.parse(jsonStr);
      expect(result).assertEqual("带符号的字符串：!@#");
    });

    /**
     * @tc.name   Json1Test087
     * @tc.number SUB_BUILTINS_Json1_TEST_8700
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '"He said: \\"\\\\test\\""';
      const result: string = JSON.parse(jsonStr);
      expect(result).assertEqual('He said: "\\test"');
    });

    /**
     * @tc.name   Json1Test088
     * @tc.number SUB_BUILTINS_Json1_TEST_8800
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '"test"';
      const result: string = JSON.parse(jsonStr);
      expect(result).assertEqual("test");
    });

    /**
     * @tc.name   Json1Test089
     * @tc.number SUB_BUILTINS_Json1_TEST_8900
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = "123";
      const result: number = JSON.parse(jsonStr);
      expect(result).assertEqual(123);
    });

    /**
     * @tc.name   Json1Test090
     * @tc.number SUB_BUILTINS_Json1_TEST_9000
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '"hello"';
      const result: string = JSON.parse(jsonStr, (k: string, v: string) => k === "" ? (v as string).toUpperCase() : v);
      expect(result).assertEqual("HELLO");
    });

    /**
     * @tc.name   Json1Test091
     * @tc.number SUB_BUILTINS_Json1_TEST_9100
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = "[1,2,3]";
      const result: number[] = JSON.parse(jsonStr);
      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.name   Json1Test092
     * @tc.number SUB_BUILTINS_Json1_TEST_9200
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = "3.14";
      const result: number = JSON.parse(jsonStr);
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.name   Json1Test093
     * @tc.number SUB_BUILTINS_Json1_TEST_9300
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = "3.14";
      const result: number = JSON.parse(jsonStr, (k: string, v: number) => k === "" ? Math.floor(v as number) : v);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   Json1Test094
     * @tc.number SUB_BUILTINS_Json1_TEST_9400
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = "-7";
      const result: number = JSON.parse(jsonStr);
      expect(result).assertEqual(-7);
    });

    /**
     * @tc.name   Json1Test095
     * @tc.number SUB_BUILTINS_Json1_TEST_9500
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '"a\\nb"';
      const result: string = JSON.parse(jsonStr);
      expect(result).assertEqual("a\nb");
    });

    /**
     * @tc.name   Json1Test096
     * @tc.number SUB_BUILTINS_Json1_TEST_9600
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '"a\\nb"';
      const result: string =
        JSON.parse(jsonStr, (k: string, v: string) => k === "" ? (v as string).replace("\n", " ") : v);
      expect(result).assertEqual("a b");
    });

    /**
     * @tc.name   Json1Test097
     * @tc.number SUB_BUILTINS_Json1_TEST_9700
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Result {
        k: number
      }

      const jsonStr: string = '[{"k":1}]';
      const result: Result[] = JSON.parse(jsonStr);
      expect(result[0].k).assertEqual(1);
    });

    /**
     * @tc.name   Json1Test098
     * @tc.number SUB_BUILTINS_Json1_TEST_9800
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = "1e3";
      const result: number = JSON.parse(jsonStr);
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.name   Json1Test099
     * @tc.number SUB_BUILTINS_Json1_TEST_9900
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = "1e3";
      const result: number = JSON.parse(jsonStr, (k: string, v: number) => k === "" ? (v as number) + 500 : v);
      expect(result).assertEqual(1500);
    });

    /**
     * @tc.name   Json1Test100
     * @tc.number SUB_BUILTINS_Json1_TEST_10000
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '"中文"';
      const result: string = JSON.parse(jsonStr, (k: string, v: string) => k === "" ? `pre-${v}` : v);
      expect(result).assertEqual("pre-中文");
    });

  })
}