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
  value: number = 0;
}

class StringFieldClass {
  text: string = "";
}

class BooleanFieldClass {
  flag: boolean = false;
}

class MultiTypeClass {
  n: number = 0;
  s: string = "";
  b: boolean = false;
}

class ParentClass {
  parentVal: number = 0;
}

class ChildClass extends ParentClass {
  childVal: string = "";
}

class ReadonlyClass {
  readonly fixedVal: number = 999;
  mutableVal: string = "mutable";
}

export default function BuiltinsInstanceFieldSetValueTest(): void {
  describe('BuiltinsInstanceFieldSetValueTest', () => {
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
     * @tc.name    BuiltinsInstanceFieldSetValueTest0100
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_SET_VALUE_TEST_0100
     * @tc.desc    Verify Number field setValue positive integer then getValue correct
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsInstanceFieldSetValueTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const obj = new NumberFieldClass();
      const field = Class.from<NumberFieldClass>().getInstanceField("value");
      let v: number = 42;
      field!.setValue(obj, v);
      expect(field!.getValue(obj) as number).assertEqual(42);
    });

    /**
     * @tc.name    BuiltinsInstanceFieldSetValueTest0200
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_SET_VALUE_TEST_0200
     * @tc.desc    Verify Number field setValue to 0 then getValue returns 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsInstanceFieldSetValueTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const obj = new NumberFieldClass();
      const field = Class.from<NumberFieldClass>().getInstanceField("value");
      let v: number = 0;
      field!.setValue(obj, v);
      expect(field!.getValue(obj) as number).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsInstanceFieldSetValueTest0300
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_SET_VALUE_TEST_0300
     * @tc.desc    Verify Number field setValue to negative then getValue correct
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsInstanceFieldSetValueTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const obj = new NumberFieldClass();
      const field = Class.from<NumberFieldClass>().getInstanceField("value");
      let v: number = -1;
      field!.setValue(obj, v);
      expect(field!.getValue(obj) as number).assertEqual(-1);
    });

    /**
     * @tc.name    BuiltinsInstanceFieldSetValueTest0400
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_SET_VALUE_TEST_0400
     * @tc.desc    Verify Number field setValue to NaN then getValue is NaN
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceFieldSetValueTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new NumberFieldClass();
      const field = Class.from<NumberFieldClass>().getInstanceField("value");
      let v: number = NaN;
      field!.setValue(obj, v);
      expect(isNaN(field!.getValue(obj) as number)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsInstanceFieldSetValueTest0500
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_SET_VALUE_TEST_0500
     * @tc.desc    Verify Number field setValue to Infinity then getValue correct
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceFieldSetValueTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new NumberFieldClass();
      const field = Class.from<NumberFieldClass>().getInstanceField("value");
      let v: number = Infinity;
      field!.setValue(obj, v);
      expect(field!.getValue(obj) as number).assertEqual(Infinity);
    });

    /**
     * @tc.name    BuiltinsInstanceFieldSetValueTest0600
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_SET_VALUE_TEST_0600
     * @tc.desc    Verify Number field setValue to MAX_SAFE_INTEGER then getValue correct
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceFieldSetValueTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new NumberFieldClass();
      const field = Class.from<NumberFieldClass>().getInstanceField("value");
      let v: number = Number.MAX_SAFE_INTEGER;
      field!.setValue(obj, v);
      expect(field!.getValue(obj) as number).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.name    BuiltinsInstanceFieldSetValueTest0700
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_SET_VALUE_TEST_0700
     * @tc.desc    Verify String field setValue to empty string then getValue correct
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceFieldSetValueTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new StringFieldClass();
      const field = Class.from<StringFieldClass>().getInstanceField("text");
      field!.setValue(obj, "");
      expect(field!.getValue(obj) as string).assertEqual("");
    });

    /**
     * @tc.name    BuiltinsInstanceFieldSetValueTest0800
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_SET_VALUE_TEST_0800
     * @tc.desc    Verify String field setValue to normal string then getValue correct
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceFieldSetValueTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new StringFieldClass();
      const field = Class.from<StringFieldClass>().getInstanceField("text");
      field!.setValue(obj, "hello world");
      expect(field!.getValue(obj) as string).assertEqual("hello world");
    });

    /**
     * @tc.name    BuiltinsInstanceFieldSetValueTest0900
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_SET_VALUE_TEST_0900
     * @tc.desc    Verify String field setValue with escape characters then getValue correct
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceFieldSetValueTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new StringFieldClass();
      const field = Class.from<StringFieldClass>().getInstanceField("text");
      field!.setValue(obj, "line1\nline2\ttab");
      expect(field!.getValue(obj) as string).assertEqual("line1\nline2\ttab");
    });

    /**
     * @tc.name    BuiltinsInstanceFieldSetValueTest1000
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_SET_VALUE_TEST_1000
     * @tc.desc    Verify Boolean field setValue to true then getValue correct
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceFieldSetValueTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new BooleanFieldClass();
      const field = Class.from<BooleanFieldClass>().getInstanceField("flag");
      field!.setValue(obj, true);
      expect(field!.getValue(obj) as boolean).assertTrue();
    });

    /**
     * @tc.name    BuiltinsInstanceFieldSetValueTest1100
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_SET_VALUE_TEST_1100
     * @tc.desc    Verify Boolean field setValue to false then getValue correct
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceFieldSetValueTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new BooleanFieldClass();
      const field = Class.from<BooleanFieldClass>().getInstanceField("flag");
      field!.setValue(obj, false);
      expect(field!.getValue(obj) as boolean).assertFalse();
    });

    /**
     * @tc.name    BuiltinsInstanceFieldSetValueTest1200
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_SET_VALUE_TEST_1200
     * @tc.desc    Verify that Number + String + Boolean fields are set correctly when setting them in batch
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceFieldSetValueTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new MultiTypeClass();
      const cls = Class.from<MultiTypeClass>();
      let nv: number = 99;
      cls.getInstanceField("n")!.setValue(obj, nv);
      cls.getInstanceField("s")!.setValue(obj, "arkts");
      cls.getInstanceField("b")!.setValue(obj, true);
      expect(cls.getInstanceField("n")!.getValue(obj) as number).assertEqual(99);
      expect(cls.getInstanceField("s")!.getValue(obj) as string).assertEqual("arkts");
      expect(cls.getInstanceField("b")!.getValue(obj) as boolean).assertTrue();
    });

    /**
     * @tc.name    BuiltinsInstanceFieldSetValueTest1300
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_SET_VALUE_TEST_1300
     * @tc.desc    Verify that Number field setValue is overwritten correctly when called multiple times
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsInstanceFieldSetValueTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const obj = new NumberFieldClass();
      const field = Class.from<NumberFieldClass>().getInstanceField("value");
      let v1: number = 1;
      let v2: number = 2;
      let v3: number = 3;
      field!.setValue(obj, v1);
      field!.setValue(obj, v2);
      field!.setValue(obj, v3);
      expect(field!.getValue(obj) as number).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsInstanceFieldSetValueTest1400
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_SET_VALUE_TEST_1400
     * @tc.desc    Verify that setting Number field setValue does not affect other instances
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsInstanceFieldSetValueTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const obj1 = new NumberFieldClass();
      const obj2 = new NumberFieldClass();
      const field = Class.from<NumberFieldClass>().getInstanceField("value");
      let v: number = 999;
      field!.setValue(obj1, v);
      expect(field!.getValue(obj1) as number).assertEqual(999);
      expect(field!.getValue(obj2) as number).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsInstanceFieldSetValueTest1500
     * @tc.number  SUB_BUILTINS_INSTANCE_FIELD_SET_VALUE_TEST_1500
     * @tc.desc    Verify that setting readonly field setValue throws TypeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsInstanceFieldSetValueTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const obj = new ReadonlyClass();
      const field = Class.from<ReadonlyClass>().getInstanceField("fixedVal");
      try {
        let v: number = 123;
        field!.setValue(obj, v);
        expect().assertFail();
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }
    });
  });
}
