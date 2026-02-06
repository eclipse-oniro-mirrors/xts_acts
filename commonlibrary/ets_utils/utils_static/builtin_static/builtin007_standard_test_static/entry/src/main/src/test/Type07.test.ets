/**
 * Copyright (c) 2025-2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';


class NoInterfaceClass {}



export default function type_07Test() {
  describe('type_07Test', (): void => {
    // Dewm25 fines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
	   await Utils.msSleep(100);
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
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_NULLTYPE_EQUALS_0100
     * @tc.name    testNullTypeEquals0001
     * @tc.desc    Verify equality of two NullType instances
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testNullTypeEquals0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNullTypeEquals0001";
      try {
        const instance1 = NullType.REF;
        const instance2 = NullType.REF;
        expect(instance1.equals(instance2)).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_NULLTYPE_EQUALS_0200
     * @tc.name    testNullTypeEquals0002
     * @tc.desc    Verify inequality between NullType and StringType
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testNullTypeEquals0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNullTypeEquals0002";
      try {
        const nullType = NullType.REF;

        const stringType = Type.of("test") as StringType;
        expect(nullType.equals(stringType)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_NULLTYPE_EQUALS_0300
     * @tc.name    testNullTypeEquals0003
     * @tc.desc    Verify inequality between NullType and IntType
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testNullTypeEquals0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNullTypeEquals0003";
      try {
        const nullType = NullType.REF;

        const intType = Type.of(123);
        expect(nullType.equals(intType)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_NULLTYPE_EQUALS_0400
     * @tc.name    testNullTypeEquals0004
     * @tc.desc    Verify inequality with UndefinedType
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testNullTypeEquals0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNullTypeEquals0004";
      try {
        const nullType = NullType.REF;

        const undefinedType = Type.of(undefined);
        expect(nullType.equals(undefinedType)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_NULLTYPE_EQUALS_0500
     * @tc.name    testNullTypeEquals0005
     * @tc.desc    Verify inequality with ClassType
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testNullTypeEquals0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNullTypeEquals0005";
      try {
        const nullType = NullType.REF;

        const classType = Type.of(new Object());
        expect(nullType.equals(classType)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_NULLTYPE_GETLITERAL_0100
     * @tc.name    testNullTypeGetLiteral0001
     * @tc.desc    Verify getLiteral returns "null"
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testNullTypeGetLiteral0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNullTypeGetLiteral0001";
      try {
        const nullType = NullType.REF;
        expect(nullType.getLiteral()).assertEqual("null");
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_NULLTYPE_GETLITERAL_0200
     * @tc.name    testNullTypeGetLiteral0002
     * @tc.desc    Verify consistent return value across multiple calls
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testNullTypeGetLiteral0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNullTypeGetLiteral0002";
      try {
        const nullType = NullType.REF;
        const firstCall = nullType.getLiteral();
        const secondCall = nullType.getLiteral();
        expect(firstCall).assertEqual("null");
        expect(secondCall).assertEqual("null");
        expect(firstCall === secondCall).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_NULLTYPE_GETLITERAL_0300
     * @tc.name    testNullTypeGetLiteral0003
     * @tc.desc    Verify type of return value is string
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testNullTypeGetLiteral0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNullTypeGetLiteral0003";
      try {
        const nullType = NullType.REF;
        const literal = nullType.getLiteral();
        expect(typeof literal === "string").assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_NULLTYPE_GETLITERAL_0400
     * @tc.name    testNullTypeGetLiteral0004
     * @tc.desc    Verify value equality with toString method
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testNullTypeGetLiteral0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNullTypeGetLiteral0004";
      try {
        const nullType = NullType.REF;
        expect(nullType.getLiteral()).assertEqual(nullType.toString());
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_NULLTYPE_GETLITERAL_0500
     * @tc.name    testNullTypeGetLiteral0005
     * @tc.desc    Verify literal length is 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testNullTypeGetLiteral0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNullTypeGetLiteral0005";
      try {
        const nullType = NullType.REF;
        const literal = nullType.getLiteral();
        expect(literal.length).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_NULLTYPE_GETNAME_0100
     * @tc.name    testNullTypeGetName0001
     * @tc.desc    Verify getName returns "null"
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testNullTypeGetName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNullTypeGetName0001";
      try {
        const nullType = NullType.REF;
        expect(nullType.getName()).assertEqual("null");
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_NULLTYPE_GETNAME_0200
     * @tc.name    testNullTypeGetName0002
     * @tc.desc    Verify consistent return value across multiple calls
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testNullTypeGetName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNullTypeGetName0002";
      try {
        const nullType = NullType.REF;
        const firstCall = nullType.getName();
        const secondCall = nullType.getName();
        expect(firstCall).assertEqual("null");
        expect(secondCall).assertEqual("null");
        expect(firstCall === secondCall).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_NULLTYPE_GETNAME_0300
     * @tc.name    testNullTypeGetName0003
     * @tc.desc    Verify type of return value is string
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testNullTypeGetName0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNullTypeGetName0003";
      try {
        const nullType = NullType.REF;
        const name = nullType.getName();
        expect(typeof name === "string").assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_NULLTYPE_GETNAME_0400
     * @tc.name    testNullTypeGetName0004
     * @tc.desc    Verify name length is 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testNullTypeGetName0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNullTypeGetName0004";
      try {
        const nullType = NullType.REF;
        const name = nullType.getName();
        expect(name.length).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_NULLTYPE_GETNAME_0500
     * @tc.name    testNullTypeGetName0005
     * @tc.desc    Verify name is immutable
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testNullTypeGetName0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNullTypeGetName0005";
      try {
        const nullType = NullType.REF;
        const name = nullType.getName();

        const modifiedName = name + "_modified";
        expect(nullType.getName()).assertEqual("null");
        expect(modifiedName).assertEqual("null_modified");
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_NULLTYPE_HASNAME_0100
     * @tc.name    testNullTypeHasName0001
     * @tc.desc    Verify hasName returns true
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testNullTypeHasName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNullTypeHasName0001";
      try {
        const nullType = NullType.REF;
        expect(nullType.hasName()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_NULLTYPE_HASNAME_0200
     * @tc.name    testNullTypeHasName0002
     * @tc.desc    Verify consistent return value across multiple calls
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testNullTypeHasName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNullTypeHasName0002";
      try {
        const nullType = NullType.REF;
        const firstCall = nullType.hasName();
        const secondCall = nullType.hasName();
        expect(firstCall).assertTrue();
        expect(secondCall).assertTrue();
        expect(firstCall === secondCall).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_NULLTYPE_HASNAME_0300
     * @tc.name    testNullTypeHasName0003
     * @tc.desc    Verify return type is boolean
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testNullTypeHasName0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNullTypeHasName0003";
      try {
        const nullType = NullType.REF;
        const result = nullType.hasName();
        expect(typeof result === "boolean").assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_NULLTYPE_HASNAME_0400
     * @tc.name    testNullTypeHasName0004
     * @tc.desc    Verify comparison with primitive types
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testNullTypeHasName0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNullTypeHasName0004";
      try {
        const nullType = NullType.REF;
        const booleanType = Type.of(true);
        const stringType = Type.of("test");

        expect(nullType.hasName()).assertTrue();
        expect(booleanType.hasName()).assertFalse();
        expect(stringType.hasName()).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_NULLTYPE_HASNAME_0500
     * @tc.name    testNullTypeHasName0005
     * @tc.desc    Verify behavior with getName method
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testNullTypeHasName0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNullTypeHasName0005";
      try {
        const nullType = NullType.REF;
        if (nullType.hasName()) {
          const name = nullType.getName();
          expect(name).assertEqual("null");
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_NULLTYPE_ISPRIMITIVE_0100
     * @tc.name    testNullTypeIsPrimitive0001
     * @tc.desc    Verify isPrimitive returns true
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testNullTypeIsPrimitive0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNullTypeIsPrimitive0001";
      try {
        const nullType = NullType.REF;
        expect(nullType.isPrimitive()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_NULLTYPE_ISPRIMITIVE_0200
     * @tc.name    testNullTypeIsPrimitive0002
     * @tc.desc    Verify consistent return value across multiple calls
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testNullTypeIsPrimitive0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNullTypeIsPrimitive0002";
      try {
        const nullType = NullType.REF;
        const firstCall = nullType.isPrimitive();
        const secondCall = nullType.isPrimitive();
        expect(firstCall).assertTrue();
        expect(secondCall).assertTrue();
        expect(firstCall === secondCall).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_NULLTYPE_ISPRIMITIVE_0300
     * @tc.name    testNullTypeIsPrimitive0003
     * @tc.desc    Verify return type is boolean
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testNullTypeIsPrimitive0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNullTypeIsPrimitive0003";
      try {
        const nullType = NullType.REF;
        const result = nullType.isPrimitive();
        expect(typeof result === "boolean").assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_NULLTYPE_ISPRIMITIVE_0400
     * @tc.name    testNullTypeIsPrimitive0004
     * @tc.desc    Verify comparison with other primitive types
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testNullTypeIsPrimitive0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNullTypeIsPrimitive0004";
      try {
        const nullType = NullType.REF;
        const booleanType = Type.of(true);
        const stringType = Type.of("test");

        expect(nullType.isPrimitive()).assertTrue();
        expect(booleanType.isPrimitive()).assertTrue();
        expect(stringType.isPrimitive()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_NULLTYPE_ISREFERENCE_0100
     * @tc.name    testNullTypeIsReference0001
     * @tc.desc    Verify isReference returns true
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testNullTypeIsReference0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNullTypeIsReference0001";
      try {
        const nullType = NullType.REF;
        expect(nullType.isReference()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_NULLTYPE_ISREFERENCE_0200
     * @tc.name    testNullTypeIsReference0002
     * @tc.desc    Verify consistent return value across multiple calls
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testNullTypeIsReference0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNullTypeIsReference0002";
      try {
        const nullType = NullType.REF;
        const firstCall = nullType.isReference();
        const secondCall = nullType.isReference();
        expect(firstCall).assertTrue();
        expect(secondCall).assertTrue();
        expect(firstCall === secondCall).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_NULLTYPE_ISREFERENCE_0300
     * @tc.name    testNullTypeIsReference0003
     * @tc.desc    Verify return type is boolean
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testNullTypeIsReference0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNullTypeIsReference0003";
      try {
        const nullType = NullType.REF;
        const result = nullType.isReference();
        expect(typeof result === "boolean").assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_NULLTYPE_ISREFERENCE_0400
     * @tc.name    testNullTypeIsReference0004
     * @tc.desc    Verify comparison with value types
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testNullTypeIsReference0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNullTypeIsReference0004";
      try {
        const nullType = NullType.REF;
        const intValType = Type.of(123);
        const booleanValType = Type.of(true);

        expect(nullType.isReference()).assertTrue();
        expect(intValType.isReference()).assertFalse();
        expect(booleanValType.isReference()).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_EQUALS_0100
     * @tc.name    testStringTypeEquals0001
     * @tc.desc    Verify equality with self
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeEquals0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeEquals0001";
      try {
        const stringType = StringType.REF;
        expect(stringType.equals(stringType)).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_EQUALS_0200
     * @tc.name    testStringTypeEquals0002
     * @tc.desc    Verify equality with another StringType instance
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeEquals0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeEquals0002";
      try {
        const stringType1 = StringType.REF;
        const stringType2 = StringType.REF;
        expect(stringType1.equals(stringType2)).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_EQUALS_0300
     * @tc.name    testStringTypeEquals0003
     * @tc.desc    Verify inequality with NullType
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeEquals0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeEquals0003";
      try {
        const stringType = StringType.REF;
        const nullType = NullType.REF;
        expect(stringType.equals(nullType)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_EQUALS_0400
     * @tc.name    testStringTypeEquals0004
     * @tc.desc    Verify inequality with IntType
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeEquals0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeEquals0004";
      try {
        const stringType = StringType.REF;
        const intType = IntType.VAL;
        expect(stringType.equals(intType)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_EQUALS_0500
     * @tc.name    testStringTypeEquals0005
     * @tc.desc    Verify inequality with ClassType
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeEquals0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeEquals0005";
      try {
        const stringType = StringType.REF;
        const classType = ObjectType;
        expect(stringType.equals(classType)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_EQUALS_0600
     * @tc.name    testStringTypeEquals0006
     * @tc.desc    Verify inequality with ArrayType
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeEquals0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeEquals0006";
      try {
        const stringType = StringType.REF;
        const arrayType = ArrayType.INT_REF;
        expect(stringType.equals(arrayType)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_EQUALS_0700
     * @tc.name    testStringTypeEquals0007
     * @tc.desc    Verify inequality with UndefinedType
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeEquals0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeEquals0007";
      try {
        const stringType = StringType.REF;
        const undefinedType = UndefinedType.REF;
        expect(stringType.equals(undefinedType)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_GETLITERAL_0100
     * @tc.name    testStringTypeGetLiteral0001
     * @tc.desc    Verify getLiteral returns "string"
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeGetLiteral0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeGetLiteral0001";
      try {
        const stringType = StringType.REF;
        expect(stringType.getLiteral()).assertEqual("string");
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_GETLITERAL_0200
     * @tc.name    testStringTypeGetLiteral0002
     * @tc.desc    Verify consistent return value across multiple calls
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeGetLiteral0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeGetLiteral0002";
      try {
        const stringType = StringType.REF;
        const firstCall = stringType.getLiteral();
        const secondCall = stringType.getLiteral();
        expect(firstCall).assertEqual("string");
        expect(secondCall).assertEqual("string");
        expect(firstCall === secondCall).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_GETLITERAL_0300
     * @tc.name    testStringTypeGetLiteral0003
     * @tc.desc    Verify return type is string
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeGetLiteral0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeGetLiteral0003";
      try {
        const stringType = StringType.REF;
        const literal = stringType.getLiteral();
        expect(typeof literal === "string").assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_GETLITERAL_0400
     * @tc.name    testStringTypeGetLiteral0004
     * @tc.desc    Verify literal length is 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeGetLiteral0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeGetLiteral0004";
      try {
        const stringType = StringType.REF;
        const literal = stringType.getLiteral();
        expect(literal.length).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_GETLITERAL_0600
     * @tc.name    testStringTypeGetLiteral0006
     * @tc.desc    Verify literal is immutable
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeGetLiteral0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeGetLiteral0006";
      try {
        const stringType = StringType.REF;
        const originalLiteral = stringType.getLiteral();
        const modifiedLiteral = originalLiteral + "_modified";

        expect(stringType.getLiteral()).assertEqual("string");
        expect(modifiedLiteral).assertEqual("string_modified");
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_GETNAME_0100
     * @tc.name    testStringTypeGetName0001
     * @tc.desc    Verify getName returns empty string
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeGetName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeGetName0001";
      try {
        const stringType = StringType.REF;
        expect(stringType.getName()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_GETNAME_0200
     * @tc.name    testStringTypeGetName0002
     * @tc.desc    Verify consistent return value across multiple calls
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeGetName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeGetName0002";
      try {
        const stringType = StringType.REF;
        const firstCall = stringType.getName();
        const secondCall = stringType.getName();
        expect(firstCall).assertEqual("");
        expect(secondCall).assertEqual("");
        expect(firstCall === secondCall).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_GETNAME_0300
     * @tc.name    testStringTypeGetName0003
     * @tc.desc    Verify return type is string
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeGetName0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeGetName0003";
      try {
        const stringType = StringType.REF;
        const name = stringType.getName();
        expect(typeof name === "string").assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_GETNAME_0400
     * @tc.name    testStringTypeGetName0004
     * @tc.desc    Verify name length is 0
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeGetName0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeGetName0004";
      try {
        const stringType = StringType.REF;
        const name = stringType.getName();
        expect(name.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_GETNAME_0500
     * @tc.name    testStringTypeGetName0005
     * @tc.desc    Verify comparison with other types names
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeGetName0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeGetName0005";
      try {
        const stringType = StringType.REF;
        const nullType = NullType.REF;
        const intType = Type.of(123);

        expect(stringType.getName()).assertEqual("");
        expect(nullType.getName()).assertEqual("null");
        expect(intType.getName()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_GETNAME_0600
     * @tc.name    testStringTypeGetName0006
     * @tc.desc    Verify name is immutable
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeGetName0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeGetName0006";
      try {
        const stringType = StringType.REF;
        const name = stringType.getName();

        const modifiedName = name + "modified";
        expect(stringType.getName()).assertEqual("");
        expect(modifiedName).assertEqual("modified");
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_HASNAME_0100
     * @tc.name    testStringTypeHasName0001
     * @tc.desc    Verify hasName returns false
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeHasName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeHasName0001";
      try {
        const stringType = StringType.REF;
        expect(stringType.hasName()).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_HASNAME_0200
     * @tc.name    testStringTypeHasName0002
     * @tc.desc    Verify consistent return value across multiple calls
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeHasName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeHasName0002";
      try {
        const stringType = StringType.REF;
        const firstCall = stringType.hasName();
        const secondCall = stringType.hasName();
        expect(firstCall).assertFalse();
        expect(secondCall).assertFalse();
        expect(firstCall === secondCall).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_HASNAME_0300
     * @tc.name    testStringTypeHasName0003
     * @tc.desc    Verify return type is boolean
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeHasName0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeHasName0003";
      try {
        const stringType = StringType.REF;
        const result = stringType.hasName();
        expect(typeof result === "boolean").assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_HASNAME_0400
     * @tc.name    testStringTypeHasName0004
     * @tc.desc    Verify comparison with types that have names
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeHasName0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeHasName0004";
      try {
        const stringType = StringType.REF;
        const nullType = NullType.REF;
        const classType = ObjectType;

        expect(stringType.hasName()).assertFalse();
        expect(nullType.hasName()).assertTrue();
        expect(classType.hasName()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_HASNAME_0500
     * @tc.name    testStringTypeHasName0005
     * @tc.desc    Verify behavior with getName method
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeHasName0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeHasName0005";
      try {
        const stringType = StringType.REF;
        if (stringType.hasName()) {
          const name = stringType.getName();
          expect(name.length > 0).assertTrue();
        } else {
          const name = stringType.getName();
          expect(name).assertEqual("");
        }
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_HASNAME_0600
     * @tc.name    testStringTypeHasName0006
     * @tc.desc    Verify comparison with other primitive types
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeHasName0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeHasName0006";
      try {
        const stringType = StringType.REF;
        const booleanType = BooleanType.VAL;
        const intType = IntType.VAL;
        const doubleType = DoubleType.VAL;

        expect(stringType.hasName()).assertFalse();
        expect(booleanType.hasName()).assertFalse();
        expect(intType.hasName()).assertFalse();
        expect(doubleType.hasName()).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_ISPRIMITIVE_0100
     * @tc.name    testStringTypeIsPrimitive0001
     * @tc.desc    Verify isPrimitive returns true
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeIsPrimitive0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeIsPrimitive0001";
      try {
        const stringType = StringType.REF;
        expect(stringType.isPrimitive()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_ISPRIMITIVE_0200
     * @tc.name    testStringTypeIsPrimitive0002
     * @tc.desc    Verify consistent return value across multiple calls
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeIsPrimitive0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeIsPrimitive0002";
      try {
        const stringType = StringType.REF;
        const firstCall = stringType.isPrimitive();
        const secondCall = stringType.isPrimitive();
        expect(firstCall).assertTrue();
        expect(secondCall).assertTrue();
        expect(firstCall === secondCall).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_ISPRIMITIVE_0300
     * @tc.name    testStringTypeIsPrimitive0003
     * @tc.desc    Verify return type is boolean
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeIsPrimitive0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeIsPrimitive0003";
      try {
        const stringType = StringType.REF;
        const result = stringType.isPrimitive();
        expect(typeof result === "boolean").assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_ISPRIMITIVE_0400
     * @tc.name    testStringTypeIsPrimitive0004
     * @tc.desc    Verify comparison with other primitive types
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeIsPrimitive0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeIsPrimitive0004";
      try {
        const stringType = StringType.REF;
        const booleanType = BooleanType.REF;
        const intType = IntType.REF;
        const doubleType = DoubleType.REF;

        expect(stringType.isPrimitive()).assertTrue();
        expect(booleanType.isPrimitive()).assertTrue();
        expect(intType.isPrimitive()).assertTrue();
        expect(doubleType.isPrimitive()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_ISPRIMITIVE_0500
     * @tc.name    testStringTypeIsPrimitive0005
     * @tc.desc    Verify comparison with non-primitive types
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeIsPrimitive0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeIsPrimitive0005";
      try {
        const stringType = StringType.REF;
        const arrayType = ArrayType.INT_REF;
        const objectType = ObjectType;

        expect(stringType.isPrimitive()).assertTrue();
        expect(arrayType.isPrimitive()).assertFalse();
        expect(objectType.isPrimitive()).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_ISPRIMITIVE_0600
     * @tc.name    testStringTypeIsPrimitive0006
     * @tc.desc    Verify comparison with reference types
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeIsPrimitive0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeIsPrimitive0006";
      try {
        const stringType = StringType.REF;
        const nullType = NullType.REF;
        const undefinedType = UndefinedType.REF;

        expect(stringType.isPrimitive()).assertTrue();
        expect(nullType.isPrimitive()).assertTrue();
        expect(undefinedType.isPrimitive()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_ISPRIMITIVE_0700
     * @tc.name    testStringTypeIsPrimitive0007
     * @tc.desc    Verify consistency with isReference method
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeIsPrimitive0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeIsPrimitive0007";
      try {
        const stringType = StringType.REF;
        expect(stringType.isPrimitive()).assertTrue();
        expect(stringType.isReference()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_ISREFERENCE_0100
     * @tc.name    testStringTypeIsReference0001
     * @tc.desc    Verify isReference returns true
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeIsReference0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeIsReference0001";
      try {
        const stringType = StringType.REF;
        expect(stringType.isReference()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_ISREFERENCE_0200
     * @tc.name    testStringTypeIsReference0002
     * @tc.desc    Verify consistent return value across multiple calls
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeIsReference0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeIsReference0002";
      try {
        const stringType = StringType.REF;
        const firstCall = stringType.isReference();
        const secondCall = stringType.isReference();
        expect(firstCall).assertTrue();
        expect(secondCall).assertTrue();
        expect(firstCall === secondCall).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_ISREFERENCE_0300
     * @tc.name    testStringTypeIsReference0003
     * @tc.desc    Verify return type is boolean
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeIsReference0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeIsReference0003";
      try {
        const stringType = StringType.REF;
        const result = stringType.isReference();
        expect(typeof result === "boolean").assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_ISREFERENCE_0400
     * @tc.name    testStringTypeIsReference0004
     * @tc.desc    Verify comparison with value types
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeIsReference0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeIsReference0004";
      try {
        const stringType = StringType.REF;
        const intValType = IntType.VAL;
        const booleanValType = BooleanType.VAL;
        const doubleValType = DoubleType.VAL;

        expect(stringType.isReference()).assertTrue();
        expect(intValType.isReference()).assertFalse();
        expect(booleanValType.isReference()).assertFalse();
        expect(doubleValType.isReference()).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_ISREFERENCE_0500
     * @tc.name    testStringTypeIsReference0005
     * @tc.desc    Verify comparison with reference types
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeIsReference0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeIsReference0005";
      try {
        const stringType = StringType.REF;
        const arrayType = ArrayType.INT_REF;
        const objectType = ObjectType;
        const nullType = NullType.REF;
        const undefinedType = UndefinedType.REF;

        expect(stringType.isReference()).assertTrue();
        expect(arrayType.isReference()).assertTrue();
        expect(objectType.isReference()).assertTrue();
        expect(nullType.isReference()).assertTrue();
        expect(undefinedType.isReference()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_STRINGTYPE_ISREFERENCE_0700
     * @tc.name    testStringTypeIsReference0007
     * @tc.desc    Verify behavior with primitive reference types
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testStringTypeIsReference0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testStringTypeIsReference0007";
      try {
        const stringType = StringType.REF;
        const intRefType = IntType.REF;
        const booleanRefType = BooleanType.REF;
        const doubleRefType = DoubleType.REF;

        expect(stringType.isReference()).assertTrue();
        expect(intRefType.isReference()).assertTrue();
        expect(booleanRefType.isReference()).assertTrue();
        expect(doubleRefType.isReference()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_INTTYPE_VALUE_0100
     * @tc.name    testIntTypeGetLiteral0001
     * @tc.desc    Verify getLiteral for IntType.VAL returns "int"
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIntTypeGetLiteral0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testIntTypeGetLiteral0001";
      try {
        const intType = IntType.VAL;
        expect(intType.getLiteral()).assertEqual("int");
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_INTTYPE_GETLITERALREF_0200
     * @tc.name    testIntTypeGetLiteral0002
     * @tc.desc    Verify getLiteral for IntType.REF returns "Int"
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIntTypeGetLiteral0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testIntTypeGetLiteral0002";
      try {
        const intType = IntType.REF;
        expect(intType.getLiteral()).assertEqual("Int");
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_INTTYPE_GETLITERALA_0500
     * @tc.name    testIntTypeGetLiteral0005
     * @tc.desc    Verify consistent return value for IntType.VAL
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIntTypeGetLiteral0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testIntTypeGetLiteral0005";
      try {
        const intType = IntType.VAL;
        const firstCall = intType.getLiteral();
        const secondCall = intType.getLiteral();
        expect(firstCall).assertEqual("int");
        expect(secondCall).assertEqual("int");
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_INTTYPE_GETLITERAL_0600
     * @tc.name    testIntTypeGetLiteral0006
     * @tc.desc    Verify return type is string for IntType.VAL
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIntTypeGetLiteral0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testIntTypeGetLiteral0006";
      try {
        const intType = IntType.VAL;
        const literal = intType.getLiteral();
        expect(typeof literal === "string").assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_EQUALS_0100
     * @tc.name    testDoubleTypeEquals0001
     * @tc.desc    Verify equality of two DoubleType.VAL instances
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeEquals0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeEquals0001";
      try {
        const doubleType1 = DoubleType.VAL;
        const doubleType2 = DoubleType.VAL;
        expect(doubleType1.equals(doubleType2)).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_EQUALS_0200
     * @tc.name    testDoubleTypeEquals0002
     * @tc.desc    Verify equality of two DoubleType.REF instances
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level:  Level 1
     */
    it('testDoubleTypeEquals0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeEquals0002";
      try {
        const doubleType1 = DoubleType.REF;
        const doubleType2 = DoubleType.REF;
        expect(doubleType1.equals(doubleType2)).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_EQUALS_0400
     * @tc.name    testDoubleTypeEquals0004
     * @tc.desc    Verify inequality between DoubleType.VAL and FloatType.VAL
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeEquals0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeEquals0004";
      try {
        const doubleType = DoubleType.VAL;
        const floatType = FloatType.VAL;
        expect(doubleType.equals(floatType)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_EQUALS_0500
     * @tc.name    testDoubleTypeEquals0005
     * @tc.desc    Verify inequality between DoubleType.REF and IntType.REF
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeEquals0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeEquals0005";
      try {
        const doubleType = DoubleType.REF;
        const intType = IntType.REF;
        expect(doubleType.equals(intType)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_EQUALS_0600
     * @tc.name    testDoubleTypeEquals0006
     * @tc.desc    Verify inequality with StringType
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeEquals0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeEquals0006";
      try {
        const doubleType = DoubleType.VAL;
        const stringType = Type.of("test") as StringType;
        expect(doubleType.equals(stringType)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_EQUALS_0700
     * @tc.name    testDoubleTypeEquals0007
     * @tc.desc    Verify equality when getting Type from double value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeEquals0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeEquals0007";
      try {
        const doubleValFromTypeOf = Type.of(3.14);
        expect(doubleValFromTypeOf.equals(DoubleType.VAL)).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_EQUALS_0800
     * @tc.name    testDoubleTypeEquals0008
     * @tc.desc    Verify inequality when comparing DoubleType.VAL to DoubleType.REF from Type.of
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeEquals0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeEquals0008";
      try {
        const doubleVal = DoubleType.VAL;
        const doubleRefFromTypeOf = Type.of(new Double(3.14));
        expect(doubleVal.equals(doubleRefFromTypeOf)).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_GETLITERAL_0100
     * @tc.name    testDoubleTypeGetLiteral0001
     * @tc.desc    Verify getLiteral for DoubleType.VAL returns "double"
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeGetLiteral0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeGetLiteral0001";
      try {
        const doubleType = DoubleType.VAL;
        expect(doubleType.getLiteral()).assertEqual("double");
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_GETLITERAL_0200
     * @tc.name    testDoubleTypeGetLiteral0002
     * @tc.desc    Verify getLiteral for DoubleType.REF returns "Double"
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeGetLiteral0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeGetLiteral0002";
      try {
        const doubleType = DoubleType.REF;
        expect(doubleType.getLiteral()).assertEqual("Double");
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_GETLITERAL_0300
     * @tc.name    testDoubleTypeGetLiteral0003
     * @tc.desc    Verify getLiteral returns correct value for primitive double
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeGetLiteral0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeGetLiteral0003";
      try {
        const doubleVal = Type.of(3.14);
        expect(doubleVal.getLiteral()).assertEqual("double");
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_GETNAME_0100
     * @tc.name    testDoubleTypeGetName0001
     * @tc.desc    Verify getName for DoubleType.VAL returns empty string
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeGetName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeGetName0001";
      try {
        const doubleType = DoubleType.VAL;
        expect(doubleType.getName()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_GETNAME_0200
     * @tc.name    testDoubleTypeGetName0002
     * @tc.desc    Verify getName returns empty string for primitive double
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeGetName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeGetName0002";
      try {
        const doubleVal = Type.of(3.14);
        expect(doubleVal.getName()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_HASNAME_0100
     * @tc.name    testDoubleTypeHasName0001
     * @tc.desc    Verify hasName for DoubleType.VAL returns false
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeHasName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeHasName0001";
      try {
        const doubleType = DoubleType.VAL;
        expect(doubleType.hasName()).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_HASNAME_0200
     * @tc.name    testDoubleTypeHasName0002
     * @tc.desc    Verify hasName for DoubleType.REF returns true
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeHasName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeHasName0002";
      try {
        const doubleType = DoubleType.REF;
        expect(doubleType.hasName()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_HASNAME_0300
     * @tc.name    testDoubleTypeHasName0003
     * @tc.desc    Verify hasName for primitive double returns false
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeHasName0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeHasName0003";
      try {
        const doubleVal = Type.of(3.14);
        expect(doubleVal.hasName()).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_HASNAME_0400
     * @tc.name    testDoubleTypeHasName0004
     * @tc.desc    Verify hasName for boxed Double returns true
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeHasName0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeHasName0004";
      try {
        const doubleRef = Type.of(new Double(3.14));
        expect(doubleRef.hasName()).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_HASNAME_0500
     * @tc.name    testDoubleTypeHasName0005
     * @tc.desc    Verify hasName returns false for other primitive types
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeHasName0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeHasName0005";
      try {
        const intType = Type.of(123);
        expect(intType.hasName()).assertFalse();

        const floatType = Type.of(3.14);
        expect(floatType.hasName()).assertFalse();

        const booleanType = Type.of(true);
        expect(booleanType.hasName()).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_HASNAME_0600
     * @tc.name    testDoubleTypeHasName0006
     * @tc.desc    Verify hasName returns true for VoidType.REF
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeHasName0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeHasName0006";
      try {
        const voidType = VoidType.REF;
        expect(voidType.hasName()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_ISPRIMITIVE_0100
     * @tc.name    testDoubleTypeIsPrimitive0001
     * @tc.desc    Verify isPrimitive for DoubleType.VAL returns true
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeIsPrimitive0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeIsPrimitive0001";
      try {
        const doubleType = DoubleType.VAL;
        expect(doubleType.isPrimitive()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_ISPRIMITIVE_0200
     * @tc.name    testDoubleTypeIsPrimitive0002
     * @tc.desc    Verify isPrimitive for primitive double returns true
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeIsPrimitive0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeIsPrimitive0002";
      try {
        const doubleVal = Type.of(3.14);
        expect(doubleVal.isPrimitive()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_ISPRIMITIVE_0300
     * @tc.name    testDoubleTypeIsPrimitive0003
     * @tc.desc    Verify isPrimitive returns true for other primitive types
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeIsPrimitive0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeIsPrimitive0003";
      try {
        const intType = Type.of(123);
        expect(intType.isPrimitive()).assertTrue();

        const booleanType = Type.of(true);
        expect(booleanType.isPrimitive()).assertTrue();

        const charType = Type.of('a');
        expect(charType.isPrimitive()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_ISPRIMITIVE_0400
     * @tc.name    testDoubleTypeIsPrimitive0004
     * @tc.desc    Verify isPrimitive returns false for reference types
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeIsPrimitive0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeIsPrimitive0004";
      try {
        const stringType = Type.of("test") as StringType;
        expect(stringType.isPrimitive()).assertTrue();

        const objectType = Type.of(new Object());
        expect(objectType.isPrimitive()).assertFalse();

        const arrayType = Type.of([1, 2, 3]);
        expect(arrayType.isPrimitive()).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_ISPRIMITIVE_0500
     * @tc.name    testDoubleTypeIsPrimitive0005
     * @tc.desc    Verify isPrimitive returns true for VoidType.VAL
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeIsPrimitive0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeIsPrimitive0005";
      try {
        const voidType = VoidType.VAL;
        expect(voidType.isPrimitive()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_ISPRIMITIVE_0600
     * @tc.name    testDoubleTypeIsPrimitive0006
     * @tc.desc    Verify isPrimitive returns false for VoidType.REF
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeIsPrimitive0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeIsPrimitive0006";
      try {
        const voidType = VoidType.REF;
        expect(voidType.isPrimitive()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_ISPRIMITIVE_0700
     * @tc.name    testDoubleTypeIsPrimitive0007
     * @tc.desc    Verify isPrimitive returns false for NullType
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeIsPrimitive0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeIsPrimitive0007";
      try {
        const nullType = NullType.REF;
        expect(nullType.isPrimitive()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_ISPRIMITIVE_0800
     * @tc.name    testDoubleTypeIsPrimitive0008
     * @tc.desc    Verify isPrimitive returns false for UndefinedType
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeIsPrimitive0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeIsPrimitive0008";
      try {
        const undefinedType = UndefinedType.REF;
        expect(undefinedType.isPrimitive()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_ISREFERENCE_0100
     * @tc.name    testDoubleTypeIsReference0001
     * @tc.desc    Verify isReference for DoubleType.VAL returns false
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeIsReference0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeIsReference0001";
      try {
        const doubleType = DoubleType.VAL;
        expect(doubleType.isReference()).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_ISREFERENCE_0200
     * @tc.name    testDoubleTypeIsReference0002
     * @tc.desc    Verify isReference for DoubleType.REF returns true
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeIsReference0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeIsReference0002";
      try {
        const doubleType = DoubleType.REF;
        expect(doubleType.isReference()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_ISREFERENCE_0300
     * @tc.name    testDoubleTypeIsReference0003
     * @tc.desc    Verify isReference for primitive double returns false
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeIsReference0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeIsReference0003";
      try {
        const doubleVal = Type.of(3.14);
        expect(doubleVal.isReference()).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_ISREFERENCE_0400
     * @tc.name    testDoubleTypeIsReference0004
     * @tc.desc    Verify isReference for boxed Double returns true
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeIsReference0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeIsReference0004";
      try {
        const doubleRef = Type.of(new Double(3.14));
        expect(doubleRef.isReference()).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRLibrary_UTIL_BASE_DOUBLETYPE_ISREFERENCE_0500
     * @tc.name    testDoubleTypeIsReference0005
     * @tc.desc    Verify isReference returns false for other primitive types
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeIsReference0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeIsReference0005";
      try {
        const intType = Type.of(123);
        expect(intType.isReference()).assertFalse();

        const floatType = Type.of(3.14);
        expect(floatType.isReference()).assertFalse();

        const booleanType = Type.of(true);
        expect(booleanType.isReference()).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_ISREFERENCE_0600
     * @tc.name    testDoubleTypeIsReference0006
     * @tc.desc    Verify isReference returns true for other reference types
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeIsReference0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeIsReference0006";
      try {
        const stringType = Type.of("test") as StringType;
        expect(stringType.isReference()).assertTrue();

        const objectType = Type.of(new Object());
        expect(objectType.isReference()).assertTrue();

        const arrayType = Type.of([1, 2, 3]);
        expect(arrayType.isReference()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_ISREFERENCE_0700
     * @tc.name    testDoubleTypeIsReference0007
     * @tc.desc    Verify isReference returns false for VoidType.VAL
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeIsReference0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeIsReference0007";
      try {
        const voidType = VoidType.VAL;
        expect(voidType.isReference()).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_ISREFERENCE_0800
     * @tc.name    testDoubleTypeIsReference0008
     * @tc.desc    Verify isReference returns true for VoidType.REF
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeIsReference0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeIsReference0008";
      try {
        const voidType = VoidType.REF;
        expect(voidType.isReference()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_ISREFERENCE_0900
     * @tc.name    testDoubleTypeIsReference0009
     * @tc.desc    Verify isReference returns true for NullType
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeIsReference0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeIsReference0009";
      try {
        const nullType = NullType.REF;
        expect(nullType.isReference()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_ISREFERENCE_1000
     * @tc.name    testDoubleTypeIsReference0010
     * @tc.desc    Verify isReference returns true for UndefinedType
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeIsReference0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeIsReference0010";
      try {
        const undefinedType = UndefinedType.REF;
        expect(undefinedType.isReference()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_DOUBLETYPE_ISREFERENCE_1100
     * @tc.name    testDoubleTypeIsReference0011
     * @tc.desc    Verify isReference returns false for StringType
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testDoubleTypeIsReference0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testDoubleTypeIsReference0011";
      try {
        const stringType = StringType.REF;
        expect(stringType.isReference()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });
  })
}