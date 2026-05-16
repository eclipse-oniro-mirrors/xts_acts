/*
* Copyright (C) 2026 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';

function sleep(time: number): Promise<void> {
  return new Promise((re) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

interface TestObj1 {
  a?: string;
  b?: number;
  username?: string;
  password?: string;
}

interface TestObj2 {
  a?: number;
  b?: string;
}

interface TestObj3 {
  a?: number;
}

interface TestObj4 {
  num?: number;
}

interface TestObj5 {
  a?: number;
}

interface TestObj6 {
  week?: number;
  month?: number;
  year?: number;
}

interface TestObj7 {
  a?: number;
  b?: number;
  c?: number;
}

interface TestObj8 {
  outer?: TestObj9;
}

interface TestObj9 {
  inner?: string;
}

interface TestObj10 {
  a?: TestObj11;
}

interface TestObj11 {
  b?: TestObj12;
}

interface TestObj12 {
  c?: number;
}

interface TestObj13 {
  a?: number;
  b?: number;
}

export default function JSONStringifyReplacerTest() {
  describe('JSONStringifyReplacerTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
    })
    beforeEach(async () => {
      await sleep(20);
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
    })

    // Replacer as function
    /**
     * @tc.name   JSONStringify_Replacer_Function_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_REPLACER_FUNC_0100
     * @tc.desc   Test replacer function filtering string properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Replacer_Function_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let replacer = (key: string, value: ESObject): ESObject => typeof value === "string" ? undefined : value;
      let obj: TestObj1 = { a: "foo", b: 123 };
      let result: string = JSON.stringify(obj, replacer);
      expect(result).assertEqual('{"b":123}');
    });

    /**
     * @tc.name   JSONStringify_Replacer_Function_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_REPLACER_FUNC_0200
     * @tc.desc   Test replacer function filtering specific properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Replacer_Function_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let replacer = (key: string, value: ESObject): ESObject => key === "password" ? undefined : value;
      let obj: TestObj1 = { username: "user", password: "secret" };
      let result: string = JSON.stringify(obj, replacer);
      expect(result).assertEqual('{"username":"user"}');
    });

    /**
     * @tc.name   JSONStringify_Replacer_Function_003
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_REPLACER_FUNC_0300
     * @tc.desc   Test replacer function converting property values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Replacer_Function_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let replacer = (key: string, value: ESObject): ESObject => typeof value === "number" ? (value as number) * 2 : value;
      let obj: TestObj2 = { a: 5, b: "text" };
      let result: string = JSON.stringify(obj, replacer);
      expect(result).assertEqual('{"a":10,"b":"text"}');
    });

    /**
     * @tc.name   JSONStringify_Replacer_Function_004
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_REPLACER_FUNC_0400
     * @tc.desc   Test replacer function key parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Replacer_Function_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let actualKeys: string[] = [];
      let replacer = (key: string, value: ESObject): ESObject => {
        actualKeys.push(key);
        return value;
      };
      let obj: TestObj1 = { a: "1", b: 2 };
      JSON.stringify(obj, replacer);
      expect(actualKeys).assertDeepEquals(["", "a", "b"]);
    });

    /**
     * @tc.name   JSONStringify_Replacer_Function_005
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_REPLACER_FUNC_0500
     * @tc.desc   Test replacer function initial call with empty key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Replacer_Function_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let called = false;
      let replacer = (key: string, value: ESObject): ESObject => {
        if (key === "") {
          called = true;
        }
        return value;
      };
      let obj: TestObj3 = { a: 1 };
      JSON.stringify(obj, replacer);
      expect(called).assertTrue();
    });

    /**
     * @tc.name   JSONStringify_Replacer_Function_006
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_REPLACER_FUNC_0600
     * @tc.desc   Test replacer function returning undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Replacer_Function_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let replacer = (key: string, value: ESObject): ESObject => undefined;
      let obj: TestObj3 = { a: 1 };
      let result: string = JSON.stringify(obj, replacer);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   JSONStringify_Replacer_Function_007
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_REPLACER_FUNC_0700
     * @tc.desc   Test replacer function returning null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Replacer_Function_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let replacer = (key: string, value: ESObject): ESObject => null;
      let obj: TestObj3 = { a: 1 };
      let result: string = JSON.stringify(obj, replacer);
      expect(result).assertEqual("null");
    });

    /**
     * @tc.name   JSONStringify_Replacer_Function_008
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_REPLACER_FUNC_0800
     * @tc.desc   Test replacer function returning function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Replacer_Function_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let replacer = (key: string, value: ESObject): ESObject => (() => {});
      let obj: TestObj3 = { a: 1 };
      let result: string = JSON.stringify(obj, replacer);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   JSONStringify_Replacer_Function_010
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_REPLACER_FUNC_1000
     * @tc.desc   Test replacer function in array returning undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Replacer_Function_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let replacer = (key: string, value: ESObject): ESObject => undefined;
      let arr: number[] = [1, 2, 3];
      let result: string = JSON.stringify(arr, replacer);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   JSONStringify_Replacer_Function_011
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_REPLACER_FUNC_1100
     * @tc.desc   Test replacer function in array returning function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Replacer_Function_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let replacer = (key: string, value: ESObject): ESObject => (() => {});
      let arr: number[] = [1, 2, 3];
      let result: string = JSON.stringify(arr, replacer);
      expect(result).assertEqual(undefined);
    });

    // Replacer as array
    /**
     * @tc.name   JSONStringify_Replacer_Array_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_REPLACER_ARRAY_0100
     * @tc.desc   Test replacer array selective inclusion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Replacer_Array_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj: TestObj6 = { week: 45, month: 7, year: 2024 };
      let replacer: (string | number)[] = ["week", "month"];
      let result: string = JSON.stringify(obj, replacer);
      expect(result).assertEqual('{"week":45,"month":7}');
    });

    /**
     * @tc.name   JSONStringify_Replacer_Array_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_REPLACER_ARRAY_0200
     * @tc.desc   Test replacer array single property selection
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Replacer_Array_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj: TestObj7 = { a: 1, b: 2, c: 3 };
      let replacer: (string | number)[] = ["b"];
      let result: string = JSON.stringify(obj, replacer);
      expect(result).assertEqual('{"b":2}');
    });

    /**
     * @tc.name   JSONStringify_Replacer_Array_003
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_REPLACER_ARRAY_0300
     * @tc.desc   Test replacer array with non-existent properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Replacer_Array_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj: TestObj5 = { a: 1 };
      let replacer: (string | number)[] = ["a", "b", "c"];
      let result: string = JSON.stringify(obj, replacer);
      expect(result).assertEqual('{"a":1}');
    });

    /**
     * @tc.name   JSONStringify_Replacer_Array_004
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_REPLACER_ARRAY_0400
     * @tc.desc   Test replacer array with nested object properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Replacer_Array_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj: TestObj8 = { outer: { inner: "value" } };
      let replacer: (string | number)[] = ["outer"];
      let result: string = JSON.stringify(obj, replacer);
      expect(result).assertEqual('{"outer":{}}');
    });

    /**
     * @tc.name   JSONStringify_Replacer_Array_005
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_REPLACER_ARRAY_0500
     * @tc.desc   Test replacer array with deep nested properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Replacer_Array_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj: TestObj10 = { a: { b: { c: 1 } } };
      let replacer: (string | number)[] = ["a", "b", "c"];
      let result: string = JSON.stringify(obj, replacer);
      expect(result).assertEqual('{"a":{"b":{"c":1}}}');
    });

    // Replacer as null or undefined
    /**
     * @tc.name   JSONStringify_Replacer_Null_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_REPLACER_NULL_0100
     * @tc.desc   Test replacer as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Replacer_Null_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj: TestObj13 = { a: 1, b: 2 };
      let result: string = JSON.stringify(obj, undefined);
      expect(result).assertEqual('{"a":1,"b":2}');
    });

    /**
     * @tc.name   JSONStringify_Replacer_Undefined_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_REPLACER_UNDEFINED_0100
     * @tc.desc   Test replacer as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Replacer_Undefined_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj: TestObj13 = { a: 1, b: 2 };
      let result: string = JSON.stringify(obj, undefined);
      expect(result).assertEqual('{"a":1,"b":2}');
    });

    /**
     * @tc.name   JSONStringify_Replacer_Omitted_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_REPLACER_OMITTED_0100
     * @tc.desc   Test without replacer parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Replacer_Omitted_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj: TestObj13 = { a: 1, b: 2 };
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"a":1,"b":2}');
    });
  })
}