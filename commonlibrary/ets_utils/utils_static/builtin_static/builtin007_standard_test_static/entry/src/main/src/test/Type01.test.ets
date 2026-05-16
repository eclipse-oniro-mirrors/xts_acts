/**
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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

class parse {
  text: string = ''
}

function isIteratorEmpty<T>(iterator: Iterator<T>): boolean {
  const firstResult = iterator.next();
  return firstResult.done === true;
}

interface Options {
  type: string,
  endings: string,
}

export default function type_01Test() {
  describe('type_01Test', (): void => {
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
     * @tc.number  SUB_COMMONLIBRARY_BASEDATA_TYPE_OF_0100
     * @tc.name    testTypeOf0001
     * @tc.desc    Testing Type.of with null.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testTypeOf0001";
      try {
        let a = Type.of(null);
        expect(String(a)).assertEqual(String(null));
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_EQUALSVAL_0200
     * @tc.name    testEquals0002
     * @tc.desc    Testing VoidType.VAL and VoidType.REF are different instances.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testEquals0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEquals0002';
      try {
        const v1 = VoidType.VAL;
        const v2 = VoidType.REF;
        expect(v1 === v2).assertFalse();
        expect(v1.equals(v2)).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_TYPEEQUALS_0300
     * @tc.name    testEquals0003
     * @tc.desc    Testing VoidType.VAL equals another VoidType.VAL.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testEquals0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEquals0003';
      try {
        const v1 = VoidType.VAL;
        const v2 = VoidType.VAL;
        expect(v1.equals(v2)).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_EQUALS_0400
     * @tc.name    testEquals0004
     * @tc.desc    Testing VoidType.VAL equals VoidType.REF.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testEquals0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEquals0004';
      try {
        const v1 = VoidType.VAL;
        const v2 = VoidType.REF;
        expect(v1.equals(v2)).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_EQUALS_0500
     * @tc.name    testEquals0005
     * @tc.desc    Testing VoidType.REF equals another VoidType.REF.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testEquals0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEquals0005';
      try {
        const r1 = VoidType.REF;
        const r2 = VoidType.REF;
        expect(r1.equals(r2)).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_EQUALS_0600
     * @tc.name    testEquals0006
     * @tc.desc    Testing VoidType does not equal IntType.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testEquals0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEquals0006';
      try {
        const v = VoidType.VAL;
        const i = IntType.VAL;
        expect(v.equals(i)).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_LITERAL_0001
     * @tc.name    testGetLiteral0001
     * @tc.desc    Testing NullType.getLiteral() returns "null".
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetLiteral0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testGetLiteral0001';
      try {
        const literal = NullType.REF.getLiteral();
        expect(literal).assertEqual('null');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_LITERAL_0002
     * @tc.name    testGetLiteral0002
     * @tc.desc    Testing VoidType.getLiteral() returns "void".
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetLiteral0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testGetLiteral0002';
      try {
        const literal = VoidType.VAL.getLiteral();
        expect(literal).assertEqual('void');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_LITERAL_0003
     * @tc.name    testGetLiteral0003
     * @tc.desc    Testing IntType.VAL.getLiteral() returns "int".
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetLiteral0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testGetLiteral0003';
      try {
        const literal = IntType.VAL.getLiteral();
        expect(literal).assertEqual('int');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_LITERAL_0004
     * @tc.name    testGetLiteral0004
     * @tc.desc    Testing IntType.REF.getLiteral() returns "Int".
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetLiteral0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testGetLiteral0004';
      try {
        const literal = IntType.REF.getLiteral();
        expect(literal).assertEqual('Int');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_LITERAL_0005
     * @tc.name    testGetLiteral0005
     * @tc.desc    Testing BooleanType.VAL.getLiteral() returns "boolean".
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetLiteral0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testGetLiteral0005';
      try {
        const literal = BooleanType.VAL.getLiteral();
        expect(literal).assertEqual('boolean');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_NAME_0001
     * @tc.name    testGetName0001
     * @tc.desc    Testing NullType.getName() returns "null".
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testGetName0001';
      try {
        const name = NullType.REF.getName();
        expect(name).assertEqual('null');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_NAME_0002
     * @tc.name    testGetName0002
     * @tc.desc    Testing VoidType.getName() returns "void".
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testGetName0002';
      try {
        const name = VoidType.VAL.getName();
        expect(name).assertEqual('void');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_NAME_0003
     * @tc.name    testGetName0003
     * @tc.desc    Testing IntType.VAL.getName() returns empty string "".
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetName0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testGetName0003';
      try {
        const name = IntType.VAL.getName();
        expect(name).assertEqual('');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_NAME_0004
     * @tc.name    testGetName0004
     * @tc.desc    Testing IntType.REF.getName() returns "Int".
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetName0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testGetName0004';
      try {
        const name = IntType.REF.getName();
        expect(name).assertEqual('std.core.Int');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_NAME_0005
     * @tc.name    testGetName0005
     * @tc.desc    Testing BooleanType.VAL.getName() returns empty string "".
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetName0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testGetName0005';
      try {
        const name = BooleanType.VAL.getName();
        expect(name).assertEqual('');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_AHASNAME_0001
     * @tc.name    testHasName0001
     * @tc.desc    Testing NullType.hasName() returns true.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testHasName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHasName0001';
      try {
        const flag = NullType.REF.hasName();
        expect(flag).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_BASE_TYPE_HASNAME_0002
     * @tc.name    testHasName0002
     * @tc.desc    Testing VoidType.hasName() returns true.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testHasName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHasName0002';
      try {
        const flag = VoidType.VAL.hasName();
        expect(flag).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_HASNAMEA_0003
     * @tc.name    testHasName0003
     * @tc.desc    Testing IntType.VAL.hasName() returns false.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testHasName0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHasName0003';
      try {
        const flag = IntType.VAL.hasName();
        expect(flag).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASEA_TYPE_HASNAME_0004
     * @tc.name    testHasName0004
     * @tc.desc    Testing IntType.REF.hasName() returns true.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testHasName0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHasName0004';
      try {
        const flag = IntType.REF.hasName();
        expect(flag).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_HASNAME_0005
     * @tc.name    testHasName0005
     * @tc.desc    Testing BooleanType.VAL.hasName() returns false.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testHasName0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHasName0005';
      try {
        const flag = BooleanType.VAL.hasName();
        expect(flag).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ISPRIMITIVEA_0001
     * @tc.name    testIsPrimitive0001
     * @tc.desc    Testing NullType.isPrimitive() returns true.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIsPrimitive0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testIsPrimitive0001';
      try {
        const flag = NullType.REF.isPrimitive();
        expect(flag).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ISAPRIMITIVE_0002
     * @tc.name    testIsPrimitive0002
     * @tc.desc    Testing VoidType.isPrimitive() returns true.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIsPrimitive0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testIsPrimitive0002';
      try {
        const flag = VoidType.VAL.isPrimitive();
        expect(flag).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_BASE_TYPE_ISPRIMITIVE_0003
     * @tc.name    testIsIntPrimitive0003
     * @tc.desc    Testing IntType.VAL.isPrimitive() returns true.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIsIntPrimitive0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testIsIntPrimitive0003';
      try {
        const flag = IntType.VAL.isPrimitive();
        expect(flag).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_AISREFERENCE_0001
     * @tc.name    testIsReference0001
     * @tc.desc    Testing NullType.isReference() returns true.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIsReference0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testIsReference0001';
      try {
        const flag = NullType.REF.isReference();
        expect(flag).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ISREFERENCEA_0002
     * @tc.name    testValIsReference0002
     * @tc.desc    Testing VoidType.VAL.isReference() returns false.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testValIsReference0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValIsReference0002';
      try {
        const flag = VoidType.VAL.isReference();
        expect(flag).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_BASE_TYPE_ISREFERENCE_0003
     * @tc.name    testVoidIsReference0003
     * @tc.desc    Testing VoidType.REF.isReference() returns true.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testVoidIsReference0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testVoidIsReference0003';
      try {
        const flag = VoidType.REF.isReference();
        expect(flag).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_BASE_TYPE_ISREFERENCE_0004
     * @tc.name    testIsTypeReference0004
     * @tc.desc    Testing IntType.VAL.isReference() returns false.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIsTypeReference0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testIsTypeReference0004';
      try {
        const flag = IntType.VAL.isReference();
        expect(flag).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ISREFERENCE_0005
     * @tc.name    testBaseDataIsReference0005
     * @tc.desc    Testing IntType.REF.isReference() returns true.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testBaseDataIsReference0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBaseDataIsReference0005';
      try {
        const flag = IntType.REF.isReference();
        expect(flag).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_BASE_TYPE_EQUALS_0001
     * @tc.name    testLongEquals0001
     * @tc.desc    Testing LongType.VAL equals LongType.VAL.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLongEquals0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLongEquals0001';
      try {
        const v1 = LongType.VAL;
        const v2 = LongType.VAL;
        expect(v1.equals(v2)).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_AEQUALS_0003
     * @tc.name    testLongEquals0003
     * @tc.desc    Testing LongType.REF equals LongType.REF.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLongEquals0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLongEquals0003';
      try {
        const r1 = LongType.REF;
        const r2 = LongType.REF;
        expect(r1.equals(r2)).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_BASE_TYPE_EQUALS_0004
     * @tc.name    testLongEquals0004
     * @tc.desc    Testing LongType does NOT equal IntType.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLongEquals0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLongEquals0004';
      try {
        const longT = LongType.VAL;
        const intT = IntType.VAL;
        expect(longT.equals(intT)).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPEA_GETLITERAL_0001
     * @tc.name    testLongGetLiteral0001
     * @tc.desc    Testing LongType.VAL.getLiteral() returns "long".
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLongGetLiteral0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLongGetLiteral0001';
      try {
        const literal = LongType.VAL.getLiteral();
        expect(literal).assertEqual('long');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_GETLITERALA_0002
     * @tc.name    testLongGetLiteral0002
     * @tc.desc    Testing LongType.REF.getLiteral() returns "Long".
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLongGetLiteral0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLongGetLiteral0002';
      try {
        const literal = LongType.REF.getLiteral();
        expect(literal).assertEqual('Long');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_BASE_TYPE_GETLITERAL_0003
     * @tc.name    testLongGetLiteral0003
     * @tc.desc    Testing DoubleType.VAL.getLiteral() returns "double".
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLongGetLiteral0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLongGetLiteral0003';
      try {
        const literal = DoubleType.VAL.getLiteral();
        expect(literal).assertEqual('double');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BOOLEAN_GETLITERAL_0004
     * @tc.name    testLongGetLiteral0004
     * @tc.desc    Testing BooleanType.REF.getLiteral() returns "Boolean".
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLongGetLiteral0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLongGetLiteral0004';
      try {
        const literal = BooleanType.REF.getLiteral();
        expect(literal).assertEqual('Boolean');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_TYPE_GETNAME_0001
     * @tc.name    testLongGetName0001
     * @tc.desc    Testing LongType.VAL.getName() returns empty string.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLongGetName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLongGetName0001';
      try {
        const name = LongType.VAL.getName();
        expect(name).assertEqual('');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_GETNAMEA_0002
     * @tc.name    testLongGetName0002
     * @tc.desc    Testing LongType.REF.getName() returns "Long".
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLongGetName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLongGetName0002';
      try {
        const name = LongType.REF.getName();
        expect(name).assertEqual('std.core.Long');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_GETNAME_0003
     * @tc.name    testValIntGetName0003
     * @tc.desc    Testing IntType.VAL.getName() returns empty string.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testValIntGetName0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValIntGetName0003';
      try {
        const name = IntType.VAL.getName();
        expect(name).assertEqual('');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_GETNAME_0004
     * @tc.name    testIntTypeRefGetName0004
     * @tc.desc    Testing IntType.REF.getName() returns "Int".
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIntTypeRefGetName0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testIntTypeRefGetName0004';
      try {
        const name = IntType.REF.getName();
        expect(name).assertEqual('std.core.Int');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_BHASNAME_0001
     * @tc.name    testLongHasName0001
     * @tc.desc    Testing LongType.VAL.hasName() returns false.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLongHasName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLongHasName0001';
      try {
        const hasName = LongType.VAL.hasName();
        expect(hasName).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_TYPE_HASNAME_0002
     * @tc.name    testLongHasName0002
     * @tc.desc    Testing LongType.REF.hasName() returns true.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLongHasName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLongHasName0002';
      try {
        const hasName = LongType.REF.hasName();
        expect(hasName).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_HASNAMEB_0003
     * @tc.name    testAIntHasName0003
     * @tc.desc    Testing IntType.VAL.hasName() returns false.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testAIntHasName0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testAIntHasName0003';
      try {
        const hasName = IntType.VAL.hasName();
        expect(hasName).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASEB_TYPE_HASNAME_0004
     * @tc.name    testIntTypeHasName0004
     * @tc.desc    Testing IntType.REF.hasName() returns true.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIntTypeHasName0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testIntTypeHasName0004';
      try {
        const hasName = IntType.REF.hasName();
        expect(hasName).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ISPRIMITIVEB_0001
     * @tc.name    testLongIsPrimitive0001
     * @tc.desc    Testing LongType.VAL.isPrimitive() returns true.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLongIsPrimitive0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLongIsPrimitive0001';
      try {
        const isPrimitive = LongType.VAL.isPrimitive();
        expect(isPrimitive).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ISBPRIMITIVE_0002
     * @tc.name    testLongIsPrimitive0002
     * @tc.desc    Testing LongType.REF.isPrimitive() returns false.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLongIsPrimitive0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLongIsPrimitive0002';
      try {
        const isPrimitive = LongType.REF.isPrimitive();
        expect(isPrimitive).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_TYPE_ISPRIMITIVE_0003
     * @tc.name    testIntTypeValIsPrimitive0003
     * @tc.desc    Testing IntType.VAL.isPrimitive() returns true.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIntTypeValIsPrimitive0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testIntTypeValIsPrimitive0003';
      try {
        const isPrimitive = IntType.VAL.isPrimitive();
        expect(isPrimitive).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ISPRIMITIVEB_0004
     * @tc.name    testIntIsPrimitive0004
     * @tc.desc    Testing IntType.REF.isPrimitive() returns false.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIntIsPrimitive0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testIntIsPrimitive0004';
      try {
        const isPrimitive = IntType.REF.isPrimitive();
        expect(isPrimitive).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_BISREFERENCE_0001
     * @tc.name    testLongIsReference0001
     * @tc.desc    Testing LongType.VAL.isReference() returns false.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLongIsReference0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLongIsReference0001';
      try {
        const isReference = LongType.VAL.isReference();
        expect(isReference).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ISREFERENCEB_0002
     * @tc.name    testLongIsReference0002
     * @tc.desc    Testing LongType.REF.isReference() returns true.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLongIsReference0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLongIsReference0002';
      try {
        const isReference = LongType.REF.isReference();
        expect(isReference).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_TYPE_ISREFERENCE_0003
     * @tc.name    testIntIsReferenceVal0003
     * @tc.desc    Testing IntType.VAL.isReference() returns false.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIntIsReferenceVal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testIntIsReferenceVal0003';
      try {
        const isReference = IntType.VAL.isReference();
        expect(isReference).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_TYPE_ISREFERENCE_0004
     * @tc.name    testAIntIsReference0004
     * @tc.desc    Testing IntType.REF.isReference() returns true.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testAIntIsReference0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testAIntIsReference0004';
      try {
        const isReference = IntType.REF.isReference();
        expect(isReference).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_TYPE_EQUALS_0001
     * @tc.name    testShortEquals0001
     * @tc.desc    Testing ShortType.VAL.equals(ShortType.VAL) returns true.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testShortEquals0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testShortEquals0001';
      try {
        const v1 = ShortType.VAL;
        const v2 = ShortType.VAL;
        expect(v1.equals(v2)).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_BEQUALS_0003
     * @tc.name    testShortEquals0003
     * @tc.desc    Testing ShortType.REF.equals(ShortType.REF) returns true.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testShortEquals0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testShortEquals0003';
      try {
        const r1 = ShortType.REF;
        const r2 = ShortType.REF;
        expect(r1.equals(r2)).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_TYPE_EQUALS_0004
     * @tc.name    testShortEquals0004
     * @tc.desc    Testing ShortType.VAL.equals(IntType.VAL) returns false.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testShortEquals0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testShortEquals0004';
      try {
        const shortT = ShortType.VAL;
        const intT = IntType.VAL;
        expect(shortT.equals(intT)).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPEB_GETLITERAL_0001
     * @tc.name    testShortGetLiteral0001
     * @tc.desc    Testing ShortType.VAL.getLiteral() returns "short".
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testShortGetLiteral0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testShortGetLiteral0001';
      try {
        const literal = ShortType.VAL.getLiteral();
        expect(literal).assertEqual('short');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_GETLITERALB_0002
     * @tc.name    testShortGetLiteral0002
     * @tc.desc    Testing ShortType.REF.getLiteral() returns "Short".
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testShortGetLiteral0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testShortGetLiteral0002';
      try {
        const literal = ShortType.REF.getLiteral();
        expect(literal).assertEqual('Short');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_GETLITERAL_0003
     * @tc.name    testIntGetLiteral0003
     * @tc.desc    Testing IntType.VAL.getLiteral() returns "int".
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIntGetLiteral0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testIntGetLiteral0003';
      try {
        const literal = IntType.VAL.getLiteral();
        expect(literal).assertEqual('int');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_GETLITERAL_0004
     * @tc.name    testIntGetLiteral0004
     * @tc.desc    Testing IntType.REF.getLiteral() returns "Int".
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIntGetLiteral0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testIntGetLiteral0004';
      try {
        const literal = IntType.REF.getLiteral();
        expect(literal).assertEqual('Int');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_GETNAME_0001
     * @tc.name    testShortGetName0001
     * @tc.desc    Testing ShortType.VAL.getName() returns empty string.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testShortGetName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testShortGetName0001';
      try {
        const name = ShortType.VAL.getName();
        expect(name).assertEqual('');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_GETNAMEB_0002
     * @tc.name    testShortGetName0002
     * @tc.desc    Testing ShortType.REF.getName() returns "Short".
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testShortGetName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testShortGetName0002';
      try {
        const name = ShortType.REF.getName();
        expect(name).assertEqual('std.core.Short');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_GETNAME_0003
     * @tc.name    testIntGetName0003
     * @tc.desc    Testing IntType.VAL.getName() returns empty string.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIntGetName0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testIntGetName0003';
      try {
        const name = IntType.VAL.getName();
        expect(name).assertEqual('');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_GETNAME_0004
     * @tc.name    testIntGetName0004
     * @tc.desc    Testing IntType.REF.getName() returns "Int".
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIntGetName0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testIntGetName0004';
      try {
        const name = IntType.REF.getName();
        expect(name).assertEqual('std.core.Int');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_CHASNAME_0001
     * @tc.name    testShortHasName0001
     * @tc.desc    Testing ShortType.VAL.hasName() returns false.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testShortHasName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testShortHasName0001';
      try {
        const hasName = ShortType.VAL.hasName();
        expect(hasName).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_HASNAME_0002
     * @tc.name    testShortHasName0002
     * @tc.desc    Testing ShortType.REF.hasName() returns true.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testShortHasName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testShortHasName0002';
      try {
        const hasName = ShortType.REF.hasName();
        expect(hasName).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_HASNAMEC_0003
     * @tc.name    testIntHasName0003
     * @tc.desc    Testing IntType.VAL.hasName() returns false.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIntHasName0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testIntHasName0003';
      try {
        const hasName = IntType.VAL.hasName();
        expect(hasName).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASEC_TYPE_HASNAME_0004
     * @tc.name    testIntHasName0004
     * @tc.desc    Testing IntType.REF.hasName() returns true.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIntHasName0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testIntHasName0004';
      try {
        const hasName = IntType.REF.hasName();
        expect(hasName).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ISPRIMITIVEC_0001
     * @tc.name    testShortIsPrimitive0001
     * @tc.desc    Testing ShortType.VAL.isPrimitive() returns true.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testShortIsPrimitive0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testShortIsPrimitive0001';
      try {
        const isPrimitive = ShortType.VAL.isPrimitive();
        expect(isPrimitive).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ISCPRIMITIVE_0002
     * @tc.name    testShortIsPrimitive0002
     * @tc.desc    Testing ShortType.REF.isPrimitive() returns false.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testShortIsPrimitive0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testShortIsPrimitive0002';
      try {
        const isPrimitive = ShortType.REF.isPrimitive();
        expect(isPrimitive).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ISPRIMITIVE_0003
     * @tc.name    testIntIsPrimitive0003
     * @tc.desc    Testing IntType.VAL.isPrimitive() returns true.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIntIsPrimitive0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testIntIsPrimitive0003';
      try {
        const isPrimitive = IntType.VAL.isPrimitive();
        expect(isPrimitive).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ISPRIMITIVEC_0004
     * @tc.name    testIntIsPrimitivet0004
     * @tc.desc    Testing IntType.REF.isPrimitive() returns false.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIntIsPrimitivet0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testIntIsPrimitivet0004';
      try {
        const isPrimitive = IntType.REF.isPrimitive();
        expect(isPrimitive).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_CISREFERENCE_0001
     * @tc.name    testShortIsReference0001
     * @tc.desc    Testing ShortType.VAL.isReference() returns false.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testShortIsReference0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testShortIsReference0001';
      try {
        const isReference = ShortType.VAL.isReference();
        expect(isReference).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ISREFERENCEC_0002
     * @tc.name    testShortIsReference0002
     * @tc.desc    Testing ShortType.REF.isReference() returns true.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testShortIsReference0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testShortIsReference0002';
      try {
        const isReference = ShortType.REF.isReference();
        expect(isReference).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ISREFERENCE_0003
     * @tc.name    testIntIsReference0003
     * @tc.desc    Testing IntType.VAL.isReference() returns false.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIntIsReference0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testIntIsReference0003';
      try {
        const isReference = IntType.VAL.isReference();
        expect(isReference).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ISREFERENCE_0004
     * @tc.name    testIntIsReference0004
     * @tc.desc    Testing IntType.REF.isReference() returns true.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIntIsReference0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testIntIsReference0004';
      try {
        const isReference = IntType.REF.isReference();
        expect(isReference).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EQUALS_0001
     * @tc.name    testCharEquals0001
     * @tc.desc    Testing CharType.VAL.equals(CharType.VAL) returns true.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testCharEquals0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCharEquals0001';
      try {
        const v1 = CharType.VAL;
        const v2 = CharType.VAL;
        expect(v1.equals(v2)).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_CEQUALS_0003
     * @tc.name    testCharEquals0003
     * @tc.desc    Testing CharType.REF.equals(CharType.REF) returns true.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testCharEquals0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCharEquals0003';
      try {
        const r1 = CharType.REF;
        const r2 = CharType.REF;
        expect(r1.equals(r2)).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EQUALS_0004
     * @tc.name    testCharEquals0004
     * @tc.desc    Testing CharType.VAL.equals(IntType.VAL) returns false.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testCharEquals0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCharEquals0004';
      try {
        const charT = CharType.VAL;
        const intT = IntType.VAL;
        expect(charT.equals(intT)).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPEC_GETLITERAL_0001
     * @tc.name    testCharGetLiteral0001
     * @tc.desc    Testing CharType.VAL.getLiteral() returns "char".
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testCharGetLiteral0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCharGetLiteral0001';
      try {
        const literal = CharType.VAL.getLiteral();
        expect(literal).assertEqual('char');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_GETLITERALC_0002
     * @tc.name    testCharGetLiteral0002
     * @tc.desc    Testing CharType.REF.getLiteral() returns "Char".
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testCharGetLiteral0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCharGetLiteral0002';
      try {
        const literal = CharType.REF.getLiteral();
        expect(literal).assertEqual('Char');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_CHAR_GETNAME_0001
     * @tc.name    testCharGetName0001
     * @tc.desc    Testing CharType.VAL.getName() returns empty string.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testCharGetName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCharGetName0001';
      try {
        const name = CharType.VAL.getName();
        expect(name).assertEqual('');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_GETNAMEC_0002
     * @tc.name    testCharGetName0002
     * @tc.desc    Testing CharType.REF.getName() returns "Char".
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testCharGetName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCharGetName0002';
      try {
        const name = CharType.REF.getName();
        expect(name).assertEqual('std.core.Char');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_DHASNAME_0001
     * @tc.name    testCharHasName0001
     * @tc.desc    Testing CharType.VAL.hasName() returns false.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testCharHasName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCharHasName0001';
      try {
        const hasName = CharType.VAL.hasName();
        expect(hasName).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_REFHASNAME_0002
     * @tc.name    testCharHasName0002
     * @tc.desc    Testing CharType.REF.hasName() returns true.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testCharHasName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCharHasName0002';
      try {
        const hasName = CharType.REF.hasName();
        expect(hasName).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ISPRIMITIVED_0001
     * @tc.name    testCharIsPrimitive0001
     * @tc.desc    Testing CharType.VAL.isPrimitive() returns true.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testCharIsPrimitive0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCharIsPrimitive0001';
      try {
        const isPrimitive = CharType.VAL.isPrimitive();
        expect(isPrimitive).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ISDPRIMITIVE_0002
     * @tc.name    testCharIsPrimitive0002
     * @tc.desc    Testing CharType.REF.isPrimitive() returns true.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testCharIsPrimitive0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCharIsPrimitive0002';
      try {
        const isPrimitive = CharType.REF.isPrimitive();
        expect(isPrimitive).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_DISREFERENCE_0001
     * @tc.name    testCharIsReference0001
     * @tc.desc    Testing CharType.VAL.isReference() returns false.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testCharIsReference0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCharIsReference0001';
      try {
        const isReference = CharType.VAL.isReference();
        expect(isReference).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ISREFERENCED_0002
     * @tc.name    testCharIsReference0002
     * @tc.desc    Testing CharType.REF.isReference() returns true.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testCharIsReference0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCharIsReference0002';
      try {
        const isReference = CharType.REF.isReference();
        expect(isReference).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_EQUALS_0001
     * @tc.name    testByteEquals0001
     * @tc.desc    Testing ByteType.VAL.equals(ByteType.VAL) returns true.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testByteEquals0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testByteEquals0001';
      try {
        const v1 = ByteType.VAL;
        const v2 = ByteType.VAL;
        expect(v1.equals(v2)).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_DEQUALS_0003
     * @tc.name    testByteEquals0003
     * @tc.desc    Testing ByteType.REF.equals(ByteType.REF) returns true.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testByteEquals0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testByteEquals0003';
      try {
        const r1 = ByteType.REF;
        const r2 = ByteType.REF;
        expect(r1.equals(r2)).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_EQUALS_0004
     * @tc.name    testByteEquals0004
     * @tc.desc    Testing ByteType.VAL.equals(IntType.VAL) returns false.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testByteEquals0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testByteEquals0004';
      try {
        const byteT = ByteType.VAL;
        const intT = IntType.VAL;
        expect(byteT.equals(intT)).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPED_GETLITERAL_0001
     * @tc.name    testByteGetLiteral0001
     * @tc.desc    Testing ByteType.VAL.getLiteral() returns "byte".
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testByteGetLiteral0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testByteGetLiteral0001';
      try {
        const literal = ByteType.VAL.getLiteral();
        expect(literal).assertEqual('byte');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_GETLITERALD_0002
     * @tc.name    testByteGetLiteral0002
     * @tc.desc    Testing ByteType.REF.getLiteral() returns "Byte".
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testByteGetLiteral0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testByteGetLiteral0002';
      try {
        const literal = ByteType.REF.getLiteral();
        expect(literal).assertEqual('Byte');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_GETNAME_0001
     * @tc.name    testByteGetName0001
     * @tc.desc    Testing ByteType.VAL.getName() returns empty string.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testByteGetName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testByteGetName0001';
      try {
        const name = ByteType.VAL.getName();
        expect(name).assertEqual('');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_GETNAMED_0002
     * @tc.name    testByteGetName0002
     * @tc.desc    Testing ByteType.REF.getName() returns "Byte".
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testByteGetName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testByteGetName0002';
      try {
        const name = ByteType.REF.getName();
        expect(name).assertEqual('std.core.Byte');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_EHASNAME_0001
     * @tc.name    testByteHasName0001
     * @tc.desc    Testing ByteType.VAL.hasName() returns false.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testByteHasName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testByteHasName0001';
      try {
        const hasName = ByteType.VAL.hasName();
        expect(hasName).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_HASNAME_0002
     * @tc.name    testByteHasName0002
     * @tc.desc    Testing ByteType.REF.hasName() returns true.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testByteHasName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testByteHasName0002';
      try {
        const hasName = ByteType.REF.hasName();
        expect(hasName).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ISPRIMITIVE_0100
     * @tc.name    testIsPrimitivet0001
     * @tc.desc    Testing isPrimitive method of ByteType (value type).
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIsPrimitivet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testIsPrimitivet0001";
      try {
        let byteType = ByteType.VAL; // Value type
        let result = byteType.isPrimitive();
        expect(result).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ISPRIMITIVE_0200
     * @tc.name    testByteType0002
     * @tc.desc    Testing isPrimitive method of ByteType (reference type).
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testByteType0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testByteType0002";
      try {
        let byteType = ByteType.REF;
        let result = byteType.isPrimitive();
        expect(result).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ISPRIMITIVE_0300
     * @tc.name    testIsPrimitive0003
     * @tc.desc    Testing isPrimitive method of ByteType (value vs reference type).
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIsPrimitive0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testIsPrimitive0003";
      try {
        let byteValueType = ByteType.VAL;
        let byteRefType = ByteType.REF;
        let result1 = byteValueType.isPrimitive();
        let result2 = byteRefType.isPrimitive();
        expect(result1).assertTrue();
        expect(result2).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ISPRIMITIVE_0400
     * @tc.name    testTypeIsPrimitive0004
     * @tc.desc    Testing isPrimitive method of ByteType with other types.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeIsPrimitive0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testTypeIsPrimitive0004";
      try {
        let byteType = ByteType.VAL;
        let intType = IntType.VAL;
        let result1 = byteType.isPrimitive();
        let result2 = intType.isPrimitive();
        expect(result1).assertTrue();
        expect(result2).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ISPRIMITIVE_0500
     * @tc.name    testIsPrimitive0005
     * @tc.desc    Testing isPrimitive method of ByteType with isReference method.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIsPrimitive0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testIsPrimitive0005";
      try {
        let byteType = ByteType.VAL;
        let isPrim = byteType.isPrimitive();
        let isRef = byteType.isReference();
        expect(isPrim).assertTrue();
        expect(isRef).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ISREFERENCE_0100
     * @tc.name    testTypeIsReference0001
     * @tc.desc    Testing isReference method of ByteType (value type).
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testTypeIsReference0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testTypeIsReference0001";
      try {
        let byteType = ByteType.VAL;
        let result = byteType.isReference();
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ISREFERENCE_0200
     * @tc.name    testIsReference0002
     * @tc.desc    Testing isReference method of ByteType (reference type).
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIsReference0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testIsReference0002";
      try {
        let byteType = ByteType.REF;
        let result = byteType.isReference();
        expect(result).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ISREFERENCE_0300
     * @tc.name    testIsReference0003
     * @tc.desc    Testing isReference method of ByteType (value vs reference type).
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIsReference0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testIsReference0003";
      try {
        let byteValueType = ByteType.VAL;
        let byteRefType = ByteType.REF;
        let result1 = byteValueType.isReference();
        let result2 = byteRefType.isReference();
        expect(result1).assertFalse();
        expect(result2).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ISREFERENCE_0400
     * @tc.name    testIsReference0004
     * @tc.desc    Testing isReference method of ByteType with other types.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIsReference0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testIsReference0004";
      try {
        let byteType = ByteType.VAL;
        let intType = IntType.VAL;
        let stringType = StringType.REF;
        let result1 = byteType.isReference();
        let result2 = intType.isReference();
        let result3 = stringType.isReference();
        expect(result1).assertFalse();
        expect(result2).assertFalse();
        expect(result3).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_ISREFERENCE_0500
     * @tc.name    testIsReference0005
     * @tc.desc    Testing isReference method of ByteType with isPrimitive method.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testIsReference0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testIsReference0005";
      try {
        let byteType = ByteType.VAL;
        let isRef = byteType.isReference();
        let isPrim = byteType.isPrimitive();
        expect(isRef).assertFalse();
        expect(isPrim).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });
  });
}