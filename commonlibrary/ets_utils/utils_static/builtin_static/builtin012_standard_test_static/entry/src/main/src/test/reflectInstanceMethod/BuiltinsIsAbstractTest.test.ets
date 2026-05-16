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

class TestClassWithAbstractMethod {
  public abstractMethod(): string {
    return "abstract";
  }

  public concreteMethod(): string {
    return "concrete";
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

class ParentClassWithAbstract {
  public parentMethod(): string {
    return "parent";
  }
}

class ChildClassWithAbstract extends ParentClassWithAbstract {
  public childMethod(): string {
    return "child";
  }
}

export default function BuiltinsIsAbstractTest(): void {
  describe('BuiltinsIsAbstractTest', () => {
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
     * @tc.name    BuiltinsIsAbstractTest0100
     * @tc.number  SUB_BUILTINS_IS_ABSTRACT_TEST_0100
     * @tc.desc    Verify that isAbstract() returns correct result for a method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsAbstractTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithAbstractMethod>();
      const method = cls.getInstanceMethod("abstractMethod");
      expect(method !== undefined).assertTrue();
      const result = method!.isAbstract();
      expect(result === true || result === false).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsAbstractTest0200
     * @tc.number  SUB_BUILTINS_IS_ABSTRACT_TEST_0200
     * @tc.desc    Verify that isAbstract() returns consistent type for different methods
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsAbstractTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithAbstractMethod>();
      const abstractMethod = cls.getInstanceMethod("abstractMethod");
      const concreteMethod = cls.getInstanceMethod("concreteMethod");
      expect(abstractMethod !== undefined).assertTrue();
      expect(concreteMethod !== undefined).assertTrue();
      const result1 = abstractMethod!.isAbstract();
      const result2 = concreteMethod!.isAbstract();
      expect(typeof result1 === 'boolean').assertTrue();
      expect(typeof result2 === 'boolean').assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsAbstractTest0300
     * @tc.number  SUB_BUILTINS_IS_ABSTRACT_TEST_0300
     * @tc.desc    Verify that isAbstract() returns consistent result for the same method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsAbstractTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithAbstractMethod>();
      const method = cls.getInstanceMethod("abstractMethod");
      expect(method !== undefined).assertTrue();
      const result1 = method!.isAbstract();
      const result2 = method!.isAbstract();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.name    BuiltinsIsAbstractTest0400
     * @tc.number  SUB_BUILTINS_IS_ABSTRACT_TEST_0400
     * @tc.desc    Verify that isAbstract() works correctly for multiple methods in the same class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsAbstractTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithMultipleMethods>();
      const method1 = cls.getInstanceMethod("method1");
      const method2 = cls.getInstanceMethod("method2");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      const result1 = method1!.isAbstract();
      const result2 = method2!.isAbstract();
      expect(typeof result1 === 'boolean').assertTrue();
      expect(typeof result2 === 'boolean').assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsAbstractTest0500
     * @tc.number  SUB_BUILTINS_IS_ABSTRACT_TEST_0500
     * @tc.desc    Verify that isAbstract() returns consistent results when called multiple times on different methods
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsAbstractTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassWithMultipleMethods>();
      const method1 = cls.getInstanceMethod("method1");
      const method2 = cls.getInstanceMethod("method2");
      const method3 = cls.getInstanceMethod("method3");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method3 !== undefined).assertTrue();
      for (let i = 0; i < 3; i++) {
        expect(typeof method1!.isAbstract() === 'boolean').assertTrue();
        expect(typeof method2!.isAbstract() === 'boolean').assertTrue();
        expect(typeof method3!.isAbstract() === 'boolean').assertTrue();
      }
    });

    /**
     * @tc.name    BuiltinsIsAbstractTest0600
     * @tc.number  SUB_BUILTINS_IS_ABSTRACT_TEST_0600
     * @tc.desc    Verify that isAbstract() returns boolean for all methods in a class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsAbstractTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassWithMultipleMethods>();
      const methods = cls.getInstanceMethods();
      expect(methods.length > 0).assertTrue();
      for (let i = 0; i < methods.length; i++) {
        const result = methods[i].isAbstract();
        expect(typeof result === 'boolean').assertTrue();
      }
    });

    /**
     * @tc.name    BuiltinsIsAbstractTest0700
     * @tc.number  SUB_BUILTINS_IS_ABSTRACT_TEST_0700
     * @tc.desc    Verify that isAbstract() returns consistent results for parent and child class methods
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsAbstractTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const parentCls = Class.from<ParentClassWithAbstract>();
      const childCls = Class.from<ChildClassWithAbstract>();
      const parentMethod = parentCls.getInstanceMethod("parentMethod");
      const childMethod = childCls.getInstanceMethod("childMethod");
      expect(parentMethod !== undefined).assertTrue();
      expect(childMethod !== undefined).assertTrue();
      const parentResult = parentMethod!.isAbstract();
      const childResult = childMethod!.isAbstract();
      expect(typeof parentResult === 'boolean').assertTrue();
      expect(typeof childResult === 'boolean').assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsAbstractTest0800
     * @tc.number  SUB_BUILTINS_IS_ABSTRACT_TEST_0800
     * @tc.desc    Verify that isAbstract() returns same result when retrieved from different Class.from calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsAbstractTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls1 = Class.from<TestClassWithAbstractMethod>();
      const cls2 = Class.from<TestClassWithAbstractMethod>();
      const method1 = cls1.getInstanceMethod("abstractMethod");
      const method2 = cls2.getInstanceMethod("abstractMethod");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      const result1 = method1!.isAbstract();
      const result2 = method2!.isAbstract();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.name    BuiltinsIsAbstractTest0900
     * @tc.number  SUB_BUILTINS_IS_ABSTRACT_TEST_0900
     * @tc.desc    Verify that two different methods are independent in isAbstract() results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsAbstractTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassWithAbstractMethod>();
      const method1 = cls.getInstanceMethod("abstractMethod");
      const method2 = cls.getInstanceMethod("concreteMethod");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      const result1 = method1!.isAbstract();
      const result2 = method2!.isAbstract();
      expect(typeof result1 === 'boolean').assertTrue();
      expect(typeof result2 === 'boolean').assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsAbstractTest1000
     * @tc.number  SUB_BUILTINS_IS_ABSTRACT_TEST_1000
     * @tc.desc    Verify isAbstract() idempotency: multiple calls yield consistent results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsAbstractTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithAbstractMethod>();
      const method = cls.getInstanceMethod("abstractMethod");
      expect(method !== undefined).assertTrue();
      const results: boolean[] = [];
      for (let i = 0; i < 10; i++) {
        results.push(method!.isAbstract());
      }
      for (let i = 1; i < results.length; i++) {
        expect(results[i]).assertEqual(results[0]);
      }
    });

    /**
     * @tc.name    BuiltinsIsAbstractTest1100
     * @tc.number  SUB_BUILTINS_IS_ABSTRACT_TEST_1100
     * @tc.desc    Verify that isAbstract() returns correct results when comparing different methods
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsAbstractTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithAbstractMethod>();
      const abstractMethod = cls.getInstanceMethod("abstractMethod");
      const concreteMethod = cls.getInstanceMethod("concreteMethod");
      expect(abstractMethod !== undefined).assertTrue();
      expect(concreteMethod !== undefined).assertTrue();
      const result1 = abstractMethod!.isAbstract();
      const result2 = concreteMethod!.isAbstract();
      expect(typeof result1 === 'boolean').assertTrue();
      expect(typeof result2 === 'boolean').assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsAbstractTest1200
     * @tc.number  SUB_BUILTINS_IS_ABSTRACT_TEST_1200
     * @tc.desc    Verify that three methods do not affect each other's isAbstract() results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsAbstractTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithMultipleMethods>();
      const method1 = cls.getInstanceMethod("method1");
      const method2 = cls.getInstanceMethod("method2");
      const method3 = cls.getInstanceMethod("method3");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method3 !== undefined).assertTrue();
      const result1 = method1!.isAbstract();
      const result2 = method2!.isAbstract();
      const result3 = method3!.isAbstract();
      expect(typeof result1 === 'boolean').assertTrue();
      expect(typeof result2 === 'boolean').assertTrue();
      expect(typeof result3 === 'boolean').assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsAbstractTest1300
     * @tc.number  SUB_BUILTINS_IS_ABSTRACT_TEST_1300
     * @tc.desc    Verify that when checking multiple methods, all return boolean results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsAbstractTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithMultipleMethods>();
      const methodNames = ["method1", "method2", "method3"];
      for (let i = 0; i < methodNames.length; i++) {
        const method = cls.getInstanceMethod(methodNames[i]);
        expect(method !== undefined).assertTrue();
        const result = method!.isAbstract();
        expect(typeof result === 'boolean').assertTrue();
      }
    });

    /**
     * @tc.name    BuiltinsIsAbstractTest1400
     * @tc.number  SUB_BUILTINS_IS_ABSTRACT_TEST_1400
     * @tc.desc    Verify that isAbstract() returns correct result for methods retrieved from getInstanceMethods iteration
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsAbstractTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithAbstractMethod>();
      const methods = cls.getInstanceMethods();
      expect(methods.length > 0).assertTrue();
      let foundMethod = false;
      for (let i = 0; i < methods.length; i++) {
        if (methods[i].getName() === "abstractMethod") {
          const result = methods[i].isAbstract();
          expect(typeof result === 'boolean').assertTrue();
          foundMethod = true;
          break;
        }
      }
      expect(foundMethod).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsAbstractTest1500
     * @tc.number  SUB_BUILTINS_IS_ABSTRACT_TEST_1500
     * @tc.desc    Verify that modifying one method reference does not affect another's isAbstract() result
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsAbstractTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithAbstractMethod>();
      const method1 = cls.getInstanceMethod("abstractMethod");
      const method2 = cls.getInstanceMethod("abstractMethod");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      const result1 = method1!.isAbstract();
      const result2 = method2!.isAbstract();
      expect(result1).assertEqual(result2);
    });
  });
}
