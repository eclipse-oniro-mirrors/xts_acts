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

class OuterClass {
  private inner: InnerClass | undefined;
  createInner(): void {
    this.inner = new InnerClass();
  }
}

class InnerClass {

}
class TestClass {}

export default function BuiltinsClassGetLinkerTest(): void {
  describe("BuiltinsClassGetLinkerTest", () => {
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
     * @tc.name    BuiltinsClassGetLinkerTest0100
     * @tc.number  SUB_BUILTINS_CLASS_GET_LINKER_TEST_0100
     * @tc.desc    Verify getLinker for primitive boolean type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetLinkerTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const booleanClass = Class.PRIMITIVE_BOOLEAN;
      const linker = booleanClass.getLinker();
      expect(linker !== null).assertTrue();
      const linker2 = booleanClass.getLinker();
      expect(linker).assertEqual(linker2);
    });

    /**
     * @tc.name    BuiltinsClassGetLinkerTest0200
     * @tc.number  SUB_BUILTINS_CLASS_GET_LINKER_TEST_0200
     * @tc.desc    Verify getLinker for primitive int type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetLinkerTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const intClass = Class.PRIMITIVE_INT;
      const linker = intClass.getLinker();
      expect(linker !== null).assertTrue();
      const linker2 = intClass.getLinker();
      expect(linker).assertEqual(linker2);
    });

    /**
     * @tc.name    BuiltinsClassGetLinkerTest0300
     * @tc.number  SUB_BUILTINS_CLASS_GET_LINKER_TEST_0300
     * @tc.desc    Verify getLinker for primitive double type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetLinkerTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleClass = Class.PRIMITIVE_DOUBLE;
      const linker = doubleClass.getLinker();
      expect(linker !== null).assertTrue();
      const linker2 = doubleClass.getLinker();
      expect(linker).assertEqual(linker2);
    });

    /**
     * @tc.name    BuiltinsClassGetLinkerTest0400
     * @tc.number  SUB_BUILTINS_CLASS_GET_LINKER_TEST_0400
     * @tc.desc    Verify getLinker for object type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetLinkerTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new Object();
      const objClass = Class.of(obj);
      const linker = objClass.getLinker();
      expect(linker !== null).assertTrue();
      const linker2 = objClass.getLinker();
      expect(linker).assertEqual(linker2);
    });

    /**
     * @tc.name    BuiltinsClassGetLinkerTest0500
     * @tc.number  SUB_BUILTINS_CLASS_GET_LINKER_TEST_0500
     * @tc.desc    Verify getLinker for array type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetLinkerTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>();
      const arrClass = Class.of(arr);
      const linker = arrClass.getLinker();
      expect(linker !== null).assertTrue();
      const linker2 = arrClass.getLinker();
      expect(linker).assertEqual(linker2);
    });

    /**
     * @tc.name    BuiltinsClassGetLinkerTest0600
     * @tc.number  SUB_BUILTINS_CLASS_GET_LINKER_TEST_0600
     * @tc.desc    Verify getLinker for string type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetLinkerTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const str = 'test';
      const strClass = Class.of(str);
      const linker = strClass.getLinker();
      expect(linker !== null).assertTrue();
      const linker2 = strClass.getLinker();
      expect(linker).assertEqual(linker2);
    });

    /**
     * @tc.name    BuiltinsClassGetLinkerTest0700
     * @tc.number  SUB_BUILTINS_CLASS_GET_LINKER_TEST_0700
     * @tc.desc    Verify getLinker for current class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetLinkerTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const currentClass = Class.current();
      const linker = currentClass.getLinker();
      expect(linker !== null).assertTrue();
      const linker2 = currentClass.getLinker();
      expect(linker).assertEqual(linker2);
    });

    /**
     * @tc.name    BuiltinsClassGetLinkerTest0800
     * @tc.number  SUB_BUILTINS_CLASS_GET_LINKER_TEST_0800
     * @tc.desc    Verify getLinker for null
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetLinkerTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const nullClass = Class.of(null);
      const linker = nullClass.getLinker();
      expect(linker !== null).assertTrue();
      const linker2 = nullClass.getLinker();
      expect(linker).assertEqual(linker2);
    });

    /**
     * @tc.name    BuiltinsClassGetLinkerTest0900
     * @tc.number  SUB_BUILTINS_CLASS_GET_LINKER_TEST_0900
     * @tc.desc    Verify getLinker returns the same instance on multiple calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetLinkerTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new Object();
      const objClass = Class.of(obj);
      const linker1 = objClass.getLinker();
      const linker2 = objClass.getLinker();
      expect(linker1).assertEqual(linker2);
      expect(linker1 !== null).assertTrue();
      expect(linker2 !== null).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassGetLinkerTest1000
     * @tc.number  SUB_BUILTINS_CLASS_GET_LINKER_TEST_1000
     * @tc.desc    Verify getLinker for custom class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetLinkerTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const testObj = new TestClass();
      const testClass = Class.of(testObj);
      const linker = testClass.getLinker();
      expect(linker !== null).assertTrue();
      const linker2 = testClass.getLinker();
      expect(linker).assertEqual(linker2);
    });

    /**
     * @tc.name    BuiltinsClassGetLinkerTest1100
     * @tc.number  SUB_BUILTINS_CLASS_GET_LINKER_TEST_1100
     * @tc.desc    Verify getLinker for primitive byte type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetLinkerTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const byteClass = Class.PRIMITIVE_BYTE;
      const linker = byteClass.getLinker();
      expect(linker !== null).assertTrue();
      const linker2 = byteClass.getLinker();
      expect(linker).assertEqual(linker2);
    });

    /**
     * @tc.name    BuiltinsClassGetLinkerTest1200
     * @tc.number  SUB_BUILTINS_CLASS_GET_LINKER_TEST_1200
     * @tc.desc    Verify getLinker for primitive char type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetLinkerTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const charClass = Class.PRIMITIVE_CHAR;
      const linker = charClass.getLinker();
      expect(linker !== null).assertTrue();
      const linker2 = charClass.getLinker();
      expect(linker).assertEqual(linker2);
    });

    /**
     * @tc.name    BuiltinsClassGetLinkerTest1300
     * @tc.number  SUB_BUILTINS_CLASS_GET_LINKER_TEST_1300
     * @tc.desc    Verify getLinker for primitive short type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetLinkerTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const shortClass = Class.PRIMITIVE_SHORT;
      const linker = shortClass.getLinker();
      expect(linker !== null).assertTrue();
      const linker2 = shortClass.getLinker();
      expect(linker).assertEqual(linker2);
    });

    /**
     * @tc.name    BuiltinsClassGetLinkerTest1400
     * @tc.number  SUB_BUILTINS_CLASS_GET_LINKER_TEST_1400
     * @tc.desc    Verify getLinker for primitive long type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetLinkerTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const longClass = Class.PRIMITIVE_LONG;
      const linker = longClass.getLinker();
      expect(linker !== null).assertTrue();
      const linker2 = longClass.getLinker();
      expect(linker).assertEqual(linker2);
    });

    /**
     * @tc.name    BuiltinsClassGetLinkerTest1500
     * @tc.number  SUB_BUILTINS_CLASS_GET_LINKER_TEST_1500
     * @tc.desc    Verify getLinker for primitive float type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetLinkerTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const floatClass = Class.PRIMITIVE_FLOAT;
      const linker = floatClass.getLinker();
      expect(linker !== null).assertTrue();
      const linker2 = floatClass.getLinker();
      expect(linker).assertEqual(linker2);
    });

    /**
     * @tc.name    BuiltinsClassGetLinkerTest1600
     * @tc.number  SUB_BUILTINS_CLASS_GET_LINKER_TEST_1600
     * @tc.desc    Verify getLinker for primitive number type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetLinkerTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const numberClass = Class.PRIMITIVE_NUMBER;
      const linker = numberClass.getLinker();
      expect(linker !== null).assertTrue();
      const linker2 = numberClass.getLinker();
      expect(linker).assertEqual(linker2);
    });

    /**
     * @tc.name    BuiltinsClassGetLinkerTest1700
     * @tc.number  SUB_BUILTINS_CLASS_GET_LINKER_TEST_1700
     * @tc.desc    Verify getLinker for primitive void type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetLinkerTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const voidClass = Class.PRIMITIVE_VOID;
      const linker = voidClass.getLinker();
      expect(linker !== null).assertTrue();
      const linker2 = voidClass.getLinker();
      expect(linker).assertEqual(linker2);
    });

    /**
     * @tc.name    BuiltinsClassGetLinkerTest1800
     * @tc.number  SUB_BUILTINS_CLASS_GET_LINKER_TEST_1800
     * @tc.desc    Verify getLinker for different class types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetLinkerTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new Object();
      const objClass = Class.of(obj);
      const objLinker = objClass.getLinker();

      const arr = new Array<number>();
      const arrClass = Class.of(arr);
      const arrLinker = arrClass.getLinker();

      expect(objLinker !== null).assertTrue();
      expect(arrLinker !== null).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassGetLinkerTest1900
     * @tc.number  SUB_BUILTINS_CLASS_GET_LINKER_TEST_1900
     * @tc.desc    Verify getLinker for nested custom class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetLinkerTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {

      const outerObj = new OuterClass();
      const outerClass = Class.of(outerObj);
      const outerLinker = outerClass.getLinker();
      expect(outerLinker !== null).assertTrue();
      const outerLinker2 = outerClass.getLinker();
      expect(outerLinker).assertEqual(outerLinker2);
    });

  })
}
