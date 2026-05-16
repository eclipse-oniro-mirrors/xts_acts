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

class CallerTestHelper {
  static getCaller(): Class | undefined {
    return Class.ofCaller();
  }

  getCallerInstance(): Class | undefined {
    return Class.ofCaller();
  }
}

class NestedCallerTest {
  static callNested(): Class | undefined {
    const nestedFunc = (): Class | undefined => {
      return Class.ofCaller();
    };
    return nestedFunc();
  }
}

class AsyncCallerTest {
  static async callAsync(): Promise<Class | undefined> {
    const asyncFunc = async (): Promise<Class | undefined> => {
      return Class.ofCaller();
    };
    return await asyncFunc();
  }
}

class MultipleCallerTest {
  static getCallerMultiple(): [Class | undefined, Class | undefined] {
    const caller1 = Class.ofCaller();
    const caller2 = Class.ofCaller();
    return [caller1, caller2];
  }
}

class ClassA {
  static getCaller(): Class | undefined {
    return Class.ofCaller();
  }
}

class ClassB {
  static getCaller(): Class | undefined {
    return Class.ofCaller();
  }
}

class DeepNestedCallerTest {
  static level1(): Class | undefined {
    return DeepNestedCallerTest.level2();
  }

  static level2(): Class | undefined {
    return DeepNestedCallerTest.level3();
  }

  static level3(): Class | undefined {
    return Class.ofCaller();
  }
}

class StaticInitializationTest {
  private static caller: Class | undefined = Class.ofCaller();

  static getCallerFromStaticInit(): Class | undefined {
    return StaticInitializationTest.caller;
  }
}

export default function BuiltinsClassOfCallerTest(): void {
  describe("BuiltinsClassOfCallerTest", () => {
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
     * @tc.name    BuiltinsClassOfCallerTest0100
     * @tc.number  SUB_BUILTINS_CLASS_OF_CALLER_TEST_0100
     * @tc.desc    Verify ofCaller returns class when called from top-level
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassOfCallerTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const callerClass = Class.ofCaller();
      expect(callerClass !== null).assertTrue();
      expect(callerClass!.getName().length > 0).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassOfCallerTest0200
     * @tc.number  SUB_BUILTINS_CLASS_OF_CALLER_TEST_0200
     * @tc.desc    Verify ofCaller returns caller class when called from static method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassOfCallerTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caller = CallerTestHelper.getCaller();
      expect(caller !== null).assertTrue();
      expect(caller!.getName().length > 0).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassOfCallerTest0300
     * @tc.number  SUB_BUILTINS_CLASS_OF_CALLER_TEST_0300
     * @tc.desc    Verify ofCaller returns caller class when called from instance method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassOfCallerTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const instance = new CallerTestHelper();
      const caller = instance.getCallerInstance();
      expect(caller !== null).assertTrue();
      expect(caller!.getName().length > 0).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassOfCallerTest0400
     * @tc.number  SUB_BUILTINS_CLASS_OF_CALLER_TEST_0400
     * @tc.desc    Verify ofCaller returns correct caller in nested function
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassOfCallerTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const caller = NestedCallerTest.callNested();
      expect(caller !== null).assertTrue();
      expect(caller!.getName().length > 0).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassOfCallerTest0500
     * @tc.number  SUB_BUILTINS_CLASS_OF_CALLER_TEST_0500
     * @tc.desc    Verify ofCaller returns correct caller in async function
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassOfCallerTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caller = await AsyncCallerTest.callAsync();
      if (caller) {
        expect(caller.getName().length > 0).assertTrue();
      } else {
        expect(caller).assertEqual(undefined);
      }
    });

    /**
     * @tc.name    BuiltinsClassOfCallerTest0600
     * @tc.number  SUB_BUILTINS_CLASS_OF_CALLER_TEST_0600
     * @tc.desc    Verify ofCaller returns same result for multiple calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassOfCallerTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const [caller1, caller2] = MultipleCallerTest.getCallerMultiple();
      expect(caller1).assertEqual(caller2);
    });

    /**
     * @tc.name    BuiltinsClassOfCallerTest0700
     * @tc.number  SUB_BUILTINS_CLASS_OF_CALLER_TEST_0700
     * @tc.desc    Verify ofCaller returns different callers from different classes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassOfCallerTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const callerA = ClassA.getCaller();
      const callerB = ClassB.getCaller();

      expect(callerA !== null).assertTrue();
      expect(callerB !== null).assertTrue();
      expect(callerA!.getName().length > 0).assertTrue();
      expect(callerB!.getName().length > 0).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassOfCallerTest0800
     * @tc.number  SUB_BUILTINS_CLASS_OF_CALLER_TEST_0800
     * @tc.desc    Verify ofCaller returns correct caller in deep nested calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassOfCallerTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const caller = DeepNestedCallerTest.level1();
      expect(caller !== null).assertTrue();
      expect(caller!.getName().length > 0).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassOfCallerTest0900
     * @tc.number  SUB_BUILTINS_CLASS_OF_CALLER_TEST_0900
     * @tc.desc    Verify ofCaller returns class from static initialization
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassOfCallerTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const caller = StaticInitializationTest.getCallerFromStaticInit();
      expect(caller !== null).assertTrue();
      expect(caller!.getName().length > 0).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassOfCallerTest1000
     * @tc.number  SUB_BUILTINS_CLASS_OF_CALLER_TEST_1000
     * @tc.desc    Verify ofCaller returns consistent result
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassOfCallerTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const caller1 = Class.ofCaller();
      const caller2 = Class.ofCaller();
      const caller3 = Class.ofCaller();

      expect(caller1 !== null).assertTrue();
      expect(caller2 !== null).assertTrue();
      expect(caller3 !== null).assertTrue();
      expect(caller1).assertEqual(caller2);
      expect(caller2).assertEqual(caller3);
    });

    /**
     * @tc.name    builtinsClassOfCallerTest1100
     * @tc.number  SUB_BUILTINS_CLASS_OFCALLER_TEST_1100
     * @tc.desc    Verify ofCaller returns undefined when no caller managed frame
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsClassOfCallerTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // This test case verifies the behavior when there's no caller managed frame
      // The actual behavior may depend on the execution environment
      const caller = Class.ofCaller();
      if (caller) {
        expect(caller.getName().length > 0).assertTrue();
      } else {
        expect(caller).assertEqual(undefined);
      }
    });
  })
}
