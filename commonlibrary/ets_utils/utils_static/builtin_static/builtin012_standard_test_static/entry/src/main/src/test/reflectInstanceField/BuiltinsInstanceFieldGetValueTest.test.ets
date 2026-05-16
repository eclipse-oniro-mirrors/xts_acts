 /*
 * Copyright (c) 2026 RKH Corp.
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

class NumberFieldClass {
  zero: number = 0;
  negative: number = -1;
  nan: number = NaN;
  inf: number = Infinity;
  negInf: number = -Infinity;
  maxSafe: number = Number.MAX_SAFE_INTEGER;
}

class StringFieldClass {
  empty: string = "";
  normal: string = "hello world";
  escaped: string = "line1\nline2\ttab";
}

class BooleanFieldClass {
  trueVal: boolean = true;
  falseVal: boolean = false;
}

class ParentClass {
  parentVal: number = 100;
}

class ChildClass extends ParentClass {
  childVal: string = "child";
}

class MultiTypeClass {
  n: number = 42;
  s: string = "test";
  b: boolean = true;
}

export default function BuiltinsInstanceFieldGetValueTest(): void {
  describe('BuiltinsInstanceFieldGetValueTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
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
     * @tc.name    BuiltinsInstanceFieldGetValueTest0100
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_GET_VALUE_TEST_0100
     * @tc.desc    Verify Number field getValue returns 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsInstanceFieldGetValueTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const obj = new NumberFieldClass();
      const field = Class.from<NumberFieldClass>().getInstanceField("zero");
      const result = field!.getValue(obj) as number;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsInstanceFieldGetValueTest0200
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_GET_VALUE_TEST_0200
     * @tc.desc    Verify Number field getValue returns negative integer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsInstanceFieldGetValueTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const obj = new NumberFieldClass();
      const field = Class.from<NumberFieldClass>().getInstanceField("negative");
      const result = field!.getValue(obj) as number;
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    BuiltinsInstanceFieldGetValueTest0300
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_GET_VALUE_TEST_0300
     * @tc.desc    Verify Number field getValue returns NaN
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsInstanceFieldGetValueTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const obj = new NumberFieldClass();
      const field = Class.from<NumberFieldClass>().getInstanceField("nan");
      const result = field!.getValue(obj) as number;
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsInstanceFieldGetValueTest0400
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_GET_VALUE_TEST_0400
     * @tc.desc    Verify Number field getValue returns Infinity
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceFieldGetValueTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new NumberFieldClass();
      const field = Class.from<NumberFieldClass>().getInstanceField("inf");
      const result = field!.getValue(obj) as number;
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name    BuiltinsInstanceFieldGetValueTest0500
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_GET_VALUE_TEST_0500
     * @tc.desc    Verify Number field getValue returns -Infinity
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceFieldGetValueTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new NumberFieldClass();
      const field = Class.from<NumberFieldClass>().getInstanceField("negInf");
      const result = field!.getValue(obj) as number;
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.name    BuiltinsInstanceFieldGetValueTest0600
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_GET_VALUE_TEST_0600
     * @tc.desc    Verify Number field getValue returns MAX_SAFE_INTEGER
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceFieldGetValueTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new NumberFieldClass();
      const field = Class.from<NumberFieldClass>().getInstanceField("maxSafe");
      const result = field!.getValue(obj) as number;
      expect(result).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.name    BuiltinsInstanceFieldGetValueTest0700
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_GET_VALUE_TEST_0700
     * @tc.desc    Verify String field getValue returns empty string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceFieldGetValueTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new StringFieldClass();
      const field = Class.from<StringFieldClass>().getInstanceField("empty");
      const result = field!.getValue(obj) as string;
      expect(result).assertEqual("");
    });

    /**
     * @tc.name    BuiltinsInstanceFieldGetValueTest0800
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_GET_VALUE_TEST_0800
     * @tc.desc    Verify String field getValue returns normal string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceFieldGetValueTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new StringFieldClass();
      const field = Class.from<StringFieldClass>().getInstanceField("normal");
      const result = field!.getValue(obj) as string;
      expect(result).assertEqual("hello world");
    });

    /**
     * @tc.name    BuiltinsInstanceFieldGetValueTest0900
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_GET_VALUE_TEST_0900
     * @tc.desc    Verify String field getValue returns string with escape characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceFieldGetValueTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new StringFieldClass();
      const field = Class.from<StringFieldClass>().getInstanceField("escaped");
      const result = field!.getValue(obj) as string;
      expect(result).assertEqual("line1\nline2\ttab");
    });

    /**
     * @tc.name    BuiltinsInstanceFieldGetValueTest1000
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_GET_VALUE_TEST_1000
     * @tc.desc    Verify Boolean field getValue returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceFieldGetValueTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new BooleanFieldClass();
      const field = Class.from<BooleanFieldClass>().getInstanceField("trueVal");
      const result = field!.getValue(obj) as boolean;
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsInstanceFieldGetValueTest1100
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_GET_VALUE_TEST_1100
     * @tc.desc    Verify Boolean field getValue returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceFieldGetValueTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new BooleanFieldClass();
      const field = Class.from<BooleanFieldClass>().getInstanceField("falseVal");
      const result = field!.getValue(obj) as boolean;
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsInstanceFieldGetValueTest1200
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_GET_VALUE_TEST_1200
     * @tc.desc    Verify subclass String field getValue is correct
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceFieldGetValueTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new ChildClass();
      const field = Class.from<ChildClass>().getInstanceField("childVal");
      const result = field!.getValue(obj) as string;
      expect(result).assertEqual("child");
    });

    /**
     * @tc.name    BuiltinsInstanceFieldGetValueTest1300
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_GET_VALUE_TEST_1300
     * @tc.desc    Verify parent Number field getValue is correct
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceFieldGetValueTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new ParentClass();
      const field = Class.from<ParentClass>().getInstanceField("parentVal");
      const result = field!.getValue(obj) as number;
      expect(result).assertEqual(100);
    });

    /**
     * @tc.name    BuiltinsInstanceFieldGetValueTest1400
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_GET_VALUE_TEST_1400
     * @tc.desc    Verify that getValue is correct for each field in MultiTypeClass
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceFieldGetValueTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new MultiTypeClass();
      const cls = Class.from<MultiTypeClass>();
      expect(cls.getInstanceField("n")!.getValue(obj) as number).assertEqual(42);
      expect(cls.getInstanceField("s")!.getValue(obj) as string).assertEqual("test");
      expect(cls.getInstanceField("b")!.getValue(obj) as boolean).assertTrue();
    });

    /**
     * @tc.name    BuiltinsInstanceFieldGetValueTest1500
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_GET_VALUE_TEST_1500
     * @tc.desc    Verify that getInstanceFields returns defined values for each field in MultiTypeClass
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsInstanceFieldGetValueTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const obj = new MultiTypeClass();
      const fields = Class.from<MultiTypeClass>().getInstanceFields();
      for (let i = 0; i < fields.length; i++) {
        const val = fields[i].getValue(obj) as Object;
        expect(val !== undefined).assertTrue();
      }
    });
  });
}
