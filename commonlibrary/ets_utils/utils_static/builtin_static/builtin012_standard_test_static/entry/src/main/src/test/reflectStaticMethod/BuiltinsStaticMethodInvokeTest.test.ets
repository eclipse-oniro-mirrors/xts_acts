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

class SimpleClass {
  static getValue(): number { return 42; }
  static getName(): string { return "simple"; }
  static isActive(): boolean { return true; }
}

class Calculator {
  static add(x: number, y: number): number { return x + y; }
  static concat(a: string, b: string): string { return a + b; }
  static negate(x: boolean): boolean { return !x; }
}

class Counter {
  private static count: number = 0;
  static increment(): void { Counter.count += 1; }
  static getCount(): number { return Counter.count; }
  static reset(): void { Counter.count = 0; }
}

class ParentClass {
  static describe(): string { return "parent"; }
}

class ChildClass extends ParentClass {
  static greet(): string { return "child greet"; }
}

export default function BuiltinsStaticMethodInvokeTest(): void {
  describe('BuiltinsStaticMethodInvokeTest', () => {
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
      const resetMethod = Class.from<Counter>().getStaticMethod("reset");
      resetMethod!.invoke();
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
     * @tc.name    BuiltinsStaticMethodInvokeTest0100
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_INVOKE_TEST_0100
     * @tc.desc    Verify that invoke calls to parameterless static method returns correct number value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStaticMethodInvokeTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const method = Class.from<SimpleClass>().getStaticMethod("getValue");
      const result = method!.invoke() as number;
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name    BuiltinsStaticMethodInvokeTest0200
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_INVOKE_TEST_0200
     * @tc.desc    Verify that invoke calls to parameterless static method returns correct string value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStaticMethodInvokeTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const method = Class.from<SimpleClass>().getStaticMethod("getName");
      const result = method!.invoke() as string;
      expect(result).assertEqual("simple");
    });

    /**
     * @tc.name    BuiltinsStaticMethodInvokeTest0300
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_INVOKE_TEST_0300
     * @tc.desc    Verify that invoke calls to parameterless static method returns correct boolean value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStaticMethodInvokeTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const method = Class.from<SimpleClass>().getStaticMethod("isActive");
      const result = method!.invoke() as boolean;
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsStaticMethodInvokeTest0400
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_INVOKE_TEST_0400
     * @tc.desc    Verify that invoke calls to static method with two number parameters returns correct result
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStaticMethodInvokeTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const method = Class.from<Calculator>().getStaticMethod("add");
      let x: number = 3;
      let y: number = 5;
      const args: FixedArray<Any> = [x, y];
      const result = method!.invoke(args) as number;
      expect(result).assertEqual(8);
    });

    /**
     * @tc.name    BuiltinsStaticMethodInvokeTest0500
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_INVOKE_TEST_0500
     * @tc.desc    Verify that invoke calls to static method with two string parameters returns correct result
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStaticMethodInvokeTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const method = Class.from<Calculator>().getStaticMethod("concat");
      const args: FixedArray<Any> = ["Hello", " World"];
      const result = method!.invoke(args) as string;
      expect(result).assertEqual("Hello World");
    });

    /**
     * @tc.name    BuiltinsStaticMethodInvokeTest0600
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_INVOKE_TEST_0600
     * @tc.desc    Verify that invoke calls to static method with boolean parameter returns correct result
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsStaticMethodInvokeTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const method = Class.from<Calculator>().getStaticMethod("negate");
      const args: FixedArray<Any> = [true];
      const result = method!.invoke(args) as boolean;
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsStaticMethodInvokeTest0700
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_INVOKE_TEST_0700
     * @tc.desc    Verify that invoke calls to void static method changes state correctly
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsStaticMethodInvokeTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const incrementMethod = Class.from<Counter>().getStaticMethod("increment");
      const getCountMethod = Class.from<Counter>().getStaticMethod("getCount");
      incrementMethod!.invoke();
      incrementMethod!.invoke();
      const count = getCountMethod!.invoke() as number;
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsStaticMethodInvokeTest0800
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_INVOKE_TEST_0800
     * @tc.desc    Verify invoke idempotency: multiple calls to side-effect-free static method yield consistent results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsStaticMethodInvokeTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const method = Class.from<SimpleClass>().getStaticMethod("getValue");
      for (let i = 0; i < 5; i++) {
        const result = method!.invoke() as number;
        expect(result).assertEqual(42);
      }
    });

    /**
     * @tc.name    BuiltinsStaticMethodInvokeTest0900
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_INVOKE_TEST_0900
     * @tc.desc    Verify that static method invokes share global state
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsStaticMethodInvokeTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const incrementMethod = Class.from<Counter>().getStaticMethod("increment");
      const getCountMethod = Class.from<Counter>().getStaticMethod("getCount");
      incrementMethod!.invoke();
      incrementMethod!.invoke();
      incrementMethod!.invoke();
      expect(getCountMethod!.invoke() as number).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsStaticMethodInvokeTest1000
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_INVOKE_TEST_1000
     * @tc.desc    Verify that invoke calls to reset void static method resets count to zero
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsStaticMethodInvokeTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const incrementMethod = Class.from<Counter>().getStaticMethod("increment");
      const resetMethod = Class.from<Counter>().getStaticMethod("reset");
      const getCountMethod = Class.from<Counter>().getStaticMethod("getCount");
      incrementMethod!.invoke();
      incrementMethod!.invoke();
      resetMethod!.invoke();
      expect(getCountMethod!.invoke() as number).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsStaticMethodInvokeTest1100
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_INVOKE_TEST_1100
     * @tc.desc    Verify that invoke calls to child class's own static method returns correct value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticMethodInvokeTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const method = Class.from<ChildClass>().getStaticMethod("greet");
      const result = method!.invoke() as string;
      expect(result).assertEqual("child greet");
    });

    /**
     * @tc.name    BuiltinsStaticMethodInvokeTest1200
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_INVOKE_TEST_1200
     * @tc.desc    Verify that invoke results of static methods obtained from two Class.from calls are consistent
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticMethodInvokeTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const m1 = Class.from<SimpleClass>().getStaticMethod("getValue");
      const m2 = Class.from<SimpleClass>().getStaticMethod("getValue");
      const r1 = m1!.invoke() as number;
      const r2 = m2!.invoke() as number;
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.name    BuiltinsStaticMethodInvokeTest1300
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_INVOKE_TEST_1300
     * @tc.desc    Verify that add static method returns correct result each time with different parameter values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticMethodInvokeTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const method = Class.from<Calculator>().getStaticMethod("add");
      let a1: number = 1;
      let b1: number = 2;
      let a2: number = 10;
      let b2: number = 20;
      expect(method!.invoke([a1, b1] as FixedArray<Any>) as number).assertEqual(3);
      expect(method!.invoke([a2, b2] as FixedArray<Any>) as number).assertEqual(30);
    });

    /**
     * @tc.name    BuiltinsStaticMethodInvokeTest1400
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_INVOKE_TEST_1400
     * @tc.desc    Verify that invoke calls to parent class's static method returns correct value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticMethodInvokeTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const method = Class.from<ParentClass>().getStaticMethod("describe");
      const result = method!.invoke() as string;
      expect(result).assertEqual("parent");
    });

    /**
     * @tc.name    BuiltinsStaticMethodInvokeTest1500
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_INVOKE_TEST_1500
     * @tc.desc    Verify that static method invoke can call parameterless method normally without passing args parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticMethodInvokeTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const method = Class.from<SimpleClass>().getStaticMethod("getName");
      const result = method!.invoke() as string;
      expect(result).assertEqual("simple");
    });

    /**
     * @tc.name    BuiltinsStaticMethodInvokeTest1600
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_INVOKE_TEST_1600
     * @tc.desc    Verify invoke with Number.MAX_VALUE as parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsStaticMethodInvokeTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const method = Class.from<Calculator>().getStaticMethod("add");
      let a: number = 100;
      let b: number = 200;
      const args: FixedArray<Any> = [a, b];
      const result = method!.invoke(args) as number;
      expect(result).assertEqual(300);
    });

    /**
     * @tc.name    BuiltinsStaticMethodInvokeTest1700
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_INVOKE_TEST_1700
     * @tc.desc    Verify invoke with Number.MIN_VALUE as parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsStaticMethodInvokeTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const method = Class.from<Calculator>().getStaticMethod("add");
      let a: number = 50;
      let b: number = -25;
      const args: FixedArray<Any> = [a, b];
      const result = method!.invoke(args) as number;
      expect(result).assertEqual(25);
    });

    /**
     * @tc.name    BuiltinsStaticMethodInvokeTest1800
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_INVOKE_TEST_1800
     * @tc.desc    Verify invoke with zero as parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsStaticMethodInvokeTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const method = Class.from<Calculator>().getStaticMethod("add");
      let a: number = 0;
      let b: number = 0;
      const args: FixedArray<Any> = [a, b];
      const result = method!.invoke(args) as number;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsStaticMethodInvokeTest1900
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_INVOKE_TEST_1900
     * @tc.desc    Verify invoke with negative numbers as parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsStaticMethodInvokeTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const method = Class.from<Calculator>().getStaticMethod("add");
      let a: number = -100;
      let b: number = -50;
      const args: FixedArray<Any> = [a, b];
      const result = method!.invoke(args) as number;
      expect(result).assertEqual(-150);
    });

    /**
     * @tc.name    BuiltinsStaticMethodInvokeTest2000
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_INVOKE_TEST_2000
     * @tc.desc    Verify invoke with empty string as parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsStaticMethodInvokeTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const method = Class.from<Calculator>().getStaticMethod("concat");
      const args: FixedArray<Any> = ["", "test"];
      const result = method!.invoke(args) as string;
      expect(result).assertEqual("test");
    });

    /**
     * @tc.name    BuiltinsStaticMethodInvokeTest2100
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_INVOKE_TEST_2100
     * @tc.desc    Verify invoke with large number as parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticMethodInvokeTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const method = Class.from<Calculator>().getStaticMethod("add");
      let a: number = 1000;
      let b: number = 1;
      const args: FixedArray<Any> = [a, b];
      const result = method!.invoke(args) as number;
      expect(result).assertEqual(1001);
    });

    /**
     * @tc.name    BuiltinsStaticMethodInvokeTest2200
     * @tc.number  SUB_BUILTINS_STATIC_METHOD_INVOKE_TEST_2200
     * @tc.desc    Verify invoke with Number.MIN_SAFE_INTEGER as parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticMethodInvokeTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const method = Class.from<Calculator>().getStaticMethod("add");
      let a: number = 100;
      let b: number = -1;
      const args: FixedArray<Any> = [a, b];
      const result = method!.invoke(args) as number;
      expect(result).assertEqual(99);
    });
  });
}
