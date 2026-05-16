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

class PlainObject {
  a: number = 1;
  b: string = "test";
  c: number[] = [1, 2, 3];
}

class NestedObject {
  a: number = 1;
  b: NestedInner = new NestedInner();
}

class NestedInner {
  c: number = 2;
  d: NestedDeep = new NestedDeep();
}

class NestedDeep {
  e: number = 3;
}

class ObjectWithFunction {
  a: number = 1;
  b(): void {}
}

class ObjectWithArrayBuffer {
  buffer: ArrayBuffer = new ArrayBuffer(16);
}

class ObjectWithDataView {
  view: DataView = new DataView(new ArrayBuffer(16));
}

class ObjectWithTypedArray {
  buffer: Uint8Array = new Uint8Array([72, 101, 108, 108, 111]);
}

class KeyValue {
  key1: string = 'value1';
}

class ObjectWithObject {
  map: KeyValue = new KeyValue();
}

class ObjectWithArray {
  set: number[] = [1, 2, 3];
}

class ObjectWithString {
  regex: string = "abc";
}

export default function BuiltinsClassOfTest(): void {
  describe("BuiltinsClassOfTest", () => {
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
     * @tc.name    BuiltinsClassOfTest0100
     * @tc.number  SUB_BUILTINS_CLASS_OF_TEST_0100
     * @tc.desc    Verify of returns Class for null
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassOfTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const nullClass = Class.of(null);
      expect(nullClass !== undefined).assertTrue();
      expect(nullClass.getName()).assertEqual('std.core.Null');
    });

    /**
     * @tc.name    BuiltinsClassOfTest0200
     * @tc.number  SUB_BUILTINS_CLASS_OF_TEST_0200
     * @tc.desc    Verify of returns Class for PlainObject
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassOfTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const plainObj = new PlainObject();
      const objClass = Class.of(plainObj);
      expect(objClass !== undefined).assertTrue();
      expect(objClass.getName().indexOf('PlainObject') !== -1).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassOfTest0300
     * @tc.number  SUB_BUILTINS_CLASS_OF_TEST_0300
     * @tc.desc    Verify of returns Class for NestedObject
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassOfTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const nestedObj = new NestedObject();
      const objClass = Class.of(nestedObj);
      expect(objClass !== undefined).assertTrue();
      expect(objClass.getName().indexOf('NestedObject') !== -1).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassOfTest0400
     * @tc.number  SUB_BUILTINS_CLASS_OF_TEST_0400
     * @tc.desc    Verify of returns Class for ObjectWithFunction
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassOfTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const objWithFunction = new ObjectWithFunction();
      const objClass = Class.of(objWithFunction);
      expect(objClass !== undefined).assertTrue();
      expect(objClass.getName().indexOf('ObjectWithFunction') !== -1).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassOfTest0500
     * @tc.number  SUB_BUILTINS_CLASS_OF_TEST_0500
     * @tc.desc    Verify of returns Class for ObjectWithArrayBuffer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassOfTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const objWithArrayBuffer = new ObjectWithArrayBuffer();
      const objClass = Class.of(objWithArrayBuffer);
      expect(objClass !== undefined).assertTrue();
      expect(objClass.getName().indexOf('ObjectWithArrayBuffer') !== -1).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassOfTest0600
     * @tc.number  SUB_BUILTINS_CLASS_OF_TEST_0600
     * @tc.desc    Verify of returns Class for ObjectWithDataView
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassOfTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const objWithDataView = new ObjectWithDataView();
      const objClass = Class.of(objWithDataView);
      expect(objClass !== undefined).assertTrue();
      expect(objClass.getName().indexOf('ObjectWithDataView') !== -1).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassOfTest0700
     * @tc.number  SUB_BUILTINS_CLASS_OF_TEST_0700
     * @tc.desc    Verify of returns Class for ObjectWithTypedArray
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassOfTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const objWithTypedArray = new ObjectWithTypedArray();
      const objClass = Class.of(objWithTypedArray);
      expect(objClass !== undefined).assertTrue();
      expect(objClass.getName().indexOf('ObjectWithTypedArray') !== -1).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassOfTest0800
     * @tc.number  SUB_BUILTINS_CLASS_OF_TEST_0800
     * @tc.desc    Verify of returns Class for ObjectWithObject
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassOfTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const objWithObject = new ObjectWithObject();
      const objClass = Class.of(objWithObject);
      expect(objClass !== undefined).assertTrue();
      expect(objClass.getName().indexOf('ObjectWithObject') !== -1).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassOfTest0900
     * @tc.number  SUB_BUILTINS_CLASS_OF_TEST_0900
     * @tc.desc    Verify of returns Class for ObjectWithArray
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassOfTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const objWithArray = new ObjectWithArray();
      const objClass = Class.of(objWithArray);
      expect(objClass !== undefined).assertTrue();
      expect(objClass.getName().indexOf('ObjectWithArray') !== -1).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassOfTest1000
     * @tc.number  SUB_BUILTINS_CLASS_OF_TEST_1000
     * @tc.desc    Verify of returns Class for ObjectWithString
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassOfTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const objWithString = new ObjectWithString();
      const objClass = Class.of(objWithString);
      expect(objClass !== undefined).assertTrue();
      expect(objClass.getName().indexOf('ObjectWithString') !== -1).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassOfTest1100
     * @tc.number  SUB_BUILTINS_CLASS_OF_TEST_1100
     * @tc.desc    Verify of returns same Class for same object reference
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassOfTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new PlainObject();
      const class1 = Class.of(obj);
      const class2 = Class.of(obj);
      expect(class1).assertEqual(class2);
    });

    /**
     * @tc.name    BuiltinsClassOfTest1200
     * @tc.number  SUB_BUILTINS_CLASS_OF_TEST_1200
     * @tc.desc    Verify of returns same Class for different instances of same class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassOfTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj1 = new PlainObject();
      const obj2 = new PlainObject();
      const class1 = Class.of(obj1);
      const class2 = Class.of(obj2);
      expect(class1).assertEqual(class2);
    });

    /**
     * @tc.name    BuiltinsClassOfTest1300
     * @tc.number  SUB_BUILTINS_CLASS_OF_TEST_1300
     * @tc.desc    Verify of returns different Class for different classes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassOfTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj1 = new PlainObject();
      const obj2 = new NestedObject();
      const class1 = Class.of(obj1);
      const class2 = Class.of(obj2);
      expect(class1).not().assertEqual(class2);
    });
  })
}
