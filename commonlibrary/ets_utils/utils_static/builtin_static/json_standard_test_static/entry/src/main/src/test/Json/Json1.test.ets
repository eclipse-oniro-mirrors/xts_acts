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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';

class test001 {
}

class Info006 {
  name: string = '';
  age: number;
}

class NestedData006 {
  id: number;
  info: Info006 = { name: '', age: 1 };
}

class NegNumData007 {
  negInt: number;
  negFloat: number;
}

class ChineseData014 {
  title: string = '';
  content: string = '';
}

class FloatData016 {
  price: number;
}

class SciData019 {
  value: number;
}

class LongNum025 {
  num: number;
}

class NoReturn027 {
  x?: number;
  y: number;
}

class Key028 {
  key: String = '';
}

class ArrWithObj030 {
  id: number;
  name: string = '';
}

class ObjToArr033 {
  data: (number | string)[] = [];
}

class VObj033 {
  id: number | string = 1;
  name: number | string = 1;
}

class ZeroVal035 {
  zero: number;
  negZero: number;
}

class BoolToNum039 {
  success: number;
}

class EmptyStr040 {
  str: string = '';
}

class Level1042 {
  level2: Level2042 = { level3: 1 };
}

class Level2042 {
  level3: number;
}

class DeepNested042 {
  level1: Level1042 = { level2: { level3: 1 } };
}

class InfStr044 {
  str: string = '';
}

class FuncStr048 {
  code: string = '';
}

class ObjWithEmptyArr049 {
  list: never[] = [];
}

class NullVal050 {
  data: null;
}

class NaNStr056 {
  str: string = '';
}

class A063 {
  b: null;
}

class NestedNull063 {
  a: A063 = { b: null };
}

class RegexStr068 {
  pattern: string = '';
}

class A069 {
  b: never[] = [];
}

class ObjWithNestedEmptyArr069 {
  a: A069 = { b: [] };
}

class CurrencyStr073 {
  amount: string = '';
}

class LongChineseStr074 {
  content: string = '';
}

class Result097 {
  k: number;
}

class test008_2 {
  e: number;
}

class test008_1 {
  c: number;
  d: test008_2 = { e: 1 };
}

class test008 {
  a: number;
  b: test008_1 = { c: 1, d: { e: 1 } };
}

class test037_1 {
  b: number;
}

class test037 {
  a: test037_1 = { b: 1 };
}

export default function Json1Test() {
  describe('Json1Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
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
     * @tc.name   Json1Test001
     * @tc.number SUB_BUILTINS_Json1_TEST_0100
     * @tc.desc   test Json parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Json1Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = "{}";
      let typ: Type = Type.of(new Object());
      const result: object = JSON.parse<object>(jsonStr, typ) as object;
      expect(JSON.stringify(result)).assertEqual(JSON.stringify({} as test001));
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
      let typ: Type = Type.of(new Boolean());
      const result: boolean = JSON.parse<boolean>(jsonStr, typ) as boolean;
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
      let typ: Type = Type.of(new String());
      const result: string = JSON.parse<string>(jsonStr, typ) as string;
      expect(result).assertEqual("typescript");
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
      let typ: Type = Type.of(null);
      const result: null = JSON.parse<null>(jsonStr, typ) as null;
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
      const jsonStr: string = '{"id": 1, "info": {"name": "Alice", "age": 25}}';
      let typ: Type = Type.of(new NestedData006());
      const result: NestedData006 = JSON.parse<NestedData006>(jsonStr, typ) as NestedData006;
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
      let typ: Type = Type.of(new NegNumData007());
      const jsonStr: string = '{"negInt": -100, "negFloat": -15.7}';
      const result: NegNumData007 = JSON.parse<NegNumData007>(jsonStr, typ) as NegNumData007;
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
      let typ: Type = Type.of(new test008());
      JSON.parse<test008>(jsonStr, (key: string, v: Any) => {
        keys.push(key);
        return v;
      }, typ) as test008;
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
      let typ: Type = Type.of(new String());
      try {
        JSON.parse<string>(jsonStr, typ) as string;
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
      let typ: Type = Type.of(new String());
      try {
        JSON.parse<string>(jsonStr, typ) as string;
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
      let typ: Type = Type.of(new String());
      const result: string = JSON.parse<string>(jsonStr, typ) as string;
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
      const result: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);
      expect(result.asArray().length).assertEqual(0);
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
      let typ: Type = Type.of(new Boolean());
      const result: boolean = JSON.parse<boolean>(jsonStr, typ) as boolean;
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
      const jsonStr: string = '{"title": "测试", "content": ""}';
      let typ: Type = Type.of(new ChineseData014());
      const result: ChineseData014 = JSON.parse<ChineseData014>(jsonStr, typ) as ChineseData014;
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
      let typ: Type = Type.of(new Number());
      const result: number = JSON.parse<number>(jsonStr, typ) as number;
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
      const jsonStr: string = '{"price": 99.99}';
      let typ: Type = Type.of(new FloatData016());
      const result: FloatData016 = JSON.parse<FloatData016>(jsonStr, typ) as FloatData016;
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
      let typ: Type = Type.of(new String());
      try {
        JSON.parse<string>(jsonStr, typ) as string;
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
      let typ: Type = Type.of(new Boolean());
      const result: boolean = JSON.parse<boolean>(jsonStr, typ) as boolean;
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
      const jsonStr: string = '{"value": 1.8e4}';
      let typ: Type = Type.of(new SciData019());
      const result: SciData019 = JSON.parse<SciData019>(jsonStr, typ) as SciData019;
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
      const result: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);
      expect(result[0].jsonType).assertEqual(7);
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
      const result: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);
      expect(result[2].asInteger()).assertEqual(-5);
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
      let typ: Type = Type.of(new String());
      try {
        JSON.parse<string>(jsonStr, typ) as string;
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
      let typ: Type = Type.of(new String());
      const result: string = JSON.parse<string>(jsonStr, typ) as string;
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
      let typ: Type = Type.of(new String());
      try {
        JSON.parse<string>(jsonStr, typ) as string;
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
      const jsonStr: string = '{"num": 9007199254740991}';
      let typ: Type = Type.of(new LongNum025());
      const result: LongNum025 = JSON.parse<LongNum025>(jsonStr, typ) as LongNum025;
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
      let typ: Type = Type.of(new String());
      try {
        JSON.parse<string>(jsonStr, typ) as string;
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
      const jsonStr: string = '{"x": 10, "y": 20}';
      let typ: Type = Type.of(new NoReturn027());
      const result: NoReturn027 =
        JSON.parse<NoReturn027>(jsonStr, (k: string, v: Any) => k === "x" ? undefined : v, typ) as NoReturn027;
      expect(result.x).assertEqual(undefined);
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
      let typ: Type = Type.of(new Number());
      const result: number =
        JSON.parse<number>(jsonStr, (k: string, v: Any) => k === "" ? (v as number) + 77 : v, typ) as number;
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
      const jsonStr: string = '[{"id": 1, "name": "A"}, {"id": 2, "name": "B"}]';
      const result: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);
      expect(result[1]["name"].asString()).assertEqual("B");
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
      JSON.parseJsonElement(jsonStr, (k) => {
        if (k !== "" && typeof k !== "string") {
          isStrKey = false;
        }
        return jsonx.JsonElement.createString(k);
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
      let typ: Type = Type.of(new String());
      try {
        JSON.parse<string>(jsonStr, typ) as string;
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
      const jsonStr: string = '{"data": {"id": 1, "name": "test"}}';
      const result: jsonx.JsonElement = JSON.parseJsonElement(jsonStr,
        (k: string, v: jsonx.JsonElement) => k === "data" ? jsonx.JsonElement.createArray([v['id'], v['name']]) : v);
      expect(result["data"][0].asDouble()).assertEqual(1);
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
      let typ: Type = Type.of(new String());
      const result: string = JSON.parse<string>(jsonStr, typ) as string;
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
      const jsonStr: string = '{"zero": 0, "negZero": -0}';
      let typ: Type = Type.of(new ZeroVal035());
      const result: ZeroVal035 = JSON.parse<ZeroVal035>(jsonStr, typ) as ZeroVal035;
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
      let typ: Type = Type.of(new String());
      const result: string = JSON.parse<string>(jsonStr, typ) as string;
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
      let typ: Type = Type.of(new test037());
      let lastKey: string = "";
      JSON.parse<test037>(jsonStr, (k: string, v: Any) => {
        lastKey = k;
        return v;
      }, typ) as test037;
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
      const result: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);
      expect(result[2].asDouble()).assertEqual(-3.5);
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
      const jsonStr: string = '{"success": 123}';
      let typ: Type = Type.of(new BoolToNum039());
      const result: BoolToNum039 =
        JSON.parse<BoolToNum039>(jsonStr, (k: string, v: Any) => k === "success" ? (v ? 1 : 0) as number : v,
          typ) as BoolToNum039;
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
      const jsonStr: string = '{"str": ""}';
      let typ: Type = Type.of(new EmptyStr040());
      const result: EmptyStr040 = JSON.parse<EmptyStr040>(jsonStr, typ) as EmptyStr040;
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
      let typ: Type = Type.of(new Boolean());
      const result: boolean = JSON.parse<boolean>(jsonStr, typ) as boolean;
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
      const jsonStr: string = '{"level1": {"level2": {"level3": 5}}}';
      let typ: Type = Type.of(new DeepNested042());
      const result: DeepNested042 =
        JSON.parse<DeepNested042>(jsonStr, (k: string, v: Any) => k === "level3" ? (v as number) * 4 : v,
          typ) as DeepNested042;
      expect(result.level1.level2.level3).assertEqual(20);
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
      const jsonStr: string = '{"str": "Infinity"}';
      let typ: Type = Type.of(new InfStr044());
      const result: InfStr044 = JSON.parse<InfStr044>(jsonStr, typ) as InfStr044;
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
      let typ: Type = Type.of(new String());
      try {
        JSON.parse<string>(jsonStr, typ) as string;
      } catch (e) {
        isSyntaxError = e instanceof Error;
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
      const result: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);
      expect(result[2].asInteger()).assertEqual(0);
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
      let typ: Type = Type.of(new String());
      const result: string = JSON.parse<string>(jsonStr, typ) as string;
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
      const jsonStr: string = '{"code": "function() {}"}';
      let typ: Type = Type.of(new FuncStr048());
      const result: FuncStr048 = JSON.parse<FuncStr048>(jsonStr, typ) as FuncStr048;
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
      const jsonStr: string = '{"list": []}';
      const result: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);
      expect(result["list"].asArray().length).assertEqual(0);
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
      const jsonStr: string = '{"data": null}';
      let typ: Type = Type.of(new NullVal050());
      const result: NullVal050 = JSON.parse<NullVal050>(jsonStr, typ) as NullVal050;
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
      const jsonStr: string = '{"a": 1, "b": 2, }';
      let isSyntaxError: boolean = false;
      let typ: Type = Type.of(new String());
      try {
        JSON.parse<string>(jsonStr, typ) as string;
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
      let typ: Type = Type.of(new String());
      const result: string = JSON.parse<string>(jsonStr, typ) as string;
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
      let typ: Type = Type.of(new String());
      try {
        JSON.parse<string>(jsonStr, typ) as string;
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
      const result: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);
      expect(result[1][0][0].asInteger()).assertEqual(3);
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
      const result: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);
      expect(result.asString()).assertEqual("☺✌");
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
      const jsonStr: string = '{"str": "NaN"}';
      let typ: Type = Type.of(new NaNStr056());
      const result: NaNStr056 = JSON.parse<NaNStr056>(jsonStr, typ) as NaNStr056;
      expect(result.str).assertEqual("NaN");
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
      let typ: Type = Type.of(new String());
      try {
        JSON.parse<string>(jsonStr, typ) as string;
      } catch (e) {
        isSyntaxError = e instanceof Error;
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
      const result: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);
      expect(result[0].asDouble()).assertEqual(-0);
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
      let typ: Type = Type.of(new String());
      const result: string = JSON.parse<string>(jsonStr, typ) as string;
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
      const result: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);
      expect(result[1].asString()).assertEqual("function b(){}");
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
      const result: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);
      expect(result[1].asArray().length).assertEqual(0);
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
      const jsonStr: string = '{"a": {"b": null}}';
      let typ: Type = Type.of(new NestedNull063());
      const result: NestedNull063 = JSON.parse<NestedNull063>(jsonStr, typ) as NestedNull063;
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
      JSON.parseJsonElement(jsonStr, (k) => {
        if (k !== "" && isNaN(Number(k))) {
          isAllStrIdx = false;
        }
        return jsonx.JsonElement.createString(k);
      });
      expect(isAllStrIdx).assertEqual(true);
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
      let typ: Type = Type.of(new String());
      const result: string = JSON.parse<string>(jsonStr, typ) as string;
      expect(result).assertEqual(`C:\\\\Users\\\\test`);
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
      const jsonStr: string = '{"pattern": "/^[a-z]+$/"}';
      let typ: Type = Type.of(new RegexStr068());
      const result: RegexStr068 = JSON.parse<RegexStr068>(jsonStr, typ) as RegexStr068;
      expect(result.pattern).assertEqual("/^[a-z]+$/");
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
      const result: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);
      expect(result[3].jsonType).assertEqual(7);
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
      const result: jsonx.JsonElement = JSON.parseJsonElement(jsonStr, (k: string, v: jsonx.JsonElement) => {
        if (k === "") {
          return jsonx.JsonElement.createArray(v.asArray()
            .filter((num: jsonx.JsonElement) => num.asDouble() % 2 === 0));
        }
        return v;
      });
      expect(result[1].asDouble()).assertEqual(4);
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
      const jsonStr: string = '{"amount": "1234.56"}';
      let typ: Type = Type.of(new CurrencyStr073());
      const result: CurrencyStr073 = JSON.parse<CurrencyStr073>(jsonStr, (k: string, v: Any) => {
        if (k === "amount") {
          return `$${Number(v as string).toFixed(2)}`;
        }
        return v;
      }, typ) as CurrencyStr073;
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
      const longContent: string = "这是一段用于测试JSON解析的超长中文字符串，包含多个汉字和标点符号。";
      const jsonStr: string = `{"content": "${longContent}"}`;
      let typ: Type = Type.of(new LongChineseStr074());
      const result: LongChineseStr074 = JSON.parse<LongChineseStr074>(jsonStr, typ) as LongChineseStr074;

      expect(result.content).assertEqual(longContent);
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
      let typ: Type = Type.of(new String());
      const result: string = JSON.parse<string>(jsonStr, typ) as string;
      expect(result).assertEqual("He said: 'Hello!'");
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
      let typ: Type = Type.of(new String());
      try {
        JSON.parse<string>(jsonStr, typ) as string;
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
      const result: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);
      expect(result[0][0][0][0][0].asInteger()).assertEqual(10);
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
      const result: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);
      expect(result.asString()).assertEqual("☃☀");
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
      const result: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);
      expect(result[0].asString()).assertEqual("NaN");
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
      const result: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);
      expect(result[0].asString()).assertEqual("-Infinity");
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
      const result: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);
      expect(result[0][1].asDouble()).assertEqual(-0);
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
      let typ: Type = Type.of(new String());
      const result: string = JSON.parse<string>(jsonStr, typ) as string;
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
      const result: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);
      expect(result[1][1].asArray().length).assertEqual(0);
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
      const result: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);
      expect(result.asString()).assertEqual("带符号的字符串：!@#");
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
      let typ: Type = Type.of(new String());
      const result: string = JSON.parse<string>(jsonStr, typ) as string;
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
      let typ: Type = Type.of(new String());
      const result: string = JSON.parse<string>(jsonStr, typ) as string;
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
      let typ: Type = Type.of(new Number());
      const result: number = JSON.parse<number>(jsonStr, typ) as number;
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
      let typ: Type = Type.of(new String());
      const result: string =
        JSON.parse<string>(jsonStr, (k: string, v: Any) => k === "" ? (v as string).toUpperCase() : v, typ) as string;
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
      const result: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);
      expect(result[1].asInteger()).assertEqual(2);
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
      let typ: Type = Type.of(new Number());
      const result: number = JSON.parse<number>(jsonStr, typ) as number;
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
      let typ: Type = Type.of(new Number());
      const result: number =
        JSON.parse<number>(jsonStr, (k: string, v: Any) => k === "" ? Math.floor(v as number) : v, typ) as number;
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
      let typ: Type = Type.of(new Number());
      const result: number = JSON.parse<number>(jsonStr, typ) as number;
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
      let typ: Type = Type.of(new String());
      const result: string = JSON.parse<string>(jsonStr, typ) as string;
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
      let typ: Type = Type.of(new String());
      const result: string =
        JSON.parse<string>(jsonStr, (k: string, v: Any) => k === "" ? (v as string).replace("\n", " ") : v,
          typ) as string;
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
      const jsonStr: string = '[{"k":1}]';
      const result: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);
      expect(result[0]["k"].asDouble()).assertEqual(1);
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
      let typ: Type = Type.of(new Number());
      const result: number = JSON.parse<number>(jsonStr, typ) as number;
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
      let typ: Type = Type.of(new Number());
      const result: number =
        JSON.parse<number>(jsonStr, (k: string, v: Any) => k === "" ? (v as number) + 500 : v, typ) as number;
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
      let typ: Type = Type.of(new String());
      const result: string =
        JSON.parse<string>(jsonStr, (k: string, v: Any) => k === "" ? `pre-${v}` : v, typ) as string;
      expect(result).assertEqual("pre-中文");
    });

  })
}