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

class NumberMethodClass {
  static passthrough(n: number): number { return n; }
  static isZero(n: number): boolean { return n === 0; }
  static isNanVal(n: number): boolean { return isNaN(n); }
}

class StringMethodClass {
  static passthrough(s: string): string { return s; }
  static isEmpty(s: string): boolean { return s.length === 0; }
}

class BooleanMethodClass {
  static passthrough(b: boolean): boolean { return b; }
  static negate(b: boolean): boolean { return !b; }
}

class MultiMethodClass {
  static process(n: number, s: string, b: boolean): string { return `${n}_${s}_${b}`; }
}

class ParentClass {
  static run(): void {}
  static stop(): void {}
}

class ChildClass extends ParentClass {
  static jump(): void {}
}

export default function BuiltinsStaticMethodEqualsTest(): void {
  describe('BuiltinsStaticMethodEqualsTest', () => {
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
     * @tc.name    BuiltinsStaticMethodEqualsTest0100
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_EQUALS_TEST_0100
     * @tc.desc    Verify that equals returns true when getting Number parameter static method twice
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStaticMethodEqualsTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const method1 = Class.from<NumberMethodClass>().getStaticMethod("passthrough");
      const method2 = Class.from<NumberMethodClass>().getStaticMethod("passthrough");
      expect(method1!.equals(method2!)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsStaticMethodEqualsTest0200
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_EQUALS_TEST_0200
     * @tc.desc    Verify that equals returns false for different static methods in the same Number class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStaticMethodEqualsTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const method1 = Class.from<NumberMethodClass>().getStaticMethod("passthrough");
      const method2 = Class.from<NumberMethodClass>().getStaticMethod("isZero");
      expect(method1!.equals(method2!)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsStaticMethodEqualsTest0300
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_EQUALS_TEST_0300
     * @tc.desc    Verify that equals returns false for static methods with same name in Number and String classes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStaticMethodEqualsTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const methodNum = Class.from<NumberMethodClass>().getStaticMethod("passthrough");
      const methodStr = Class.from<StringMethodClass>().getStaticMethod("passthrough");
      expect(methodNum!.equals(methodStr!)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsStaticMethodEqualsTest0400
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_EQUALS_TEST_0400
     * @tc.desc    Verify equals symmetry for Number parameter static method (equal case)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStaticMethodEqualsTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const method1 = Class.from<NumberMethodClass>().getStaticMethod("passthrough");
      const method2 = Class.from<NumberMethodClass>().getStaticMethod("passthrough");
      expect(method1!.equals(method2!)).assertTrue();
      expect(method2!.equals(method1!)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsStaticMethodEqualsTest0500
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_EQUALS_TEST_0500
     * @tc.desc    Verify equals symmetry for Number vs String static methods (unequal case)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsStaticMethodEqualsTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const methodNum = Class.from<NumberMethodClass>().getStaticMethod("passthrough");
      const methodStr = Class.from<StringMethodClass>().getStaticMethod("passthrough");
      expect(methodNum!.equals(methodStr!)).assertFalse();
      expect(methodStr!.equals(methodNum!)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsStaticMethodEqualsTest0600
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_EQUALS_TEST_0600
     * @tc.desc    Verify equals transitivity for Number parameter static method: if a==b and b==c then a==c
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsStaticMethodEqualsTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const m1 = Class.from<NumberMethodClass>().getStaticMethod("passthrough");
      const m2 = Class.from<NumberMethodClass>().getStaticMethod("passthrough");
      const m3 = Class.from<NumberMethodClass>().getStaticMethod("passthrough");
      expect(m1!.equals(m2!)).assertTrue();
      expect(m2!.equals(m3!)).assertTrue();
      expect(m1!.equals(m3!)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsStaticMethodEqualsTest0700
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_EQUALS_TEST_0700
     * @tc.desc    Verify equals idempotency for Number parameter static method: consistent results after 10 repeated calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsStaticMethodEqualsTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const method1 = Class.from<NumberMethodClass>().getStaticMethod("passthrough");
      const method2 = Class.from<NumberMethodClass>().getStaticMethod("passthrough");
      for (let i = 0; i < 10; i++) {
        expect(method1!.equals(method2!)).assertTrue();
      }
    });

    /**
     * @tc.name    BuiltinsStaticMethodEqualsTest0800
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_EQUALS_TEST_0800
     * @tc.desc    Verify that equals returns false for child class's own static method and parent class's static method (inheritance scenario)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsStaticMethodEqualsTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const childMethod = Class.from<ChildClass>().getStaticMethod("jump");
      const parentMethod = Class.from<ParentClass>().getStaticMethod("run");
      expect(childMethod!.equals(parentMethod!)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsStaticMethodEqualsTest0900
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_EQUALS_TEST_0900
     * @tc.desc    Verify that equals returns false for two different static methods in parent class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsStaticMethodEqualsTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const method1 = Class.from<ParentClass>().getStaticMethod("run");
      const method2 = Class.from<ParentClass>().getStaticMethod("stop");
      expect(method1!.equals(method2!)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsStaticMethodEqualsTest1000
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_EQUALS_TEST_1000
     * @tc.desc    Verify that equals returns true for Number passthrough method found via getStaticMethods traversal and getStaticMethod result
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticMethodEqualsTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const targetMethod = Class.from<NumberMethodClass>().getStaticMethod("passthrough");
      const methods = Class.from<NumberMethodClass>().getStaticMethods();
      let found = false;
      for (let i = 0; i < methods.length; i++) {
        if (methods[i].equals(targetMethod!)) {
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.name    BuiltinsStaticMethodEqualsTest1100
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_EQUALS_TEST_1100
     * @tc.desc    Verify that equals returns true when each method in Number class's getStaticMethods compares with itself
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticMethodEqualsTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const methods = Class.from<NumberMethodClass>().getStaticMethods();
      for (let i = 0; i < methods.length; i++) {
        expect(methods[i].equals(methods[i])).assertTrue();
      }
    });

    /**
     * @tc.name    BuiltinsStaticMethodEqualsTest1200
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_EQUALS_TEST_1200
     * @tc.desc    Verify that equals returns false for pairwise comparison of different methods in Number class's getStaticMethods
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticMethodEqualsTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const methods = Class.from<NumberMethodClass>().getStaticMethods();
      for (let i = 0; i < methods.length; i++) {
        for (let j = 0; j < methods.length; j++) {
          if (i !== j) {
            expect(methods[i].equals(methods[j])).assertFalse();
          }
        }
      }
    });

    /**
     * @tc.name    BuiltinsStaticMethodEqualsTest1300
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_EQUALS_TEST_1300
     * @tc.desc    Verify that equals returns true for Number isZero static method obtained from two Class.from calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticMethodEqualsTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls1 = Class.from<NumberMethodClass>();
      const cls2 = Class.from<NumberMethodClass>();
      const m1 = cls1.getStaticMethod("isZero");
      const m2 = cls2.getStaticMethod("isZero");
      expect(m1!.equals(m2!)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsStaticMethodEqualsTest1400
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_EQUALS_TEST_1400
     * @tc.desc    Verify that equals returns true symmetrically for Boolean parameter static method obtained from two calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticMethodEqualsTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const m1 = Class.from<BooleanMethodClass>().getStaticMethod("passthrough");
      const m2 = Class.from<BooleanMethodClass>().getStaticMethod("passthrough");
      expect(m1!.equals(m2!)).assertTrue();
      expect(m2!.equals(m1!)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsStaticMethodEqualsTest1500
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_EQUALS_TEST_1500
     * @tc.desc    Verify that equals returns false bidirectionally for static methods with same name in String and Boolean classes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticMethodEqualsTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const methodStr = Class.from<StringMethodClass>().getStaticMethod("passthrough");
      const methodBool = Class.from<BooleanMethodClass>().getStaticMethod("passthrough");
      expect(methodStr!.equals(methodBool!)).assertFalse();
      expect(methodBool!.equals(methodStr!)).assertFalse();
    });
  });
}
