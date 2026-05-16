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

class ClassA {
  greet(): string { return "hello"; }
  add(x: number, y: number): number { return x + y; }
  toString(): string { return "ClassA"; }
}

class ClassB {
  greet(): string { return "world"; }
  subtract(x: number, y: number): number { return x - y; }
}

class ParentClass {
  run(): void {}
  stop(): void {}
}

class ChildClass extends ParentClass {
  jump(): void {}
}

export default function BuiltinsInstanceMethodEqualsTest(): void {
  describe('BuiltinsInstanceMethodEqualsTest', () => {
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
     * @tc.name    BuiltinsInstanceMethodEqualsTest0100
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_EQUALS_TEST_0100
     * @tc.desc    Verify that equals returns true for the same method obtained twice from the same class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsInstanceMethodEqualsTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const method1 = Class.from<ClassA>().getInstanceMethod("greet");
      const method2 = Class.from<ClassA>().getInstanceMethod("greet");
      expect(method1!.equals(method2!)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsInstanceMethodEqualsTest0200
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_EQUALS_TEST_0200
     * @tc.desc    Verify that equals returns false for different methods in the same class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsInstanceMethodEqualsTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const method1 = Class.from<ClassA>().getInstanceMethod("greet");
      const method2 = Class.from<ClassA>().getInstanceMethod("add");
      expect(method1!.equals(method2!)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsInstanceMethodEqualsTest0300
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_EQUALS_TEST_0300
     * @tc.desc    Verify that equals returns false for methods with the same name in different classes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsInstanceMethodEqualsTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const methodA = Class.from<ClassA>().getInstanceMethod("greet");
      const methodB = Class.from<ClassB>().getInstanceMethod("greet");
      expect(methodA!.equals(methodB!)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsInstanceMethodEqualsTest0400
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_EQUALS_TEST_0400
     * @tc.desc    Verify equals symmetry: a.equals(b) == b.equals(a)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsInstanceMethodEqualsTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const method1 = Class.from<ClassA>().getInstanceMethod("greet");
      const method2 = Class.from<ClassA>().getInstanceMethod("greet");
      expect(method1!.equals(method2!)).assertTrue();
      expect(method2!.equals(method1!)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsInstanceMethodEqualsTest0500
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_EQUALS_TEST_0500
     * @tc.desc    Verify equals symmetry: a.equals(b) == b.equals(a)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceMethodEqualsTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const method1 = Class.from<ClassA>().getInstanceMethod("greet");
      const method2 = Class.from<ClassA>().getInstanceMethod("add");
      expect(method1!.equals(method2!)).assertFalse();
      expect(method2!.equals(method1!)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsInstanceMethodEqualsTest0600
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_EQUALS_TEST_0600
     * @tc.desc    Verify equals transitivity: if a==b and b==c then a==c
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceMethodEqualsTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const m1 = Class.from<ClassA>().getInstanceMethod("greet");
      const m2 = Class.from<ClassA>().getInstanceMethod("greet");
      const m3 = Class.from<ClassA>().getInstanceMethod("greet");
      expect(m1!.equals(m2!)).assertTrue();
      expect(m2!.equals(m3!)).assertTrue();
      expect(m1!.equals(m3!)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsInstanceMethodEqualsTest0700
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_EQUALS_TEST_0700
     * @tc.desc    Verify equals idempotency: repeated calls 10 times yield consistent results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceMethodEqualsTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const method1 = Class.from<ClassA>().getInstanceMethod("greet");
      const method2 = Class.from<ClassA>().getInstanceMethod("greet");
      for (let i = 0; i < 10; i++) {
        expect(method1!.equals(method2!)).assertTrue();
      }
    });

    /**
     * @tc.name    BuiltinsInstanceMethodEqualsTest0800
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_EQUALS_TEST_0800
     * @tc.desc    Verify that equals returns false for child class's own method and parent class's method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceMethodEqualsTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const childMethod = Class.from<ChildClass>().getInstanceMethod("jump");
      const parentMethod = Class.from<ParentClass>().getInstanceMethod("run");
      expect(childMethod!.equals(parentMethod!)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsInstanceMethodEqualsTest0900
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_EQUALS_TEST_0900
     * @tc.desc    Verify that equals returns false for two different methods in parent class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsInstanceMethodEqualsTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const method1 = Class.from<ParentClass>().getInstanceMethod("run");
      const method2 = Class.from<ParentClass>().getInstanceMethod("stop");
      expect(method1!.equals(method2!)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsInstanceMethodEqualsTest1000
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_EQUALS_TEST_1000
     * @tc.desc    Verify that equals returns true for the same method obtained via getInstanceMethods iteration and getInstanceMethod
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsInstanceMethodEqualsTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const targetMethod = Class.from<ClassA>().getInstanceMethod("greet");
      const methods = Class.from<ClassA>().getInstanceMethods();
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
     * @tc.name    BuiltinsInstanceMethodEqualsTest1100
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_EQUALS_TEST_1100
     * @tc.desc    Verify that equals returns true for the same method when compared to itself during getInstanceMethods iteration
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsInstanceMethodEqualsTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const methods = Class.from<ClassA>().getInstanceMethods();
      for (let i = 0; i < methods.length; i++) {
        expect(methods[i].equals(methods[i])).assertTrue();
      }
    });

    /**
     * @tc.name    BuiltinsInstanceMethodEqualsTest1200
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_EQUALS_TEST_1200
     * @tc.desc    Verify that equals returns false for different methods when compared pairwise during getInstanceMethods iteration
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsInstanceMethodEqualsTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const methods = Class.from<ClassA>().getInstanceMethods();
      for (let i = 0; i < methods.length; i++) {
        for (let j = 0; j < methods.length; j++) {
          if (i !== j) {
            expect(methods[i].equals(methods[j])).assertFalse();
          }
        }
      }
    });

    /**
     * @tc.name    BuiltinsInstanceMethodEqualsTest1300
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_EQUALS_TEST_1300
     * @tc.desc    Verify that equals returns true for the same method obtained from two different Class.from instances
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsInstanceMethodEqualsTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls1 = Class.from<ClassA>();
      const cls2 = Class.from<ClassA>();
      const m1 = cls1.getInstanceMethod("add");
      const m2 = cls2.getInstanceMethod("add");
      expect(m1!.equals(m2!)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsInstanceMethodEqualsTest1400
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_EQUALS_TEST_1400
     * @tc.desc    Verify that equals returns true for the same method obtained from different Class.from instances for the same class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsInstanceMethodEqualsTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const m1 = Class.from<ClassB>().getInstanceMethod("greet");
      const m2 = Class.from<ClassB>().getInstanceMethod("greet");
      expect(m1!.equals(m2!)).assertTrue();
      expect(m2!.equals(m1!)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsInstanceMethodEqualsTest1500
     * @tc.number  SUB_BUILTINS_INSTANCE_METHOD_EQUALS_TEST_1500
     * @tc.desc    Verify that equals returns false for all methods with the same name between ClassA and ClassB
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsInstanceMethodEqualsTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const methodA = Class.from<ClassA>().getInstanceMethod("greet");
      const methodB = Class.from<ClassB>().getInstanceMethod("greet");
      expect(methodA!.equals(methodB!)).assertFalse();
      expect(methodB!.equals(methodA!)).assertFalse();
    });
  });
}
