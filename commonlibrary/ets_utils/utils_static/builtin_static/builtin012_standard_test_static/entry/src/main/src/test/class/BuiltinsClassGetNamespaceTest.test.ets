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

interface TestInterface {}

export default function BuiltinsClassGetNamespaceTest(): void {
  describe("BuiltinsClassGetNamespaceTest", () => {
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
     * @tc.name    BuiltinsClassGetNamespaceTest0100
     * @tc.number  SUB_BUILTINS_CLASS_GET_NAMESPACE_TEST_0100
     * @tc.desc    Verify getNamespace for primitive boolean type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetNamespaceTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const booleanClass = Class.PRIMITIVE_BOOLEAN;
      expect(() => {
        booleanClass.getNamespace();
      }).assertThrow('not implemented');
    });

    /**
     * @tc.name    BuiltinsClassGetNamespaceTest0200
     * @tc.number  SUB_BUILTINS_CLASS_GET_NAMESPACE_TEST_0200
     * @tc.desc    Verify getNamespace for primitive byte type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetNamespaceTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const byteClass = Class.PRIMITIVE_BYTE;
      expect(() => {
        byteClass.getNamespace();
      }).assertThrow('not implemented');
    });

    /**
     * @tc.name    BuiltinsClassGetNamespaceTest0300
     * @tc.number  SUB_BUILTINS_CLASS_GET_NAMESPACE_TEST_0300
     * @tc.desc    Verify getNamespace for primitive char type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetNamespaceTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const charClass = Class.PRIMITIVE_CHAR;
      expect(() => {
        charClass.getNamespace();
      }).assertThrow('not implemented');
    });

    /**
     * @tc.name    BuiltinsClassGetNamespaceTest0400
     * @tc.number  SUB_BUILTINS_CLASS_GET_NAMESPACE_TEST_0400
     * @tc.desc    Verify getNamespace for primitive short type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetNamespaceTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const shortClass = Class.PRIMITIVE_SHORT;
      expect(() => {
        shortClass.getNamespace();
      }).assertThrow('not implemented');
    });

    /**
     * @tc.name    BuiltinsClassGetNamespaceTest0500
     * @tc.number  SUB_BUILTINS_CLASS_GET_NAMESPACE_TEST_0500
     * @tc.desc    Verify getNamespace for primitive int type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetNamespaceTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const intClass = Class.PRIMITIVE_INT;
      expect(() => {
        intClass.getNamespace();
      }).assertThrow('not implemented');
    });

    /**
     * @tc.name    BuiltinsClassGetNamespaceTest0600
     * @tc.number  SUB_BUILTINS_CLASS_GET_NAMESPACE_TEST_0600
     * @tc.desc    Verify getNamespace for primitive long type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetNamespaceTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const longClass = Class.PRIMITIVE_LONG;
      expect(() => {
        longClass.getNamespace();
      }).assertThrow('not implemented');
    });

    /**
     * @tc.name    BuiltinsClassGetNamespaceTest0700
     * @tc.number  SUB_BUILTINS_CLASS_GET_NAMESPACE_TEST_0700
     * @tc.desc    Verify getNamespace for primitive float type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetNamespaceTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const floatClass = Class.PRIMITIVE_FLOAT;
      expect(() => {
        floatClass.getNamespace();
      }).assertThrow('not implemented');
    });

    /**
     * @tc.name    BuiltinsClassGetNamespaceTest0800
     * @tc.number  SUB_BUILTINS_CLASS_GET_NAMESPACE_TEST_0800
     * @tc.desc    Verify getNamespace for primitive double type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetNamespaceTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleClass = Class.PRIMITIVE_DOUBLE;
      expect(() => {
        doubleClass.getNamespace();
      }).assertThrow('not implemented');
    });

    /**
     * @tc.name    BuiltinsClassGetNamespaceTest0900
     * @tc.number  SUB_BUILTINS_CLASS_GET_NAMESPACE_TEST_0900
     * @tc.desc    Verify getNamespace for primitive number type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetNamespaceTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const numClass = Class.PRIMITIVE_NUMBER;
      expect(() => {
        numClass.getNamespace();
      }).assertThrow('not implemented');
    });

    /**
     * @tc.name    BuiltinsClassGetNamespaceTest1000
     * @tc.number  SUB_BUILTINS_CLASS_GET_NAMESPACE_TEST_1000
     * @tc.desc    Verify getNamespace for primitive void type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetNamespaceTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const voidClass = Class.PRIMITIVE_VOID;
      expect(() => {
        voidClass.getNamespace();
      }).assertThrow('not implemented');
    });

    /**
     * @tc.name    BuiltinsClassGetNamespaceTest1100
     * @tc.number  SUB_BUILTINS_CLASS_GET_NAMESPACE_TEST_1100
     * @tc.desc    Verify getNamespace for object type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetNamespaceTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new Object();
      const objClass = Class.of(obj);
      expect(() => {
        objClass.getNamespace();
      }).assertThrow('not implemented');
    });

    /**
     * @tc.name    BuiltinsClassGetNamespaceTest1200
     * @tc.number  SUB_BUILTINS_CLASS_GET_NAMESPACE_TEST_1200
     * @tc.desc    Verify getNamespace for array type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetNamespaceTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>();
      const arrClass = Class.of(arr);
      expect(() => {
        arrClass.getNamespace();
      }).assertThrow('not implemented');
    });

    /**
     * @tc.name    BuiltinsClassGetNamespaceTest1300
     * @tc.number  SUB_BUILTINS_CLASS_GET_NAMESPACE_TEST_1300
     * @tc.desc    Verify getNamespace for string type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetNamespaceTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const str = 'test';
      const strClass = Class.of(str);
      expect(() => {
        strClass.getNamespace();
      }).assertThrow('not implemented');
    });

    /**
     * @tc.name    BuiltinsClassGetNamespaceTest1400
     * @tc.number  SUB_BUILTINS_CLASS_GET_NAMESPACE_TEST_1400
     * @tc.desc    Verify getNamespace for custom class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetNamespaceTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClass>();
      expect(() => {
        testClass.getNamespace();
      }).assertThrow('not implemented');
    });

    /**
     * @tc.name    BuiltinsClassGetNamespaceTest1500
     * @tc.number  SUB_BUILTINS_CLASS_GET_NAMESPACE_TEST_1500
     * @tc.desc    Verify getNamespace for interface type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetNamespaceTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const interfaceClass = Class.from<TestInterface>();
      expect(() => {
        interfaceClass.getNamespace();
      }).assertThrow('not implemented');
    });

  })
}
