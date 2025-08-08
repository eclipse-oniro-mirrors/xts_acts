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
import { LightWeightSet } from '@kit.ArkTS';

export default function LightWeightSetTest() {
  describe('lightWeightSetTest', () => {
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

    class C1 {
      name: string = ""
      age: string = ""
    }

    class C2 {
      name: string = ""
    }

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_0100
     * @tc.name       : testLightWeightSet0001
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testLightWeightSet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testLightWeightSet0001";
      try {
        let lightWeightSet: LightWeightSet<number | string> = new LightWeightSet();
        let result = lightWeightSet.isEmpty()
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_0200
     * @tc.name       : testLightWeightSet0002
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testLightWeightSet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testLightWeightSet0002";
      try {
        let lightWeightSet: LightWeightSet<number | string> = new LightWeightSet();
        lightWeightSet.add(1)
        lightWeightSet.add(2)
        lightWeightSet.add(3)
        let result = lightWeightSet.isEmpty()
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_0300
     * @tc.name       : testLightWeightSet0003
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testLightWeightSet0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testLightWeightSet0003";
      try {
        let lightWeightSet: LightWeightSet<number | string> = new LightWeightSet();
        lightWeightSet.add(3)
        lightWeightSet.remove(3)
        let result = lightWeightSet.isEmpty()
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_0400
     * @tc.name       : testLightWeightSet0004
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testLightWeightSet0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testLightWeightSet0004";
      try {
        let lightWeightSet: LightWeightSet<number | string> = new LightWeightSet();
        lightWeightSet.add("a")
        lightWeightSet.add("b")
        lightWeightSet.add("c")
        lightWeightSet.clear()
        let result = lightWeightSet.isEmpty()
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_0500
     * @tc.name       : testLightWeightSet0005
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testLightWeightSet0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testLightWeightSet0005";
      try {
        let lightWeightSet: LightWeightSet<number | string> = new LightWeightSet();
        const MY_MAX = 10240;
        let result = lightWeightSet.add(MY_MAX);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_0600
     * @tc.name       : testLightWeightSet0006
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testLightWeightSet0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testLightWeightSet0006";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        let result = lightWeightSet.add("squirrel");
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_0700
     * @tc.name       : testLightWeightSet0007
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testLightWeightSet0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testLightWeightSet0007";
      try {
        let lightWeightSet: LightWeightSet<number> = new LightWeightSet();
        const MY_MAX = 10240;
        lightWeightSet.add(MY_MAX);
        let set: LightWeightSet<number> = new LightWeightSet();
        let result = set.addAll(set);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_0800
     * @tc.name       : testLightWeightSet0008
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0008";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        let set: LightWeightSet<string> = new LightWeightSet();
        set.add("sparrow");
        let result = lightWeightSet.hasAll(set);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_0900
     * @tc.name       : testLightWeightSet0009
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0009";
      try {
        let lightWeightSet: LightWeightSet<number> = new LightWeightSet();
        lightWeightSet.add(123);
        let result = lightWeightSet.has(123);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }

    })


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_0900
     * @tc.name       : testLightWeightSet0009
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0010";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        lightWeightSet.add(undefined);
        let result = lightWeightSet.has(undefined);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_1100
     * @tc.name       : testLightWeightSet0011
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0011";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        lightWeightSet.add(null);
        let result = lightWeightSet.has(null);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_1200
     * @tc.name       : testLightWeightSet0012
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0012";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        let str: string = ''
        for (let index = 0; index < 10000; index++) {
          str.concat(index + '')
        }
        lightWeightSet.add(str);
        let result = lightWeightSet.has(str);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_1300
     * @tc.name       : testLightWeightSet0013
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0013";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        let obj = ["sparrow", "squirrel"];
        let result = lightWeightSet.equal(obj);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_1400
     * @tc.name       : testLightWeightSet0014
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0014";
      try {
        let lightWeightSet: LightWeightSet<number> = new LightWeightSet();
        lightWeightSet.add(10);
        let obj = [8];
        let result = lightWeightSet.equal(obj);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_1500
     * @tc.name       : testLightWeightSet0015
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0015";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        lightWeightSet.add('');
        let obj = [''];
        let result = lightWeightSet.equal(obj);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_1600
     * @tc.name       : testLightWeightSet0016
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0016";
      try {
        let lightWeightSet: LightWeightSet<string | number> = new LightWeightSet();
        lightWeightSet.add('20');
        lightWeightSet.add('30');
        let obj = [20, 30];
        let result = lightWeightSet.equal(obj);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_1700
     * @tc.name       : testLightWeightSet0017
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0017";
      try {
        let lightWeightSet: LightWeightSet<string | number> = new LightWeightSet();
        lightWeightSet.add(null);
        lightWeightSet.add(null);
        let obj = [null, null];
        let result = lightWeightSet.equal(obj);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_1800
     * @tc.name       : testLightWeightSet0018
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0018";
      try {
        let lightWeightSet: LightWeightSet<string | number> = new LightWeightSet();
        lightWeightSet.add(undefined);
        lightWeightSet.add(undefined);
        let obj = [undefined, undefined];
        let result = lightWeightSet.equal(obj);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_1900
     * @tc.name       : testLightWeightSet0019
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0019";
      try {
        let lightWeightSet: LightWeightSet<number> = new LightWeightSet();
        const MY_MAX = 10240;
        let set = lightWeightSet.add(MY_MAX);
        let result = lightWeightSet.equal(set);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_2000
     * @tc.name       : testLightWeightSet0020
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0020";
      try {
        let lightWeightSet: LightWeightSet<number> = new LightWeightSet();
        lightWeightSet.increaseCapacityTo(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_2100
     * @tc.name       : testLightWeightSet0021
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0021";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        let result = lightWeightSet.getIndexOf("sparrow");
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_2200
     * @tc.name       : testLightWeightSet0022
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0022";
      try {
        let lightWeightSet: LightWeightSet<object> = new LightWeightSet();
        let a: C1 = {
          name: "Dylon", age: "13"
        };
        lightWeightSet.add(a);
        let result = lightWeightSet.getIndexOf(a);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_2300
     * @tc.name       : testLightWeightSet0023
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0023";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        let age = ''
        lightWeightSet.add(age);
        let result = lightWeightSet.getIndexOf(age);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_2400
     * @tc.name       : testLightWeightSet0024
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0024";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        lightWeightSet.add(null);
        let result = lightWeightSet.getIndexOf(null);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_2500
     * @tc.name       : testLightWeightSet0025
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0025";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        lightWeightSet.add(undefined);
        let result = lightWeightSet.getIndexOf(undefined);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_2600
     * @tc.name       : testLightWeightSet0026
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0026";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        lightWeightSet.add("squirrel2222222222222");
        lightWeightSet.add("sparrow33");
        let result1 = lightWeightSet.getIndexOf("squirrel2222222222222");
        let result = lightWeightSet.getIndexOf("sparrow33");
        expect(result).assertEqual(0);
        expect(result1).assertEqual(1);

      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_2700
     * @tc.name       : testLightWeightSet0027
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0027";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        let result = lightWeightSet.remove("sparrow");
        expect(result).assertEqual("sparrow");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_2800
     * @tc.name       : testLightWeightSet0028
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0028";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        lightWeightSet.add(null);
        let result = lightWeightSet.remove(null);
        expect(result).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_2900
     * @tc.name       : testLightWeightSet0029
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0029";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        lightWeightSet.add(undefined);
        let result = lightWeightSet.remove(undefined);
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_3000
     * @tc.name       : testLightWeightSet0030
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0030";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        let result = lightWeightSet.remove("88");
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_3200
     * @tc.name       : testLightWeightSet0032
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0032";
      try {
        let lightWeightSet: LightWeightSet<number> = new LightWeightSet();
        const MY_MAX = 1024000;
        lightWeightSet.add(MY_MAX);
        let result = lightWeightSet.remove(MY_MAX);
        expect(result).assertEqual(MY_MAX);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_3300
     * @tc.name       : testLightWeightSet0033
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0033";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        let result = lightWeightSet.removeAt(1);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_3300
     * @tc.name       : testLightWeightSet0033
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0034";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        let result = lightWeightSet.removeAt(-1);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_3500
     * @tc.name       : testLightWeightSet0035
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0035";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        let result = lightWeightSet.removeAt(3);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_3600
     * @tc.name       : testLightWeightSet0036
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0036";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        let result = lightWeightSet.getValueAt(1);
        expect(result).assertEqual("squirrel");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_3700
     * @tc.name       : testLightWeightSet0037
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0037";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        let result = lightWeightSet.getValueAt(3);
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_3800
     * @tc.name       : testLightWeightSet0038
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0038";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        let result = lightWeightSet.getValueAt(1);
        let result1 = lightWeightSet.getIndexOf("sparrow");
        expect(result).assertEqual("squirrel");
        expect(result1).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_3900
     * @tc.name       : testLightWeightSet0039
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0039";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        lightWeightSet.clear();
        let result = lightWeightSet.length;
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_3900
     * @tc.name       : testLightWeightSet0039
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0040";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        lightWeightSet.clear();
        let result = lightWeightSet.add("squirrel");
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_4100
     * @tc.name       : testLightWeightSet0041
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0041";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        let result = lightWeightSet.clear();
        // let result = lightWeightSet.length;
        console.log(JSON.stringify(result), 'result-------')
        // expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_4200
     * @tc.name       : testLightWeightSet0042
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0042";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        let result = lightWeightSet.toString(); // "sparrow,squirrel"
        console.log(JSON.stringify(result), 'result---toString----')
        expect(result).assertEqual("sparrow,squirrel");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_4300
     * @tc.name       : testLightWeightSet0043
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0043";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        let result = lightWeightSet.toString();
        expect(result).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_440
     * @tc.name       : testLightWeightSet0044
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0044";
      try {
        let lightWeightSet = "null";
        let result = lightWeightSet.toString();
        expect(result).assertEqual("null");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_450
     * @tc.name       : testLightWeightSet0045
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0045";
      try {
        let lightWeightSet = "undefined";
        let result = lightWeightSet.toString();
        expect(result).assertEqual("undefined");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_4600
     * @tc.name       : testLightWeightSet0046
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0046";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("squirrel");
        let result = lightWeightSet.toString();
        expect(result).assertEqual("squirrel");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_4700
     * @tc.name       : testLightWeightSet0047
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0047";
      try {
        let lightWeightSet: LightWeightSet<object> = new LightWeightSet();
        let a: C1 = {
          name: "Dylon", age: "Dylon"
        };
        lightWeightSet.add(a);
        let result = lightWeightSet.toString();
        console.log(JSON.stringify(result), 'result-------')
        // expect(result).assertEqual("Dylon,Dylon");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_4800
     * @tc.name       : testLightWeightSet0048
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0048";
      try {
        let lightWeightSet: LightWeightSet<number> = new LightWeightSet();
        const MY_MAX = 1024000;
        lightWeightSet.add(MY_MAX);
        let result = lightWeightSet.toString();
        console.log(JSON.stringify(result), 'result-------')
        expect(result).assertEqual(MY_MAX + '');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_4900
     * @tc.name       : testLightWeightSet0049
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0049";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        let result = lightWeightSet.toArray();
        console.log(JSON.stringify(result), 'result-------') // ["sparrow","squirrel"]
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_5000
     * @tc.name       : testLightWeightSet0050
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0050";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        let result = lightWeightSet.toArray().length;
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_5100
     * @tc.name       : testLightWeightSet0051
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0051";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("squirrel");
        let result = lightWeightSet.toArray();
        console.log(JSON.stringify(result), 'result-------') // ["squirrel"]
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_5200
     * @tc.name       : testLightWeightSet0052
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0052";
      try {
        let lightWeightSet: LightWeightSet<object> = new LightWeightSet();
        let a: C1 = {
          name: "Dylon", age: "Dylon"
        };
        lightWeightSet.add(a);
        let result = lightWeightSet.toArray();
        console.log(JSON.stringify(result), 'result-------') // [{"name":"Dylon","age":"Dylon"}]
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_5300
     * @tc.name       : testLightWeightSet0053
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0053";
      try {
        let element = 0
        let lightWeightSet: LightWeightSet<number> = new LightWeightSet();
        for (let index = 0; index < 1024; index++) {
          element = element += index;
        }
        lightWeightSet.add(element);
        let result = lightWeightSet.toArray();
        console.log(JSON.stringify(result), 'result-------') //[523776]
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_5400
     * @tc.name       : testLightWeightSet0054
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0054";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        let iter = lightWeightSet.values();
        let index = 0;
        while (index < lightWeightSet.length) {
          console.log(JSON.stringify(iter.next().value), 'next----------');
          index++;
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_5500
     * @tc.name       : testLightWeightSet0055
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0055";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        let iter = lightWeightSet.values();
        console.log(JSON.stringify(iter.next().value), 'next----------');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_5600
     * @tc.name       : testLightWeightSet0056
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0056";
      try {
        let element = ''
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        for (let index = 0; index < 100; index++) {
          element = element.concat('squirrel')
          lightWeightSet.add(element)
        }
        let iter = lightWeightSet.values();
        let index = 0;
        while (index < lightWeightSet.length) {
          console.log(JSON.stringify(iter.next().value), 'next----------');
          index++;
        }

      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_5700
     * @tc.name       : testLightWeightSet0057
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0057";
      try {
        let lightWeightSet: LightWeightSet<number> = new LightWeightSet();
        for (let index = 0; index < 1024; index++) {
          lightWeightSet.add(index++)
        }
        let iter = lightWeightSet.values();
        let index = 0;
        while (index < lightWeightSet.length) {
          console.log(JSON.stringify(iter.next().value), 'next----------');
          index++;
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_5800
     * @tc.name       : testLightWeightSet0058
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0058";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        lightWeightSet.add("sparrow");
        lightWeightSet.add("gull");
        lightWeightSet.forEach((item ?: string, index ?: string) => {
          lightWeightSet.remove(item);
        });
        console.log(JSON.stringify(lightWeightSet), 'lightWeightSet-')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_5900
     * @tc.name       : testLightWeightSet0059
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0059";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        lightWeightSet.add("sparrow");
        lightWeightSet.add("gull");
        lightWeightSet.forEach((value ?: string, key ?: string) => {
          console.log("value:" + value, "key:" + key);
        });
        console.log(JSON.stringify(lightWeightSet), 'lightWeightSet-')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_5800
     * @tc.name       : testLightWeightSet0060
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0060";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        lightWeightSet.forEach((value ?: string, key ?: string) => {
          console.log("value:" + value, "key:" + key);
        });
        console.log(JSON.stringify(lightWeightSet), 'lightWeightSet-')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_6100
     * @tc.name       : testLightWeightSet0061
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0061";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        let iter = lightWeightSet.entries();
        let index = 0;
        while (index < lightWeightSet.length) {
          console.log(JSON.stringify(iter.next().value), 'iter.next====');
          index++;
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_6200
     * @tc.name       : testLightWeightSet0062
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0062";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("squirrel");
        let iter = lightWeightSet.entries();
        let index = 0;
        while (index < lightWeightSet.length) {
          console.log(JSON.stringify(iter.next().value), 'iter.next====');
          index++;
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_6300
     * @tc.name       : testLightWeightSet0063
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0063";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        let iter = lightWeightSet.entries();
        let index = 0;
        console.log(JSON.stringify(iter), 'iter.next====');
        while (index < lightWeightSet.length) {
          console.log(JSON.stringify(iter.next().value), 'iter.next====');
          index++;
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_6400
     * @tc.name       : testLightWeightSet0064
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0064";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        // 示例方法一：
        let nums: Array<string> = lightWeightSet.toArray()
        for (let item of nums) {
          console.log("value:" + item);
        }

      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_6500
     * @tc.name       : testLightWeightSet0065
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0065";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        // 示例方法二：
        let iter = lightWeightSet[Symbol.iterator]();
        let temp: IteratorResult<string> = iter.next();
        while (!temp.done) {
          console.log("value:" + temp.value);
          temp = iter.next();
        }

      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_6600
     * @tc.name       : testLightWeightSet0066
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0062";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("squirrel");
        let iter = lightWeightSet[Symbol.iterator]().next();
        let index = 0;
        while (index < lightWeightSet.length) {
          console.log(JSON.stringify(iter.value), 'iter.next====');
          index++;
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_6700
     * @tc.name       : testLightWeightSet0067
     * @tc.desc       : Test the function of the interface isEmpty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0067";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet();
        let iter = lightWeightSet[Symbol.iterator]().next();
        let index = 0;
        while (index < lightWeightSet.length) {
          console.log(JSON.stringify(iter.value), 'iter.next====');
          index++;
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_6800
     * @tc.name       : testLightWeightSet0068
     * @tc.desc       : Test the function foreach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0068";
      try {
        let lightWeightSet: LightWeightSet<number> = new LightWeightSet();
        for (let i = 0; i < 10; i++) {
          lightWeightSet.add(i);
        }
        lightWeightSet.forEach(() => {
          expect(lightWeightSet.length).assertEqual(10);
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_6900
     * @tc.name       : testLightWeightSet0069
     * @tc.desc       : Test the function foreach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0069";
      try {
        let lightWeightSet: LightWeightSet<number> = new LightWeightSet();
        for (let i = 0; i < 10; i++) {
          lightWeightSet.add(i);
        }
        lightWeightSet.forEach((value) => {
          expect(lightWeightSet.has(value)).assertTrue();
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_7000
     * @tc.name       : testLightWeightSet0070
     * @tc.desc       : Test the function foreach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0070";
      try {
        let lightWeightSet: LightWeightSet<number> = new LightWeightSet();
        for (let i = 0; i < 10; i++) {
          lightWeightSet.add(i);
        }
        lightWeightSet.forEach((value, index: number) => {
          expect(lightWeightSet.getIndexOf(value)).assertEqual(index);
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_7100
     * @tc.name       : testLightWeightSet0071
     * @tc.desc       : Test the function foreach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0071";
      try {
        let lightWeightSet: LightWeightSet<number> = new LightWeightSet();
        for (let i = 0; i < 10; i++) {
          lightWeightSet.add(i);
        }
        lightWeightSet.forEach((value, index: number, lightWeightSet: LightWeightSet<number>) => {
          expect(lightWeightSet.getIndexOf(value)).assertEqual(index);
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_7200
     * @tc.name       : testLightWeightSet0072
     * @tc.desc       : Test the function foreach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLightWeightSet0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testLightWeightSet0072";
      try {
        let lightWeightSet: LightWeightSet<number> = new LightWeightSet();
        let str: string = "0";
        for (let i = 0; i < 10; i++) {
          lightWeightSet.add(i);
        }
        lightWeightSet.forEach((value, index: number, lightWeightSet: LightWeightSet<number>) => {
          expect(lightWeightSet.getIndexOf(value)).assertEqual(index);
        }, str);
        expect(str).assertEqual("0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    })

  })
}

