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

abstract class AbstractClass {
  abstract abstractMethod(): void;
  concreteMethod(): void {}
}

class ConcreteClass extends AbstractClass {
  abstractMethod(): void {}
}

interface TestInterface {
  method(): void;
}

export default function BuiltinsClassIsAbstractTest(): void {
  describe("BuiltinsClassIsAbstractTest", () => {
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
     * @tc.name    BuiltinsClassIsAbstractTest0100
     * @tc.number  SUB_BUILTINS_CLASS_IS_ABSTRACT_TEST_0100
     * @tc.desc    Verify isAbstract for boolean type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassIsAbstractTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
        const boolClass = Class.PRIMITIVE_BOOLEAN;
        expect(boolClass.isAbstract()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassIsAbstractTest0200
     * @tc.number  SUB_BUILTINS_CLASS_IS_ABSTRACT_TEST_0200
     * @tc.desc    Verify isAbstract for number type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassIsAbstractTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
        const numClass = Class.PRIMITIVE_NUMBER;
        expect(numClass.isAbstract()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassIsAbstractTest0300
     * @tc.number  SUB_BUILTINS_CLASS_IS_ABSTRACT_TEST_0300
     * @tc.desc    Verify isAbstract for string type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassIsAbstractTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const strClass = Class.from<string>();
      expect(strClass.isAbstract()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsAbstractTest0400
     * @tc.number  SUB_BUILTINS_CLASS_IS_ABSTRACT_TEST_0400
     * @tc.desc    Verify isAbstract for object type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsAbstractTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const objClass = Class.from<Object>();
      expect(objClass.isAbstract()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsAbstractTest0500
     * @tc.number  SUB_BUILTINS_CLASS_IS_ABSTRACT_TEST_0500
     * @tc.desc    Verify isAbstract for array type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsAbstractTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arrClass = Class.from<Array<number>>();
      expect(arrClass.isAbstract()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsAbstractTest0600
     * @tc.number  SUB_BUILTINS_CLASS_IS_ABSTRACT_TEST_0600
     * @tc.desc    Verify isAbstract for abstract class type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsAbstractTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const abstractClass = Class.from<AbstractClass>();
      expect(abstractClass.isAbstract()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassIsAbstractTest0700
     * @tc.number  SUB_BUILTINS_CLASS_IS_ABSTRACT_TEST_0700
     * @tc.desc    Verify isAbstract for concrete class type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsAbstractTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const concreteClass = Class.from<ConcreteClass>();
      expect(concreteClass.isAbstract()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsAbstractTest0800
     * @tc.number  SUB_BUILTINS_CLASS_IS_ABSTRACT_TEST_0800
     * @tc.desc    Verify isAbstract for interface type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsAbstractTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const interfaceClass = Class.from<TestInterface>();
      expect(interfaceClass.isAbstract()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassIsAbstractTest0900
     * @tc.number  SUB_BUILTINS_CLASS_IS_ABSTRACT_TEST_0900
     * @tc.desc    Verify isAbstract for byte type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsAbstractTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const byteClass = Class.PRIMITIVE_BYTE;
        expect(byteClass.isAbstract()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassIsAbstractTest1000
     * @tc.number  SUB_BUILTINS_CLASS_IS_ABSTRACT_TEST_1000
     * @tc.desc    Verify isAbstract for short type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsAbstractTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const shortClass = Class.PRIMITIVE_SHORT;
        expect(shortClass.isAbstract()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassIsAbstractTest1100
     * @tc.number  SUB_BUILTINS_CLASS_IS_ABSTRACT_TEST_1100
     * @tc.desc    Verify isAbstract for int type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsAbstractTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const intClass = Class.PRIMITIVE_INT;
        expect(intClass.isAbstract()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassIsAbstractTest1200
     * @tc.number  SUB_BUILTINS_CLASS_IS_ABSTRACT_TEST_1200
     * @tc.desc    Verify isAbstract for long type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsAbstractTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const longClass = Class.PRIMITIVE_LONG;
        expect(longClass.isAbstract()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassIsAbstractTest1300
     * @tc.number  SUB_BUILTINS_CLASS_IS_ABSTRACT_TEST_1300
     * @tc.desc    Verify isAbstract for float type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsAbstractTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const floatClass = Class.PRIMITIVE_FLOAT;
        expect(floatClass.isAbstract()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassIsAbstractTest1400
     * @tc.number  SUB_BUILTINS_CLASS_IS_ABSTRACT_TEST_1400
     * @tc.desc    Verify isAbstract for double type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsAbstractTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const doubleClass = Class.PRIMITIVE_DOUBLE;
        expect(doubleClass.isAbstract()).assertTrue();
    });

  })
}
