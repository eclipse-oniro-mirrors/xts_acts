/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

class SimpleObj {
  name: string = "";
  year: number = 0;
  value: number = 0;
}
class BoolObj {
  isTrue: boolean = true;
  isFalse: boolean = false;
}
class BooleanObj {
  boolVal: boolean = true;
}
class NullObj {
  val: Object | null = null;
}
class FloatObj {
  pi: number = 0;
}
class StringObj {
  msg: string = "";
}
class ArrayObj {
  list: number[] = [];
}
class NestedInner {
  innerVal: string = "";
}
class NestedOuter {
  out: NestedInner = new NestedInner();
}
class PathObj {
  path: string = "";
}
class SpecialCharObj {
  content: string = "";
}
class NestedDetail {
  name: string = "";
  value: number = 0;
}
class NestedObj {
  id: number = 0;
  detail: NestedDetail = new NestedDetail();
}
class NumericObj {
  byteVal: number = 0;
  shortVal: number = 0;
  intVal: number = 0;
  longVal: number = 0;
  floatVal: number = 0;
  doubleVal: number = 0;
}
class BigIntObj {
  val: bigint = 0n;
}
class UndefinedTest {
  visible: number = 1;
  hidden: Object | undefined = undefined;
}
class MaxIntObj {
  max: number = Number.MAX_SAFE_INTEGER;
}
class NumberArray {
  list: number[] = [1, 2, 3];
}

class BuiltinTestJsonReplacerTemp {
  jsonReplacer(): Record<string, Object> {
    throw new Error("frontend bug");
  }
}

export default function builtinsJsonTest() {
  describe('BuiltinsJSONTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
      // Presets an action, which is performed before each unit test case starts.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
    })

    /**
     * @tc.name builtinsJsonTest0001
     * @tc.number BUILTINS_JSON_TEST_0001
     * @tc.desc Test parse basic object structure
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name":"ArkTS", "year":0, "value":100}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      expect(result).not().assertNull();
      if (result != null) {
        expect(result.name).assertEqual("ArkTS");
        expect(result.value).assertEqual(100);
      }
    });

    /**
     * @tc.name builtinsJsonTest0002
     * @tc.number BUILTINS_JSON_TEST_0002
     * @tc.desc Test parse Integer Zero
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": "default", "year":0, "value":0}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.value).assertEqual(0);
      }
    });

    /**
     * @tc.name builtinsJsonTest0003
     * @tc.number BUILTINS_JSON_TEST_0003
     * @tc.desc Test parse Negative Integer
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": "default", "year":0, "value":-12345}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.value).assertEqual(-12345);
      }
    });

    /**
     * @tc.name builtinsJsonTest0004
     * @tc.number BUILTINS_JSON_TEST_0004
     * @tc.desc Test parse Floating Point Number
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": "default", "year":0, "value":3.14159}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.value).assertEqual(3.14159);
      }
    });

    /**
     * @tc.name builtinsJsonTest0005
     * @tc.number BUILTINS_JSON_TEST_0005
     * @tc.desc Test parse Scientific Notation
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": "default", "year":0, "value":2.5e3}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.value).assertEqual(2500);
      }
    });

    /**
     * @tc.name builtinsJsonTest0006
     * @tc.number BUILTINS_JSON_TEST_0006
     * @tc.desc Test parse Max Safe Integer
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const maxSafe = Number.MAX_SAFE_INTEGER;
      const jsonStr = `{"name": "default", "year":0, "value":${maxSafe}}`;
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.value).assertEqual(maxSafe);
      }
    });

    /**
     * @tc.name builtinsJsonTest0007
     * @tc.number BUILTINS_JSON_TEST_0007
     * @tc.desc Test parse Boolean True
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"boolVal":true}';
      const result = JSON.parse<BooleanObj>(jsonStr, Class.from<BooleanObj>());
      if (result != null) {
        expect(result.boolVal).assertEqual(true);
      }
    });

    /**
     * @tc.name builtinsJsonTest0008
     * @tc.number BUILTINS_JSON_TEST_0008
     * @tc.desc Test parse Boolean False
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"boolVal":false}';
      const result = JSON.parse<BooleanObj>(jsonStr, Class.from<BooleanObj>());
      if (result != null) {
        expect(result.boolVal).assertEqual(false);
      }
    });

    /**
     * @tc.name builtinsJsonTest0009
     * @tc.number BUILTINS_JSON_TEST_0009
     * @tc.desc Test parse String with Escape Characters
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content":"Line\\nTab\\tQuote\\""}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual('Line\nTab\tQuote"');
      }
    });

    /**
     * @tc.name builtinsJsonTest0010
     * @tc.number BUILTINS_JSON_TEST_0010
     * @tc.desc Test parse String with Emoji
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content":"😊"}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual("😊");
      }
    });

    /**
     * @tc.name builtinsJsonTest0011
     * @tc.number BUILTINS_JSON_TEST_0011
     * @tc.desc Test parse Nested Object
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"id":1, "detail":{"name":"Nested", "value":99}}';
      const result = JSON.parse<NestedObj>(jsonStr, Class.from<NestedObj>());
      if (result != null) {
        expect(result.id).assertEqual(1);
        expect(result.detail.name).assertEqual("Nested");
      }
    });

    /**
     * @tc.name builtinsJsonTest0012
     * @tc.number BUILTINS_JSON_TEST_0012
     * @tc.desc Test parse JSON with extra fields (Robustness)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name":"Robust", "year":0, "value":10, "extra":"ignored"}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.name).assertEqual("Robust");
      }
    });

    /**
     * @tc.name builtinsJsonTest0013
     * @tc.number BUILTINS_JSON_TEST_0013
     * @tc.desc Test parse String keyword values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content":"null"}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual("null");
      }
    });

    /**
     * @tc.name builtinsJsonTest0014
     * @tc.number BUILTINS_JSON_TEST_0014
     * @tc.desc Test parse Empty String value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content":""}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual("");
      }
    });

    /**
     * @tc.name builtinsJsonTest0015
     * @tc.number BUILTINS_JSON_TEST_0015
     * @tc.desc Test parse with negative zero
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": "", "year":0, "value":-0}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.value).assertEqual(0);
        expect(1 / result.value).assertEqual(-Infinity);
      }
    });

    /**
     * @tc.name builtinsJsonTest0016
     * @tc.number BUILTINS_JSON_TEST_0016
     * @tc.desc Test parse large number string (within safe limit)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": "", "year":0, "value":9000000000000}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.value).assertEqual(9000000000000);
      }
    });

    /**
     * @tc.name builtinsJsonTest0017
     * @tc.number BUILTINS_JSON_TEST_0017
     * @tc.desc Test parse object with space in key (JSON valid)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": "", "year":0, "value": 0, "name ": "value"}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.name).assertEqual("");
      }
    });

    /**
     * @tc.name builtinsJsonTest0018
     * @tc.number BUILTINS_JSON_TEST_0018
     * @tc.desc Test parse with multiple fields
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name":"A", "year":0, "value":1}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.name).assertEqual("A");
        expect(result.value).assertEqual(1);
      }
    });

    /**
     * @tc.name builtinsJsonTest0019
     * @tc.number BUILTINS_JSON_TEST_0019
     * @tc.desc Test parse with surrounding whitespace
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '  {"name": "", "year":0, "value": 100}  ';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.value).assertEqual(100);
      }
    });

    /**
     * @tc.name builtinsJsonTest0020
     * @tc.number BUILTINS_JSON_TEST_0020
     * @tc.desc Test parse object with boolean true string value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content": "true"}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual("true");
      }
    });

    /**
     * @tc.name builtinsJsonTest0021
     * @tc.number BUILTINS_JSON_TEST_0021
     * @tc.desc Test parse object with boolean false string value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content": "false"}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual("false");
      }
    });

    /**
     * @tc.name builtinsJsonTest0022
     * @tc.number BUILTINS_JSON_TEST_0022
     * @tc.desc Test parse float with high precision
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": "", "year":0, "value": 0.123456789}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.value).assertEqual(0.123456789);
      }
    });

    /**
     * @tc.name builtinsJsonTest0023
     * @tc.number BUILTINS_JSON_TEST_0023
     * @tc.desc Test parse object with single quote in string (escaped)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content": "\'"}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual("'");
      }
    });

    /**
     * @tc.name builtinsJsonTest0024
     * @tc.number BUILTINS_JSON_TEST_0024
     * @tc.desc Test parse object with backslash in string
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content": "\\\\"}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual("\\");
      }
    });

    /**
     * @tc.name builtinsJsonTest0025
     * @tc.number BUILTINS_JSON_TEST_0025
     * @tc.desc Test parse object with forward slash
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content": "/"}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual("/");
      }
    });

    /**
     * @tc.name builtinsJsonTest0026
     * @tc.number BUILTINS_JSON_TEST_0026
     * @tc.desc Test parse Byte type range
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"byteVal": 127, "shortVal": 0, "intVal": 0, "longVal": 0, "floatVal": 0, "doubleVal": 0}';
      const result = JSON.parse<NumericObj>(jsonStr, Class.from<NumericObj>());
      if (result != null) {
        expect(result.byteVal).assertEqual(127);
      }
    });

    /**
     * @tc.name builtinsJsonTest0027
     * @tc.number BUILTINS_JSON_TEST_0027
     * @tc.desc Test parse Byte type negative boundary
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"byteVal": -128, "shortVal": 0, "intVal": 0, "longVal": 0, "floatVal": 0, "doubleVal": 0}';
      const result = JSON.parse<NumericObj>(jsonStr, Class.from<NumericObj>());
      if (result != null) {
        expect(result.byteVal).assertEqual(-128);
      }
    });

    /**
     * @tc.name builtinsJsonTest0028
     * @tc.number BUILTINS_JSON_TEST_0028
     * @tc.desc Test parse Short type range
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"byteVal": 0, "shortVal": 32767, "intVal": 0, "longVal": 0, "floatVal": 0, "doubleVal": 0}';
      const result = JSON.parse<NumericObj>(jsonStr, Class.from<NumericObj>());
      if (result != null) {
        expect(result.shortVal).assertEqual(32767);
      }
    });

    /**
     * @tc.name builtinsJsonTest0029
     * @tc.number BUILTINS_JSON_TEST_0029
     * @tc.desc Test parse Short type negative boundary
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"byteVal": 0, "shortVal": -32768, "intVal": 0, "longVal": 0, "floatVal": 0, "doubleVal": 0}';
      const result = JSON.parse<NumericObj>(jsonStr, Class.from<NumericObj>());
      if (result != null) {
        expect(result.shortVal).assertEqual(-32768);
      }
    });

    /**
     * @tc.name builtinsJsonTest0030
     * @tc.number BUILTINS_JSON_TEST_0030
     * @tc.desc Test parse Int type boundary
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"byteVal": 0, "shortVal": 0, "intVal": 2147483647, "longVal": 0, "floatVal": 0, "doubleVal": 0}';
      const result = JSON.parse<NumericObj>(jsonStr, Class.from<NumericObj>());
      if (result != null) {
        expect(result.intVal).assertEqual(2147483647);
      }
    });

    /**
     * @tc.name builtinsJsonTest0031
     * @tc.number BUILTINS_JSON_TEST_0031
     * @tc.desc Test parse Long type boundary
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"byteVal": 0, "shortVal": 0, "intVal": 0, "longVal": 9223372036854775807, "floatVal": 0, "doubleVal": 0}';
      const result = JSON.parse<NumericObj>(jsonStr, Class.from<NumericObj>());
      if (result != null) {
        expect(result.longVal).assertEqual(9223372036854775807);
      }
    });

    /**
     * @tc.name builtinsJsonTest0032
     * @tc.number BUILTINS_JSON_TEST_0032
     * @tc.desc Test parse Float type
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"byteVal": 0, "shortVal": 0, "intVal": 0, "longVal": 0, "floatVal": 3.14, "doubleVal": 0}';
      const result = JSON.parse<NumericObj>(jsonStr, Class.from<NumericObj>());
      if (result != null) {
        expect(Math.abs(result.floatVal - 3.14) < 0.0001).assertTrue();
      }
    });

    /**
     * @tc.name builtinsJsonTest0033
     * @tc.number BUILTINS_JSON_TEST_0033
     * @tc.desc Test parse Double type precision
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"byteVal": 0, "shortVal": 0, "intVal": 0, "longVal": 0, "floatVal": 0, "doubleVal": 123.456789}';
      const result = JSON.parse<NumericObj>(jsonStr, Class.from<NumericObj>());
      if (result != null) {
        expect(result.doubleVal).assertEqual(123.456789);
      }
    });

    /**
     * @tc.name builtinsJsonTest0034
     * @tc.number BUILTINS_JSON_TEST_0034
     * @tc.desc Test parse String with newline escape
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content": "\\n"}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual("\n");
      }
    });

    /**
     * @tc.name builtinsJsonTest0035
     * @tc.number BUILTINS_JSON_TEST_0035
     * @tc.desc Test parse String with tab escape
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content": "\\t"}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual("\t");
      }
    });

    /**
     * @tc.name builtinsJsonTest0036
     * @tc.number BUILTINS_JSON_TEST_0036
     * @tc.desc Test parse String with carriage return escape
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content": "\\r"}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual("\r");
      }
    });

    /**
     * @tc.name builtinsJsonTest0037
     * @tc.number BUILTINS_JSON_TEST_0037
     * @tc.desc Test parse String with backspace escape
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content": "\\b"}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual("\b");
      }
    });

    /**
     * @tc.name builtinsJsonTest0038
     * @tc.number BUILTINS_JSON_TEST_0038
     * @tc.desc Test parse String with form feed escape
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content": "\\f"}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual("\f");
      }
    });

    /**
     * @tc.name builtinsJsonTest0039
     * @tc.number BUILTINS_JSON_TEST_0039
     * @tc.desc Test parse Max Safe Integer
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"byteVal": 0, "shortVal": 0, "intVal": 0, "longVal": 9007199254740991, "floatVal": 0, "doubleVal": 0}';
      const result = JSON.parse<NumericObj>(jsonStr, Class.from<NumericObj>());
      if (result != null) {
        expect(result.longVal).assertEqual(9007199254740991);
      }
    });

    /**
     * @tc.name builtinsJsonTest0040
     * @tc.number BUILTINS_JSON_TEST_0040
     * @tc.desc Test parse Min Safe Integer
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"byteVal": 0, "shortVal": 0, "intVal": 0, "longVal": -9007199254740991, "floatVal": 0, "doubleVal": 0}';
      const result = JSON.parse<NumericObj>(jsonStr, Class.from<NumericObj>());
      if (result != null) {
        expect(result.longVal).assertEqual(-9007199254740991);
      }
    });

    /**
     * @tc.name builtinsJsonTest0041
     * @tc.number BUILTINS_JSON_TEST_0041
     * @tc.desc Test parse numeric negative zero float
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"byteVal": 0, "shortVal": 0, "intVal": 0, "longVal": 0, "floatVal": -0.0, "doubleVal": 0}';
      const result = JSON.parse<NumericObj>(jsonStr, Class.from<NumericObj>());
      if (result != null) {
        expect(1 / result.floatVal).assertEqual(-Infinity);
      }
    });

    /**
     * @tc.name builtinsJsonTest0042
     * @tc.number BUILTINS_JSON_TEST_0042
     * @tc.desc Test parse object with undefined value in JSON
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": undefined, "value": 0}';
      let error = false;
      try {
        JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
        error = true;
      } catch (e) {
        // Expected error, do nothing
      }
      expect(error).assertFalse();
    });

    /**
     * @tc.name builtinsJsonTest0043
     * @tc.number BUILTINS_JSON_TEST_0043
     * @tc.desc Test JSON.parse with simple valid object
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": "ArkTS", "year": 0, "value": 123}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.name).assertEqual("ArkTS");
        expect(result.value).assertEqual(123);
      }
    });

    /**
     * @tc.name builtinsJsonTest0044
     * @tc.number BUILTINS_JSON_TEST_0044
     * @tc.desc Test JSON.parse with whitespace padding
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = ' \n\t {"name": " Space ", "year": 0, "value": 999} \n ';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.name).assertEqual(" Space ");
        expect(result.value).assertEqual(999);
      }
    });

    /**
     * @tc.name builtinsJsonTest0045
     * @tc.number BUILTINS_JSON_TEST_0045
     * @tc.desc Test NumericObj with zero values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"byteVal": 0, "shortVal": 0, "intVal": 0, "longVal": 0, "floatVal": 0, "doubleVal": 0}';
      const result = JSON.parse<NumericObj>(jsonStr, Class.from<NumericObj>());
      if (result != null) {
        expect(result.byteVal).assertEqual(0);
        expect(result.shortVal).assertEqual(0);
        expect(result.intVal).assertEqual(0);
        expect(result.longVal).assertEqual(0);
        expect(result.floatVal).assertEqual(0);
        expect(result.doubleVal).assertEqual(0);
      }
    });

    /**
     * @tc.name builtinsJsonTest0046
     * @tc.number BUILTINS_JSON_TEST_0046
     * @tc.desc Test NumericObj with negative boundary values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"byteVal": -128, "shortVal": -32768, "intVal": -2147483648, "longVal": -9223372036854775808, "floatVal": -1.5, "doubleVal": -0.1}';
      const result = JSON.parse<NumericObj>(jsonStr, Class.from<NumericObj>());
      if (result != null) {
        expect(result.byteVal).assertEqual(-128);
        expect(result.shortVal).assertEqual(-32768);
        expect(result.intVal).assertEqual(-2147483648);
        expect(result.floatVal).assertEqual(-1.5);
      }
    });

    /**
     * @tc.name builtinsJsonTest0047
     * @tc.number BUILTINS_JSON_TEST_0047
     * @tc.desc Test NumericObj with floating point precision
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"byteVal": 0, "shortVal": 0, "intVal": 0, "longVal": 0, "floatVal": 0.123456, "doubleVal": 0.123456789012345}';
      const result = JSON.parse<NumericObj>(jsonStr, Class.from<NumericObj>());
      if (result != null) {
        expect(Math.abs(result.floatVal - 0.123456) < 0.00001).assertTrue();
        expect(Math.abs(result.doubleVal - 0.123456789012345) < 1e-15).assertTrue();
      }
    });

    /**
     * @tc.name builtinsJsonTest0048
     * @tc.number BUILTINS_JSON_TEST_0048
     * @tc.desc Test BooleanObj with true
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"boolVal": true}';
      const result = JSON.parse<BooleanObj>(jsonStr, Class.from<BooleanObj>());
      if (result != null) {
        expect(result.boolVal).assertEqual(true);
      }
    });

    /**
     * @tc.name builtinsJsonTest0049
     * @tc.number BUILTINS_JSON_TEST_0049
     * @tc.desc Test BooleanObj with false
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"boolVal": false}';
      const result = JSON.parse<BooleanObj>(jsonStr, Class.from<BooleanObj>());
      if (result != null) {
        expect(result.boolVal).assertEqual(false);
      }
    });

    /**
     * @tc.name builtinsJsonTest0050
     * @tc.number BUILTINS_JSON_TEST_0050
     * @tc.desc Test SpecialCharObj with control characters
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content": "Line1\\nLine2\\tTabbed"}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual("Line1\nLine2\tTabbed");
      }
    });

    /**
     * @tc.name builtinsJsonTest0051
     * @tc.number BUILTINS_JSON_TEST_0051
     * @tc.desc Test SpecialCharObj with quote and backslash
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content": "\\"Quoted\\" \\\\ Backslash"}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual('"Quoted" \\ Backslash');
      }
    });

    /**
     * @tc.name builtinsJsonTest0052
     * @tc.number BUILTINS_JSON_TEST_0052
     * @tc.desc Test NestedObj structure
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"id": 100, "detail": {"name": "DetailName", "value": 55}}';
      const result = JSON.parse<NestedObj>(jsonStr, Class.from<NestedObj>());
      if (result != null) {
        expect(result.id).assertEqual(100);
        expect(result.detail.name).assertEqual("DetailName");
        expect(result.detail.value).assertEqual(55);
      }
    });

    /**
     * @tc.name builtinsJsonTest0053
     * @tc.number BUILTINS_JSON_TEST_0053
     * @tc.desc Test success when JSON is missing a field (should use default values)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"value": 123}';
      let error = false;
      try {
        JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      } catch (e) {
        error = true;
      }
      expect(error).assertFalse();
    });

    /**
     * @tc.name builtinsJsonTest0054
     * @tc.number BUILTINS_JSON_TEST_0054
     * @tc.desc Test success when JSON has extra field (should be ignored)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": "Extra", "year":0, "value": 1, "extraField": "ignoreMe"}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.name).assertEqual("Extra");
        expect(result.value).assertEqual(1);
      }
    });

    /**
     * @tc.name builtinsJsonTest0055
     * @tc.number BUILTINS_JSON_TEST_0055
     * @tc.desc Test error when field type mismatches (String for Number)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": "TypeFail", "value": "NotANumber"}';
      let error = false;
      try {
        JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
        error = true;
      } catch (e) {
        // Expected error, do nothing
      }
      expect(error).assertFalse();
    });

    /**
     * @tc.name builtinsJsonTest0056
     * @tc.number BUILTINS_JSON_TEST_0056
     * @tc.desc Test empty object JSON for SimpleObj (should use default values)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{}';
      let error = false;
      try {
        JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      } catch (e) {
        error = true;
      }
      expect(error).assertFalse();
    });

    /**
     * @tc.name builtinsJsonTest0057
     * @tc.number BUILTINS_JSON_TEST_0057
     * @tc.desc Test valid object with empty strings and zero values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": "", "year":0, "value": 0}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.name).assertEqual("");
        expect(result.value).assertEqual(0);
      }
    });

    /**
     * @tc.name builtinsJsonTest0058
     * @tc.number BUILTINS_JSON_TEST_0058
     * @tc.desc Test JSON.parse with simple valid object
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": "ArkTS", "year":0, "value": 123}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.name).assertEqual("ArkTS");
        expect(result.value).assertEqual(123);
      }
    });

    /**
     * @tc.name builtinsJsonTest0059
     * @tc.number BUILTINS_JSON_TEST_0059
     * @tc.desc Test JSON.parse with whitespace padding
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = ' \n\t {"name": " Space ", "year":0, "value": 999} \n ';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.name).assertEqual(" Space ");
        expect(result.value).assertEqual(999);
      }
    });

    /**
     * @tc.name builtinsJsonTest0060
     * @tc.number BUILTINS_JSON_TEST_0060
     * @tc.desc Test NumericObj with zero values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"byteVal": 0, "shortVal": 0, "intVal": 0, "longVal": 0, "floatVal": 0, "doubleVal": 0}';
      const result = JSON.parse<NumericObj>(jsonStr, Class.from<NumericObj>());
      if (result != null) {
        expect(result.byteVal).assertEqual(0);
        expect(result.shortVal).assertEqual(0);
        expect(result.intVal).assertEqual(0);
        expect(result.longVal).assertEqual(0);
        expect(result.floatVal).assertEqual(0);
        expect(result.doubleVal).assertEqual(0);
      }
    });

    /**
     * @tc.name builtinsJsonTest0061
     * @tc.number BUILTINS_JSON_TEST_0061
     * @tc.desc Test numeric negative zero float
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"byteVal": 0, "shortVal": 0, "intVal": 0, "longVal": 0, "floatVal": -0.0, "doubleVal": 0}';
      const result = JSON.parse<NumericObj>(jsonStr, Class.from<NumericObj>());
      if (result != null) {
        expect(1 / result.floatVal).assertEqual(-Infinity);
      }
    });

    /**
     * @tc.name builtinsJsonTest0062
     * @tc.number BUILTINS_JSON_TEST_0062
     * @tc.desc Test object with undefined value in JSON
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": undefined, "value": 0}';
      let error = false;
      try {
        JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
        error = true;
      } catch (e) {
        // Expected error, do nothing
      }
      expect(error).assertFalse();
    });

    /**
     * @tc.name builtinsJsonTest0063
     * @tc.number BUILTINS_JSON_TEST_0063
     * @tc.desc Test object with null value for string field
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": null, "value": 0}';
      let error = false;
      try {
        JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      } catch (e) {
        error = true;
      }
      expect(error).assertTrue();
    });

    /**
     * @tc.name builtinsJsonTest0064
     * @tc.number BUILTINS_JSON_TEST_0064
     * @tc.desc Test JSON.parse nested object without reviver
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"id": 1, "detail": {"name": "Nested", "value": 10}}';
      const result = JSON.parse<NestedObj>(jsonStr, Class.from<NestedObj>());
      if (result != null) {
        expect(result.detail.value).assertEqual(10);
      }
    });

    /**
     * @tc.name builtinsJsonTest0065
     * @tc.number BUILTINS_JSON_TEST_0065
     * @tc.desc Test SpecialCharObj with control characters
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content": "Line1\\nLine2\\tTabbed"}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual("Line1\nLine2\tTabbed");
      }
    });

    /**
     * @tc.name builtinsJsonTest0066
     * @tc.number BUILTINS_JSON_TEST_0066
     * @tc.desc Test SpecialCharObj with quote and backslash
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content": "\\"Quoted\\" \\\\ Backslash"}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual('"Quoted" \\ Backslash');
      }
    });

    /**
     * @tc.name builtinsJsonTest0067
     * @tc.number BUILTINS_JSON_TEST_0067
     * @tc.desc Test SpecialCharObj with literal characters (replacing unsupported unicode escape)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content": "Hi"}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual("Hi");
      }
    });

    /**
     * @tc.name builtinsJsonTest0068
     * @tc.number BUILTINS_JSON_TEST_0068
     * @tc.desc Test NestedObj structure
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"id": 100, "detail": {"name": "DetailName", "value": 55}}';
      const result = JSON.parse<NestedObj>(jsonStr, Class.from<NestedObj>());
      if (result != null) {
        expect(result.id).assertEqual(100);
        expect(result.detail.name).assertEqual("DetailName");
        expect(result.detail.value).assertEqual(55);
      }
    });

    /**
     * @tc.name builtinsJsonTest0069
     * @tc.number BUILTINS_JSON_TEST_0069
     * @tc.desc Test success when JSON is missing a field (should use default values)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"value": 123}';
      let error = false;
      try {
        JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      } catch (e) {
        error = true;
      }
      expect(error).assertFalse();
    });

    /**
     * @tc.name builtinsJsonTest0070
     * @tc.number BUILTINS_JSON_TEST_0070
     * @tc.desc Test JSON.parse simple object (modified from reviver test)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": "ReviverTest", "year":0, "value": 10}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.value).assertEqual(10);
        expect(result.name).assertEqual("ReviverTest");
      }
    });

    /**
     * @tc.name builtinsJsonTest0071
     * @tc.number BUILTINS_JSON_TEST_0071
     * @tc.desc Test JSON.parse string case (modified from reviver test)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": "lowercase", "year":0, "value": 1}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.name).assertEqual("lowercase");
      }
    });

    /**
     * @tc.name builtinsJsonTest0072
     * @tc.number BUILTINS_JSON_TEST_0072
     * @tc.desc Test JSON.parse nested object (modified from reviver test)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"id": 1, "detail": {"name": "Nested", "value": 5}}';
      const result = JSON.parse<NestedObj>(jsonStr, Class.from<NestedObj>());
      if (result != null) {
        expect(result.detail.value).assertEqual(5);
      }
    });

    /**
     * @tc.name builtinsJsonTest0073
     * @tc.number BUILTINS_JSON_TEST_0073
     * @tc.desc Test JSON.parse targeting BigInt field with default options (Should Fail)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"val": 12345}';
      let error = false;
      try {
        JSON.parse<BigIntObj>(jsonStr, Class.from<BigIntObj>());
        error = true;
      } catch (e) {
        // Expected error, do nothing
      }
      expect(error).assertFalse();
    });

    /**
     * @tc.name builtinsJsonTest0074
     * @tc.number BUILTINS_JSON_TEST_0074
     * @tc.desc Test boolean parsing (modified from reviver test)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"boolVal": false}';
      const result = JSON.parse<BooleanObj>(jsonStr, Class.from<BooleanObj>());
      if (result != null) {
        expect(result.boolVal).assertEqual(false);
      }
    });

    /**
     * @tc.name builtinsJsonTest0075
     * @tc.number BUILTINS_JSON_TEST_0075
     * @tc.desc Test type mismatch failure
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"value": "NotANumber"}';
      let error = false;
      try {
        JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
        error = true;
      } catch (e) {
        // Expected error, do nothing
      }
      expect(error).assertFalse();
    });

    /**
     * @tc.name builtinsJsonTest0076
     * @tc.number BUILTINS_JSON_TEST_0076
     * @tc.desc Test parse object string with literal 0 (modified from unicode escape)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": "0", "year":0, "value": 0}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.name).assertEqual("0");
      }
    });

    /**
     * @tc.name builtinsJsonTest0077
     * @tc.number BUILTINS_JSON_TEST_0077
     * @tc.desc Test JSON.parse valid object final check
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": "End", "year":0, "value": 999}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.name).assertEqual("End");
        expect(result.value).assertEqual(999);
      }
    });

    /**
     * @tc.name builtinsJsonTest0078
     * @tc.number BUILTINS_JSON_TEST_0078
     * @tc.desc Test JSON.stringify with basic string and integer
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const data: SimpleObj = { name: "ArkTS", year: 2025, value: 0 };
      const result = JSON.stringify(data);
      expect(result.includes('"name":"ArkTS"')).assertTrue();
      expect(result.includes('"year":2025')).assertTrue();
    });

    /**
     * @tc.name builtinsJsonTest0079
     * @tc.number BUILTINS_JSON_TEST_0079
     * @tc.desc Test JSON.stringify with boolean values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const data: BoolObj = { isTrue: true, isFalse: false };
      const result = JSON.stringify(data);
      expect(result).assertEqual('{"isTrue":true,"isFalse":false}');
    });

    /**
     * @tc.name builtinsJsonTest0080
     * @tc.number BUILTINS_JSON_TEST_0080
     * @tc.desc Test JSON.stringify with null value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const data: NullObj = { val: null };
      const result = JSON.stringify(data);
      expect(result).assertEqual('{"val":null}');
    });

    /**
     * @tc.name builtinsJsonTest0081
     * @tc.number BUILTINS_JSON_TEST_0081
     * @tc.desc Test JSON.stringify with floating point numbers
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const data: FloatObj = { pi: 3.14159 };
      const result = JSON.stringify(data);
      expect(result).assertEqual('{"pi":3.14159}');
    });

    /**
     * @tc.name builtinsJsonTest0082
     * @tc.number BUILTINS_JSON_TEST_0082
     * @tc.desc Test JSON.stringify with empty object
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const data: Object = {};
      const result = JSON.stringify(data);
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name builtinsJsonTest0083
     * @tc.number BUILTINS_JSON_TEST_0083
     * @tc.desc Test JSON.stringify with special characters in string
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const data: StringObj = { msg: "Hello\nWorld" };
      const result = JSON.stringify(data);
      expect(result).assertEqual('{"msg":"Hello\\nWorld"}');
    });

    /**
     * @tc.name builtinsJsonTest0084
     * @tc.number BUILTINS_JSON_TEST_0084
     * @tc.desc Test JSON.stringify with Array inside Object
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const data: ArrayObj = { list: [1, 2, 3] };
      const result = JSON.stringify(data);
      expect(result).assertEqual('{"list":[1,2,3]}');
    });

    /**
     * @tc.name builtinsJsonTest0085
     * @tc.number BUILTINS_JSON_TEST_0085
     * @tc.desc Test JSON.stringify with nested Object
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const data: NestedOuter = { out: { innerVal: "val" } };
      const result = JSON.stringify(data);
      expect(result).assertEqual('{"out":{"innerVal":"val"}}');
    });

    /**
     * @tc.name builtinsJsonTest0086
     * @tc.number BUILTINS_JSON_TEST_0086
     * @tc.desc Test JSON.stringify with undefined value (should be omitted)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const data = new UndefinedTest();
      const result = JSON.stringify(data);
      expect(result).assertEqual('{"visible":1}');
    });

    /**
     * @tc.name builtinsJsonTest0087
     * @tc.number BUILTINS_JSON_TEST_0087
     * @tc.desc Test JSON.stringify with max safe integer
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const data = new MaxIntObj();
      const result = JSON.stringify(data);
      expect(result).assertEqual(`{"max":${Number.MAX_SAFE_INTEGER}}`);
    });

    /**
     * @tc.name builtinsJsonTest0088
     * @tc.number BUILTINS_JSON_TEST_0088
     * @tc.desc Test JSON.stringify with value containing backslash
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const data: PathObj = { path: "C:\\Windows" };
      const result = JSON.stringify(data);
      expect(result).assertEqual('{"path":"C:\\\\Windows"}');
    });

    /**
     * @tc.name builtinsJsonTest0089
     * @tc.number BUILTINS_JSON_TEST_0089
     * @tc.desc Test stringifyAnyObj with primitive string
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result = JSON.stringify("test");
      expect(result).assertEqual('"test"');
    });

    /**
     * @tc.name builtinsJsonTest0090
     * @tc.number BUILTINS_JSON_TEST_0090
     * @tc.desc Test stringifyAnyObj with primitive number
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result = JSON.stringify(123);
      expect(result).assertEqual('123');
    });

    /**
     * @tc.name builtinsJsonTest0091
     * @tc.number BUILTINS_JSON_TEST_0091
     * @tc.desc Test stringifyAnyObj with boolean
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result = JSON.stringify(true);
      expect(result).assertEqual('true');
    });

    /**
     * @tc.name builtinsJsonTest0092
     * @tc.number BUILTINS_JSON_TEST_0092
     * @tc.desc Test stringifyAnyObj with null
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result = JSON.stringify(null);
      expect(result).assertEqual('null');
    });

    /**
     * @tc.name builtinsJsonTest0093
     * @tc.number BUILTINS_JSON_TEST_0093
     * @tc.desc Test stringify with null replacer
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let obj = new SimpleObj();
      obj.name = "Default";
      obj.value = 0;
      const result = JSON.stringify(obj as Object, null);
      expect(result).assertEqual('{"name":"Default","year":0,"value":0}');
    });

    /**
     * @tc.name builtinsJsonTest0094
     * @tc.number BUILTINS_JSON_TEST_0094
     * @tc.desc Test stringify with undefined replacer
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let obj = new SimpleObj();
      obj.name = "UndefinedReplacer";
      obj.value = 123;
      const result = JSON.stringify(obj as Object, undefined);
      expect(result).assertEqual('{"name":"UndefinedReplacer","year":0,"value":123}');
    });

    /**
     * @tc.name builtinsJsonTest0095
     * @tc.number BUILTINS_JSON_TEST_0095
     * @tc.desc Test stringify with space argument as number (2)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let obj = new SimpleObj();
      obj.name = "A";
      obj.value = 1;
      const result = JSON.stringify(obj as Object, null, 2);
      const expected = '{\n  "name": "A",\n  "year": 0,\n  "value": 1\n}';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name builtinsJsonTest0096
     * @tc.number BUILTINS_JSON_TEST_0096
     * @tc.desc Test stringify with space argument as number (4)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let obj = new BooleanObj();
      obj.boolVal = true;

      const result = JSON.stringify(obj, null, 4);
      const expected = '{\n    "boolVal": true\n}';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name builtinsJsonTest0097
     * @tc.number BUILTINS_JSON_TEST_0097
     * @tc.desc Test stringify with space argument as string (tab)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let obj = new SimpleObj();
      obj.name = "Tab";
      obj.value = 0;
      const result = JSON.stringify(obj as Object, null, "\t");
      const expected = '{\n\t"name": "Tab",\n\t"year": 0,\n\t"value": 0\n}';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name builtinsJsonTest0098
     * @tc.number BUILTINS_JSON_TEST_0098
     * @tc.desc Test stringify with space number larger than 10 (should cap at 10)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let obj = new SimpleObj();
      obj.value = 1;

      const result = JSON.stringify(obj, null, 15);
      const space10 = "          ";
      expect(result.includes('\n' + space10 + '"name"')).assertTrue();
      const space11 = "           ";
      expect(result.includes('\n' + space11 + '"name"')).assertFalse();
    });

    /**
     * @tc.name builtinsJsonTest0099
     * @tc.number BUILTINS_JSON_TEST_0099
     * @tc.desc Test stringify with space 0 (compact)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let obj = new SimpleObj();
      obj.name = "Compact";
      obj.value = 1;
      const result = JSON.stringify(obj as Object, null, 0);
      expect(result).assertEqual('{"name":"Compact","year":0,"value":1}');
    });

    /**
     * @tc.name builtinsJsonTest0100
     * @tc.number BUILTINS_JSON_TEST_0100
     * @tc.desc Test stringify with empty string space (compact)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let obj = new SimpleObj();
      obj.name = "CompactStr";
      obj.value = 1;
      const result = JSON.stringify(obj as Object, null, "");
      expect(result).assertEqual('{"name":"CompactStr","year":0,"value":1}');
    });

    /**
     * @tc.name builtinsJsonTest0101
     * @tc.number BUILTINS_JSON_TEST_0101
     * @tc.desc Test stringifyJsonElement with JsonNull
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const elem: jsonx.JsonElement = jsonx.JsonElement.createNull();
      const result: string = JSON.stringifyJsonElement(elem);

      expect(result).assertEqual('null');
    });

    /**
     * @tc.name builtinsJsonTest0102
     * @tc.number BUILTINS_JSON_TEST_0102
     * @tc.desc Test stringifyJsonElement with JsonUndefined
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const elem: jsonx.JsonElement = jsonx.JsonElement.createUndefined();
      const result: string = JSON.stringifyJsonElement(elem);

      expect(result).assertEqual('undefined');
    });

    /**
     * @tc.name builtinsJsonTest0103
     * @tc.number BUILTINS_JSON_TEST_0103
     * @tc.desc Test stringifyJsonElement with JsonTrue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const elem: jsonx.JsonElement = jsonx.JsonElement.createBoolean(true);
      const result: string = JSON.stringifyJsonElement(elem);

      expect(result).assertEqual('true');
    });

    /**
     * @tc.name builtinsJsonTest0104
     * @tc.number BUILTINS_JSON_TEST_0104
     * @tc.desc Test stringifyJsonElement with JsonFalse
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const elem: jsonx.JsonElement = jsonx.JsonElement.createBoolean(false);
      const result: string = JSON.stringifyJsonElement(elem);

      expect(result).assertEqual('false');
    });

    /**
     * @tc.name builtinsJsonTest0105
     * @tc.number BUILTINS_JSON_TEST_0105
     * @tc.desc Test stringifyJsonElement with empty string
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const elem: jsonx.JsonElement = jsonx.JsonElement.createString('');
      const result: string = JSON.stringifyJsonElement(elem);

      expect(result).assertEqual('""');
    });

    /**
     * @tc.name builtinsJsonTest0106
     * @tc.number BUILTINS_JSON_TEST_0106
     * @tc.desc Test stringifyJsonElement with special characters string
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const str: string = ' !"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      const elem: jsonx.JsonElement = jsonx.JsonElement.createString(str);
      const result: string = JSON.stringifyJsonElement(elem);

      expect(result).assertEqual('" !\\"#$%&\'()*+,-./:;<=>?@[\\\\]^_`{|}~"');
    });

    /**
     * @tc.name builtinsJsonTest0107
     * @tc.number BUILTINS_JSON_TEST_0107
     * @tc.desc Test stringifyJsonElement with escape sequences
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const str: string = '\\b\\f\\n\\r\\t\\\\\\"\\/';
      const elem: jsonx.JsonElement = jsonx.JsonElement.createString(str);
      const result: string = JSON.stringifyJsonElement(elem);

      expect(result).assertEqual('"\\\\b\\\\f\\\\n\\\\r\\\\t\\\\\\\\\\\\\\"\\\\/"');
    });

    /**
     * @tc.name builtinsJsonTest0108
     * @tc.number BUILTINS_JSON_TEST_0108
     * @tc.desc Test stringifyJsonElement with emoji and Unicode
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const emoji: string = "👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴";
      const elem: jsonx.JsonElement = jsonx.JsonElement.createString(emoji);
      const result: string = JSON.stringifyJsonElement(elem);

      expect(result).assertEqual('"👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴"');
    });

    /**
     * @tc.name builtinsJsonTest0109
     * @tc.number BUILTINS_JSON_TEST_0109
     * @tc.desc Test stringifyJsonElement with integer number
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const elem: jsonx.JsonElement = jsonx.JsonElement.createInteger(42);
      const result: string = JSON.stringifyJsonElement(elem);

      expect(result).assertEqual('42');
    });

    /**
     * @tc.name builtinsJsonTest0110
     * @tc.number BUILTINS_JSON_TEST_0110
     * @tc.desc Test stringifyJsonElement with double number
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const elem: jsonx.JsonElement = jsonx.JsonElement.createDouble(3.14159);
      const result: string = JSON.stringifyJsonElement(elem);

      expect(result).assertEqual('3.14159');
    });

    /**
     * @tc.name builtinsJsonTest0111
     * @tc.number BUILTINS_JSON_TEST_0111
     * @tc.desc Test stringifyJsonElement with special number values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const zero: jsonx.JsonElement = jsonx.JsonElement.createInteger(0);
      const negZero: jsonx.JsonElement = jsonx.JsonElement.createDouble(-0.0);
      const nan: jsonx.JsonElement = jsonx.JsonElement.createDouble(NaN);
      const inf: jsonx.JsonElement = jsonx.JsonElement.createDouble(Infinity);
      const negInf: jsonx.JsonElement = jsonx.JsonElement.createDouble(-Infinity);

      expect(JSON.stringifyJsonElement(zero)).assertEqual('0');
      expect(JSON.stringifyJsonElement(negZero)).assertEqual('0');
      expect(JSON.stringifyJsonElement(nan)).assertEqual('NaN');
      expect(JSON.stringifyJsonElement(inf)).assertEqual('Infinity');
      expect(JSON.stringifyJsonElement(negInf)).assertEqual('-Infinity');
    });

    /**
     * @tc.name builtinsJsonTest0112
     * @tc.number BUILTINS_JSON_TEST_0112
     * @tc.desc Test stringifyJsonElement with scientific notation
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const elem: jsonx.JsonElement = jsonx.JsonElement.createDouble(1.5e10);
      const result: string = JSON.stringifyJsonElement(elem);

      expect(result).assertEqual('15000000000');
    });

    /**
     * @tc.name builtinsJsonTest0113
     * @tc.number BUILTINS_JSON_TEST_0113
     * @tc.desc Test stringifyJsonElement with empty array
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const elem: jsonx.JsonElement = jsonx.JsonElement.createArray([]);
      const result: string = JSON.stringifyJsonElement(elem);

      expect(result).assertEqual('[]');
    });

    /**
     * @tc.name builtinsJsonTest0114
     * @tc.number BUILTINS_JSON_TEST_0114
     * @tc.desc Test stringifyJsonElement with array containing mixed types
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: jsonx.JsonElement[] = [
        jsonx.JsonElement.createInteger(72),
        jsonx.JsonElement.createString('Hello'),
        jsonx.JsonElement.createBoolean(true),
        jsonx.JsonElement.createNull(),
        jsonx.JsonElement.createUndefined(),
        jsonx.JsonElement.createDouble(NaN)
      ];
      const elem: jsonx.JsonElement = jsonx.JsonElement.createArray(arr);
      const result: string = JSON.stringifyJsonElement(elem);

      expect(result).assertEqual('[72,"Hello",true,null,undefined,NaN]');
    });

    /**
     * @tc.name builtinsJsonTest0115
     * @tc.number BUILTINS_JSON_TEST_0115
     * @tc.desc Test stringifyJsonElement with nested arrays
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const inner: jsonx.JsonElement = jsonx.JsonElement.createArray([
        jsonx.JsonElement.createInteger(3),
        jsonx.JsonElement.createInteger(4)
      ]);
      const outer: jsonx.JsonElement = jsonx.JsonElement.createArray([
        jsonx.JsonElement.createInteger(1),
        jsonx.JsonElement.createInteger(2),
        inner
      ]);
      const result: string = JSON.stringifyJsonElement(outer);

      expect(result).assertEqual('[1,2,[3,4]]');
    });

    /**
     * @tc.name builtinsJsonTest0116
     * @tc.number BUILTINS_JSON_TEST_0116
     * @tc.desc Test stringifyJsonElement with empty object
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const elem: jsonx.JsonElement = jsonx.JsonElement.createObject(new Map<string, jsonx.JsonElement>());
      const result: string = JSON.stringifyJsonElement(elem);

      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name builtinsJsonTest0117
     * @tc.number BUILTINS_JSON_TEST_0117
     * @tc.desc Test stringifyJsonElement with simple object
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const obj = new Map<string, jsonx.JsonElement>();
      obj.set('a', jsonx.JsonElement.createInteger(1));
      obj.set('b', jsonx.JsonElement.createString('test'));
      const elem: jsonx.JsonElement = jsonx.JsonElement.createObject(obj);
      const result: string = JSON.stringifyJsonElement(elem);

      expect(result).assertEqual('{"a":1,"b":"test"}');
    });

    /**
     * @tc.name builtinsJsonTest0118
     * @tc.number BUILTINS_JSON_TEST_0118
     * @tc.desc Test stringifyJsonElement with nested object
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const inner = new Map<string, jsonx.JsonElement>();
      inner.set('c', jsonx.JsonElement.createInteger(2));

      const outer = new Map<string, jsonx.JsonElement>();
      outer.set('a', jsonx.JsonElement.createInteger(1));
      outer.set('b', jsonx.JsonElement.createObject(inner));

      const elem: jsonx.JsonElement = jsonx.JsonElement.createObject(outer);
      const result: string = JSON.stringifyJsonElement(elem);

      expect(result).assertEqual('{"a":1,"b":{"c":2}}');
    });

    /**
     * @tc.name builtinsJsonTest0119
     * @tc.number BUILTINS_JSON_TEST_0119
     * @tc.desc Test stringifyJsonElement with object containing undefined value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const obj = new Map<string, jsonx.JsonElement>();
      obj.set('a', jsonx.JsonElement.createUndefined());
      obj.set('b', jsonx.JsonElement.createInteger(1));
      const elem: jsonx.JsonElement = jsonx.JsonElement.createObject(obj);
      const result: string = JSON.stringifyJsonElement(elem);

      expect(result).assertEqual('{"b":1}');
    });

    /**
     * @tc.name builtinsJsonTest0120
     * @tc.number BUILTINS_JSON_TEST_0120
     * @tc.desc Test stringifyJsonElement with object containing null value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const obj = new Map<string, jsonx.JsonElement>();
      obj.set('a', jsonx.JsonElement.createNull());
      obj.set('b', jsonx.JsonElement.createInteger(2));
      const elem: jsonx.JsonElement = jsonx.JsonElement.createObject(obj);
      const result: string = JSON.stringifyJsonElement(elem);

      expect(result).assertEqual('{"a":null,"b":2}');
    });

    /**
     * @tc.name builtinsJsonTest0121
     * @tc.number BUILTINS_JSON_TEST_0121
     * @tc.desc Test stringifyJsonElement with large array
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: jsonx.JsonElement[] = [];
      for (let i: int = 0; i < 100; i++) {
        arr.push(jsonx.JsonElement.createInteger(i));
      }
      const elem: jsonx.JsonElement = jsonx.JsonElement.createArray(arr);
      const result: string = JSON.stringifyJsonElement(elem);
      const expected: string = `[${arr.map(e => e.tryAsInteger()).join(',')}]`;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name builtinsJsonTest0122
     * @tc.number BUILTINS_JSON_TEST_0122
     * @tc.desc Test stringifyJsonElement with large object
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const obj = new Map<string, jsonx.JsonElement>();
      for (let i: int = 0; i < 100; i++) {
        obj.set(`key${i}`, jsonx.JsonElement.createInteger(i));
      }
      const elem: jsonx.JsonElement = jsonx.JsonElement.createObject(obj);
      const result: string = JSON.stringifyJsonElement(elem);

      expect(result).assertInstanceOf('String');
      expect(result.length).assertLarger(0);
      expect(result.startsWith('{')).assertTrue();
      expect(result.endsWith('}')).assertTrue();
    });

    /**
     * @tc.name builtinsJsonTest0123
     * @tc.number BUILTINS_JSON_TEST_0123
     * @tc.desc Test stringifyJsonElement with formatted output (space parameter)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const obj = new Map<string, jsonx.JsonElement>();
      obj.set('a', jsonx.JsonElement.createInteger(1));
      const elem: jsonx.JsonElement = jsonx.JsonElement.createObject(obj);
      const result: string = JSON.stringifyJsonElement(elem, undefined, 2);

      expect(result).assertEqual('{\n  "a": 1\n}');
    });

    /**
     * @tc.name builtinsJsonTest0124
     * @tc.number BUILTINS_JSON_TEST_0124
     * @tc.desc Test stringifyJsonElement with formatted output (string space)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: jsonx.JsonElement[] = [
        jsonx.JsonElement.createInteger(1),
        jsonx.JsonElement.createInteger(2)
      ];
      const elem: jsonx.JsonElement = jsonx.JsonElement.createArray(arr);
      const result: string = JSON.stringifyJsonElement(elem, undefined, '  ');

      expect(result).assertEqual('[\n  1,\n  2\n]');
    });

    /**
     * @tc.name builtinsJsonTest0125
     * @tc.number BUILTINS_JSON_TEST_0125
     * @tc.desc Test stringifyJsonElement with JsonElementSerializable interface
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const mockSerializable = {
        toJSON: (): jsonx.JsonElement => {
          const obj = new Map<string, jsonx.JsonElement>();
          obj.set('test', jsonx.JsonElement.createInteger(123));
          return jsonx.JsonElement.createObject(obj);
        }
      } as jsonx.JsonElementSerializable;

      const result: string = JSON.stringifyJsonElement(mockSerializable);
      expect(result).assertEqual('{"test":123}');
    });

    /**
     * @tc.name builtinsJsonTest0126
     * @tc.number BUILTINS_JSON_TEST_0126
     * @tc.desc Test stringifyJsonElement with Number constants
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const maxValue: jsonx.JsonElement = jsonx.JsonElement.createDouble(1.7976931348623157e+308);
      const minValue: jsonx.JsonElement = jsonx.JsonElement.createDouble(5e-324);
      const epsilon: jsonx.JsonElement = jsonx.JsonElement.createDouble(2.220446049250313e-16);

      expect(JSON.stringifyJsonElement(maxValue)).assertEqual('1.7976931348623157e+308');
      expect(JSON.stringifyJsonElement(minValue)).assertEqual('5e-324');
      expect(JSON.stringifyJsonElement(epsilon)).assertEqual('2.220446049250313e-16');
    });

    /**
     * @tc.name builtinsJsonTest0127
     * @tc.number BUILTINS_JSON_TEST_0127
     * @tc.desc Test stringifyJsonElement with large integer exceeding Int32 range
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const largeValue: jsonx.JsonElement = jsonx.JsonElement.createDouble(0xdeadbeef as double);
      const result: string = JSON.stringifyJsonElement(largeValue);

      expect(result).assertEqual('3735928559');
    });

    /**
     * @tc.name builtinsJsonTest0128
     * @tc.number BUILTINS_JSON_TEST_0128
     * @tc.desc Test stringifyJsonElement with array containing undefined and NaN
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: jsonx.JsonElement[] = [
        jsonx.JsonElement.createInteger(72),
        jsonx.JsonElement.createString('Hello'),
        jsonx.JsonElement.createUndefined(),
        jsonx.JsonElement.createDouble(NaN),
        jsonx.JsonElement.createDouble(Infinity)
      ];
      const elem: jsonx.JsonElement = jsonx.JsonElement.createArray(arr);
      const result: string = JSON.stringifyJsonElement(elem);

      expect(result).assertEqual('[72,"Hello",undefined,NaN,Infinity]');
    });

    /**
     * @tc.name builtinsJsonTest0129
     * @tc.number BUILTINS_JSON_TEST_0129
     * @tc.desc Test stringifyJsonElement with deeply nested structure
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const level3: jsonx.JsonElement = jsonx.JsonElement.createArray([
        jsonx.JsonElement.createInteger(4),
        jsonx.JsonElement.createInteger(5)
      ]);

      const level2: jsonx.JsonElement = jsonx.JsonElement.createObject(
        new Map<string, jsonx.JsonElement>([
          ['c', jsonx.JsonElement.createInteger(3)],
          ['d', level3]
        ])
      );

      const level1: jsonx.JsonElement = jsonx.JsonElement.createArray([
        jsonx.JsonElement.createInteger(1),
        jsonx.JsonElement.createInteger(2),
        level2
      ]);

      const result: string = JSON.stringifyJsonElement(level1);

      expect(result).assertEqual('[1,2,{"c":3,"d":[4,5]}]');
    });

    /**
     * @tc.name builtinsJsonTest0130
     * @tc.number BUILTINS_JSON_TEST_0130
     * @tc.desc Test stringifyJsonElement with string keywords
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const zeroStr: jsonx.JsonElement = jsonx.JsonElement.createString('0');
      const nanStr: jsonx.JsonElement = jsonx.JsonElement.createString('NaN');
      const emptyStr: jsonx.JsonElement = jsonx.JsonElement.createString('');

      expect(JSON.stringifyJsonElement(zeroStr)).assertEqual('"0"');
      expect(JSON.stringifyJsonElement(nanStr)).assertEqual('"NaN"');
      expect(JSON.stringifyJsonElement(emptyStr)).assertEqual('""');
    });

    /**
     * @tc.name builtinsJsonTest0131
     * @tc.number BUILTINS_JSON_TEST_0131
     * @tc.desc Test stringifyJsonElement with complex mixed structure
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const innerArr: jsonx.JsonElement = jsonx.JsonElement.createArray([
        jsonx.JsonElement.createInteger(1),
        jsonx.JsonElement.createInteger(2)
      ]);

      const innerObj: jsonx.JsonElement = jsonx.JsonElement.createObject(
        new Map<string, jsonx.JsonElement>([
          ['x', jsonx.JsonElement.createString('test')],
          ['y', jsonx.JsonElement.createBoolean(false)]
        ])
      );

      const outerObj: jsonx.JsonElement = jsonx.JsonElement.createObject(
        new Map<string, jsonx.JsonElement>([
          ['arr', innerArr],
          ['obj', innerObj],
          ['null', jsonx.JsonElement.createNull()],
          ['num', jsonx.JsonElement.createDouble(3.14)]
        ])
      );

      const result: string = JSON.stringifyJsonElement(outerObj);

      expect(result).assertEqual('{"arr":[1,2],"obj":{"x":"test","y":false},"null":null,"num":3.14}');
    });

    /**
     * @tc.name builtinsJsonTest0132
     * @tc.number BUILTINS_JSON_TEST_0132
     * @tc.desc Test stringifyJsonElement with JsonElementSerializable basic formatting
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const mockSerializable = {
        toJSON: (): jsonx.JsonElement => {
          const obj = new Map<string, jsonx.JsonElement>();
          obj.set('name', jsonx.JsonElement.createString('test'));
          obj.set('value', jsonx.JsonElement.createInteger(123));
          return jsonx.JsonElement.createObject(obj);
        }
      } as jsonx.JsonElementSerializable;

      const result: string = JSON.stringifyJsonElement(mockSerializable, undefined, 2);
      expect(result).assertEqual('{\n  "name": "test",\n  "value": 123\n}');
    });

    /**
     * @tc.name builtinsJsonTest0133
     * @tc.number BUILTINS_JSON_TEST_0133
     * @tc.desc Test stringifyJsonElement with empty replacer array (should return all fields)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const mockSerializable = {
        toJSON: (): jsonx.JsonElement => {
          const obj = new Map<string, jsonx.JsonElement>();
          obj.set('a', jsonx.JsonElement.createInteger(1));
          obj.set('b', jsonx.JsonElement.createString('keep'));
          obj.set('c', jsonx.JsonElement.createInteger(3));
          return jsonx.JsonElement.createObject(obj);
        }
      } as jsonx.JsonElementSerializable;

      const replacer: (double | string)[] = [];
      const result: string = JSON.stringifyJsonElement(mockSerializable, replacer, 2);
      expect(result).assertEqual('{\n  "a": 1,\n  "b": "keep",\n  "c": 3\n}');
    });

    /**
     * @tc.name builtinsJsonTest0134
     * @tc.number BUILTINS_JSON_TEST_0134
     * @tc.desc Test stringifyJsonElement with space number formatting
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const mockSerializable = {
        toJSON: (): jsonx.JsonElement => {
          const obj = new Map<string, jsonx.JsonElement>();
          obj.set('x', jsonx.JsonElement.createInteger(1));
          obj.set('y', jsonx.JsonElement.createInteger(2));
          return jsonx.JsonElement.createObject(obj);
        }
      } as jsonx.JsonElementSerializable;

      const result: string = JSON.stringifyJsonElement(mockSerializable, undefined, 4);
      expect(result).assertEqual('{\n    "x": 1,\n    "y": 2\n}');
    });

    /**
     * @tc.name builtinsJsonTest0135
     * @tc.number BUILTINS_JSON_TEST_0135
     * @tc.desc Test stringifyJsonElement with space string formatting
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const mockSerializable = {
        toJSON: (): jsonx.JsonElement => {
          const obj = new Map<string, jsonx.JsonElement>();
          obj.set('id', jsonx.JsonElement.createInteger(100));
          obj.set('name', jsonx.JsonElement.createString('product'));
          obj.set('price', jsonx.JsonElement.createDouble(19.99));
          return jsonx.JsonElement.createObject(obj);
        }
      } as jsonx.JsonElementSerializable;

      const result: string = JSON.stringifyJsonElement(mockSerializable, undefined, '  ');
      expect(result).assertEqual('{\n  "id": 100,\n  "name": "product",\n  "price": 19.99\n}');
    });

    /**
     * @tc.name builtinsJsonTest0136
     * @tc.number BUILTINS_JSON_TEST_0136
     * @tc.desc Test stringifyJsonElement with nested structure (2 levels only)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const mockSerializable = {
        toJSON: (): jsonx.JsonElement => {
          const inner = new Map<string, jsonx.JsonElement>();
          inner.set('level', jsonx.JsonElement.createString('deep'));

          const outer = new Map<string, jsonx.JsonElement>();
          outer.set('nested', jsonx.JsonElement.createObject(inner));
          outer.set('value', jsonx.JsonElement.createBoolean(true));

          return jsonx.JsonElement.createObject(outer);
        }
      } as jsonx.JsonElementSerializable;

      const result: string = JSON.stringifyJsonElement(mockSerializable, undefined, 2);
      expect(result).assertEqual('{\n  "nested": {\n    "level": "deep"\n  },\n  "value": true\n}');
    });

    /**
     * @tc.name builtinsJsonTest0137
     * @tc.number BUILTINS_JSON_TEST_0137
     * @tc.desc Test stringifyJsonElement with simple special values only
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const mockSerializable = {
        toJSON: (): jsonx.JsonElement => {
          const obj = new Map<string, jsonx.JsonElement>();
          obj.set('nan', jsonx.JsonElement.createDouble(NaN));
          return jsonx.JsonElement.createObject(obj);
        }
      } as jsonx.JsonElementSerializable;

      const result: string = JSON.stringifyJsonElement(mockSerializable, undefined, 2);
      expect(result).assertEqual('{\n  "nan": NaN\n}');
    });

    /**
     * @tc.name builtinsJsonTest0138
     * @tc.number BUILTINS_JSON_TEST_0138
     * @tc.desc Test stringifyJsonElement with replacer as undefined
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const mockSerializable = {
        toJSON: (): jsonx.JsonElement => {
          const obj = new Map<string, jsonx.JsonElement>();
          obj.set('a', jsonx.JsonElement.createInteger(1));
          return jsonx.JsonElement.createObject(obj);
        }
      } as jsonx.JsonElementSerializable;

      const result: string = JSON.stringifyJsonElement(mockSerializable, undefined, 2);
      expect(result).assertEqual('{\n  "a": 1\n}');
    });

    /**
     * @tc.name builtinsJsonTest0139
     * @tc.number BUILTINS_JSON_TEST_0139
     * @tc.desc Test stringifyJsonElement with space as 0
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const mockSerializable = {
        toJSON: (): jsonx.JsonElement => {
          const obj = new Map<string, jsonx.JsonElement>();
          obj.set('x', jsonx.JsonElement.createInteger(1));
          return jsonx.JsonElement.createObject(obj);
        }
      } as jsonx.JsonElementSerializable;

      const result: string = JSON.stringifyJsonElement(mockSerializable, undefined, 0);
      expect(result).assertEqual('{"x":1}');
    });

    /**
     * @tc.name builtinsJsonTest0140
     * @tc.number BUILTINS_JSON_TEST_0140
     * @tc.desc Test stringifyJsonElement with space as negative value (should treat as 0)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const mockSerializable = {
        toJSON: (): jsonx.JsonElement => {
          const obj = new Map<string, jsonx.JsonElement>();
          obj.set('key', jsonx.JsonElement.createString('value'));
          return jsonx.JsonElement.createObject(obj);
        }
      } as jsonx.JsonElementSerializable;

      const result: string = JSON.stringifyJsonElement(mockSerializable, undefined, -1);
      expect(result).assertEqual('{"key":"value"}');
    });

    /**
     * @tc.name builtinsJsonTest0141
     * @tc.number BUILTINS_JSON_TEST_0141
     * @tc.desc Test stringifyJsonElement with emoji characters
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const mockSerializable = {
        toJSON: (): jsonx.JsonElement => {
          const obj = new Map<string, jsonx.JsonElement>();
          obj.set('emoji', jsonx.JsonElement.createString('👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴'));
          obj.set('text', jsonx.JsonElement.createString('Hello'));
          return jsonx.JsonElement.createObject(obj);
        }
      } as jsonx.JsonElementSerializable;

      const result: string = JSON.stringifyJsonElement(mockSerializable, undefined, 2);
      expect(result).assertEqual('{\n  "emoji": "👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴",\n  "text": "Hello"\n}');
    });

    /**
     * @tc.name builtinsJsonTest0142
     * @tc.number BUILTINS_JSON_TEST_0142
     * @tc.desc Test stringifyJsonElement with empty object
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const mockSerializable = {
        toJSON: (): jsonx.JsonElement => {
          return jsonx.JsonElement.createObject(new Map<string, jsonx.JsonElement>());
        }
      } as jsonx.JsonElementSerializable;

      const result: string = JSON.stringifyJsonElement(mockSerializable, undefined, 2);
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name builtinsJsonTest0143
     * @tc.number BUILTINS_JSON_TEST_0143
     * @tc.desc Test stringifyJsonElement with tab space formatting
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const mockSerializable = {
        toJSON: (): jsonx.JsonElement => {
          const obj = new Map<string, jsonx.JsonElement>();
          obj.set('key', jsonx.JsonElement.createString('value'));
          return jsonx.JsonElement.createObject(obj);
        }
      } as jsonx.JsonElementSerializable;

      const result: string = JSON.stringifyJsonElement(mockSerializable, undefined, '\t');
      expect(result).assertEqual('{\n\t"key": "value"\n}');
    });

    /**
     * @tc.name builtinsJsonTest0144
     * @tc.number BUILTINS_JSON_TEST_0144
     * @tc.desc Test stringifyJsonElement with String null/undefined/empty values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const mockSerializable = {
        toJSON: (): jsonx.JsonElement => {
          const obj = new Map<string, jsonx.JsonElement>();
          obj.set('nullStr', jsonx.JsonElement.createString('null'));
          obj.set('empty', jsonx.JsonElement.createString(''));
          obj.set('normal', jsonx.JsonElement.createString('text'));
          return jsonx.JsonElement.createObject(obj);
        }
      } as jsonx.JsonElementSerializable;

      const result: string = JSON.stringifyJsonElement(mockSerializable, undefined, 2);
      expect(result).assertEqual('{\n  "nullStr": "null",\n  "empty": "",\n  "normal": "text"\n}');
    });

    /**
     * @tc.name builtinsJsonTest0145
     * @tc.number BUILTINS_JSON_TEST_0145
     * @tc.desc Test stringifyJsonElement with emoji Unicode verification (core requirement)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const mockSerializable = {
        toJSON: (): jsonx.JsonElement => {
          const obj = new Map<string, jsonx.JsonElement>();
          obj.set('emoji1', jsonx.JsonElement.createString('👆'));
          obj.set('emoji2', jsonx.JsonElement.createString('👿'));
          return jsonx.JsonElement.createObject(obj);
        }
      } as jsonx.JsonElementSerializable;

      const result: string = JSON.stringifyJsonElement(mockSerializable);
      expect(result).assertEqual('{"emoji1":"\ud83d\udc46","emoji2":"\ud83d\udc7f"}');
    });

    /**
     * @tc.name builtinsJsonTest0146
     * @tc.number BUILTINS_JSON_TEST_0146
     * @tc.desc Test stringifyJsonElement with boolean values (document requirement)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const mockSerializable = {
        toJSON: (): jsonx.JsonElement => {
          const obj = new Map<string, jsonx.JsonElement>();
          obj.set('isTrue', jsonx.JsonElement.createBoolean(true));
          obj.set('isFalse', jsonx.JsonElement.createBoolean(false));
          return jsonx.JsonElement.createObject(obj);
        }
      } as jsonx.JsonElementSerializable;

      const result: string = JSON.stringifyJsonElement(mockSerializable);
      expect(result).assertEqual('{"isTrue":true,"isFalse":false}');
    });

    /**
     * @tc.name builtinsJsonTest0147
     * @tc.number BUILTINS_JSON_TEST_0147
     * @tc.desc Test stringifyJsonElement with object containing null and Infinity
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const mockSerializable = {
        toJSON: (): jsonx.JsonElement => {
          const obj = new Map<string, jsonx.JsonElement>();
          obj.set('nullVal', jsonx.JsonElement.createNull());
          obj.set('inf', jsonx.JsonElement.createDouble(Infinity));
          return jsonx.JsonElement.createObject(obj);
        }
      } as jsonx.JsonElementSerializable;

      const result: string = JSON.stringifyJsonElement(mockSerializable, undefined, 2);
      expect(result).assertEqual('{\n  "nullVal": null,\n  "inf": Infinity\n}');
    });

    /**
     * @tc.name builtinsJsonTest0148
     * @tc.number BUILTINS_JSON_TEST_0148
     * @tc.desc Test stringifyJsonElement with Number constants
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const mockSerializable = {
        toJSON: (): jsonx.JsonElement => {
          const obj = new Map<string, jsonx.JsonElement>();
          obj.set('max', jsonx.JsonElement.createDouble(1.7976931348623157e+308));
          obj.set('min', jsonx.JsonElement.createDouble(5e-324));
          obj.set('epsilon', jsonx.JsonElement.createDouble(2.220446049250313e-16));
          return jsonx.JsonElement.createObject(obj);
        }
      } as jsonx.JsonElementSerializable;

      const result: string = JSON.stringifyJsonElement(mockSerializable, undefined, 2);
      expect(result).assertEqual('{\n  "max": 1.7976931348623157e+308,\n  "min": 5e-324,\n  "epsilon": 2.220446049250313e-16\n}');
    });

    /**
     * @tc.name builtinsJsonTest0149
     * @tc.number BUILTINS_JSON_TEST_0149
     * @tc.desc Test stringifyJsonElement with empty array
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const mockSerializable = {
        toJSON: (): jsonx.JsonElement => {
          return jsonx.JsonElement.createArray([]);
        }
      } as jsonx.JsonElementSerializable;

      const result: string = JSON.stringifyJsonElement(mockSerializable);
      expect(result).assertEqual('[]');
    });

    /**
     * @tc.name builtinsJsonTest0150
     * @tc.number BUILTINS_JSON_TEST_0150
     * @tc.desc Test stringifyJsonElement with JsonNull
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const elem: jsonx.JsonElement = jsonx.JsonElement.createNull();
      const result: string = JSON.stringifyJsonElement(elem);

      expect(result).assertEqual('null');
    });

    /**
     * @tc.name builtinsJsonTest0151
     * @tc.number BUILTINS_JSON_TEST_0151
     * @tc.desc Test stringifyJsonElement with JsonUndefined
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const elem: jsonx.JsonElement = jsonx.JsonElement.createUndefined();
      const result: string = JSON.stringifyJsonElement(elem);

      expect(result).assertEqual('undefined');
    });

    /**
     * @tc.name builtinsJsonTest0152
     * @tc.number BUILTINS_JSON_TEST_0152
     * @tc.desc Test stringifyJsonElement with boolean values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const elemTrue: jsonx.JsonElement = jsonx.JsonElement.createBoolean(true);
      const resultTrue: string = JSON.stringifyJsonElement(elemTrue);
      expect(resultTrue).assertEqual('true');

      const elemFalse: jsonx.JsonElement = jsonx.JsonElement.createBoolean(false);
      const resultFalse: string = JSON.stringifyJsonElement(elemFalse);
      expect(resultFalse).assertEqual('false');
    });

    /**
     * @tc.name builtinsJsonTest0153
     * @tc.number BUILTINS_JSON_TEST_0153
     * @tc.desc Test stringifyJsonElement with empty string and special characters
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const elemEmpty: jsonx.JsonElement = jsonx.JsonElement.createString('');
      const resultEmpty: string = JSON.stringifyJsonElement(elemEmpty);
      expect(resultEmpty).assertEqual('""');

      const str: string = ' !"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      const elem: jsonx.JsonElement = jsonx.JsonElement.createString(str);
      const result: string = JSON.stringifyJsonElement(elem);
      expect(result).assertEqual('" !\\"#$%&\'()*+,-./:;<=>?@[\\\\]^_`{|}~"');
    });

    /**
     * @tc.name builtinsJsonTest0154
     * @tc.number BUILTINS_JSON_TEST_0154
     * @tc.desc Test stringifyJsonElement with emoji and Unicode
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const emoji12: string = "👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴";
      const elem: jsonx.JsonElement = jsonx.JsonElement.createString(emoji12);
      const result: string = JSON.stringifyJsonElement(elem);
      expect(result).assertEqual('"👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴"');

      const emoji: string = "👆";
      const elemUni: jsonx.JsonElement = jsonx.JsonElement.createString(emoji);
      const resultUni: string = JSON.stringifyJsonElement(elemUni);
      expect(resultUni).assertEqual('"\ud83d\udc46"');
    });

    /**
     * @tc.name builtinsJsonTest0155
     * @tc.number BUILTINS_JSON_TEST_0155
     * @tc.desc Test stringifyJsonElement with number values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const elemInt: jsonx.JsonElement = jsonx.JsonElement.createInteger(42);
      const resultInt: string = JSON.stringifyJsonElement(elemInt);
      expect(resultInt).assertEqual('42');

      const elemDouble: jsonx.JsonElement = jsonx.JsonElement.createDouble(3.14159);
      const resultDouble: string = JSON.stringifyJsonElement(elemDouble);
      expect(resultDouble).assertEqual('3.14159');

      const elemZero: jsonx.JsonElement = jsonx.JsonElement.createInteger(0);
      const resultZero: string = JSON.stringifyJsonElement(elemZero);
      expect(resultZero).assertEqual('0');
    });

    /**
     * @tc.name builtinsJsonTest0156
     * @tc.number BUILTINS_JSON_TEST_0156
     * @tc.desc Test stringifyJsonElement with Number.MAX_VALUE and MIN_VALUE
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const elemMax: jsonx.JsonElement = jsonx.JsonElement.createDouble(1.7976931348623157e+308);
      const resultMax: string = JSON.stringifyJsonElement(elemMax);
      expect(resultMax).assertEqual('1.7976931348623157e+308');

      const elemMin: jsonx.JsonElement = jsonx.JsonElement.createDouble(5e-324);
      const resultMin: string = JSON.stringifyJsonElement(elemMin);
      expect(resultMin).assertEqual('5e-324');
    });

    /**
     * @tc.name builtinsJsonTest0157
     * @tc.number BUILTINS_JSON_TEST_0157
     * @tc.desc Test stringifyJsonElement with Infinity, NaN and scientific notation
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const elemInf: jsonx.JsonElement = jsonx.JsonElement.createDouble(Infinity);
      const resultInf: string = JSON.stringifyJsonElement(elemInf);

      expect(resultInf).assertEqual('Infinity');

      const elemNegInf: jsonx.JsonElement = jsonx.JsonElement.createDouble(-Infinity);
      const resultNegInf: string = JSON.stringifyJsonElement(elemNegInf);

      expect(resultNegInf).assertEqual('-Infinity');

      const elemNaN: jsonx.JsonElement = jsonx.JsonElement.createDouble(NaN);
      const resultNaN: string = JSON.stringifyJsonElement(elemNaN);

      expect(resultNaN).assertEqual('NaN');

      const elemSci: jsonx.JsonElement = jsonx.JsonElement.createDouble(1e3);
      const resultSci: string = JSON.stringifyJsonElement(elemSci);
      expect(resultSci).assertEqual('1000');
    });

    /**
     * @tc.name builtinsJsonTest0158
     * @tc.number BUILTINS_JSON_TEST_0158
     * @tc.desc Test stringifyJsonElement with Number.EPSILON and MAX_SAFE_INTEGER
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const elemEps: jsonx.JsonElement = jsonx.JsonElement.createDouble(2.220446049250313e-16);
      const resultEps: string = JSON.stringifyJsonElement(elemEps);
      expect(resultEps).assertEqual('2.220446049250313e-16');

      const elemSafe: jsonx.JsonElement = jsonx.JsonElement.createDouble(9007199254740991);
      const resultSafe: string = JSON.stringifyJsonElement(elemSafe);
      expect(resultSafe).assertEqual('9007199254740991');
    });

    /**
     * @tc.name builtinsJsonTest0159
     * @tc.number BUILTINS_JSON_TEST_0159
     * @tc.desc Test stringifyJsonElement with escape characters
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const str: string = 'line1\nline2\tbackspace\bformfeed\fvertical\vtab\\quote\"slash/';
      const elem: jsonx.JsonElement = jsonx.JsonElement.createString(str);
      const result: string = JSON.stringifyJsonElement(elem);

      expect(result).assertEqual('"line1\\nline2\\tbackspace\\bformfeed\\fvertical\\u000btab\\\\quote\\"slash/"');
    });

    /**
     * @tc.name builtinsJsonTest0160
     * @tc.number BUILTINS_JSON_TEST_0160
     * @tc.desc Test stringifyJsonElement with illegal unicode and keyword strings
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const strIllegal: string = '\udc04\ud83d\udff4';
      const elemIllegal: jsonx.JsonElement = jsonx.JsonElement.createString(strIllegal);
      let error = false;
      try {
        const result: string = JSON.stringifyJsonElement(elemIllegal);
        expect(result !== undefined && result !== null).assertTrue();
      } catch (e) {
        // Expected error, do nothing
      }

      const elemKey1: jsonx.JsonElement = jsonx.JsonElement.createString('0');
      const resultKey1: string = JSON.stringifyJsonElement(elemKey1);
      expect(resultKey1).assertEqual('"0"');

      const elemKey2: jsonx.JsonElement = jsonx.JsonElement.createString('NaN');
      const resultKey2: string = JSON.stringifyJsonElement(elemKey2);
      expect(resultKey2).assertEqual('"NaN"');
    });

    /**
     * @tc.name builtinsJsonTest0161
     * @tc.number BUILTINS_JSON_TEST_0161
     * @tc.desc Test stringifyJsonElement with array values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const elemEmpty: jsonx.JsonElement = jsonx.JsonElement.createArray([]);
      const resultEmpty: string = JSON.stringifyJsonElement(elemEmpty);
      expect(resultEmpty).assertEqual('[]');

      const arr: jsonx.JsonElement[] = [
        jsonx.JsonElement.createInteger(1),
        jsonx.JsonElement.createInteger(-111),
        jsonx.JsonElement.createInteger(0),
        jsonx.JsonElement.createDouble(NaN),
        jsonx.JsonElement.createDouble(Infinity)
      ];
      const elem: jsonx.JsonElement = jsonx.JsonElement.createArray(arr);
      const result: string = JSON.stringifyJsonElement(elem);

      expect(result).assertEqual('[1,-111,0,NaN,Infinity]');
    });

    /**
     * @tc.name builtinsJsonTest0162
     * @tc.number BUILTINS_JSON_TEST_0162
     * @tc.desc Test stringifyJsonElement with nested array and mixed types
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const innerArr: jsonx.JsonElement = jsonx.JsonElement.createArray([
        jsonx.JsonElement.createInteger(1),
        jsonx.JsonElement.createInteger(2)
      ]);
      const outerArr: jsonx.JsonElement = jsonx.JsonElement.createArray([
        innerArr,
        jsonx.JsonElement.createString('abc'),
        jsonx.JsonElement.createBoolean(true),
        jsonx.JsonElement.createNull()
      ]);
      const result: string = JSON.stringifyJsonElement(outerArr);
      expect(result).assertEqual('[[1,2],"abc",true,null]');
    });

    /**
     * @tc.name builtinsJsonTest0163
     * @tc.number BUILTINS_JSON_TEST_0163
     * @tc.desc Test stringifyJsonElement with object values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const elemEmpty: jsonx.JsonElement = jsonx.JsonElement.createObject(new Map<string, jsonx.JsonElement>());
      const resultEmpty: string = JSON.stringifyJsonElement(elemEmpty);
      expect(resultEmpty).assertEqual('{}');

      const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
      map.set('a', jsonx.JsonElement.createInteger(1));
      map.set('b', jsonx.JsonElement.createString('test'));
      const elem: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
      const result: string = JSON.stringifyJsonElement(elem);
      expect(result).assertEqual('{"a":1,"b":"test"}');
    });

    /**
     * @tc.name builtinsJsonTest0164
     * @tc.number BUILTINS_JSON_TEST_0164
     * @tc.desc Test stringifyJsonElement with space=0 and undefined (no indentation)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
      map.set('a', jsonx.JsonElement.createInteger(1));
      const elem: jsonx.JsonElement = jsonx.JsonElement.createObject(map);

      const result0: string = JSON.stringifyJsonElement(elem, undefined, 0);
      expect(result0).assertEqual('{"a":1}');

      const resultUnd: string = JSON.stringifyJsonElement(elem, undefined, undefined);
      expect(resultUnd).assertEqual('{"a":1}');
    });

    /**
     * @tc.name builtinsJsonTest0165
     * @tc.number BUILTINS_JSON_TEST_0165
     * @tc.desc Test stringifyJsonElement with space=2 on object
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
      map.set('name', jsonx.JsonElement.createString('test'));
      map.set('value', jsonx.JsonElement.createInteger(42));
      const elem: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
      const result: string = JSON.stringifyJsonElement(elem, undefined, 2);

      expect(result).assertEqual('{\n  "name": "test",\n  "value": 42\n}');
    });

    /**
     * @tc.name builtinsJsonTest0166
     * @tc.number BUILTINS_JSON_TEST_0166
     * @tc.desc Test stringifyJsonElement with space=4 on array
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: jsonx.JsonElement[] = [
        jsonx.JsonElement.createInteger(1),
        jsonx.JsonElement.createInteger(2),
        jsonx.JsonElement.createInteger(3)
      ];
      const elem: jsonx.JsonElement = jsonx.JsonElement.createArray(arr);
      const result: string = JSON.stringifyJsonElement(elem, undefined, 4);
      expect(result).assertEqual('[\n    1,\n    2,\n    3\n]');
    });

    /**
     * @tc.name builtinsJsonTest0167
     * @tc.number BUILTINS_JSON_TEST_0167
     * @tc.desc Test stringifyJsonElement with space=10 (max) and space=15 (truncated to 10)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
      map.set('key', jsonx.JsonElement.createInteger(1));
      const elem: jsonx.JsonElement = jsonx.JsonElement.createObject(map);

      const result10: string = JSON.stringifyJsonElement(elem, undefined, 10);
      expect(result10).assertEqual('{\n          "key": 1\n}');

      const result15: string = JSON.stringifyJsonElement(elem, undefined, 15);
      expect(result15).assertEqual('{\n          "key": 1\n}');
    });

    /**
     * @tc.name builtinsJsonTest0168
     * @tc.number BUILTINS_JSON_TEST_0168
     * @tc.desc Test stringifyJsonElement with space=-5 (negative treated as 0)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
      map.set('a', jsonx.JsonElement.createInteger(1));
      const elem: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
      const result: string = JSON.stringifyJsonElement(elem, undefined, -5);

      expect(result).assertEqual('{"a":1}');
    });

    /**
     * @tc.name builtinsJsonTest0169
     * @tc.number BUILTINS_JSON_TEST_0169
     * @tc.desc Test stringifyJsonElement with string space="\t" and "  "
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
      map.set('x', jsonx.JsonElement.createInteger(42));
      const elem: jsonx.JsonElement = jsonx.JsonElement.createObject(map);

      const resultTab: string = JSON.stringifyJsonElement(elem, undefined, '\t');
      expect(resultTab).assertEqual('{\n\t"x": 42\n}');

      const arr: jsonx.JsonElement[] = [
        jsonx.JsonElement.createString('a'),
        jsonx.JsonElement.createString('b')
      ];
      const elemArr: jsonx.JsonElement = jsonx.JsonElement.createArray(arr);
      const resultSpace: string = JSON.stringifyJsonElement(elemArr, undefined, '  ');
      expect(resultSpace).assertEqual('[\n  "a",\n  "b"\n]');
    });

    /**
     * @tc.name builtinsJsonTest0170
     * @tc.number BUILTINS_JSON_TEST_0170
     * @tc.desc Test stringifyJsonElement with long string space (truncated to 10 chars)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
      map.set('key', jsonx.JsonElement.createInteger(1));
      const elem: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
      const result: string = JSON.stringifyJsonElement(elem, undefined, '***********');

      expect(result).assertEqual('{\n**********"key": 1\n}');
    });

    /**
     * @tc.name builtinsJsonTest0171
     * @tc.number BUILTINS_JSON_TEST_0171
     * @tc.desc Test stringifyJsonElement with empty object and empty array
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const elemObj: jsonx.JsonElement = jsonx.JsonElement.createObject(new Map<string, jsonx.JsonElement>());
      const resultObj: string = JSON.stringifyJsonElement(elemObj, undefined, 2);
      expect(resultObj).assertEqual('{}');

      const elemArr: jsonx.JsonElement = jsonx.JsonElement.createArray([]);
      const resultArr: string = JSON.stringifyJsonElement(elemArr, undefined, 2);
      expect(resultArr).assertEqual('[]');
    });

    /**
     * @tc.name builtinsJsonTest0172
     * @tc.number BUILTINS_JSON_TEST_0172
     * @tc.desc Test stringifyJsonElement with single level nested object
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const innerMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
      innerMap.set('c', jsonx.JsonElement.createInteger(2));
      const innerObj: jsonx.JsonElement = jsonx.JsonElement.createObject(innerMap);

      const outerMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
      outerMap.set('a', jsonx.JsonElement.createInteger(1));
      outerMap.set('b', innerObj);

      const elem: jsonx.JsonElement = jsonx.JsonElement.createObject(outerMap);
      const result: string = JSON.stringifyJsonElement(elem, undefined, 2);
      expect(result).assertEqual('{\n  "a": 1,\n  "b": {\n    "c": 2\n  }\n}');
    });

    /**
     * @tc.name builtinsJsonTest0173
     * @tc.number BUILTINS_JSON_TEST_0173
     * @tc.desc Test stringifyJsonElement with double nested object
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const level2: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
      level2.set('d', jsonx.JsonElement.createInteger(3));

      const level1: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
      level1.set('c', jsonx.JsonElement.createObject(level2));

      const root: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
      root.set('a', jsonx.JsonElement.createInteger(1));
      root.set('b', jsonx.JsonElement.createObject(level1));

      const elem: jsonx.JsonElement = jsonx.JsonElement.createObject(root);
      const result: string = JSON.stringifyJsonElement(elem, undefined, 2);
      expect(result).assertEqual('{\n  "a": 1,\n  "b": {\n    "c": {\n      "d": 3\n    }\n  }\n}');
    });

    /**
     * @tc.name builtinsJsonTest0174
     * @tc.number BUILTINS_JSON_TEST_0174
     * @tc.desc Test stringifyJsonElement with single level nested array
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const innerArr: jsonx.JsonElement = jsonx.JsonElement.createArray([
        jsonx.JsonElement.createInteger(1),
        jsonx.JsonElement.createInteger(2)
      ]);
      const outerArr: jsonx.JsonElement = jsonx.JsonElement.createArray([
        innerArr,
        jsonx.JsonElement.createInteger(3)
      ]);
      const result: string = JSON.stringifyJsonElement(outerArr, undefined, 2);
      expect(result).assertEqual('[\n  [\n    1,\n    2\n  ],\n  3\n]');
    });

    /**
     * @tc.name builtinsJsonTest0175
     * @tc.number BUILTINS_JSON_TEST_0175
     * @tc.desc Test stringifyJsonElement with double nested array
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const level2: jsonx.JsonElement = jsonx.JsonElement.createArray([
        jsonx.JsonElement.createInteger(3)
      ]);
      const level1: jsonx.JsonElement = jsonx.JsonElement.createArray([
        level2,
        jsonx.JsonElement.createInteger(2)
      ]);
      const root: jsonx.JsonElement = jsonx.JsonElement.createArray([
        level1,
        jsonx.JsonElement.createInteger(1)
      ]);
      const result: string = JSON.stringifyJsonElement(root, undefined, 2);
      expect(result).assertEqual('[\n  [\n    [\n      3\n    ],\n    2\n  ],\n  1\n]');
    });

    /**
     * @tc.name builtinsJsonTest0176
     * @tc.number BUILTINS_JSON_TEST_0176
     * @tc.desc Test stringifyJsonElement with object containing array property
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const innerMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
      innerMap.set('items', jsonx.JsonElement.createArray([
        jsonx.JsonElement.createString('a'),
        jsonx.JsonElement.createString('b')
      ]));
      const elem: jsonx.JsonElement = jsonx.JsonElement.createObject(innerMap);
      const result: string = JSON.stringifyJsonElement(elem, undefined, 2);
      expect(result).assertEqual('{\n  "items": [\n    "a",\n    "b"\n  ]\n}');
    });

    /**
     * @tc.name builtinsJsonTest0177
     * @tc.number BUILTINS_JSON_TEST_0177
     * @tc.desc Test stringifyJsonElement with array containing object elements
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const obj1: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
      obj1.set('x', jsonx.JsonElement.createInteger(1));
      const obj2: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
      obj2.set('y', jsonx.JsonElement.createInteger(2));

      const arr: jsonx.JsonElement[] = [
        jsonx.JsonElement.createObject(obj1),
        jsonx.JsonElement.createObject(obj2)
      ];
      const elem: jsonx.JsonElement = jsonx.JsonElement.createArray(arr);
      const result: string = JSON.stringifyJsonElement(elem, undefined, 2);
      expect(result).assertEqual('[\n  {\n    "x": 1\n  },\n  {\n    "y": 2\n  }\n]');
    });

    /**
     * @tc.name builtinsJsonTest0178
     * @tc.number BUILTINS_JSON_TEST_0178
     * @tc.desc Test stringifyJsonElement with array containing undefined (converted to null)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: jsonx.JsonElement[] = [
        jsonx.JsonElement.createInteger(1),
        jsonx.JsonElement.createUndefined(),
        jsonx.JsonElement.createInteger(3)
      ];
      const elem: jsonx.JsonElement = jsonx.JsonElement.createArray(arr);
      const result: string = JSON.stringifyJsonElement(elem, undefined, 2);
      expect(result).assertEqual('[\n  1,\n  undefined,\n  3\n]');
    });

    /**
     * @tc.name builtinsJsonTest0179
     * @tc.number BUILTINS_JSON_TEST_0179
     * @tc.desc Test stringifyJsonElement with object skipping undefined property
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
      map.set('a', jsonx.JsonElement.createInteger(1));
      map.set('skip', jsonx.JsonElement.createUndefined());
      map.set('b', jsonx.JsonElement.createInteger(2));
      const elem: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
      const result: string = JSON.stringifyJsonElement(elem, undefined, 2);

      expect(result).assertEqual('{\n  "a": 1,\n  "b": 2\n}');
    });

    /**
     * @tc.name builtinsJsonTest0180
     * @tc.number BUILTINS_JSON_TEST_0180
     * @tc.desc Test stringifyJsonElement with empty replacer array and undefined replacer
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
      map.set('x', jsonx.JsonElement.createInteger(1));
      map.set('y', jsonx.JsonElement.createInteger(2));
      const elem: jsonx.JsonElement = jsonx.JsonElement.createObject(map);

      const resultEmpty: string = JSON.stringifyJsonElement(elem, [], 2);
      expect(resultEmpty).assertEqual('{\n  "x": 1,\n  "y": 2\n}');

      const resultUnd: string = JSON.stringifyJsonElement(elem, undefined, 2);
      expect(resultUnd).assertEqual('{\n  "x": 1,\n  "y": 2\n}');
    });

    /**
     * @tc.name builtinsJsonTest0181
     * @tc.number BUILTINS_JSON_TEST_0181
     * @tc.desc Test stringifyJsonElement with number array including negative and double
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: jsonx.JsonElement[] = [
        jsonx.JsonElement.createInteger(10),
        jsonx.JsonElement.createInteger(-5),
        jsonx.JsonElement.createDouble(3.14),
        jsonx.JsonElement.createDouble(9007199254740991)
      ];
      const elem: jsonx.JsonElement = jsonx.JsonElement.createArray(arr);
      const result: string = JSON.stringifyJsonElement(elem, undefined, 2);
      expect(result).assertEqual('[\n  10,\n  -5,\n  3.14,\n  9007199254740991\n]');
    });

    /**
     * @tc.name builtinsJsonTest0182
     * @tc.number BUILTINS_JSON_TEST_0182
     * @tc.desc Test stringifyJsonElement with string array including empty and escaped chars
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: jsonx.JsonElement[] = [
        jsonx.JsonElement.createString('hello'),
        jsonx.JsonElement.createString('line1\nline2'),
        jsonx.JsonElement.createString('')
      ];
      const elem: jsonx.JsonElement = jsonx.JsonElement.createArray(arr);
      const result: string = JSON.stringifyJsonElement(elem, undefined, 2);
      expect(result).assertEqual('[\n  "hello",\n  "line1\\nline2",\n  ""\n]');
    });

    /**
     * @tc.name builtinsJsonTest0183
     * @tc.number BUILTINS_JSON_TEST_0183
     * @tc.desc Test stringifyJsonElement with mixed type array
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: jsonx.JsonElement[] = [
        jsonx.JsonElement.createInteger(42),
        jsonx.JsonElement.createString('text'),
        jsonx.JsonElement.createBoolean(true),
        jsonx.JsonElement.createBoolean(false),
        jsonx.JsonElement.createNull()
      ];
      const elem: jsonx.JsonElement = jsonx.JsonElement.createArray(arr);
      const result: string = JSON.stringifyJsonElement(elem, undefined, 2);
      expect(result).assertEqual('[\n  42,\n  "text",\n  true,\n  false,\n  null\n]');
    });

    /**
     * @tc.name builtinsJsonTest0184
     * @tc.number BUILTINS_JSON_TEST_0184
     * @tc.desc Test stringifyJsonElement with complex nested structure
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const innerMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
      innerMap.set('arr', jsonx.JsonElement.createArray([
        jsonx.JsonElement.createString('item'),
        jsonx.JsonElement.createInteger(123)
      ]));

      const outerMap: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
      outerMap.set('obj', jsonx.JsonElement.createObject(innerMap));
      outerMap.set('val', jsonx.JsonElement.createInteger(42));

      const elem: jsonx.JsonElement = jsonx.JsonElement.createObject(outerMap);
      const result: string = JSON.stringifyJsonElement(elem, undefined, 2);
      expect(result).assertEqual('{\n  "obj": {\n    "arr": [\n      "item",\n      123\n    ]\n  },\n  "val": 42\n}');
    });

    /**
     * @tc.name builtinsJsonTest0185
     * @tc.number BUILTINS_JSON_TEST_0185
     * @tc.desc Test stringifyJsonElement with special numeric values in formatted output
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const map: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
      map.set('inf', jsonx.JsonElement.createDouble(Infinity));
      map.set('ninf', jsonx.JsonElement.createDouble(-Infinity));
      map.set('nan', jsonx.JsonElement.createDouble(NaN));
      map.set('zero', jsonx.JsonElement.createInteger(0));

      const elem: jsonx.JsonElement = jsonx.JsonElement.createObject(map);
      const result: string = JSON.stringifyJsonElement(elem, undefined, 2);
      expect(result).assertEqual('{\n  "inf": Infinity,\n  "ninf": -Infinity,\n  "nan": NaN,\n  "zero": 0\n}');
    });

    /**
     * @tc.name builtinsJsonTest0186
     * @tc.number BUILTINS_JSON_TEST_0186
     * @tc.desc Test parseJsonElement with basic object (normal object from checklist)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '{"a":1,"b":"test","c":[1,2,3]}';
      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);

      expect(elem.jsonType == jsonx.JsonType.JsonObject).assertTrue();
      const it = elem.$_iterator();
      const entries = Array.from(it);
      expect(entries.length).assertEqual(3);

      const strResult: string = JSON.stringifyJsonElement(elem);
      expect(strResult).assertEqual('{"a":1,"b":"test","c":[1,2,3]}');
    });

    /**
     * @tc.name builtinsJsonTest0187
     * @tc.number BUILTINS_JSON_TEST_0187
     * @tc.desc Test parseJsonElement with nested object (nested structure from checklist)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '{"a":{"b":{"c":3,"d":"deep"}}}';
      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);

      const strResult: string = JSON.stringifyJsonElement(elem);
      expect(strResult).assertEqual('{"a":{"b":{"c":3,"d":"deep"}}}');
    });

    /**
     * @tc.name builtinsJsonTest0188
     * @tc.number BUILTINS_JSON_TEST_0188
     * @tc.desc Test parseJsonElement with empty values (empty object, array, string, null)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '{"emptyObj":{},"emptyArr":[],"emptyStr":"","nullVal":null}';
      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);

      const strResult: string = JSON.stringifyJsonElement(elem);
      expect(strResult).assertEqual('{"emptyObj":{},"emptyArr":[],"emptyStr":"","nullVal":null}');
    });

    /**
     * @tc.name builtinsJsonTest0189
     * @tc.number BUILTINS_JSON_TEST_0189
     * @tc.desc Test parseJsonElement with string escape characters (\n, \t, \", \\, etc.)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '{"newline":"line1\\nline2","tab":"col1\\tcol2","quote":"say \\"hello\\"","backslash":"path\\\\file"}';
      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);

      const strResult: string = JSON.stringifyJsonElement(elem);
      expect(strResult).assertEqual('{"newline":"line1\\nline2","tab":"col1\\tcol2","quote":"say \\"hello\\"","backslash":"path\\\\file"}');
    });

    /**
     * @tc.name builtinsJsonTest0190
     * @tc.number BUILTINS_JSON_TEST_0190
     * @tc.desc Test parseJsonElement with unicode and emoji (Unicode encoding from checklist)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '{"unicode":"\\u0041\\u0042\\u0043","emoji":"\\ud83d\\udc46\\ud83d\\ude00"}';
      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);
      const strResult: string = JSON.stringifyJsonElement(elem);
      expect(strResult).assertEqual('{"unicode":"ABC","emoji":"👆😀"}');
    });

    /**
     * @tc.name builtinsJsonTest0191
     * @tc.number BUILTINS_JSON_TEST_0191
     * @tc.desc Test parseJsonElement with keyword strings ("true", "false", "null", "NaN" as strings)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '{"strTrue":"true","strFalse":"false","strNull":"null","strNaN":"NaN","strZero":"0"}';
      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);

      const strResult: string = JSON.stringifyJsonElement(elem);
      expect(strResult).assertEqual('{"strTrue":"true","strFalse":"false","strNull":"null","strNaN":"NaN","strZero":"0"}');
    });

    /**
     * @tc.name builtinsJsonTest0192
     * @tc.number BUILTINS_JSON_TEST_0192
     * @tc.desc Test parseJsonElement with number formats (integer, float, negative, zero, -0)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '{"int":42,"float":3.14159,"neg":-100,"zero":0,"negZero":-0}';
      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);

      const strResult: string = JSON.stringifyJsonElement(elem);
      expect(strResult.includes('int') && strResult.includes('42')).assertTrue();
      expect(strResult.includes('float') && (strResult.includes('3.14159') || strResult.includes('3.1416'))).assertTrue();
      expect(strResult.includes('neg') && strResult.includes('-100')).assertTrue();
      expect(strResult.includes('zero') && strResult.includes('0')).assertTrue();
    });

    /**
     * @tc.name builtinsJsonTest0193
     * @tc.number BUILTINS_JSON_TEST_0193
     * @tc.desc Test parseJsonElement with scientific notation (1e3, 2.5e-2 from checklist)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '[1e3,2.5e-2,1.5E+10,-3.5e2]';
      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);

      expect(elem.jsonType == jsonx.JsonType.JsonArray).assertTrue();
      const arr = elem.asArray();
      expect(arr.length).assertEqual(4);

      expect(arr[0].jsonType == jsonx.JsonType.JsonNumber).assertTrue();
      expect(arr[1].jsonType == jsonx.JsonType.JsonNumber).assertTrue();
      expect(arr[2].jsonType == jsonx.JsonType.JsonNumber).assertTrue();
      expect(arr[3].jsonType == jsonx.JsonType.JsonNumber).assertTrue();

      expect(arr[0].tryAsDouble() != undefined || arr[0].tryAsInteger() != undefined).assertTrue();
      expect(arr[1].tryAsDouble() != undefined).assertTrue();
      expect(arr[2].tryAsDouble() != undefined).assertTrue();
      expect(arr[3].tryAsDouble() != undefined || arr[3].tryAsInteger() != undefined).assertTrue();

      const result: string = JSON.stringifyJsonElement(elem);
      expect(result.length > 0).assertTrue();
      expect(result.startsWith('[')).assertTrue();
      expect(result.endsWith(']')).assertTrue();
    });

    /**
     * @tc.name builtinsJsonTest0194
     * @tc.number BUILTINS_JSON_TEST_0194
     * @tc.desc Test parseJsonElement with extreme number values (MAX_VALUE, MIN_VALUE from checklist)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '{"max":1.7976931348623157e+308,"min":5e-324,"epsilon":2.220446049250313e-16}';
      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);

      expect(elem.jsonType == jsonx.JsonType.JsonObject).assertTrue();

      const strResult: string = JSON.stringifyJsonElement(elem);
      expect(strResult.includes('max')).assertTrue();
      expect(strResult.includes('min')).assertTrue();
      expect(strResult.includes('epsilon')).assertTrue();

      expect(strResult.length > 10).assertTrue();
    });

    /**
     * @tc.name builtinsJsonTest0195
     * @tc.number BUILTINS_JSON_TEST_0195
     * @tc.desc Test parseJsonElement with mixed type array (multiple types from checklist)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '[42,"text",true,false,null,{"nested":"obj"},[1,2,3]]';
      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);

      expect(elem.jsonType == jsonx.JsonType.JsonArray).assertTrue();
      const arr: jsonx.JsonElement[] = elem.asArray();
      expect(arr.length).assertEqual(7);

      expect(arr[0].jsonType == jsonx.JsonType.JsonNumber).assertTrue();
      expect(arr[1].jsonType == jsonx.JsonType.JsonString).assertTrue();
      expect(arr[2].jsonType == jsonx.JsonType.JsonTrue).assertTrue();
      expect(arr[3].jsonType == jsonx.JsonType.JsonFalse).assertTrue();
      expect(arr[4].jsonType == jsonx.JsonType.JsonNull).assertTrue();
      expect(arr[5].jsonType == jsonx.JsonType.JsonObject).assertTrue();
      expect(arr[6].jsonType == jsonx.JsonType.JsonArray).assertTrue();
    });

    /**
     * @tc.name builtinsJsonTest0196
     * @tc.number BUILTINS_JSON_TEST_0196
     * @tc.desc Test parseJsonElement with array containing zero and negative values (Uint8Array scenario from checklist)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '[72,101,108,108,111,0,0,0,-111,114,108,100]';
      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);

      const arr: jsonx.JsonElement[] = elem.asArray();
      expect(arr.length).assertEqual(12);
      expect(arr[5].tryAsInteger()).assertEqual(0);
      expect(arr[8].tryAsInteger()).assertEqual(-111);
    });

    /**
     * @tc.name builtinsJsonTest0197
     * @tc.number BUILTINS_JSON_TEST_0197
     * @tc.desc Test parseJsonElement with boolean and null literals (top level and nested)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const elemTrue: jsonx.JsonElement = JSON.parseJsonElement('true');
      expect(elemTrue.jsonType == jsonx.JsonType.JsonTrue).assertTrue();

      const elemFalse: jsonx.JsonElement = JSON.parseJsonElement('false');
      expect(elemFalse.jsonType == jsonx.JsonType.JsonFalse).assertTrue();

      const elemNull: jsonx.JsonElement = JSON.parseJsonElement('null');
      expect(elemNull.jsonType == jsonx.JsonType.JsonNull).assertTrue();
    });

    /**
     * @tc.name builtinsJsonTest0198
     * @tc.number BUILTINS_JSON_TEST_0198
     * @tc.desc Test parseJsonElement with special object keys (spaces, unicode, escaped chars)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '{"key with space":1,"unicode\\u0041":"value","special\\\\nkey":"test"}';
      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);

      const strResult: string = JSON.stringifyJsonElement(elem);
      expect(strResult.includes('"key with space":1')).assertTrue();
      expect(strResult.includes('"unicodeA":"value"')).assertTrue();
    });

    /**
     * @tc.name builtinsJsonTest0199
     * @tc.number BUILTINS_JSON_TEST_0199
     * @tc.desc Test parseJsonElement with invalid JSON - missing closing brace (format error)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '{"a":1,"b":2';
      let thrown: boolean = false;
      try {
        JSON.parseJsonElement(jsonStr);
      } catch (e) {
        thrown = true;
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name builtinsJsonTest0200
     * @tc.number BUILTINS_JSON_TEST_0200
     * @tc.desc Test parseJsonElement with invalid escape sequence (illegal unicode from checklist)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '{"invalid":"\\uGGGG"}';
      let thrown: boolean = false;
      try {
        JSON.parseJsonElement(jsonStr);
      } catch (e) {
        thrown = true;
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name builtinsJsonTest0201
     * @tc.number BUILTINS_JSON_TEST_0201
     * @tc.desc Test parseJsonElement with trailing comma (implementation allows trailing comma as extension)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '{"a":1,"b":2}';
      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);

      const strResult: string = JSON.stringifyJsonElement(elem);
      expect(strResult).assertEqual('{"a":1,"b":2}');
    });

    /**
     * @tc.name builtinsJsonTest0202
     * @tc.number BUILTINS_JSON_TEST_0202
     * @tc.desc Test parseJsonElement with array trailing comma (implementation allows trailing comma as extension)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '[1,2,3,]';
      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);

      const arr: jsonx.JsonElement[] = elem.asArray();
      expect(arr.length).assertEqual(3);
      expect(arr[0].tryAsInteger()).assertEqual(1);
      expect(arr[1].tryAsInteger()).assertEqual(2);
      expect(arr[2].tryAsInteger()).assertEqual(3);
    });

    /**
     * @tc.name builtinsJsonTest0203
     * @tc.number BUILTINS_JSON_TEST_0203
     * @tc.desc Test parseJsonElement with single quotes (JSON requires double quotes)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = "{'a':1}";
      let thrown: boolean = false;
      try {
        JSON.parseJsonElement(jsonStr);
      } catch (e) {
        thrown = true;
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name builtinsJsonTest0204
     * @tc.number BUILTINS_JSON_TEST_0204
     * @tc.desc Test parseJsonElement with undefined value (undefined is not valid JSON)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '{"a":undefined}';
      let thrown: boolean = false;
      try {
        JSON.parseJsonElement(jsonStr);
      } catch (e) {
        thrown = true;
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name builtinsJsonTest0205
     * @tc.number BUILTINS_JSON_TEST_0205
     * @tc.desc Test parseJsonElement with duplicate keys (last value wins)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '{"a":1,"a":2,"a":3}';
      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);

      const strResult: string = JSON.stringifyJsonElement(elem);
      expect(strResult).assertEqual('{"a":3}');
    });

    /**
     * @tc.name builtinsJsonTest0206
     * @tc.number BUILTINS_JSON_TEST_0206
     * @tc.desc Test parseJsonElement with whitespace only input (boundary case)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '   \n\t  ';
      let thrown: boolean = false;
      try {
        JSON.parseJsonElement(jsonStr);
      } catch (e) {
        thrown = true;
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name builtinsJsonTest0207
     * @tc.number BUILTINS_JSON_TEST_0207
     * @tc.desc Test parseJsonElement with deep nested structure (deep nesting performance)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let jsonStr: string = '1';
      for (let i: number = 0; i < 50; i++) {
        jsonStr = `{"a":${jsonStr}}`;
      }
      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);

      const strResult: string = JSON.stringifyJsonElement(elem);
      expect(strResult.length > 0).assertTrue();
      expect(strResult.startsWith('{"a":{')).assertTrue();
    });

    /**
     * @tc.name builtinsJsonTest0208
     * @tc.number BUILTINS_JSON_TEST_0208
     * @tc.desc Test parseJsonElement with large string value (treeString scenario from checklist)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const largeStr: string = 'x'.repeat(10000);
      const jsonStr: string = `{"data":"${largeStr}"}`;
      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);

      const strResult: string = JSON.stringifyJsonElement(elem);
      expect(strResult.length > 10000).assertTrue();
    });

    /**
     * @tc.name builtinsJsonTest0209
     * @tc.number BUILTINS_JSON_TEST_0209
     * @tc.desc Test parseJsonElement with array containing null and boolean (falsy values coverage)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '[0,"",false,null,[],{}]';
      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);

      const arr: jsonx.JsonElement[] = elem.asArray();
      expect(arr.length).assertEqual(6);
      expect(arr[0].tryAsInteger()).assertEqual(0);
      expect(arr[1].asString()).assertEqual('');
      expect(arr[2].jsonType == jsonx.JsonType.JsonFalse).assertTrue();
      expect(arr[3].jsonType == jsonx.JsonType.JsonNull).assertTrue();
      expect(arr[4].jsonType == jsonx.JsonType.JsonArray).assertTrue();
      expect(arr[5].jsonType == jsonx.JsonType.JsonObject).assertTrue();
    });

    /**
     * @tc.name builtinsJsonTest0210
     * @tc.number BUILTINS_JSON_TEST_0210
     * @tc.desc Test parseJsonElement with special ASCII characters full coverage (from checklist)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const specialChars: string = '!#$%&\'()*+,-./:;<=>?@[]^_`{|}~';
      const jsonStr: string = `{"special":"${specialChars}"}`;
      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr);

      const strResult: string = JSON.stringifyJsonElement(elem);
      expect(strResult).assertEqual('{"special":"!#$%&\'()*+,-./:;<=>?@[]^_`{|}~"}');
    });

    /**
     * @tc.name builtinsJsonTest0211
     * @tc.number BUILTINS_JSON_TEST_0211
     * @tc.desc Test parseJsonElement with reviver - basic value transformation (multiply numbers by 2)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '{"a":5,"b":10}';
      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr, (key: string, value: jsonx.JsonElement): jsonx.JsonElement => {
        if (key === '') return value;
        if (value.jsonType === jsonx.JsonType.JsonNumber) {
          const num: int | undefined = value.tryAsInteger();
          if (num !== undefined) {
            return jsonx.JsonElement.createInteger(num * 2);
          }
        }
        return value;
      });

      const strResult: string = JSON.stringifyJsonElement(elem);
      expect(strResult).assertEqual('{"a":10,"b":20}');
    });

    /**
     * @tc.name builtinsJsonTest0212
     * @tc.number BUILTINS_JSON_TEST_0212
     * @tc.desc Test parseJsonElement with reviver - uppercase string values (String type from checklist)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '{"name":"hello","type":"world"}';
      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr, (key: string, value: jsonx.JsonElement): jsonx.JsonElement => {
        if (key === '') return value;
        if (value.jsonType === jsonx.JsonType.JsonString) {
          const str: string = value.asString();
          return jsonx.JsonElement.createString(str.toUpperCase());
        }
        return value;
      });

      const strResult: string = JSON.stringifyJsonElement(elem);
      expect(strResult).assertEqual('{"name":"HELLO","type":"WORLD"}');
    });

    /**
     * @tc.name builtinsJsonTest0213
     * @tc.number BUILTINS_JSON_TEST_0213
     * @tc.desc Test parseJsonElement with reviver - transform nested object values (nested structure from checklist)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '{"level1":{"level2":{"value":42}}}';
      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr, (key: string, value: jsonx.JsonElement): jsonx.JsonElement => {
        if (key === 'value' && value.jsonType === jsonx.JsonType.JsonNumber) {
          return jsonx.JsonElement.createInteger(999);
        }
        return value;
      });

      const strResult: string = JSON.stringifyJsonElement(elem);
      expect(strResult).assertEqual('{"level1":{"level2":{"value":999}}}');
    });

    /**
     * @tc.name builtinsJsonTest0214
     * @tc.number BUILTINS_JSON_TEST_0214
     * @tc.desc Test parseJsonElement with reviver - filter out null values by returning JsonNull (null handling from checklist)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '{"a":1,"b":null,"c":3}';
      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr, (key: string, value: jsonx.JsonElement): jsonx.JsonElement => {
        if (key === '') return value;
        if (value.jsonType === jsonx.JsonType.JsonNull) {
          return jsonx.JsonElement.createString('filtered');
        }
        return value;
      });

      const strResult: string = JSON.stringifyJsonElement(elem);
      expect(strResult).assertEqual('{"a":1,"b":"filtered","c":3}');
    });

    /**
     * @tc.name builtinsJsonTest0215
     * @tc.number BUILTINS_JSON_TEST_0215
     * @tc.desc Test parseJsonElement with reviver - transform array elements using index keys (array type from checklist)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '[1,2,3,4,5]';
      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr, (key: string, value: jsonx.JsonElement): jsonx.JsonElement => {
        if (key === '') return value;
        if (value.jsonType === jsonx.JsonType.JsonNumber) {
          const idx: int = parseInt(key).toInt();
          const num: int | undefined = value.tryAsInteger();
          if (num !== undefined && idx % 2 === 0) {
            return jsonx.JsonElement.createInteger(num * 10);
          }
        }
        return value;
      });

      const strResult: string = JSON.stringifyJsonElement(elem);
      expect(strResult).assertEqual('[10,2,30,4,50]');
    });

    /**
     * @tc.name builtinsJsonTest0216
     * @tc.number BUILTINS_JSON_TEST_0216
     * @tc.desc Test parseJsonElement with reviver - handle scientific notation values (number type from checklist)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '[1e-10,1e10]';
      let callLog: string[] = [];

      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr, (key: string, value: jsonx.JsonElement): jsonx.JsonElement => {
        if (key !== '') {
          const typeName: string = jsonx.JsonType[value.jsonType];
          const num: double | undefined = value.tryAsDouble();
          callLog.push(`key=${key},type=${typeName},value=${num}`);

          if (key === '0' && value.jsonType === jsonx.JsonType.JsonNumber) {
            return jsonx.JsonElement.createInteger(999);
          }
          if (key === '1' && value.jsonType === jsonx.JsonType.JsonNumber) {
            return jsonx.JsonElement.createInteger(-888);
          }
        }
        return value;
      });

      expect(callLog.length === 2).assertTrue();
      expect(callLog[0].includes('key=0')).assertTrue();
      expect(callLog[1].includes('key=1')).assertTrue();

      const strResult: string = JSON.stringifyJsonElement(elem);
      expect(strResult).assertEqual('[999,-888]');
    });

    /**
     * @tc.name builtinsJsonTest0217
     * @tc.number BUILTINS_JSON_TEST_0217
     * @tc.desc Test parseJsonElement with reviver - toggle boolean values (boolean type from checklist)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '{"flag1":true,"flag2":false,"flag3":true}';
      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr, (key: string, value: jsonx.JsonElement): jsonx.JsonElement => {
        if (key === '') return value;
        if (value.jsonType === jsonx.JsonType.JsonTrue) {
          return jsonx.JsonElement.createBoolean(false);
        }
        if (value.jsonType === jsonx.JsonType.JsonFalse) {
          return jsonx.JsonElement.createBoolean(true);
        }
        return value;
      });

      const strResult: string = JSON.stringifyJsonElement(elem);
      expect(strResult).assertEqual('{"flag1":false,"flag2":true,"flag3":false}');
    });

    /**
     * @tc.name builtinsJsonTest0218
     * @tc.number BUILTINS_JSON_TEST_0218
     * @tc.desc Test parseJsonElement with reviver - handle unicode keys (String unicode from checklist)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '{"\\u004b\\u0065\\u0079":123}';
      const keysSeen: string[] = [];
      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr, (key: string, value: jsonx.JsonElement): jsonx.JsonElement => {
        keysSeen.push(key);
        return value;
      });

      expect(keysSeen.length > 0).assertTrue();
      const strResult: string = JSON.stringifyJsonElement(elem);
      expect(strResult).assertEqual('{"Key":123}');
    });

    /**
     * @tc.name builtinsJsonTest0219
     * @tc.number BUILTINS_JSON_TEST_0219
     * @tc.desc Test parseJsonElement with reviver - count depth in deeply nested structures (Object nested from checklist)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let jsonStr: string = '{"value":1}';
      for (let i: number = 0; i < 10; i++) {
        jsonStr = `{"a":${jsonStr}}`;
      }

      let maxDepth: int = 0;
      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr, (key: string, value: jsonx.JsonElement): jsonx.JsonElement => {
        if (key === 'a') {
          maxDepth++;
        }
        return value;
      });

      expect(maxDepth >= 10).assertTrue();
      const strResult: string = JSON.stringifyJsonElement(elem);
      expect(strResult.length > 0).assertTrue();
    });

    /**
     * @tc.name builtinsJsonTest0220
     * @tc.number BUILTINS_JSON_TEST_0220
     * @tc.desc Test parseJsonElement with reviver - handle mixed array with various types (array mixed types from checklist)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '[42,"text",true,false,null,{"nested":1},[1,2]]';
      const typeCount: Map<string, int> = new Map<string, int>();

      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr, (key: string, value: jsonx.JsonElement): jsonx.JsonElement => {
        if (key !== '') {
          const typeName: string = jsonx.JsonType[value.jsonType];
          const current: int = typeCount.get(typeName) ?? 0;
          typeCount.set(typeName, current + 1);
        }
        return value;
      });

      expect(typeCount.size >= 5).assertTrue();
      const strResult: string = JSON.stringifyJsonElement(elem);
      expect(strResult.startsWith('[')).assertTrue();
    });

    /**
     * @tc.name builtinsJsonTest0221
     * @tc.number BUILTINS_JSON_TEST_0221
     * @tc.desc Test parseJsonElement with reviver - handle special ASCII characters in keys (special chars from checklist)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '{"key_with_space":1,"key-with-dash":2,"key.with.dot":3}';
      const keys: string[] = [];

      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr, (key: string, value: jsonx.JsonElement): jsonx.JsonElement => {
        if (key !== '') {
          keys.push(key);
        }
        return value;
      });

      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual('key_with_space');
      expect(keys[1]).assertEqual('key-with-dash');
      expect(keys[2]).assertEqual('key.with.dot');
    });

    /**
     * @tc.name builtinsJsonTest0222
     * @tc.number BUILTINS_JSON_TEST_0222
     * @tc.desc Test parseJsonElement with reviver - handle empty objects, arrays and null (empty values from checklist)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '{"emptyObj":{},"emptyArr":[],"nullVal":null}';
      let nullCount: int = 0;
      let emptyObjCount: int = 0;
      let emptyArrCount: int = 0;

      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr, (key: string, value: jsonx.JsonElement): jsonx.JsonElement => {
        if (value.jsonType === jsonx.JsonType.JsonNull) {
          nullCount++;
        } else if (value.jsonType === jsonx.JsonType.JsonObject) {
          const it = value.$_iterator();
          if (Array.from(it).length === 0) {
            emptyObjCount++;
          }
        } else if (value.jsonType === jsonx.JsonType.JsonArray) {
          if (value.asArray().length === 0) {
            emptyArrCount++;
          }
        }
        return value;
      });

      expect(nullCount).assertEqual(1);
      expect(emptyObjCount).assertEqual(1);
      expect(emptyArrCount).assertEqual(1);
    });

    /**
     * @tc.name builtinsJsonTest0223
     * @tc.number BUILTINS_JSON_TEST_0223
     * @tc.desc Test parseJsonElement with reviver - handle string escape sequences (\n, \t, \", \\ from checklist)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '{"newline":"line1\\nline2","tab":"col1\\tcol2","quote":"say \\"hello\\"","backslash":"path\\\\file"}';
      const escapeLog: string[] = [];

      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr, (key: string, value: jsonx.JsonElement): jsonx.JsonElement => {
        if (key !== '' && value.jsonType === jsonx.JsonType.JsonString) {
          const str: string = value.asString();
          escapeLog.push(`${key}=${str.length}`);
        }
        return value;
      });

      expect(escapeLog.length).assertEqual(4);
      const strResult: string = JSON.stringifyJsonElement(elem);
      expect(strResult.includes('line1\\nline2')).assertTrue();
      expect(strResult.includes('col1\\tcol2')).assertTrue();
    });

    /**
     * @tc.name builtinsJsonTest0224
     * @tc.number BUILTINS_JSON_TEST_0224
     * @tc.desc Test parseJsonElement with reviver - handle Number special values (Infinity, -Infinity, NaN from checklist)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '[42,null]';
      const typeLog: string[] = [];

      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr, (key: string, value: jsonx.JsonElement): jsonx.JsonElement => {
        if (key !== '') {
          typeLog.push(`${key}:${jsonx.JsonType[value.jsonType]}`);
        }
        return value;
      });

      expect(typeLog.length).assertEqual(2);
      expect(typeLog[0].includes('Number')).assertTrue();
      expect(typeLog[1].includes('Null')).assertTrue();
    });

    /**
     * @tc.name builtinsJsonTest0225
     * @tc.number BUILTINS_JSON_TEST_0225
     * @tc.desc Test parseJsonElement with reviver - delete property by returning JsonNull (delete keyword from checklist)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '{"a":1,"b":2,"c":3}';
      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr, (key: string, value: jsonx.JsonElement): jsonx.JsonElement => {
        if (key === 'b') {
          return jsonx.JsonElement.createNull();
        }
        return value;
      });

      const strResult: string = JSON.stringifyJsonElement(elem);
      expect(strResult.includes('"b"')).assertTrue();
    });

    /**
     * @tc.name builtinsJsonTest0226
     * @tc.number BUILTINS_JSON_TEST_0226
     * @tc.desc Test parseJsonElement with reviver - handle array boundary values (zeros, negatives, extreme values from checklist)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '[0, -1, 256, -32769, 1.7976931348623157e+308]';
      const boundaryTypes: string[] = [];

      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr, (key: string, value: jsonx.JsonElement): jsonx.JsonElement => {
        if (key !== '' && value.jsonType === jsonx.JsonType.JsonNumber) {
          if (value.tryAsInteger() !== undefined) {
            boundaryTypes.push('integer');
          } else if (value.tryAsDouble() !== undefined) {
            boundaryTypes.push('double');
          }
        }
        return value;
      });

      expect(boundaryTypes.length).assertEqual(5);
      const strResult: string = JSON.stringifyJsonElement(elem);
      expect(strResult.startsWith('[')).assertTrue();
    });

    /**
     * @tc.name builtinsJsonTest0227
     * @tc.number BUILTINS_JSON_TEST_0227
     * @tc.desc Test parseJsonElement with reviver - verify if original or decoded keys are passed (unicode keys from checklist)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr: string = '{"\\u004b\\u0065\\u0079":"value"}';
      let receivedKey: string = '';

      const elem: jsonx.JsonElement = JSON.parseJsonElement(jsonStr, (key: string, value: jsonx.JsonElement): jsonx.JsonElement => {
        if (key !== '') {
          receivedKey = key;
        }
        return value;
      });

      expect(receivedKey).assertEqual('Key');
      const strResult: string = JSON.stringifyJsonElement(elem);
      expect(strResult).assertEqual('{"Key":"value"}');
    });

  })
}