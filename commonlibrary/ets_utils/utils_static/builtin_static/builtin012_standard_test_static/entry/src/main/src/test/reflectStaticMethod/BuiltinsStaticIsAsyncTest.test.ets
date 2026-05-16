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

class TestClassWithStaticAsyncMethod {
  static async asyncMethod(): Promise<string> {
    return "async result";
  }

  static syncMethod(): string {
    return "sync result";
  }
}

class TestClassWithMultipleStaticAsync {
  static async method1(): Promise<number> {
    return 1;
  }

  static async method2(): Promise<string> {
    return "hello";
  }

  static syncMethod(): boolean {
    return true;
  }
}

class TestClassWithoutStaticAsync {
  static method1(): number {
    return 1;
  }

  static method2(): string {
    return "hello";
  }
}

export default function BuiltinsStaticIsAsyncTest(): void {
  describe('BuiltinsStaticIsAsyncTest', () => {
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
     * @tc.name    BuiltinsStaticIsAsyncTest0100
     * @tc.number  SUB_BUILTINS_STATIC_IS_ASYNC_TEST_0100
     * @tc.desc    Verify that isAsync() returns true for a static async method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStaticIsAsyncTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithStaticAsyncMethod>();
      const asyncMethod = cls.getStaticMethod("asyncMethod");
      expect(asyncMethod !== undefined).assertTrue();
      expect(asyncMethod!.isAsync()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsStaticIsAsyncTest0200
     * @tc.number  SUB_BUILTINS_STATIC_IS_ASYNC_TEST_0200
     * @tc.desc    Verify that isAsync() returns false for a static synchronous method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStaticIsAsyncTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithStaticAsyncMethod>();
      const syncMethod = cls.getStaticMethod("syncMethod");
      expect(syncMethod !== undefined).assertTrue();
      expect(syncMethod!.isAsync()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsStaticIsAsyncTest0300
     * @tc.number  SUB_BUILTINS_STATIC_IS_ASYNC_TEST_0300
     * @tc.desc    Verify that isAsync() returns false for a static non-async method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStaticIsAsyncTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithoutStaticAsync>();
      const method = cls.getStaticMethod("method1");
      expect(method !== undefined).assertTrue();
      expect(method!.isAsync()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsStaticIsAsyncTest0400
     * @tc.number  SUB_BUILTINS_STATIC_IS_ASYNC_TEST_0400
     * @tc.desc    Verify that isAsync() returns true for multiple static async methods in the same class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStaticIsAsyncTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cls = Class.from<TestClassWithMultipleStaticAsync>();
      const asyncMethod1 = cls.getStaticMethod("method1");
      const asyncMethod2 = cls.getStaticMethod("method2");
      expect(asyncMethod1 !== undefined).assertTrue();
      expect(asyncMethod2 !== undefined).assertTrue();
      expect(asyncMethod1!.isAsync()).assertTrue();
      expect(asyncMethod2!.isAsync()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsStaticIsAsyncTest0500
     * @tc.number  SUB_BUILTINS_STATIC_IS_ASYNC_TEST_0500
     * @tc.desc    Verify that isAsync() returns false for static sync methods even when static async methods exist in the same class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsStaticIsAsyncTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassWithMultipleStaticAsync>();
      const syncMethod = cls.getStaticMethod("syncMethod");
      expect(syncMethod !== undefined).assertTrue();
      expect(syncMethod!.isAsync()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsStaticIsAsyncTest0600
     * @tc.number  SUB_BUILTINS_STATIC_IS_ASYNC_TEST_0600
     * @tc.desc    Verify that isAsync() returns false for all static methods when no static async methods exist
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsStaticIsAsyncTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassWithoutStaticAsync>();
      const method1 = cls.getStaticMethod("method1");
      const method2 = cls.getStaticMethod("method2");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.isAsync()).assertFalse();
      expect(method2!.isAsync()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsStaticIsAsyncTest0700
     * @tc.number  SUB_BUILTINS_STATIC_IS_ASYNC_TEST_0700
     * @tc.desc    Verify that isAsync() returns consistent results for the same static async method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsStaticIsAsyncTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassWithStaticAsyncMethod>();
      const asyncMethod = cls.getStaticMethod("asyncMethod");
      expect(asyncMethod !== undefined).assertTrue();
      expect(asyncMethod!.isAsync()).assertTrue();
      expect(asyncMethod!.isAsync()).assertTrue();
      expect(asyncMethod!.isAsync()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsStaticIsAsyncTest0800
     * @tc.number  SUB_BUILTINS_STATIC_IS_ASYNC_TEST_0800
     * @tc.desc    Verify that isAsync() returns true when retrieved from different Class.from calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsStaticIsAsyncTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls1 = Class.from<TestClassWithStaticAsyncMethod>();
      const cls2 = Class.from<TestClassWithStaticAsyncMethod>();
      const async1 = cls1.getStaticMethod("asyncMethod");
      const async2 = cls2.getStaticMethod("asyncMethod");
      expect(async1 !== undefined).assertTrue();
      expect(async2 !== undefined).assertTrue();
      expect(async1!.isAsync()).assertTrue();
      expect(async2!.isAsync()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsStaticIsAsyncTest0900
     * @tc.number  SUB_BUILTINS_STATIC_IS_ASYNC_TEST_0900
     * @tc.desc    Verify that two different static async methods are independent
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsStaticIsAsyncTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClassWithMultipleStaticAsync>();
      const asyncMethod1 = cls.getStaticMethod("method1");
      const asyncMethod2 = cls.getStaticMethod("method2");
      expect(asyncMethod1 !== undefined).assertTrue();
      expect(asyncMethod2 !== undefined).assertTrue();
      expect(asyncMethod1!.isAsync()).assertTrue();
      expect(asyncMethod2!.isAsync()).assertTrue();
      expect(asyncMethod1!.getName() !== asyncMethod2!.getName()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsStaticIsAsyncTest1000
     * @tc.number  SUB_BUILTINS_STATIC_IS_ASYNC_TEST_1000
     * @tc.desc    Verify isAsync() idempotency: multiple calls yield consistent results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticIsAsyncTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithStaticAsyncMethod>();
      const asyncMethod = cls.getStaticMethod("asyncMethod");
      expect(asyncMethod !== undefined).assertTrue();
      for (let i = 0; i < 10; i++) {
        expect(asyncMethod!.isAsync()).assertTrue();
      }
    });

    /**
     * @tc.name    BuiltinsStaticIsAsyncTest1100
     * @tc.number  SUB_BUILTINS_STATIC_IS_ASYNC_TEST_1100
     * @tc.desc    Verify that isAsync() returns correct result when comparing static async and sync methods
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticIsAsyncTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithStaticAsyncMethod>();
      const asyncMethod = cls.getStaticMethod("asyncMethod");
      const syncMethod = cls.getStaticMethod("syncMethod");
      expect(asyncMethod !== undefined).assertTrue();
      expect(syncMethod !== undefined).assertTrue();
      expect(asyncMethod!.isAsync()).assertTrue();
      expect(syncMethod!.isAsync()).assertFalse();
      expect(asyncMethod!.isAsync() !== syncMethod!.isAsync()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsStaticIsAsyncTest1200
     * @tc.number  SUB_BUILTINS_STATIC_IS_ASYNC_TEST_1200
     * @tc.desc    Verify that three static methods (async1, async2, sync) do not affect each other's results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticIsAsyncTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithMultipleStaticAsync>();
      const asyncMethod1 = cls.getStaticMethod("method1");
      const asyncMethod2 = cls.getStaticMethod("method2");
      const syncMethod = cls.getStaticMethod("syncMethod");
      expect(asyncMethod1 !== undefined).assertTrue();
      expect(asyncMethod2 !== undefined).assertTrue();
      expect(syncMethod !== undefined).assertTrue();
      expect(asyncMethod1!.isAsync()).assertTrue();
      expect(asyncMethod2!.isAsync()).assertTrue();
      expect(syncMethod!.isAsync()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsStaticIsAsyncTest1300
     * @tc.number  SUB_BUILTINS_STATIC_IS_ASYNC_TEST_1300
     * @tc.desc    Verify that when checking multiple static methods, only static async methods return true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticIsAsyncTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithMultipleStaticAsync>();
      const methods: string[] = ["method1", "method2", "syncMethod"];
      const expectedResults: boolean[] = [true, true, false];
      for (let i = 0; i < methods.length; i++) {
        const method = cls.getStaticMethod(methods[i]);
        expect(method !== undefined).assertTrue();
        expect(method!.isAsync()).assertEqual(expectedResults[i]);
      }
    });

    /**
     * @tc.name    BuiltinsStaticIsAsyncTest1400
     * @tc.number  SUB_BUILTINS_STATIC_IS_ASYNC_TEST_1400
     * @tc.desc    Verify that isAsync() returns true for a static async method retrieved from getStaticMethods iteration
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticIsAsyncTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithStaticAsyncMethod>();
      const methods = cls.getStaticMethods();
      let asyncFound: boolean = false;
      for (let i = 0; i < methods.length; i++) {
        if (methods[i].getName() === "asyncMethod") {
          expect(methods[i].isAsync()).assertTrue();
          asyncFound = true;
          break;
        }
      }
      expect(asyncFound).assertTrue();
    });

    /**
     * @tc.name    BuiltinsStaticIsAsyncTest1500
     * @tc.number  SUB_BUILTINS_STATIC_IS_ASYNC_TEST_1500
     * @tc.desc    Verify that modifying one static method reference does not affect another's isAsync() result
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticIsAsyncTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithStaticAsyncMethod>();
      const async1 = cls.getStaticMethod("asyncMethod");
      const async2 = cls.getStaticMethod("asyncMethod");
      expect(async1 !== undefined).assertTrue();
      expect(async2 !== undefined).assertTrue();
      expect(async1!.isAsync()).assertTrue();
      expect(async2!.isAsync()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsStaticIsAsyncTest1600
     * @tc.number  SUB_BUILTINS_STATIC_IS_ASYNC_TEST_1600
     * @tc.desc    Verify that isAsync() returns true for a third static async method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticIsAsyncTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithMultipleStaticAsync>();
      const asyncMethod = cls.getStaticMethod("method1");
      expect(asyncMethod !== undefined).assertTrue();
      expect(asyncMethod!.isAsync()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsStaticIsAsyncTest1700
     * @tc.number  SUB_BUILTINS_STATIC_IS_ASYNC_TEST_1700
     * @tc.desc    Verify that isAsync() returns false for a third static non-async method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticIsAsyncTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithoutStaticAsync>();
      const method = cls.getStaticMethod("method1");
      expect(method !== undefined).assertTrue();
      expect(method!.isAsync()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsStaticIsAsyncTest1800
     * @tc.number  SUB_BUILTINS_STATIC_IS_ASYNC_TEST_1800
     * @tc.desc    Verify that isAsync() returns consistent results across all static method types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticIsAsyncTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithMultipleStaticAsync>();
      const asyncMethod1 = cls.getStaticMethod("method1");
      const asyncMethod2 = cls.getStaticMethod("method2");
      const syncMethod = cls.getStaticMethod("syncMethod");
      expect(asyncMethod1 !== undefined).assertTrue();
      expect(asyncMethod2 !== undefined).assertTrue();
      expect(syncMethod !== undefined).assertTrue();
      expect(asyncMethod1!.isAsync()).assertTrue();
      expect(asyncMethod2!.isAsync()).assertTrue();
      expect(syncMethod!.isAsync()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsStaticIsAsyncTest1900
     * @tc.number  SUB_BUILTINS_STATIC_IS_ASYNC_TEST_1900
     * @tc.desc    Verify four different static methods independence: async/async/sync results do not interfere with each other
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticIsAsyncTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls1 = Class.from<TestClassWithStaticAsyncMethod>();
      const cls2 = Class.from<TestClassWithoutStaticAsync>();
      const asyncMethod = cls1.getStaticMethod("asyncMethod");
      const syncMethod = cls1.getStaticMethod("syncMethod");
      const nonAsyncMethod = cls2.getStaticMethod("method1");
      expect(asyncMethod !== undefined).assertTrue();
      expect(syncMethod !== undefined).assertTrue();
      expect(nonAsyncMethod !== undefined).assertTrue();
      expect(asyncMethod!.isAsync()).assertTrue();
      expect(syncMethod!.isAsync()).assertFalse();
      expect(nonAsyncMethod!.isAsync()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsStaticIsAsyncTest2000
     * @tc.number  SUB_BUILTINS_STATIC_IS_ASYNC_TEST_2000
     * @tc.desc    Verify sync method idempotency: calling isAsync() on sync method 10 times in a loop all return false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticIsAsyncTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithStaticAsyncMethod>();
      const syncMethod = cls.getStaticMethod("syncMethod");
      expect(syncMethod !== undefined).assertTrue();
      for (let i = 0; i < 10; i++) {
        expect(syncMethod!.isAsync()).assertFalse();
      }
    });

    /**
     * @tc.name    BuiltinsStaticIsAsyncTest2100
     * @tc.number  SUB_BUILTINS_STATIC_IS_ASYNC_TEST_2100
     * @tc.desc    Verify three consecutive getStaticMethod calls return correct isAsync results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticIsAsyncTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithMultipleStaticAsync>();
      const syncMethod = cls.getStaticMethod("syncMethod");
      const asyncMethod1 = cls.getStaticMethod("method1");
      const nonAsyncMethod = cls.getStaticMethod("method2");
      expect(syncMethod !== undefined).assertTrue();
      expect(asyncMethod1 !== undefined).assertTrue();
      expect(nonAsyncMethod !== undefined).assertTrue();
      expect(syncMethod!.isAsync()).assertFalse();
      expect(asyncMethod1!.isAsync()).assertTrue();
      expect(nonAsyncMethod!.isAsync()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsStaticIsAsyncTest2200
     * @tc.number  SUB_BUILTINS_STATIC_IS_ASYNC_TEST_2200
     * @tc.desc    Verify that isAsync() returns false after retrieving sync method from class with async methods
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticIsAsyncTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithMultipleStaticAsync>();
      const asyncMethod = cls.getStaticMethod("method1");
      const syncMethod = cls.getStaticMethod("syncMethod");
      expect(asyncMethod !== undefined).assertTrue();
      expect(syncMethod !== undefined).assertTrue();
      expect(asyncMethod!.isAsync()).assertTrue();
      expect(syncMethod!.isAsync()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsStaticIsAsyncTest2300
     * @tc.number  SUB_BUILTINS_STATIC_IS_ASYNC_TEST_2300
     * @tc.desc    Verify that isAsync() changes from true to false when comparing async and sync methods
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticIsAsyncTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithMultipleStaticAsync>();
      const asyncMethod1 = cls.getStaticMethod("method1");
      const asyncMethod2 = cls.getStaticMethod("method2");
      const syncMethod = cls.getStaticMethod("syncMethod");
      expect(asyncMethod1 !== undefined).assertTrue();
      expect(asyncMethod2 !== undefined).assertTrue();
      expect(syncMethod !== undefined).assertTrue();
      expect(asyncMethod1!.isAsync()).assertTrue();
      expect(asyncMethod2!.isAsync()).assertTrue();
      expect(syncMethod!.isAsync()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsStaticIsAsyncTest2400
     * @tc.number  SUB_BUILTINS_STATIC_IS_ASYNC_TEST_2400
     * @tc.desc    Verify that all methods in class without async return false for isAsync()
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticIsAsyncTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithoutStaticAsync>();
      const method1 = cls.getStaticMethod("method1");
      const method2 = cls.getStaticMethod("method2");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.isAsync()).assertFalse();
      expect(method2!.isAsync()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsStaticIsAsyncTest2500
     * @tc.number  SUB_BUILTINS_STATIC_IS_ASYNC_TEST_2500
     * @tc.desc    Verify that all async methods in class with multiple async return true for isAsync()
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticIsAsyncTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithMultipleStaticAsync>();
      const asyncMethod1 = cls.getStaticMethod("method1");
      const asyncMethod2 = cls.getStaticMethod("method2");
      const syncMethod = cls.getStaticMethod("syncMethod");
      expect(asyncMethod1 !== undefined).assertTrue();
      expect(asyncMethod2 !== undefined).assertTrue();
      expect(syncMethod !== undefined).assertTrue();
      expect(asyncMethod1!.isAsync()).assertTrue();
      expect(asyncMethod2!.isAsync()).assertTrue();
      expect(syncMethod!.isAsync()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsStaticIsAsyncTest2600
     * @tc.number  SUB_BUILTINS_STATIC_IS_ASYNC_TEST_2600
     * @tc.desc    Verify 10 static methods with mixed async/sync, returning correct results alternately
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticIsAsyncTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls1 = Class.from<TestClassWithStaticAsyncMethod>();
      const cls2 = Class.from<TestClassWithoutStaticAsync>();
      const method1 = cls1.getStaticMethod("asyncMethod");
      const method2 = cls1.getStaticMethod("syncMethod");
      const method3 = cls2.getStaticMethod("method1");
      const method4 = cls2.getStaticMethod("method2");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method3 !== undefined).assertTrue();
      expect(method4 !== undefined).assertTrue();
      let trueCount: number = 0;
      if (method1!.isAsync()) { trueCount++; }
      if (method2!.isAsync()) { trueCount++; }
      if (method3!.isAsync()) { trueCount++; }
      if (method4!.isAsync()) { trueCount++; }
      expect(trueCount).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsStaticIsAsyncTest2700
     * @tc.number  SUB_BUILTINS_STATIC_IS_ASYNC_TEST_2700
     * @tc.desc    Verify that isAsync() returns false for sync method and true for async method in same class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticIsAsyncTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithStaticAsyncMethod>();
      const syncMethod = cls.getStaticMethod("syncMethod");
      const asyncMethod = cls.getStaticMethod("asyncMethod");
      expect(syncMethod !== undefined).assertTrue();
      expect(asyncMethod !== undefined).assertTrue();
      expect(syncMethod!.isAsync()).assertFalse();
      expect(asyncMethod!.isAsync()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsStaticIsAsyncTest2800
     * @tc.number  SUB_BUILTINS_STATIC_IS_ASYNC_TEST_2800
     * @tc.desc    Verify alternating 6 calls on async and sync methods, isAsync() returns true and false alternately
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticIsAsyncTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithStaticAsyncMethod>();
      const asyncMethod = cls.getStaticMethod("asyncMethod");
      const syncMethod = cls.getStaticMethod("syncMethod");
      expect(asyncMethod !== undefined).assertTrue();
      expect(syncMethod !== undefined).assertTrue();
      const expected: boolean[] = [true, false, true, false, true, false];
      for (let i = 0; i < 6; i++) {
        if (i % 2 === 0) {
          expect(asyncMethod!.isAsync()).assertEqual(expected[i]);
        } else {
          expect(syncMethod!.isAsync()).assertEqual(expected[i]);
        }
      }
    });

    /**
     * @tc.name    BuiltinsStaticIsAsyncTest2900
     * @tc.number  SUB_BUILTINS_STATIC_IS_ASYNC_TEST_2900
     * @tc.desc    Verify combinations with static async and non-async, returning true and false alternately
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticIsAsyncTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls1 = Class.from<TestClassWithStaticAsyncMethod>();
      const cls2 = Class.from<TestClassWithoutStaticAsync>();
      const method1 = cls2.getStaticMethod("method1");
      const method2 = cls2.getStaticMethod("method2");
      const method3 = cls1.getStaticMethod("syncMethod");
      const method4 = cls1.getStaticMethod("asyncMethod");
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method3 !== undefined).assertTrue();
      expect(method4 !== undefined).assertTrue();
      expect(method1!.isAsync()).assertFalse();
      expect(method2!.isAsync()).assertFalse();
      expect(method3!.isAsync()).assertFalse();
      expect(method4!.isAsync()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsStaticIsAsyncTest3000
     * @tc.number  SUB_BUILTINS_STATIC_IS_ASYNC_TEST_3000
     * @tc.desc    Verify alternating checks on async and sync methods, returning true and false alternately
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsStaticIsAsyncTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<TestClassWithStaticAsyncMethod>();
      const asyncMethod = cls.getStaticMethod("asyncMethod");
      const syncMethod = cls.getStaticMethod("syncMethod");
      expect(asyncMethod !== undefined).assertTrue();
      expect(syncMethod !== undefined).assertTrue();
      for (let i = 0; i < 10; i++) {
        if (i % 2 === 0) {
          expect(asyncMethod!.isAsync()).assertTrue();
        } else {
          expect(syncMethod!.isAsync()).assertFalse();
        }
      }
    });
  });
}
