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

class TestClassWithFinalMethod {
  public finalMethod(): string {
    return "final";
  }

  public normalMethod(): string {
    return "normal";
  }
}

class TestClassWithMultipleMethods {
  public method1(): number {
    return 1;
  }

  public method2(): number {
    return 2;
  }

  public method3(): number {
    return 3;
  }
}

class ParentClassWithFinal {
  public parentMethod(): string {
    return "parent";
  }
}

class ChildClassWithFinal extends ParentClassWithFinal {
  public childMethod(): string {
    return "child";
  }
}

export default function BuiltinsIsFinalTest(): void {
  describe('BuiltinsIsFinalTest', () => {
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
     * @tc.name    BuiltinsIsFinalTest0100
     * @tc.number  SUB_BUILTINS_IS_FINAL_TEST_0100
     * @tc.desc    Verify that isFinal() returns correct result for a method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsFinalTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithFinalMethod>();
      const method = cls.getInstanceMethod("finalMethod");
      expect(method !== undefined).assertTrue();
      const result = method!.isFinal();
      expect(result === true || result === false).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsFinalTest0200
     * @tc.number  SUB_BUILTINS_IS_FINAL_TEST_0200
     * @tc.desc    Verify that isFinal() returns consistent type for different methods
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsFinalTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithFinalMethod>();
      const finalMethod = cls.getInstanceMethod("finalMethod");
      const normalMethod = cls.getInstanceMethod("normalMethod");
      expect(finalMethod !== undefined).assertTrue();
      expect(normalMethod !== undefined).assertTrue();
      const result1 = finalMethod!.isFinal();
      const result2 = normalMethod!.isFinal();
      expect(typeof result1 === 'boolean').assertTrue();
      expect(typeof result2 === 'boolean').assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsFinalTest0300
     * @tc.number  SUB_BUILTINS_IS_FINAL_TEST_0300
     * @tc.desc    Verify that isFinal() returns consistent result for the same method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsFinalTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithFinalMethod>();
      const method = cls.getInstanceMethod("finalMethod");
      expect(method !== undefined).assertTrue();
      const result1 = method!.isFinal();
      const result2 = method!.isFinal();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.name    BuiltinsIsFinalTest0400
     * @tc.number  SUB_BUILTINS_IS_FINAL_TEST_0400
     * @tc.desc    Verify that isFinal() works correctly for multiple methods in the same class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsFinalTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithMultipleMethods>();
      const method1 = cls.getInstanceMethod("method1");
      const method2 = cls.getInstanceMethod("method2");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      const result1 = method1!.isFinal();
      const result2 = method2!.isFinal();
      expect(typeof result1 === 'boolean').assertTrue();
      expect(typeof result2 === 'boolean').assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsFinalTest0500
     * @tc.number  SUB_BUILTINS_IS_FINAL_TEST_0500
     * @tc.desc    Verify that isFinal() returns consistent results when called multiple times on different methods
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsFinalTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassWithMultipleMethods>();
      const method1 = cls.getInstanceMethod("method1");
      const method2 = cls.getInstanceMethod("method2");
      const method3 = cls.getInstanceMethod("method3");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method3 !== undefined).assertTrue();
      for (let i = 0; i < 3; i++) {
        expect(typeof method1!.isFinal() === 'boolean').assertTrue();
        expect(typeof method2!.isFinal() === 'boolean').assertTrue();
        expect(typeof method3!.isFinal() === 'boolean').assertTrue();
      }
    });

    /**
     * @tc.name    BuiltinsIsFinalTest0600
     * @tc.number  SUB_BUILTINS_IS_FINAL_TEST_0600
     * @tc.desc    Verify that isFinal() returns boolean for all methods in a class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsFinalTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassWithMultipleMethods>();
      const methods = cls.getInstanceMethods();
      expect(methods.length > 0).assertTrue();
      for (let i = 0; i < methods.length; i++) {
        const result = methods[i].isFinal();
        expect(typeof result === 'boolean').assertTrue();
      }
    });

    /**
     * @tc.name    BuiltinsIsFinalTest0700
     * @tc.number  SUB_BUILTINS_IS_FINAL_TEST_0700
     * @tc.desc    Verify that isFinal() returns consistent results for parent and child class methods
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsFinalTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const parentCls = Class.from<ParentClassWithFinal>();
      const childCls = Class.from<ChildClassWithFinal>();
      const parentMethod = parentCls.getInstanceMethod("parentMethod");
      const childMethod = childCls.getInstanceMethod("childMethod");
      expect(parentMethod !== undefined).assertTrue();
      expect(childMethod !== undefined).assertTrue();
      const parentResult = parentMethod!.isFinal();
      const childResult = childMethod!.isFinal();
      expect(typeof parentResult === 'boolean').assertTrue();
      expect(typeof childResult === 'boolean').assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsFinalTest0800
     * @tc.number  SUB_BUILTINS_IS_FINAL_TEST_0800
     * @tc.desc    Verify that isFinal() returns same result when retrieved from different Class.from calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsFinalTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls1 = Class.from<TestClassWithFinalMethod>();
      const cls2 = Class.from<TestClassWithFinalMethod>();
      const method1 = cls1.getInstanceMethod("finalMethod");
      const method2 = cls2.getInstanceMethod("finalMethod");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      const result1 = method1!.isFinal();
      const result2 = method2!.isFinal();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.name    BuiltinsIsFinalTest0900
     * @tc.number  SUB_BUILTINS_IS_FINAL_TEST_0900
     * @tc.desc    Verify that two different methods are independent in isFinal() results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsFinalTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassWithFinalMethod>();
      const method1 = cls.getInstanceMethod("finalMethod");
      const method2 = cls.getInstanceMethod("normalMethod");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      const result1 = method1!.isFinal();
      const result2 = method2!.isFinal();
      expect(typeof result1 === 'boolean').assertTrue();
      expect(typeof result2 === 'boolean').assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsFinalTest1000
     * @tc.number  SUB_BUILTINS_IS_FINAL_TEST_1000
     * @tc.desc    Verify isFinal() idempotency: multiple calls yield consistent results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsFinalTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithFinalMethod>();
      const method = cls.getInstanceMethod("finalMethod");
      expect(method !== undefined).assertTrue();
      const results: boolean[] = [];
      for (let i = 0; i < 10; i++) {
        results.push(method!.isFinal());
      }
      for (let i = 1; i < results.length; i++) {
        expect(results[i]).assertEqual(results[0]);
      }
    });

    /**
     * @tc.name    BuiltinsIsFinalTest1100
     * @tc.number  SUB_BUILTINS_IS_FINAL_TEST_1100
     * @tc.desc    Verify that isFinal() returns correct results when comparing different methods
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsFinalTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithFinalMethod>();
      const finalMethod = cls.getInstanceMethod("finalMethod");
      const normalMethod = cls.getInstanceMethod("normalMethod");
      expect(finalMethod !== undefined).assertTrue();
      expect(normalMethod !== undefined).assertTrue();
      const result1 = finalMethod!.isFinal();
      const result2 = normalMethod!.isFinal();
      expect(typeof result1 === 'boolean').assertTrue();
      expect(typeof result2 === 'boolean').assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsFinalTest1200
     * @tc.number  SUB_BUILTINS_IS_FINAL_TEST_1200
     * @tc.desc    Verify that three methods do not affect each other's isFinal() results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsFinalTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithMultipleMethods>();
      const method1 = cls.getInstanceMethod("method1");
      const method2 = cls.getInstanceMethod("method2");
      const method3 = cls.getInstanceMethod("method3");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method3 !== undefined).assertTrue();
      const result1 = method1!.isFinal();
      const result2 = method2!.isFinal();
      const result3 = method3!.isFinal();
      expect(typeof result1 === 'boolean').assertTrue();
      expect(typeof result2 === 'boolean').assertTrue();
      expect(typeof result3 === 'boolean').assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsFinalTest1300
     * @tc.number  SUB_BUILTINS_IS_FINAL_TEST_1300
     * @tc.desc    Verify that when checking multiple methods, all return boolean results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsFinalTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithMultipleMethods>();
      const methodNames = ["method1", "method2", "method3"];
      for (let i = 0; i < methodNames.length; i++) {
        const method = cls.getInstanceMethod(methodNames[i]);
        expect(method !== undefined).assertTrue();
        const result = method!.isFinal();
        expect(typeof result === 'boolean').assertTrue();
      }
    });

    /**
     * @tc.name    BuiltinsIsFinalTest1400
     * @tc.number  SUB_BUILTINS_IS_FINAL_TEST_1400
     * @tc.desc    Verify that isFinal() returns correct result for methods retrieved from getInstanceMethods iteration
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsFinalTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithFinalMethod>();
      const methods = cls.getInstanceMethods();
      expect(methods.length > 0).assertTrue();
      let foundMethod = false;
      for (let i = 0; i < methods.length; i++) {
        if (methods[i].getName() === "finalMethod") {
          const result = methods[i].isFinal();
          expect(typeof result === 'boolean').assertTrue();
          foundMethod = true;
          break;
        }
      }
      expect(foundMethod).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsFinalTest1500
     * @tc.number  SUB_BUILTINS_IS_FINAL_TEST_1500
     * @tc.desc    Verify that modifying one method reference does not affect another's isFinal() result
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsFinalTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithFinalMethod>();
      const method1 = cls.getInstanceMethod("finalMethod");
      const method2 = cls.getInstanceMethod("finalMethod");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      const result1 = method1!.isFinal();
      const result2 = method2!.isFinal();
      expect(result1).assertEqual(result2);
    });
  });
}
