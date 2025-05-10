/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'
import { PlainArray } from '@kit.ArkTS';

class Tmp {
  age: number = 0

  constructor(age: number) {
    this.age = age;
  }
}

export default function PlainArrayTest() {
  describe('plainArrayTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
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
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_CONSTRUCTOR_0100
     * @tc.name      : testPlainArrayConstructor0001
     * @tc.desc      : Testing PlainArray constructor.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayConstructor0001';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        expect(plainArray.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_ISEMPTY_0100
     * @tc.name      : testPlainArrayIsEmpty0001
     * @tc.desc      : Testing PlainArray isEmpty.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayIsEmpty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayIsEmpty0001';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        expect(plainArray.isEmpty()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_ISEMPTY_0200
     * @tc.name      : testPlainArrayIsEmpty0002
     * @tc.desc      : Testing PlainArray isEmpty add->isEmpty->remove->isEmpty.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayIsEmpty0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayIsEmpty0002';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(0, "zhang san");
        expect(plainArray.isEmpty()).assertFalse();
        plainArray.remove(0);
        expect(plainArray.isEmpty()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_ISEMPTY_0300
     * @tc.name      : testPlainArrayIsEmpty0003
     * @tc.desc      : Testing PlainArray isEmpty add->clear->isEmpty.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayIsEmpty0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayIsEmpty0003';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(0, "zhang san");
        plainArray.clear();
        expect(plainArray.isEmpty()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_HAS_0100
     * @tc.name      : testPlainArrayHas0001
     * @tc.desc      : Testing PlainArray has.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayHas0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayHas0001';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "squirrel");
        let result = plainArray.has(1);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_HAS_0200
     * @tc.name      : testPlainArrayHas0002
     * @tc.desc      : Testing PlainArray has value is "".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayHas0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayHas0002';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "");
        let result = plainArray.has(1);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_HAS_0300
     * @tc.name      : testPlainArrayHas0003
     * @tc.desc      : Testing PlainArray has null.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayHas0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayHas0003';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(null, "zhang san");
        plainArray.has(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401)
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_HAS_0400
     * @tc.name      : testPlainArrayHas0004
     * @tc.desc      : Testing PlainArray has undefined.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayHas0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayHas0004';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(undefined, "zhang san");
        plainArray.has(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401)
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_HAS_0500
     * @tc.name      : testPlainArrayHas0005
     * @tc.desc      : Testing PlainArray has.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayHas0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayHas0005';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(0, "zhang san");
        expect(plainArray.has(0)).assertTrue();
        plainArray.add(-1, "zhang san");
        expect(plainArray.has(-1)).assertTrue();

        let num: number = 2147483647;
        plainArray.add(num, "li si");
        expect(plainArray.has(num)).assertTrue();
        let num1: number = -2147483648;
        plainArray.add(num1, "li si");
        expect(plainArray.has(num1)).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GET_0100
     * @tc.name      : testPlainArrayGet0001
     * @tc.desc      : Testing PlainArray get.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayGet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayGet0001';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        let result = plainArray.get(1);
        expect(result).assertEqual('squirrel');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GET_0200
     * @tc.name      : testPlainArrayGet0002
     * @tc.desc      : Testing PlainArray get.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayGet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayGet0002';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "");
        plainArray.add(2, "sparrow");
        let result = plainArray.get(1);
        expect(result).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GET_0300
     * @tc.name      : testPlainArrayGet0003
     * @tc.desc      : Testing PlainArray get null.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayGet0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayGet0003';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(null, "zhang san");
        plainArray.get(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GET_0400
     * @tc.name      : testPlainArrayGet0004
     * @tc.desc      : Testing PlainArray get undefined.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayGet0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayGet0004';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(undefined, "zhang san");
        plainArray.get(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GET_0500
     * @tc.name      : testPlainArrayGet0005
     * @tc.desc      : Testing PlainArray get.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayGet0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayGet0005';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(0, "zhang san");
        expect(plainArray.get(0)).assertEqual("zhang san");
        plainArray.add(-1, "zhang san");
        expect(plainArray.get(-1)).assertEqual("zhang san");

        let num: number = 2147483647;
        plainArray.add(num, "li si");
        expect(plainArray.get(num)).assertEqual("li si");
        let num1: number = -2147483648;
        plainArray.add(num1, "li si");
        expect(plainArray.get(num1)).assertEqual("li si");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GETINDEXOFKEY_0100
     * @tc.name      : testPlainArrayGetIndexOfKey0001
     * @tc.desc      : Testing PlainArray getIndexOfKey.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayGetIndexOfKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayGetIndexOfKey0001';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "");
        let result = plainArray.getIndexOfKey(2);
        expect(result).assertEqual(1)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GETINDEXOFKEY_0200
     * @tc.name      : testPlainArrayGetIndexOfKey0002
     * @tc.desc      : Testing PlainArray getIndexOfKey.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayGetIndexOfKey0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayGetIndexOfKey0002';
      try {
        let plainArray: PlainArray<Tmp> = new PlainArray();
        plainArray.add(1, new Tmp(10));
        plainArray.add(2, new Tmp(12));
        let result = plainArray.getIndexOfKey(2);
        expect(result).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GETINDEXOFKEY_0300
     * @tc.name      : testPlainArrayGetIndexOfKey0003
     * @tc.desc      : Testing PlainArray getIndexOfKey.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayGetIndexOfKey0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayGetIndexOfKey0003';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, null);
        plainArray.add(3, undefined);
        let result = plainArray.getIndexOfKey(2);
        expect(result).assertEqual(1);
        let result1 = plainArray.getIndexOfKey(3);
        expect(result1).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GETINDEXOFKEY_0400
     * @tc.name      : testPlainArrayGetIndexOfKey0004
     * @tc.desc      : Testing PlainArray getIndexOfKey.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayGetIndexOfKey0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayGetIndexOfKey0004';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        let result = plainArray.getIndexOfKey(2);
        expect(result).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GETINDEXOVALUE_0100
     * @tc.name      : testPlainArrayGetIndexOfValue0001
     * @tc.desc      : Testing PlainArray getIndexOfValue.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayGetIndexOfValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayGetIndexOfValue0001';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "");
        let result = plainArray.getIndexOfValue("");
        expect(result).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GETINDEXOVALUE_0200
     * @tc.name      : testPlainArrayGetIndexOfValue0002
     * @tc.desc      : Testing PlainArray getIndexOfValue.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayGetIndexOfValue0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayGetIndexOfValue0002';
      try {
        let plainArray: PlainArray<Tmp> = new PlainArray();
        let param1 = new Tmp(10);
        plainArray.add(1, param1);
        let param2 = new Tmp(10);
        plainArray.add(2, param2);
        let result = plainArray.getIndexOfValue(param2);
        expect(result).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GETINDEXOVALUE_0300
     * @tc.name      : testPlainArrayGetIndexOfValue0003
     * @tc.desc      : Testing PlainArray getIndexOfValue.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayGetIndexOfValue0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayGetIndexOfValue0003';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, null);
        plainArray.add(3, undefined);
        let result = plainArray.getIndexOfValue(null);
        expect(result).assertEqual(1);
        let result1 = plainArray.getIndexOfValue(undefined);
        expect(result1).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GETINDEXOVALUE_0400
     * @tc.name      : testPlainArrayGetIndexOfValue0004
     * @tc.desc      : Testing PlainArray getIndexOfValue.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayGetIndexOfValue0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayGetIndexOfValue0004';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        let result = plainArray.getIndexOfValue("sparrow");
        expect(result).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GETKEYAT_0100
     * @tc.name      : testPlainArrayGetKeyAt0001
     * @tc.desc      : Testing PlainArray getKeyAt.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayGetKeyAt0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayGetKeyAt0001';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        let result = plainArray.getKeyAt(3);
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GETKEYAT_0200
     * @tc.name      : testPlainArrayGetKeyAt0002
     * @tc.desc      : Testing PlainArray getKeyAt.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayGetKeyAt0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayGetKeyAt0002';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        let result = plainArray.getKeyAt(1);
        expect(result).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GETKEYAT_0300
     * @tc.name      : testPlainArrayGetKeyAt0003
     * @tc.desc      : Testing PlainArray getKeyAt.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayGetKeyAt0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayGetKeyAt0003';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        plainArray.getKeyAt(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GETKEYAT_0400
     * @tc.name      : testPlainArrayGetKeyAt0004
     * @tc.desc      : Testing PlainArray getKeyAt.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayGetKeyAt0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayGetKeyAt0004';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        plainArray.getKeyAt(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code} ${err.message}}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GETKEYAT_0500
     * @tc.name      : testPlainArrayGetKeyAt0005
     * @tc.desc      : Testing PlainArray getKeyAt.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayGetKeyAt0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayGetKeyAt0005';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        let result = plainArray.getKeyAt(1);
        let index = plainArray.getIndexOfKey(result);
        expect(index).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code} ${err.message}}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GETVALUEAT_0100
     * @tc.name      : testPlainArrayGetValueAt0001
     * @tc.desc      : Testing PlainArray getValueAt.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayGetValueAt0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayGetValueAt0001';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        plainArray.getValueAt(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code} ${err.message}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GETVALUEAT_0200
     * @tc.name      : testPlainArrayGetValueAt0002
     * @tc.desc      : Testing PlainArray getValueAt.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayGetValueAt0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayGetValueAt0002';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        let result = plainArray.getValueAt(1);
        expect(result).assertEqual("sparrow");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GETVALUEAT_0300
     * @tc.name      : testPlainArrayGetValueAt0003
     * @tc.desc      : Testing PlainArray getValueAt.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayGetValueAt0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayGetValueAt0003';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        plainArray.getValueAt(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GETVALUEAT_0400
     * @tc.name      : testPlainArrayGetValueAt0004
     * @tc.desc      : Testing PlainArray getValueAt.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayGetValueAt0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayGetValueAt0004';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        plainArray.getValueAt(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code} ${err.message}}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GETVALUEAT_0500
     * @tc.name      : testPlainArrayGetValueAt0005
     * @tc.desc      : Testing PlainArray getValueAt.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayGetValueAt0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayGetValueAt0005';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        let result = plainArray.getValueAt(1);
        let index = plainArray.getIndexOfValue(result);
        expect(index).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code} ${err.message}}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_CLONE_0100
     * @tc.name      : testPlainArrayClone0001
     * @tc.desc      : Testing PlainArray clone.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayClone0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayClone0001';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        let newPlainArray = plainArray.clone();
        expect(newPlainArray.length).assertEqual(plainArray.length);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code} ${err.message}}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_CLONE_0200
     * @tc.name      : testPlainArrayClone0002
     * @tc.desc      : Testing PlainArray clone.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayClone0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayClone0002';
      try {
        let plainArray: PlainArray<number> = new PlainArray();
        plainArray.add(1, 1);
        plainArray.add(2, 2);
        let newPlainArray = plainArray.clone();
        expect(newPlainArray.length).assertEqual(plainArray.length);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code} ${err.message}}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_CLONE_0300
     * @tc.name      : testPlainArrayClone0003
     * @tc.desc      : Testing PlainArray clone.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayClone0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayClone0003';
      try {
        let plainArray: PlainArray<Tmp> = new PlainArray();
        plainArray.add(1, new Tmp(10));
        plainArray.add(2, new Tmp(12));
        let newPlainArray = plainArray.clone();
        expect(newPlainArray.length).assertEqual(plainArray.length);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code} ${err.message}}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_CLONE_0400
     * @tc.name      : testPlainArrayClone0004
     * @tc.desc      : Testing PlainArray clone.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayClone0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayClone0004';
      try {
        let plainArray: PlainArray<Tmp> = new PlainArray();
        plainArray.add(1, new Tmp(10));
        plainArray.add(2, new Tmp(12));
        let newPlainArray = plainArray.clone();
        newPlainArray.add(3, new Tmp(13));
        expect(plainArray.length).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code} ${err.message}}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_CLONE_0500
     * @tc.name      : testPlainArrayClone0005
     * @tc.desc      : Testing PlainArray clone.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayClone0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayClone0005';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        let param = "a".repeat(5120);
        plainArray.add(1, param);
        let newPlainArray = plainArray.clone();
        expect(plainArray.length).assertEqual(newPlainArray.length);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code} ${err.message}}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_CLONE_0600
     * @tc.name      : testPlainArrayClone0006
     * @tc.desc      : Testing PlainArray clone.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayClone0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayClone0006';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, null);
        plainArray.add(2, undefined);
        let newPlainArray = plainArray.clone();
        expect(plainArray.length).assertEqual(newPlainArray.length);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code} ${err.message}}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_ADD_0100
     * @tc.name      : testPlainArrayAdd0001
     * @tc.desc      : Testing PlainArray add.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayAdd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayAdd0001';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        let param = "a".repeat(5120);
        plainArray.add(1, param);
        expect(plainArray.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code} ${err.message}}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_ADD_0200
     * @tc.name      : testPlainArrayAdd0002
     * @tc.desc      : Testing PlainArray add.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayAdd0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayAdd0002';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "squirrel");
        expect(plainArray.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code} ${err.message}}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_ADD_0300
     * @tc.name      : testPlainArrayAdd0003
     * @tc.desc      : Testing PlainArray add.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayAdd0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayAdd0003';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, null);
        plainArray.add(2, undefined);
        expect(plainArray.length).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code} ${err.message}}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_REMOVE_0100
     * @tc.name      : testPlainArrayRemove0001
     * @tc.desc      : Testing PlainArray remove.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayRemove0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayRemove0001';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        let result = plainArray.remove(2);
        expect(result).assertEqual("sparrow");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code} ${err.message}}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_REMOVE_0200
     * @tc.name      : testPlainArrayRemove0002
     * @tc.desc      : Testing PlainArray remove null.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayRemove0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayRemove0002';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.remove(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_REMOVE_0300
     * @tc.name      : testPlainArrayRemove0003
     * @tc.desc      : Testing PlainArray remove undefined.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayRemove0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayRemove0003';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.remove(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_REMOVE_0400
     * @tc.name      : testPlainArrayRemove0004
     * @tc.desc      : Testing PlainArray remove.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayRemove0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayRemove0004';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "zhang san");
        plainArray.add(2, "zhang san1");
        let result = plainArray.remove(3);
        expect(result).assertUndefined();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_REMOVE_0500
     * @tc.name      : testPlainArrayRemove0005
     * @tc.desc      : Testing PlainArray remove.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayRemove0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayRemove0005';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "zhang san");
        plainArray.add(2, "zhang san1");
        let num: number = 2147483647;
        plainArray.add(num, "li si");
        expect(plainArray.remove(num)).assertEqual("li si");
        let num1: number = -2147483648;
        plainArray.add(num1, "li si");
        expect(plainArray.remove(num1)).assertEqual("li si");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_REMOVEAT_0100
     * @tc.name      : testPlainArrayRemoveAt0001
     * @tc.desc      : Testing PlainArray removeAt.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayRemoveAt0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayRemoveAt0001';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        let result = plainArray.removeAt(1);
        expect(result).assertEqual("sparrow");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_REMOVEAT_0200
     * @tc.name      : testPlainArrayRemoveAt0002
     * @tc.desc      : Testing PlainArray removeAt.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayRemoveAt0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayRemoveAt0002';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        let result = plainArray.removeAt(-1);
        expect(result).assertUndefined();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_REMOVEAT_0300
     * @tc.name      : testPlainArrayRemoveAt0003
     * @tc.desc      : Testing PlainArray removeAt.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayRemoveAt0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayRemoveAt0003';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        let result = plainArray.removeAt(2);
        expect(result).assertUndefined();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_REMOVEAT_0400
     * @tc.name      : testPlainArrayRemoveAt0004
     * @tc.desc      : Testing PlainArray removeAt.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayRemoveAt0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayRemoveAt0004';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        let result = plainArray.removeAt(0);
        expect(result).assertUndefined();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_REMOVERANGEFROM_0100
     * @tc.name      : testPlainArrayRemoveRangeFrom0001
     * @tc.desc      : Testing PlainArray removeRangeFrom.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayRemoveRangeFrom0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayRemoveRangeFrom0001';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        plainArray.removeRangeFrom(1, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_REMOVERANGEFROM_0200
     * @tc.name      : testPlainArrayRemoveRangeFrom0002
     * @tc.desc      : Testing PlainArray removeRangeFrom.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayRemoveRangeFrom0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayRemoveRangeFrom0002';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        let result = plainArray.removeRangeFrom(1, 3);
        expect(result).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_REMOVERANGEFROM_0300
     * @tc.name      : testPlainArrayRemoveRangeFrom0003
     * @tc.desc      : Testing PlainArray removeRangeFrom.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayRemoveRangeFrom0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayRemoveRangeFrom0003';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        let result = plainArray.removeRangeFrom(1, Math.floor(7.5));
        expect(result).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_REMOVERANGEFROM_0400
     * @tc.name      : testPlainArrayRemoveRangeFrom0004
     * @tc.desc      : Testing PlainArray removeRangeFrom
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayRemoveRangeFrom0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayRemoveRangeFrom0004';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        let result = plainArray.removeRangeFrom(0, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_SETVALUEAT_0100
     * @tc.name      : testPlainArraySetValueAt0001
     * @tc.desc      : Testing PlainArray setValueAt.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArraySetValueAt0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArraySetValueAt0001';
      try {
        let plainArray: PlainArray<string | number> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        plainArray.setValueAt(1, 3546);
        expect(plainArray.getValueAt(1)).assertEqual(3546);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_SETVALUEAT_0200
     * @tc.name      : testPlainArraySetValueAt0002
     * @tc.desc      : Testing PlainArray setValueAt.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArraySetValueAt0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArraySetValueAt0002';
      try {
        let plainArray: PlainArray<string | number> = new PlainArray();
        plainArray.setValueAt(0, 3546);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_SETVALUEAT_0300
     * @tc.name      : testPlainArraySetValueAt0003
     * @tc.desc      : Testing PlainArray setValueAt.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArraySetValueAt0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArraySetValueAt0003';
      try {
        let plainArray: PlainArray<string | number> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        plainArray.add(3, "sparrow");
        plainArray.setValueAt(0, 2147483647);
        plainArray.setValueAt(1, -2147483648);
        let param = "a".repeat(5120);
        plainArray.setValueAt(2, param);
        expect(plainArray.length).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_SETVALUEAT_0400
     * @tc.name      : testPlainArraySetValueAt0004
     * @tc.desc      : Testing PlainArray setValueAt.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArraySetValueAt0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArraySetValueAt0004';
      try {
        let plainArray: PlainArray<string | number> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        plainArray.add(3, "sparrow");
        plainArray.setValueAt(0, null);
        plainArray.setValueAt(1, undefined);
        expect(plainArray.length).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_SETVALUEAT_0500
     * @tc.name      : testPlainArraySetValueAt0005
     * @tc.desc      : Testing PlainArray setValueAt.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArraySetValueAt0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArraySetValueAt0005';
      try {
        let plainArray: PlainArray<string | number> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        plainArray.add(3, "sparrow");
        plainArray.setValueAt(null, 2147483647);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_SETVALUEAT_0600
     * @tc.name      : testPlainArraySetValueAt0006
     * @tc.desc      : Testing PlainArray setValueAt.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArraySetValueAt0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArraySetValueAt0006';
      try {
        let plainArray: PlainArray<string | number> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        plainArray.add(3, "sparrow");
        plainArray.setValueAt(undefined, 2147483647);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_TOSTRING_0100
     * @tc.name      : testPlainArrayToString0001
     * @tc.desc      : Testing PlainArray toString.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayToString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayToString0001';
      try {
        let plainArray: PlainArray<string | number> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        let result = plainArray.toString();
        console.log(`${TAG} result: ${result}`);
        expect(result).assertEqual('1:squirrel,2:sparrow');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_TOSTRING_0200
     * @tc.name      : testPlainArrayToString0002
     * @tc.desc      : Testing PlainArray toString.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayToString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayToString0002';
      try {
        let plainArray: PlainArray<string | number> = new PlainArray();
        plainArray.add(1, null);
        plainArray.add(2, undefined);
        let result = plainArray.toString();
        console.log(`${TAG} result: ${result}`);
        expect(result).assertEqual('1:,2:');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_TOSTRING_0300
     * @tc.name      : testPlainArrayToString0003
     * @tc.desc      : Testing PlainArray toString.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayToString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayToString0003';
      try {
        let plainArray: PlainArray<string | number> = new PlainArray();
        let result = plainArray.toString();
        console.log(`${TAG} result: ${result}`);
        expect(result).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_TOSTRING_0400
     * @tc.name      : testPlainArrayToString0004
     * @tc.desc      : Testing PlainArray toString.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayToString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayToString0004';
      try {
        let plainArray: PlainArray<string | number> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        plainArray.add(3, "sparrow");
        let result = plainArray.toString();
        console.log(`${TAG} result: ${result}`);
        expect(result).assertEqual('1:squirrel,2:sparrow,3:sparrow');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_TOSTRING_0500
     * @tc.name      : testPlainArrayToString0005
     * @tc.desc      : Testing PlainArray toString.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayToString0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayToString0005';
      try {
        let plainArray: PlainArray<string | number | boolean> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, 10);
        plainArray.add(3, true);
        let result = plainArray.toString();
        console.log(`${TAG} result: ${result}`);
        expect(result).assertEqual('1:squirrel,2:10,3:true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_TOSTRING_0600
     * @tc.name      : testPlainArrayToString0006
     * @tc.desc      : Testing PlainArray toString.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayToString0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayToString0006';
      try {
        let plainArray: PlainArray<string | number | boolean> = new PlainArray();
        for (let i = 0; i < 1024; i++) {
          plainArray.add(i, i);
        }
        plainArray.toString();
        expect(plainArray.length).assertEqual(1024);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_CLEAR_0100
     * @tc.name      : testPlainArrayClear0001
     * @tc.desc      : Testing PlainArray clear.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayClear0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayClear0001';
      try {
        let plainArray: PlainArray<string | number | boolean> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        plainArray.clear();
        expect(plainArray.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_CLEAR_0200
     * @tc.name      : testPlainArrayClear0002
     * @tc.desc      : Testing PlainArray clear.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayClear0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayClear0002';
      try {
        let plainArray: PlainArray<string | number | boolean> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.clear();
        plainArray.add(2, "sparrow");
        expect(plainArray.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_CLEAR_0300
     * @tc.name      : testPlainArrayClear0003
     * @tc.desc      : Testing PlainArray clear.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayClear0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayClear0003';
      try {
        let plainArray: PlainArray<string | number | boolean> = new PlainArray();
        plainArray.clear();
        expect(plainArray.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_CLEAR_0400
     * @tc.name      : testPlainArrayClear0004
     * @tc.desc      : Testing PlainArray clear.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayClear0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayClear0004';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        let result = plainArray.clear();
        console.log(`${TAG} result: ${result}`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_FOREACH_0100
     * @tc.name      : testPlainArrayForEach0001
     * @tc.desc      : Testing PlainArray forEach.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayForEach0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayForEach0001';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        plainArray.forEach((value: string, index?: number) => {
          console.log(`${TAG} value: ${value}, index: ${index}`);
          expect(plainArray.get(index)).assertEqual(value);
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_FOREACH_0200
     * @tc.name      : testPlainArrayForEach0002
     * @tc.desc      : Testing PlainArray forEach.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayForEach0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayForEach0002';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        plainArray.add(3, "sparrow");
        plainArray.forEach((value: string, index?: number) => {
          console.log(`${TAG} value: ${value}, index: ${index}`);
          expect(plainArray.get(index)).assertEqual(value);
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_FOREACH_0300
     * @tc.name      : testPlainArrayForEach0003
     * @tc.desc      : Testing PlainArray forEach.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayForEach0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayForEach0003';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.forEach((value: string, index?: number) => {
          console.log(`${TAG} value: ${value}, index: ${index}`);
          expect(plainArray.get(index)).assertEqual(value);
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_FOREACH_0400
     * @tc.name      : testPlainArrayForEach0004
     * @tc.desc      : Testing PlainArray forEach.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayForEach0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayForEach0004';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(0, undefined);
        plainArray.add(1, null);
        plainArray.forEach((value: string, index?: number) => {
          console.log(`${TAG} value: ${value}, index: ${index}`);
          expect(plainArray.get(index)).assertEqual(value);
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_FOREACH_0500
     * @tc.name      : testPlainArrayForEach0005
     * @tc.desc      : Testing PlainArray forEach.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayForEach0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayForEach0005';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(0, undefined);
        plainArray.add(1, null);
        plainArray.forEach(() => {
          expect(plainArray.length).assertEqual(2);
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_FOREACH_0600
     * @tc.name      : testPlainArrayForEach0006
     * @tc.desc      : Testing PlainArray forEach.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayForEach0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayForEach0006';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(0, "0");
        plainArray.forEach((value) => {
          expect(plainArray.get(0)).assertEqual(value);
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_FOREACH_0700
     * @tc.name      : testPlainArrayForEach0007
     * @tc.desc      : Testing PlainArray forEach.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArrayForEach0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArrayForEach0007';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(0, "0");
        plainArray.forEach((value, index, plainArray: PlainArray<string>) => {
          expect(plainArray.get(0)).assertEqual(value);
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_SYMBOL_ITERATOR_0100
     * @tc.name      : testPlainArraySymbolIterator0001
     * @tc.desc      : Testing PlainArray Symbol.iterator.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArraySymbolIterator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArraySymbolIterator0001';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        let iter = plainArray[Symbol.iterator]();
        let temp: IteratorResult<Object[]> = iter.next();
        while (!temp.done) {
          let key = temp.value[0] as number;
          let value = temp.value[1] as string;
          console.log(`${TAG} key: ${key}, value: ${value}`);
          expect(plainArray.get(key)).assertEqual(value);
          temp = iter.next();
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_SYMBOL_ITERATOR_0200
     * @tc.name      : testPlainArraySymbolIterator0002
     * @tc.desc      : Testing PlainArray Symbol.iterator.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArraySymbolIterator0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArraySymbolIterator0002';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        plainArray.add(3, "sparrow");
        let iter = plainArray[Symbol.iterator]();
        let temp: IteratorResult<Object[]> = iter.next();
        while (!temp.done) {
          let key = temp.value[0] as number;
          let value = temp.value[1] as string;
          console.log(`${TAG} key: ${key}, value: ${value}`);
          expect(plainArray.get(key)).assertEqual(value);
          temp = iter.next();
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_SYMBOL_ITERATOR_0300
     * @tc.name      : testPlainArraySymbolIterator0003
     * @tc.desc      : Testing PlainArray Symbol.iterator.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArraySymbolIterator0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArraySymbolIterator0003';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        let iter = plainArray[Symbol.iterator]();
        let temp: IteratorResult<Object[]> = iter.next();
        while (!temp.done) {
          let key = temp.value[0] as number;
          let value = temp.value[1] as string;
          console.log(`${TAG} key: ${key}, value: ${value}`);
          expect(plainArray.get(key)).assertEqual(value);
          temp = iter.next();
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_SYMBOL_ITERATOR_0400
     * @tc.name      : testPlainArraySymbolIterator0004
     * @tc.desc      : Testing PlainArray Symbol.iterator.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPlainArraySymbolIterator0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPlainArraySymbolIterator0004';
      try {
        let plainArray: PlainArray<string> = new PlainArray();
        plainArray.add(0, undefined);
        plainArray.add(1, null);
        let iter = plainArray[Symbol.iterator]();
        let temp: IteratorResult<Object[]> = iter.next();
        while (!temp.done) {
          let key = temp.value[0] as number;
          let value = temp.value[1] as string;
          console.log(`${TAG} key: ${key}, value: ${value}`);
          expect(plainArray.get(key)).assertEqual(value);
          temp = iter.next();
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });
  });
}