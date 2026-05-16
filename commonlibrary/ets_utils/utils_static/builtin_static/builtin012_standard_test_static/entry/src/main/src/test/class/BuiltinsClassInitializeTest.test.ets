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

class TestClass {}

export default function BuiltinsClassInitializeTest(): void {
  describe("BuiltinsClassInitializeTest", () => {
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
     * @tc.name    BuiltinsClassInitializeTest0100
     * @tc.number  SUB_BUILTINS_CLASS_INITIALIZE_TEST_0100
     * @tc.desc    Verify initialize for primitive boolean type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassInitializeTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const booleanClass = Class.PRIMITIVE_BOOLEAN;
      let error: Error | null = null;

      try {
        booleanClass.initialize();
      } catch (e) {
        error = e;
      }

      expect(error).assertEqual(null);
      expect(booleanClass).assertEqual(Class.PRIMITIVE_BOOLEAN);
      expect(booleanClass.getName()).assertEqual('u1');
    });

    /**
     * @tc.name    BuiltinsClassInitializeTest0200
     * @tc.number  SUB_BUILTINS_CLASS_INITIALIZE_TEST_0200
     * @tc.desc    Verify initialize for primitive int type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassInitializeTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const intClass = Class.PRIMITIVE_INT;
      let error: Error | null = null;

      try {
        intClass.initialize();
      } catch (e) {
        error = e;
      }

      expect(error).assertEqual(null);
      expect(intClass).assertEqual(Class.PRIMITIVE_INT);
      expect(intClass.getName()).assertEqual('i32');
    });

    /**
     * @tc.name    BuiltinsClassInitializeTest0300
     * @tc.number  SUB_BUILTINS_CLASS_INITIALIZE_TEST_0300
     * @tc.desc    Verify initialize for primitive double type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassInitializeTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleClass = Class.PRIMITIVE_DOUBLE;
      let error: Error | null = null;

      try {
        doubleClass.initialize();
      } catch (e) {
        error = e;
      }

      expect(error).assertEqual(null);
      expect(doubleClass).assertEqual(Class.PRIMITIVE_DOUBLE);
      expect(doubleClass.getName()).assertEqual('f64');
    });

    /**
     * @tc.name    BuiltinsClassInitializeTest0400
     * @tc.number  SUB_BUILTINS_CLASS_INITIALIZE_TEST_0400
     * @tc.desc    Verify initialize for object type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassInitializeTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new Object();
      const objClass = Class.of(obj);
      let error: Error | null = null;

      try {
        objClass.initialize();
      } catch (e) {
        error = e;
      }

      expect(error).assertEqual(null);
      expect(objClass).assertEqual(Class.from<Object>());
      expect(objClass.getName()).assertEqual('std.core.Object');
    });

    /**
     * @tc.name    BuiltinsClassInitializeTest0500
     * @tc.number  SUB_BUILTINS_CLASS_INITIALIZE_TEST_0500
     * @tc.desc    Verify initialize for array type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassInitializeTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>();
      const arrClass = Class.of(arr);
      let error: Error | null = null;

      try {
        arrClass.initialize();
      } catch (e) {
        error = e;
      }

      expect(error).assertEqual(null);
      expect(arrClass).assertEqual(Class.from<Array<number>>());
      expect(arrClass.getName()).assertEqual('std.core.Array');
    });

    /**
     * @tc.name    BuiltinsClassInitializeTest0600
     * @tc.number  SUB_BUILTINS_CLASS_INITIALIZE_TEST_0600
     * @tc.desc    Verify initialize for string type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassInitializeTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const str = 'test';
      const strClass = Class.of(str);
      let error: Error | null = null;

      try {
        strClass.initialize();
      } catch (e) {
        error = e;
      }

      expect(error).assertEqual(null);
      expect(strClass).assertEqual(Class.from<string>());
      expect(strClass.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.name    BuiltinsClassInitializeTest0700
     * @tc.number  SUB_BUILTINS_CLASS_INITIALIZE_TEST_0700
     * @tc.desc    Verify initialize for current class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassInitializeTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const currentClass = Class.current();
      let error: Error | null = null;

      try {
        currentClass.initialize();
      } catch (e) {
        error = e;
      }

      expect(error).assertEqual(null);
      expect(currentClass.getName().length > 0).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassInitializeTest0800
     * @tc.number  SUB_BUILTINS_CLASS_INITIALIZE_TEST_0800
     * @tc.desc    Verify initialize for null
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassInitializeTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const nullClass = Class.of(null);
      let error: Error | null = null;

      try {
        nullClass.initialize();
      } catch (e) {
        error = e;
      }

      expect(error).assertEqual(null);
      expect(nullClass.getName().length > 0).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassInitializeTest0900
     * @tc.number  SUB_BUILTINS_CLASS_INITIALIZE_TEST_0900
     * @tc.desc    Verify initialize for custom class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassInitializeTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testObj = new TestClass();
      const testClass = Class.of(testObj);
      let error: Error | null = null;

      try {
        testClass.initialize();
      } catch (e) {
        error = e;
      }

      expect(error).assertEqual(null);
      expect(testClass).assertEqual(Class.from<TestClass>());
      expect(testClass.getName().includes('TestClass')).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassInitializeTest1000
     * @tc.number  SUB_BUILTINS_CLASS_INITIALIZE_TEST_1000
     * @tc.desc    Verify initialize for primitive byte type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassInitializeTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const byteClass = Class.PRIMITIVE_BYTE;
      let error: Error | null = null;

      try {
        byteClass.initialize();
      } catch (e) {
        error = e;
      }

      expect(error).assertEqual(null);
      expect(byteClass).assertEqual(Class.PRIMITIVE_BYTE);
      expect(byteClass.getName()).assertEqual('i8');
    });

    /**
     * @tc.name    BuiltinsClassInitializeTest1100
     * @tc.number  SUB_BUILTINS_CLASS_INITIALIZE_TEST_1100
     * @tc.desc    Verify initialize for primitive char type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassInitializeTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const charClass = Class.PRIMITIVE_CHAR;
      let error: Error | null = null;

      try {
        charClass.initialize();
      } catch (e) {
        error = e;
      }

      expect(error).assertEqual(null);
      expect(charClass).assertEqual(Class.PRIMITIVE_CHAR);
      expect(charClass.getName()).assertEqual('u16');
    });

    /**
     * @tc.name    BuiltinsClassInitializeTest1200
     * @tc.number  SUB_BUILTINS_CLASS_INITIALIZE_TEST_1200
     * @tc.desc    Verify initialize for primitive short type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassInitializeTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const shortClass = Class.PRIMITIVE_SHORT;
      let error: Error | null = null;

      try {
        shortClass.initialize();
      } catch (e) {
        error = e;
      }

      expect(error).assertEqual(null);
      expect(shortClass).assertEqual(Class.PRIMITIVE_SHORT);
      expect(shortClass.getName()).assertEqual('i16');
    });

    /**
     * @tc.name    BuiltinsClassInitializeTest1300
     * @tc.number  SUB_BUILTINS_CLASS_INITIALIZE_TEST_1300
     * @tc.desc    Verify initialize for primitive long type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassInitializeTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const longClass = Class.PRIMITIVE_LONG;
      let error: Error | null = null;

      try {
        longClass.initialize();
      } catch (e) {
        error = e;
      }

      expect(error).assertEqual(null);
      expect(longClass).assertEqual(Class.PRIMITIVE_LONG);
      expect(longClass.getName()).assertEqual('i64');
    });

    /**
     * @tc.name    BuiltinsClassInitializeTest1400
     * @tc.number  SUB_BUILTINS_CLASS_INITIALIZE_TEST_1400
     * @tc.desc    Verify initialize for primitive float type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassInitializeTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const floatClass = Class.PRIMITIVE_FLOAT;
      let error: Error | null = null;

      try {
        floatClass.initialize();
      } catch (e) {
        error = e;
      }

      expect(error).assertEqual(null);
      expect(floatClass).assertEqual(Class.PRIMITIVE_FLOAT);
      expect(floatClass.getName()).assertEqual('f32');
    });

    /**
     * @tc.name    BuiltinsClassInitializeTest1500
     * @tc.number  SUB_BUILTINS_CLASS_INITIALIZE_TEST_1500
     * @tc.desc    Verify initialize for primitive number type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassInitializeTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const numberClass = Class.PRIMITIVE_NUMBER;
      let error: Error | null = null;

      try {
        numberClass.initialize();
      } catch (e) {
        error = e;
      }

      expect(error).assertEqual(null);
      expect(numberClass).assertEqual(Class.PRIMITIVE_NUMBER);
      expect(numberClass.getName()).assertEqual('f64');
    });

    /**
     * @tc.name    BuiltinsClassInitializeTest1600
     * @tc.number  SUB_BUILTINS_CLASS_INITIALIZE_TEST_1600
     * @tc.desc    Verify initialize for primitive void type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassInitializeTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const voidClass = Class.PRIMITIVE_VOID;
      let error: Error | null = null;

      try {
        voidClass.initialize();
      } catch (e) {
        error = e;
      }

      expect(error).assertEqual(null);
      expect(voidClass).assertEqual(Class.PRIMITIVE_VOID);
      expect(voidClass.getName()).assertEqual('void');
    });

  })
}
