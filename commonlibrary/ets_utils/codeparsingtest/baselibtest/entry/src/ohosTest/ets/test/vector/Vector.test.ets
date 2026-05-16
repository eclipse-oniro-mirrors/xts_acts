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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { Vector } from '@kit.ArkTS';

class C1 {
  name: string = ""
  age: string = ""
}

export default function Vector1Test() {
  describe('Vector1Test', () => {
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
     * @tc.name   testVectorAdd001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Vector_CASE_0100
     * @tc.desc   Testing Vector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVectorAdd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testVectorAdd001';

      try {
        let vector: Vector<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new Vector();
        vector.add("zhang san");
        vector.add(1);
        vector.add({
          age: 10, name: "zhang"
        });
        vector.add(undefined);
        vector.add(null);
        vector.add(true);
        vector.insert("insert", 0);
        vector.add([0, 1, 2, undefined]);
        vector.removeByIndex(0);
        let jsonResult = JSON.stringify(vector);
        console.log(`${TAG} jsonResult: ${jsonResult}`);
        expect(jsonResult)
          .assertEqual(`{"0":"zhang san","1":1,"2":{"age":10,"name":"zhang"},"4":null,"5":true,"6":[0,1,2,null]}`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testVectorCase002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Vector_CASE_0200
     * @tc.desc   Testing Vector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVectorCase002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testVectorAdd0002';
      try {
        let vector: Vector<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new Vector();
        let param = "!\"#$%'()+,-./:;<=>?@[\\]^_`{|}~";
        vector.add(param);
        let jsonResult = JSON.stringify(vector);
        console.log(`${TAG} jsonResult: ${jsonResult}`);
        expect(vector.get(0)).assertEqual(param);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testVectorInsert001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Vector_CASE_0300
     * @tc.desc   Testing Vector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVectorInsert001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testVectorInsert001';
      try {
        let vector: Vector<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new Vector();
        let param = "!\"#$%'()+,-./:;<=>?@[\\]^_`{|}~";
        vector.insert(1, 0);
        vector.insert(2, 1);
        vector.insert(param, 0);
        let index = vector.getIndexOf(param);
        expect(index).assertEqual(0);
        let removeResult = vector.removeByIndex(index);
        console.log(`${TAG} removeResult: ${removeResult}`);
        expect(vector.has(param)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testVectorInsert0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Vector_CASE_0400
     * @tc.desc   Testing Vector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVectorInsert0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testVectorInsert0002';
      try {
        let vector: Vector<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new Vector();
        let param = "!\"#$%'()+,-./:;<=>?@[\\]^_`{|}~";
        vector.insert(1, 0);
        vector.insert(2, 1);
        vector.add(param);
        let index = vector.getLastIndexOf(param);
        expect(index).assertEqual(vector.length - 1);
        let removeResult = vector.removeByIndex(index);
        console.log(`${TAG} removeResult: ${removeResult}`);
        expect(vector.has(param)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testVectorHas0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Vector_CASE_0500
     * @tc.desc   Testing Vector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVectorHas0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testVectorHas0001';
      try {

        let vector: Vector<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new Vector();
        vector.add("zhang san");
        vector.add(1);
        let temp: C1 = {
          age: "10", name: "zhang"
        };
        vector.add(temp);
        vector.add(undefined);
        vector.add(null);
        vector.add(true);
        let arr = [0, 1, 2, undefined];
        vector.add(arr);
        let param = "!\"#$%'()+,-./:;<=>?@[\\]^_`{|}~";
        vector.add(param);

        expect(vector.has("zhang san")).assertEqual(true);
        expect(vector.has(1)).assertEqual(true);
        expect(vector.has(temp)).assertEqual(true);
        expect(vector.has(undefined)).assertEqual(true);
        expect(vector.has(null)).assertEqual(true);
        expect(vector.has(true)).assertEqual(true);
        expect(vector.has(arr)).assertEqual(true);
        expect(vector.has(param)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testVectorGet0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Vector_CASE_0600
     * @tc.desc   Testing Vector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVectorGet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testVectorGet0001';
      try {
        let vector: Vector<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new Vector();
        vector.add("zhang san");
        vector.add(1);
        let temp: C1 = {
          age: "10", name: "zhang"
        };
        vector.add(temp);
        vector.add(undefined);
        vector.add(null);
        vector.add(true);
        let arr = [0, 1, 2, undefined];
        vector.add(arr);
        let param = "!\"#$%'()+,-./:;<=>?@[\\]^_`{|}~";
        vector.add(param);
        vector.forEach((value, index) => {
          expect(vector.get(index)).assertEqual(value);
        })
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testVectorGetIndexOf0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Vector_CASE_0700
     * @tc.desc   Testing Vector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVectorGetIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testVectorGetIndexOf0001';
      try {
        let vector: Vector<number> = new Vector();
        vector.add(1);
        vector.add(2);
        let index1 = vector.getIndexOf(2);
        vector.add(2);
        let index2 = vector.getIndexOf(2);
        vector.add(2);
        let index3 = vector.getIndexOf(2);
        expect(index1 === index2 && index2 === index3).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testVectorGetIndexOf0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Vector_CASE_0800
     * @tc.desc   Testing Vector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVectorGetIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testVectorGetIndexOf0002';
      try {
        let vector: Vector<number> = new Vector();
        vector.add(1);
        vector.add(2);
        vector.add(2);
        vector.add(3);
        vector.add(3);
        let index101 = vector.removeByIndex(vector.getIndexOf(2));
        let index102 = vector.removeByIndex(vector.getIndexOf(2));
        expect(index101 == index102).assertEqual(true);
        let index103 = vector.removeByIndex(vector.getIndexOf(3));
        let index104 = vector.removeByIndex(vector.getIndexOf(3));
        expect(index103 == index104).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testVectorGetIndexOf0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Vector_CASE_0900
     * @tc.desc   Testing Vector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVectorGetIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testVectorGetIndexOf0003';
      try {
        let vector: Vector<number> = new Vector();
        vector.add(1);
        vector.add(2);
        vector.add(3);
        vector.add(4);
        vector.add(5);
        let param: number = 5;
        vector.remove(param);
        vector.add(param);
        expect(vector.getIndexOf(param)).assertEqual(vector.length - 1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testVectorGetIndexOf0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Vector_CASE_1000
     * @tc.desc   Testing Vector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVectorGetIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testVectorGetIndexOf0004';
      try {
        let vector: Vector<number> = new Vector();
        vector.add(1);
        vector.add(2);
        vector.add(3);
        vector.add(4);
        vector.add(5);
        let removeParam = vector.removeByIndex(vector.length - 1);
        vector.add(removeParam);
        expect(vector.getIndexOf(removeParam)).assertEqual(vector.length - 1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testVectorRemoveByIndex0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Vector_CASE_1100
     * @tc.desc   Testing Vector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVectorRemoveByIndex0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testVectorRemoveByIndex0001';

      let vector: Vector<number | null | undefined> = new Vector();
      vector.add(2);
      vector.add(4);
      vector.add(5);
      vector.add(2);
      vector.add(4);

      try {
        vector.removeByIndex(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

      try {
        vector.removeByIndex(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

    });

    /**
     * @tc.name   testVectorRemove0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Vector_CASE_1200
     * @tc.desc   Testing Vector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVectorRemove0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testVectorRemove0001';
      let vector: Vector<number | null | undefined> = new Vector();
      vector.add(2);
      try {
        let result1 = vector.remove(null);
        expect(result1).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
      try {
        let result2 = vector.remove(undefined);
        expect(result2).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

    });

    /**
     * @tc.name   testVectorSet0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Vector_CASE_1300
     * @tc.desc   Testing Vector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVectorSet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testVectorSet0001';
      try {
        let vector: Vector<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new Vector();
        vector.add("zhang san");
        vector.add(1);
        let param: C1 = {
          age: "10", name: "zhang"
        };
        vector.add(param);
        vector.add(undefined);
        vector.add(null);
        vector.add(true);
        vector.add([0, 1, 2, undefined]);

        vector.forEach((value, index: number) => {
          expect(vector.set(Math.floor(index ?? 0), "li si") != undefined).assertEqual(false);
        })
        console.log(`${JSON.stringify(vector)}`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.name   testVectorSet0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Vector_CASE_1400
     * @tc.desc   Testing Vector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVectorSet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testVectorSet0002';
      try {
        let vector: Vector<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new Vector();
        vector.add("zhang san");
        vector.add(1);
        let param: C1 = {
          age: "10", name: "zhang"
        };
        vector.add(param);
        vector.add(undefined);
        vector.add(null);
        vector.add(true);
        vector.add([0, 1, 2, undefined]);

        let index = vector.getIndexOf(param);
        let setParam = vector.set(Math.floor(index), "li si");
        let removeParam = vector.removeByIndex(Math.floor(index));
        expect(setParam == removeParam).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.name   testVectorSet0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Vector_CASE_1500
     * @tc.desc   Testing Vector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVectorSet0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testVectorSet0003';
      try {
        let vector: Vector<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new Vector();
        vector.add("zhang san");
        vector.add(1);
        let param: C1 = {
          age: "10", name: "zhang"
        };
        vector.add(param);
        vector.add(undefined);
        vector.add(null);
        vector.add(true);
        vector.add([0, 1, 2, undefined]);

        let index = vector.getIndexOf(param);
        let setParam = vector.set(Math.floor(index), "li si");
        expect(vector.has(setParam)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testVectorGetLastIndexOf0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Vector_CASE_1600
     * @tc.desc   Testing Vector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVectorGetLastIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testVectorGetLastIndexOf0001';
      try {
        let vector: Vector<number> = new Vector();
        vector.add(1);
        vector.add(2);
        let index1 = vector.getLastIndexOf(2);
        vector.add(2);
        let index2 = vector.getLastIndexOf(2);
        vector.add(2);
        let index3 = vector.getLastIndexOf(2);
        expect(index1 !== index2 && index2 !== index3).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testVectorGetLastIndexOf0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Vector_CASE_1700
     * @tc.desc   Testing Vector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVectorGetLastIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testVectorGetLastIndexOf0002';
      try {
        let vector: Vector<number> = new Vector();
        vector.add(1);
        vector.add(2);
        vector.add(2);
        vector.add(3);
        vector.add(3);
        let index101 = vector.removeByIndex(vector.getLastIndexOf(2));
        let index102 = vector.removeByIndex(vector.getLastIndexOf(2));
        expect(index101 == index102).assertEqual(true);
        let index103 = vector.removeByIndex(vector.getLastIndexOf(3));
        let index104 = vector.removeByIndex(vector.getLastIndexOf(3));
        expect(index103 == index104).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testVectorGetLastIndexOf0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Vector_CASE_1800
     * @tc.desc   Testing Vector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVectorGetLastIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testVectorGetLastIndexOf0003';
      try {
        let vector: Vector<number> = new Vector();
        vector.add(1);
        vector.add(2);
        vector.add(3);
        vector.add(5);
        vector.add(5);
        let lastIndex = vector.getLastIndexOf(5);
        let removeParam = vector.removeByIndex(lastIndex);
        vector.add(removeParam);
        expect(vector.getLastIndexOf(removeParam)).assertEqual(lastIndex);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testVectorGetLastIndexOf0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Vector_CASE_1900
     * @tc.desc   Testing Vector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVectorGetLastIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testVectorGetLastIndexOf0004';
      try {
        let vector: Vector<number> = new Vector();
        vector.add(1);
        vector.add(2);
        vector.add(3);
        vector.add(4);
        vector.add(5);
        let param: number = 5;
        vector.remove(param);
        vector.add(param);
        expect(vector.getLastIndexOf(param)).assertEqual(vector.length - 1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testVectorGetLastIndexFrom0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Vector_CASE_2000
     * @tc.desc   Testing Vector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVectorGetLastIndexFrom0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testVectorGetLastIndexFrom0001';
      let vector: Vector<number | null | undefined> = new Vector();
      vector.add(2);
      vector.add(4);
      vector.add(5);
      vector.add(4);

      let result1 = vector.getLastIndexFrom(null, 3);
      expect(result1).assertEqual(-1);

      try {
        vector.getLastIndexFrom(4, null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }


      let result3 = vector.getLastIndexFrom(undefined, 3);
      expect(result3).assertEqual(-1);

      try {
        vector.getLastIndexFrom(4, undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.name   testVectorGetIndexFrom0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Vector_CASE_2100
     * @tc.desc   Testing Vector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVectorGetIndexFrom0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testVectorGetIndexFrom0001';
      let vector: Vector<number | null | undefined> = new Vector();
      vector.add(2);
      vector.add(4);
      vector.add(5);
      vector.add(4);

      let result1 = vector.getIndexFrom(null, 3);
      expect(result1).assertEqual(-1);

      try {
        vector.getIndexFrom(4, null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

      let result2 = vector.getIndexFrom(undefined, 3);
      expect(result2).assertEqual(-1);

      try {
        vector.getIndexFrom(4, undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.name   testVectorRemoveByRange0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Vector_CASE_2300
     * @tc.desc   Testing Vector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVectorRemoveByRange0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testVectorRemoveByRange0001';
      let vector: Vector<number | null | undefined> = new Vector();
      vector.add(2);
      vector.add(4);
      vector.add(5);
      vector.add(4);

      try {
        vector.removeByRange(null, 3);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

      try {
        vector.removeByRange(4, null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

      try {
        vector.removeByRange(undefined, 3);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

      try {
        vector.removeByRange(4, undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.name   testVectorReplaceAllElement0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Vector_CASE_2400
     * @tc.desc   Testing Vector replaceAllElement insert new string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVectorReplaceAllElement0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testVectorReplaceAllElement0001';
      try {
        let vector: Vector<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new Vector();
        vector.add("zhang san");
        vector.add(1);
        let temp: C1 = {
          age: "10", name: "zhang"
        };
        vector.add(temp);
        vector.add(undefined);
        vector.add(null);
        vector.add(true);
        let array = [0, 1, 2, undefined];
        vector.add(array);
        vector.add("");
        vector.add("`");
        vector.add("%");
        vector.add(`"`);

        vector.replaceAllElements((value, index, tempVector) => {
          let indexValue = index ?? 0;
          let length = tempVector ? tempVector.length - 1 : 0
          if (indexValue === length) {
            let tmp = value as string;
            value = tmp + "add last index";
          }
          return value;
        })
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testVectorForEach0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Vector_CASE_2500
     * @tc.desc   Testing Vector forEach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVectorForEach0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testVectorForEach0001';
      try {
        let vector: Vector<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new Vector();
        vector.add("zhang san");
        vector.add(1);
        let temp: C1 = {
          age: "10", name: "zhang"
        };
        vector.add(temp);
        vector.add(undefined);
        vector.add(null);
        vector.add(true);
        let array = [0, 1, 2, undefined];
        vector.add(array);
        vector.add("");
        vector.add("`");
        vector.add("%");
        vector.add(`"`);
        vector.forEach((value, index) => {
          expect(vector.get(Math.floor(index ?? 0))).assertEqual(value);
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testVectorSubVector0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Vector_CASE_2600
     * @tc.desc   Testing Vector forEach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVectorSubVector0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testVectorSubVector0001';
      let vector: Vector<number | null | undefined> = new Vector();
      vector.add(2);
      vector.add(4);
      vector.add(5);
      vector.add(4);
      vector.add(6);
      vector.add(8);

      try {
        vector.subVector(null, 3);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

      try {
        vector.subVector(4, null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

      try {
        vector.subVector(undefined, 3);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

      try {
        vector.subVector(4, undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

    });

    /**
     * @tc.name   testVectorSetLength0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Vector_CASE_2700
     * @tc.desc   Testing Vector forEach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVectorSetLength0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testVectorSetLength0001';
      let vector: Vector<number | null | undefined> = new Vector();
      vector.add(2);
      vector.add(4);
      vector.add(5);
      vector.add(4);
      vector.setLength(8);
      vector.setLength(2);

      try {
        vector.setLength(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

      try {
        vector.setLength(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

    });

    /**
     * @tc.name   testVectorIncreaseCapacityTo0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Vector_CASE_2800
     * @tc.desc   Testing Vector forEach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVectorIncreaseCapacityTo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testVectorIncreaseCapacityTo0001';
      let vector: Vector<number | null | undefined> = new Vector();
      vector.add(2);
      vector.add(4);
      vector.add(5);
      vector.add(4);
      vector.increaseCapacityTo(2);
      vector.increaseCapacityTo(12);

      try {
        vector.increaseCapacityTo(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

      try {
        vector.increaseCapacityTo(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

    });

    /**
     * @tc.name   testVectorCopyToArrayTo0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Vector_CASE_2900
     * @tc.desc   Testing Vector forEach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVectorCopyToArrayTo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testVectorCopyToArrayTo0001';
      let vector: Vector<number | null | undefined> = new Vector();
      let vector1: Vector<number | null | undefined> = new Vector();
      vector.add(2);
      vector.add(4);
      vector.add(5);
      vector.add(4);
      vector.add(null);
      vector.add(undefined);

      let result: Array<number | null | undefined> = [];
      vector.copyToArray(result);

      let result1: Array<number | null | undefined> = [];
      vector1.copyToArray(result1);

      expect(result).assertDeepEquals([2, 4, 5, 4, null, undefined]);
      expect(result1).assertDeepEquals([]);

    });
    /**
     * @tc.name   testVectorCopyToArrayTo0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Vector_CASE_3000
     * @tc.desc   Testing Vector forEach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVectorCopyToArrayTo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testVectorCopyToArrayTo0002';
      let vector: Vector<number | null | undefined> = new Vector();
      let vector1: Vector<number | null | undefined> = new Vector();
      vector.add(2);
      vector.add(4);
      vector.add(5);
      try {
        vector.get(null);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
      try {
        vector.get(undefined);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
      try {
        vector.set(null, 1);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
      try {
        vector.set(undefined, 1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
      vector.set(1, null);
      expect(vector.get(1)).assertNull();
      vector.set(2, undefined);
      expect(vector.get(1)).assertNull();
    });
  });
}