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

class ParentClass {
  public parentField: string = "parent";
}


class ChildClass extends ParentClass {
  public childField: number = 0;
}
class TestClass1{
  instanceMethod():void{}
}

class TestClass2 {
  static staticMethod(): void {}
}

class TestClass3 {
  instanceMethod(param1: string, param2: number): boolean { return true; }
}

class TestClass4 {
  public method1(param: string): void {}
  public method2(param: number): void {}
}

class TestClass5 {
  noParamMethod(): void {}
}

class TestClass6 {
  async asyncMethod(): Promise<string> { return ""; }
}
class TestClass7 {
  public field1: int = 0;
}
class TestClass8 {
  public field1: int = 0;
  public field2: string = "";
}
class TestClass9 {
  protected protectedField: int = 0;
}
class TestClass10 {
  public testField: int = 0;
}
class TestClass11 {
  public publicField: number = 42;
}

class TestClass12 {
  private privateField: string = "private";
}

class TestClass13 {
  protected protectedField: boolean = true;
}
class TestClass14 {
  public field1: string = "test";
  public field2: number = 123;
  public booleanField: boolean = true;
}
class TestClass15 {
  public static staticField: number = 0;
}
class TestClass16 {
  public static staticField: string = "testValue";
  public instanceField: number = 0;
}
class TestClass17 {
  public static staticField: string = "test";
  public instanceField: number = 0;
}
class TestClass18 {
  public static staticField: number = 10;
}
class TestClass19 {
  public instanceField: number = 10;
}
function isIteratorEmpty<T>(iterator: Iterator<T>): boolean {
  const firstResult = iterator.next();
  return firstResult.done === true;
}


interface Options {
  type: string,
  endings: string,
}

interface TestInterface {}

export default function type_06Test() {
  describe('type_06Test', (): void => {
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
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FLOAT_TYPE_0100
     * @tc.name    testFloatType0001
     * @tc.desc    Checks for equality this instance with provided object, treated as a FloatType
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFloatType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFloatType0001";
      try {
        const Type1 = FloatType.VAL;
        const Type2 = FloatType.VAL;
        expect(Type1.equals(Type2)).assertEqual(true);
      } catch (err:BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FLOAT_TYPE_0300
     * @tc.name    testFloatType0003
     * @tc.desc    Checks for equality this instance with provided object, treated as a FloatType
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFloatType0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFloatType0003";
      try {
        const Type1 = FloatType.REF;
        const Type2 = FloatType.REF;
        expect(Type1.equals(Type2)).assertEqual(true);
      } catch (err:BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FLOAT_TYPE_0400
     * @tc.name    testFloatType0004
     * @tc.desc    Returns literal of type if exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFloatType0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFloatType0004";
      try {
        const type = FloatType.REF;
        expect(type.getLiteral()).assertEqual("Float");
      } catch (err:BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FLOAT_TYPE_0500
     * @tc.name    testFloatType0005
     * @tc.desc    Returns literal of type if exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFloatType0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFloatType0005";
      try {
        const type = FloatType.VAL;
        expect(type.getLiteral()).assertEqual("float");
      } catch (err:BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FLOAT_TYPE_0600
     * @tc.name    testFloatType0006
     * @tc.desc    throws error in case of absence of name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFloatType0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFloatType0006";
      try {
        const type = FloatType.VAL;
        expect(type.getName()).assertEqual("");
      } catch (err:BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FLOAT_TYPE_0700
     * @tc.name    testFloatType0007
     * @tc.desc    Checks whether type has name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFloatType0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFloatType0007";
      try {
        const Type = FloatType.VAL;
        expect(Type.hasName()).assertEqual(false);
      } catch (err:BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FLOAT_TYPE_0800
     * @tc.name    testFloatType0008
     * @tc.desc    Checks whether type has name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFloatType0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFloatType0008";
      try {
        const Type = FloatType.REF;
        expect(Type.hasName()).assertEqual(true);
      } catch (err:BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FLOAT_TYPE_0900
     * @tc.name    testFloatType0009
     * @tc.desc    Checks whether type has name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFloatType0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFloatType0009";
      try {
        const Type = FloatType.REF;
        expect(Type.isPrimitive()).assertEqual(true);
      } catch (err:BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FLOAT_TYPE_1000
     * @tc.name    testFloatType0010
     * @tc.desc    Checks whether type has name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFloatType0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFloatType0010";
      try {
        const Type = FloatType.VAL;
        expect(Type.isPrimitive()).assertEqual(true);
      } catch (err:BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FLOAT_TYPE_1100
     * @tc.name    testFloatType0011
     * @tc.desc    Checks whether type is primitive or composite
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFloatType0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFloatType0011";
      try {
        const Type = FloatType.VAL;
        expect(Type.isPrimitive()).assertEqual(true);
      } catch (err:BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FLOAT_TYPE_1200
     * @tc.name    testFloatType0012
     * @tc.desc    Checks whether type is reference or composite
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFloatType0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFloatType0012";
      try {
        const Type = FloatType.VAL;
        expect(Type.isReference()).assertEqual(false);
      } catch (err:BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FLOAT_TYPE_1300
     * @tc.name    testFloatType0013
     * @tc.desc    Checks whether type is reference or composite
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFloatType0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFloatType0013";
      try {
        const Type = FloatType.REF;
        expect(Type.isReference()).assertEqual(true);
      } catch (err:BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_TYPE_0100
     * @tc.name    testBooleanType0001
     * @tc.desc    Returns literal of type if exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testBooleanType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBooleanType0001";
      try {
        const Type1 = BooleanType.VAL;
        const Type2 = BooleanType.VAL;
        expect(Type1.equals(Type2)).assertEqual(true);
      } catch (err:BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_TYPE_0300
     * @tc.name    testBooleanType0003
     * @tc.desc    Returns literal of type if exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testBooleanType0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBooleanType0003";
      try {
        const Type1 = BooleanType.REF;
        const Type2 = BooleanType.REF;
        expect(Type1.equals(Type2)).assertEqual(true);
      } catch (err:BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_TYPE_0400
     * @tc.name    testBooleanType0004
     * @tc.desc    Returns literal of type if exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testBooleanType0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBooleanType0004";
      try {
        const Type1 = BooleanType.REF;
        expect(Type1.getLiteral()).assertEqual("Boolean");
      } catch (err:BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_TYPE_0500
     * @tc.name    testBooleanType0005
     * @tc.desc    Returns literal of type if exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testBooleanType0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBooleanType0005";
      try {
        const Type1 = BooleanType.VAL;
        expect(Type1.getLiteral()).assertEqual("boolean");
      } catch (err:BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_TYPE_0600
     * @tc.name    testBooleanType0006
     * @tc.desc    Returns literal of type if exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testBooleanType0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBooleanType0006";
      try {
        const Type1 = BooleanType.VAL;
        expect(Type1.getName()).assertEqual("");
      } catch (err:BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_TYPE_0700
     * @tc.name    testBooleanType0007
     * @tc.desc    Returns literal of type if exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testBooleanType0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBooleanType0007";
      try {
        const Type1 = BooleanType.VAL;
        expect(Type1.hasName()).assertEqual(false);
      } catch (err:BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_TYPE_0800
     * @tc.name    testBooleanType0008
     * @tc.desc    Returns literal of type if exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testBooleanType0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBooleanType0008";
      try {
        const Type1 = BooleanType.REF;
        expect(Type1.hasName()).assertEqual(true);
      } catch (err:BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BOOLEAN_TYPE_0900
     * @tc.name    testRefBooleanType0009
     * @tc.desc    Returns literal of type if exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testRefBooleanType0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testRefBooleanType0009";
      try {
        const Type1 = BooleanType.REF;
        expect(Type1.isPrimitive()).assertEqual(true);
      } catch (err:BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_TYPE_0900
     * @tc.name    testBooleanType0009
     * @tc.desc    Returns literal of type if exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testBooleanType0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBooleanType0009";
      try {
        const Type1 = BooleanType.VAL;
        expect(Type1.isPrimitive()).assertEqual(true);
      } catch (err:BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_TYPE_1000
     * @tc.name    testBooleanType0010
     * @tc.desc    Checks whether type is reference or composite
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testBooleanType0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBooleanType0010";
      try {
        const Type1 = BooleanType.VAL;
        expect(Type1.isReference()).assertEqual(false);
      } catch (err:BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_TYPE_1100
     * @tc.name    testBooleanType0011
     * @tc.desc    Checks whether type is reference or composite
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testBooleanType0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBooleanType0011";
      try {
        const Type1 = BooleanType.REF;
        expect(Type1.isReference()).assertEqual(true);
      } catch (err:BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FIELD_EQUALS_0100
     * @tc.name    testFieldEquals0001
     * @tc.desc    Compare two identical field objects
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFieldEquals0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFieldEquals0001";
      try {

        const testInstance = new TestClass7();
        const classType = Type.of(testInstance) as ClassType;


        const field1 = classType.getFieldByName("field1");
        const field1Copy = classType.getFieldByName("field1");


        expect(field1.equals(field1Copy)).assertTrue();
      } catch (err:BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FIELD_EQUALS_0200
     * @tc.name    testFieldEquals0002
     * @tc.desc    Compare two different field objects
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFieldEquals0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFieldEquals0002";
      try {

        const testInstance = new TestClass8();
        const classType = Type.of(testInstance) as ClassType;


        const field1 = classType.getFieldByName("field1");
        const field2 = classType.getFieldByName("field2");


        expect(field1.equals(field2)).assertFalse();
      } catch (err:BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FIELD_EQUALS_0300
     * @tc.name    testFieldEquals0003
     * @tc.desc    Compare field with null
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFieldEquals0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFieldEquals0003";
      try {

        const testInstance = new TestClass7();
        const classType = Type.of(testInstance) as ClassType;


        const field1 = classType.getFieldByName("field1");


        expect(field1.equals(null)).assertFalse();
      } catch (err:BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_BASE_FIELD_GETACCESSMODIFIER_0300
     * @tc.name    testFieldGetAccessModifier0003
     * @tc.desc    Get access modifier of protected field
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFieldGetAccessModifier0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFieldGetAccessModifier0003";
      try {

        const testInstance = new TestClass9();
        const classType = Type.of(testInstance) as ClassType;


        const field = classType.getFieldByName("protectedField");


        expect(field.getAccessModifier()).assertEqual(AccessModifier.PROTECTED);
      } catch (err:BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_FIELD_GETACCESSMODIFIER_0300
     * @tc.name    testBaseFieldGetAccessModifier0003
     * @tc.desc    Get access modifier of protected field
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testBaseFieldGetAccessModifier0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBaseFieldGetAccessModifier0003";
      try {

        const testInstance = new TestClass9();
        const classType = Type.of(testInstance) as ClassType;


        const field = classType.getFieldByName("protectedField");


        expect(field.getAccessModifier()).assertEqual(AccessModifier.PROTECTED);
      } catch (err:BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FIELD_GETACCESSMODIFIER_0100
     * @tc.name    testGetAccessModifier0001
     * @tc.desc    Verify that getAccessModifier() returns correct access modifier for public field
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetAccessModifier0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetAccessModifier0001";
      try {


        const testInstance = new TestClass11();
        const classType = Type.of(testInstance) as ClassType;
        const field = classType.getFieldByName("publicField");


        const accessMod = field.getAccessModifier();
        expect(accessMod).assertEqual(AccessModifier.PUBLIC); // 假设AccessModifier.PUBLIC是标准值
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FIELD_GETACCESSMODIFIER_0200
     * @tc.name    testGetAccessModifier0002
     * @tc.desc    Verify that getAccessModifier() returns correct access modifier for private field
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetAccessModifier0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetAccessModifier0002";
      try {

        const testInstance = new TestClass12();
        const classType = Type.of(testInstance) as ClassType;
        const field = classType.getFieldByName("privateField");


        const accessMod = field.getAccessModifier();
        expect(accessMod).assertEqual(AccessModifier.PRIVATE); // 假设AccessModifier.PRIVATE是标准值
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FIELD_GETACCESSMODIFIER_0300
     * @tc.name    testGetAccessModifier0003
     * @tc.desc    Verify that getAccessModifier() returns correct access modifier for protected field
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetAccessModifier0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetAccessModifier0003";
      try {

        const testInstance = new TestClass13();
        const classType = Type.of(testInstance) as ClassType;
        const field = classType.getFieldByName("protectedField");


        const accessMod = field.getAccessModifier();
        expect(accessMod).assertEqual(AccessModifier.PROTECTED); // 假设AccessModifier.PROTECTED是标准值
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FIELD_GETNAME_0200
     * @tc.name    testGetFieldName0002
     * @tc.desc    Verify getName() returns correct field name for private field
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testGetFieldName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetFieldName0002";
      try {



        const testInstance = new TestClass12();
        const classType = Type.of(testInstance) as ClassType;
        const field = classType.getFieldByName("privateField");


        const fieldName = field.getName();
        expect(fieldName).assertEqual("privateField");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FIELD_GETOWNERTYPE_0100
     * @tc.name    testFieldGetOwnerType0001
     * @tc.desc    Get owner type of a field and verify it's correct
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFieldGetOwnerType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFieldGetOwnerType0001";
      try {

        const testInstance = new TestClass14();
        const classType = Type.of(testInstance) as ClassType;


        const field = classType.getFieldByName("field1");
        const ownerType = field.getOwnerType();


        expect(ownerType.toString()).assertEqual(classType.toString());
        expect(ownerType.equals(classType)).assertTrue();
      } catch (err:BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FIELD_GETOWNERTYPE_0200
     * @tc.name    testFieldGetOwnerType0002
     * @tc.desc    Get owner type of a static field and verify it's correct
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFieldGetOwnerType0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFieldGetOwnerType0002";
      try {

        const testInstance = new TestClass15();
        const classType = Type.of(testInstance) as ClassType;


        const staticField = classType.getFieldByName("staticField");
        const ownerType = staticField.getOwnerType();


        expect(ownerType.toString()).assertEqual(classType.toString());
        expect(ownerType.equals(classType)).assertTrue();
        expect(staticField.isStatic()).assertTrue();
      } catch (err:BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FIELD_GETSTATICVALUE_0100
     * @tc.name    testFieldGetStaticValue0001
     * @tc.desc    Get value of a static field and verify it's correct
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFieldGetStaticValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFieldGetStaticValue0001";
      try {
        const testInstance = new TestClass16();
        const classType = Type.of(testInstance) as ClassType;

        const staticField = classType.getFieldByName("staticField")!;
        const value = staticField.getStaticValue() as string;

        expect(value).assertEqual("testValue");
        expect(staticField.isStatic()).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FIELD_GETSTATICVALUE_0200
     * @tc.name    testFieldGetStaticValue0002
     * @tc.desc    Try to get value of an instance field and verify it throws error
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFieldGetStaticValue0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFieldGetStaticValue0002";
      try {

        const testInstance = new TestClass16();
        const classType = Type.of(testInstance) as ClassType;


        const instanceField = classType.getFieldByName("instanceField");

        try {
          instanceField.getStaticValue();

          expect().assertFail();
        } catch (err) {

          expect(err.toString()).assertContain("Field value is not static");
        }
        expect(instanceField.isStatic()).assertFalse();
      } catch (err:BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FIELD_ISSTATIC_0100
     * @tc.name    testFieldIsStatic0001
     * @tc.desc    Verify static field returns true for isStatic()
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFieldIsStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFieldIsStatic0001";
      try {
        const testInstance = new TestClass17();
        const classType = Type.of(testInstance) as ClassType;

        const staticField = classType.getFieldByName("staticField")!;
        expect(staticField.isStatic()).assertTrue();

        const value = staticField.getStaticValue() as string;
        expect(value).assertEqual("test");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FIELD_ISSTATIC_0200
     * @tc.name    testFieldIsStatic0002
     * @tc.desc    Verify instance field returns false for isStatic()
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFieldIsStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFieldIsStatic0002";
      try {


        const testInstance = new TestClass17();
        const classType = Type.of(testInstance) as ClassType;


        const instanceField = classType.getFieldByName("instanceField");
        expect(instanceField.isStatic()).assertFalse();


        try {
          instanceField.getStaticValue();
          expect().assertFail();
        } catch (err) {
          expect(err.toString()).assertContain("Field value is not static");
        }
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FIELD_ISREADONLY_0100
     * @tc.name    testFieldIsReadonly0001
     * @tc.desc    Test isReadonly method on a non-readonly field
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFieldIsReadonly0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFieldIsReadonly0001";
      try {

        const testInstance = new TestClass14();
        const classType = Type.of(testInstance) as ClassType;


        const field = classType.getFieldByName("field1");
        const isReadonly = field.isReadonly();


        expect(isReadonly).assertFalse();
      } catch (err:BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FIELD_TOSTRING_0100
     * @tc.name    testFieldToString0001
     * @tc.desc    Test toString method on a regular field
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFieldToString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFieldToString0001";
      try {

        const testInstance = new TestClass14();
        const classType = Type.of(testInstance) as ClassType;


        const field = classType.getFieldByName("field1");
        const fieldString = field.toString();


        expect(fieldString).assertEqual(`${field.getName()}: ${field.getType().toString()}`);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FIELD_SETSTATICVALUE_0100
     * @tc.name    testFieldSetStaticValue0001
     * @tc.desc    Set static value of a field and verify it's correctly set
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFieldSetStaticValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFieldSetStaticValue0001";
      try {
        const testInstance = new TestClass18();
        const classType = Type.of(testInstance) as ClassType;
        const field = classType.getFieldByName("staticField")!;
        expect(field.isStatic()).assertTrue();

        const newValue = 20;
        field.setStaticValue(newValue as number);

        const actual = field.getStaticValue() as number;
        expect(actual).assertEqual(newValue);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FIELD_SETSTATICVALUE_0200
     * @tc.name    testFieldSetStaticValue0002
     * @tc.desc    Attempt to set static value on non-static field should throw error
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testFieldSetStaticValue0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFieldSetStaticValue0002";
      try {

        const testInstance = new TestClass19();
        const classType = Type.of(testInstance) as ClassType;
        const field = classType.getFieldByName("instanceField");


        expect(field.isStatic()).assertFalse();


        let hasThrown = false;
        try {
          field.setStaticValue(20);
        } catch (err) {
          hasThrown = true;

          expect(err.toString()).assertContain("Field value is not static");
        }
        expect(hasThrown).assertTrue();
      } catch (err:BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });
  })
}