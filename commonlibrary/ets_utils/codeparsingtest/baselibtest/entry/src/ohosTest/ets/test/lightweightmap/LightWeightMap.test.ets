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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import { LightWeightMap } from '@kit.ArkTS';

export default function LightWeightMapTest() {
  describe('lightWeightMapTest', () => {
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
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_CONSTRUCTOR_0100
     * @tc.name      : testLightWeightMapConstructor0001
     * @tc.desc      : Testing LightWeightMap constructor
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapConstructor0001', 0, () => {
      const TAG = 'testLightWeightMapConstructor0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        expect(!!lightWeightMap).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_ISEMPTY_0100
     * @tc.name      : testLightWeightMapIsEmpty0001
     * @tc.desc      : Testing LightWeightMap is empty
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapIsEmpty0001', 0, () => {
      const TAG = 'testLightWeightMapIsEmpty0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        expect(lightWeightMap.isEmpty()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_ISEMPTY_0200
     * @tc.name      : testLightWeightMapIsEmpty0002
     * @tc.desc      : Testing LightWeightMap has data
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapIsEmpty0002', 0, () => {
      const TAG = 'testLightWeightMapIsEmpty0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        expect(lightWeightMap.isEmpty()).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_ISEMPTY_0300
     * @tc.name      : testLightWeightMapIsEmpty0003
     * @tc.desc      : Testing LightWeightMap has data and remove
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapIsEmpty0003', 0, () => {
      const TAG = 'testLightWeightMapIsEmpty0003';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.remove("squirrel");
        expect(lightWeightMap.isEmpty()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_ISEMPTY_0400
     * @tc.name      : testLightWeightMapIsEmpty0004
     * @tc.desc      : Testing LightWeightMap has large data and remove
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapIsEmpty0004', 0, () => {
      const TAG = 'testLightWeightMapIsEmpty0004';
      let data: Array<number> = Array(10000).map((_: undefined, index) => index);
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        data.forEach((i) => lightWeightMap.set('key' + i, i));
        data.forEach((i) => lightWeightMap.remove('key' + i));
        expect(lightWeightMap.isEmpty()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_ISEMPTY_0500
     * @tc.name      : testLightWeightMapIsEmpty0005
     * @tc.desc      : Testing LightWeightMap has large data and clear
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapIsEmpty0005', 0, () => {
      const TAG = 'testLightWeightMapIsEmpty0005';
      let data: Array<number> = Array(10000).map((_: undefined, index) => index);
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        data.forEach((i) => lightWeightMap.set('key' + i, i));
        lightWeightMap.clear();
        expect(lightWeightMap.isEmpty()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_HASALL_0100
     * @tc.name      : testLightWeightMapHasAll0001
     * @tc.desc      : Testing LightWeightMap contain other LightWeightMap data
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapHasAll0001', 0, () => {
      const TAG = 'testLightWeightMapHasAll0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        let map: LightWeightMap<string, number> = new LightWeightMap();
        map.set("sparrow", 356);
        expect(lightWeightMap.hasAll(map)).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_HASALL_0200
     * @tc.name      : testLightWeightMapHasAll0002
     * @tc.desc      : Testing LightWeightMap contain null data
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapHasAll0002', 0, () => {
      const TAG = 'testLightWeightMapHasAll0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        lightWeightMap.hasAll(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_HASALL_0300
     * @tc.name      : testLightWeightMapHasAll0003
     * @tc.desc      : Testing LightWeightMap contain undefined data
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapHasAll0003', 0, () => {
      const TAG = 'testLightWeightMapHasAll0003';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        lightWeightMap.hasAll(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_HASKEY_0100
     * @tc.name      : testLightWeightMapHasKey0001
     * @tc.desc      : Testing LightWeightMap has key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapHasKey0001', 0, () => {
      const TAG = 'testLightWeightMapHasKey0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        expect(lightWeightMap.hasKey("squirrel")).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_HASKEY_0200
     * @tc.name      : testLightWeightMapHasKey0002
     * @tc.desc      : Testing LightWeightMap has not existed key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapHasKey0002', 0, () => {
      const TAG = 'testLightWeightMapHasKey0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        expect(lightWeightMap.hasKey('sparrow')).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_HASKEY_0300
     * @tc.name      : testLightWeightMapHasKey0003
     * @tc.desc      : Testing LightWeightMap has existed key with blank
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapHasKey0003', 0, () => {
      const TAG = 'testLightWeightMapHasKey0003';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        expect(lightWeightMap.hasKey(' squirrel ')).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_HASKEY_0400
     * @tc.name      : testLightWeightMapHasKey0004
     * @tc.desc      : Testing LightWeightMap has null or undefined key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapHasKey0004', 0, () => {
      const TAG = 'testLightWeightMapHasKey0004';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        expect(lightWeightMap.hasKey(null)).assertFalse();
        expect(lightWeightMap.hasKey(undefined)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_HASVALUE_0100
     * @tc.name      : testLightWeightMapHasValue0001
     * @tc.desc      : Testing LightWeightMap has value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapHasValue0001', 0, () => {
      const TAG = 'testLightWeightMapHasValue0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        expect(lightWeightMap.hasValue(123)).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_HASVALUE_0200
     * @tc.name      : testLightWeightMapHasValue0002
     * @tc.desc      : Testing LightWeightMap has not existed value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapHasValue0002', 0, () => {
      const TAG = 'testLightWeightMapHasValue0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        expect(lightWeightMap.hasValue(124)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_HASVALUE_0300
     * @tc.name      : testLightWeightMapHasValue0003
     * @tc.desc      : Testing LightWeightMap has existed value with blank
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapHasValue0003', 0, () => {
      const TAG = 'testLightWeightMapHasValue0003';
      try {
        let lightWeightMap: LightWeightMap<string, string> = new LightWeightMap();
        lightWeightMap.set('squirrel', 'sparrow');
        expect(lightWeightMap.hasValue(' sparrow ')).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_HASVALUE_0400
     * @tc.name      : testLightWeightMapHasValue0004
     * @tc.desc      : Testing LightWeightMap has null or undefined value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapHasValue0004', 0, () => {
      const TAG = 'testLightWeightMapHasValue0004';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        expect(lightWeightMap.hasValue(null)).assertFalse();
        expect(lightWeightMap.hasValue(undefined)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_HASVALUE_0500
     * @tc.name      : testLightWeightMapHasValue0005
     * @tc.desc      : Testing LightWeightMap has complex value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapHasValue0005', 0, () => {
      const TAG = 'testLightWeightMapHasValue0005';

      interface ComplexValue {
        name: string;
        gender: string;
        age: number;
      }

      const value: ComplexValue = {
        name: 'squirrel',
        gender: 'male',
        age: 30,
      };
      try {
        let lightWeightMap: LightWeightMap<string, ComplexValue> = new LightWeightMap();
        lightWeightMap.set('key', value);
        expect(lightWeightMap.hasValue(value)).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_HASVALUE_0600
     * @tc.name      : testLightWeightMapHasValue0006
     * @tc.desc      : Testing LightWeightMap has large string value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapHasValue0006', 0, () => {
      const TAG = 'testLightWeightMapHasValue0006';
      const value: string = Array(10000).map((_: undefined, index) => `${index}`).join('');
      try {
        let lightWeightMap: LightWeightMap<string, string> = new LightWeightMap();
        lightWeightMap.set('key', value);
        expect(lightWeightMap.hasValue(value)).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_INCREASECAPACITYTO_0100
     * @tc.name      : testLightWeightMapIncreaseCapacityTo0001
     * @tc.desc      : Testing LightWeightMap capacity
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapIncreaseCapacityTo0001', 0, () => {
      const TAG = 'testLightWeightMapIncreaseCapacityTo0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.increaseCapacityTo(10);
        expect(lightWeightMap.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_INCREASECAPACITYTO_0200
     * @tc.name      : testLightWeightMapIncreaseCapacityTo0002
     * @tc.desc      : Testing LightWeightMap capacity to 0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapIncreaseCapacityTo0002', 0, () => {
      const TAG = 'testLightWeightMapIncreaseCapacityTo0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.increaseCapacityTo(0);
        expect(lightWeightMap.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_INCREASECAPACITYTO_0300
     * @tc.name      : testLightWeightMapIncreaseCapacityTo0003
     * @tc.desc      : Testing LightWeightMap capacity to negative number
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapIncreaseCapacityTo0003', 0, () => {
      const TAG = 'testLightWeightMapIncreaseCapacityTo0003';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.increaseCapacityTo(-1);
        expect(lightWeightMap.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_INCREASECAPACITYTO_0400
     * @tc.name      : testLightWeightMapIncreaseCapacityTo0004
     * @tc.desc      : Testing LightWeightMap capacity to large number
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapIncreaseCapacityTo0004', 0, () => {
      const TAG = 'testLightWeightMapIncreaseCapacityTo0004';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.increaseCapacityTo(1e33);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_INCREASECAPACITYTO_0500
     * @tc.name      : testLightWeightMapIncreaseCapacityTo0005
     * @tc.desc      : Testing LightWeightMap capacity to null or undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapIncreaseCapacityTo0005', 0, () => {
      const TAG = 'testLightWeightMapIncreaseCapacityTo0005';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.increaseCapacityTo(null);
        lightWeightMap.increaseCapacityTo(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GET_0100
     * @tc.name      : testLightWeightMapGet0001
     * @tc.desc      : Testing LightWeightMap get value by key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapGet0001', 0, () => {
      const TAG = 'testLightWeightMapGet0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        expect(lightWeightMap.get("sparrow")).assertEqual(356);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GET_0200
     * @tc.name      : testLightWeightMapGet0002
     * @tc.desc      : Testing LightWeightMap get value by not existed key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapGet0002', 0, () => {
      const TAG = 'testLightWeightMapGet0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        expect(lightWeightMap.get("sparrow")).assertUndefined();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GET_0300
     * @tc.name      : testLightWeightMapGet0003
     * @tc.desc      : Testing LightWeightMap get value by existed key with blank
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapGet0003', 0, () => {
      const TAG = 'testLightWeightMapGet0003';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        expect(lightWeightMap.get(" squirrel ")).assertUndefined();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GET_0400
     * @tc.name      : testLightWeightMapGet0004
     * @tc.desc      : Testing LightWeightMap get value by null or undefined key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapGet0004', 0, () => {
      const TAG = 'testLightWeightMapGet0004';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        expect(lightWeightMap.get(null)).assertUndefined();
        expect(lightWeightMap.get(undefined)).assertUndefined();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GET_0500
     * @tc.name      : testLightWeightMapGet0005
     * @tc.desc      : Testing LightWeightMap get complex value by key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapGet0005', 0, () => {
      const TAG = 'testLightWeightMapGet0005';

      interface ComplexValue {
        name: string;
        gender: string;
        age: number;
      }

      const value: ComplexValue = {
        name: 'squirrel',
        gender: 'male',
        age: 30,
      };
      try {
        let lightWeightMap: LightWeightMap<string, ComplexValue> = new LightWeightMap();
        lightWeightMap.set("squirrel", value);
        expect(lightWeightMap.get("squirrel")).assertEqual(value);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GET_0600
     * @tc.name      : testLightWeightMapGet0006
     * @tc.desc      : Testing LightWeightMap get large string value by key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapGet0006', 0, () => {
      const TAG = 'testLightWeightMapGet0006';
      const value: string = Array(10000).map((_: undefined, index) => `${index}`).join('');
      try {
        let lightWeightMap: LightWeightMap<string, string> = new LightWeightMap();
        lightWeightMap.set("squirrel", value);
        expect(lightWeightMap.get("squirrel")).assertEqual(value);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GET_0700
     * @tc.name      : testLightWeightMapGet0007
     * @tc.desc      : Testing LightWeightMap get value by complex key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapGet0007', 0, () => {
      const TAG = 'testLightWeightMapGet0007';

      interface ComplexKey {
        name: string;
        gender: string;
        age: number;
      }

      const key: ComplexKey = {
        name: 'squirrel',
        gender: 'male',
        age: 30,
      };
      try {
        let lightWeightMap: LightWeightMap<ComplexKey, number> = new LightWeightMap();
        lightWeightMap.set(key, 123);
        expect(lightWeightMap.get(key)).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GET_0800
     * @tc.name      : testLightWeightMapGet0008
     * @tc.desc      : Testing LightWeightMap get value by large string key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapGet0008', 0, () => {
      const TAG = 'testLightWeightMapGet0008';
      const key: string = Array(10000).map((_: undefined, index) => `${index}`).join('');
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set(key, 123);
        expect(lightWeightMap.get(key)).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GET_0900
     * @tc.name      : testLightWeightMapGet0009
     * @tc.desc      : Testing LightWeightMap get value by special string key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapGet0009', 0, () => {
      const TAG = 'testLightWeightMapGet0009';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set('鸿蒙', 123);
        expect(lightWeightMap.get('鸿蒙')).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GET_1000
     * @tc.name      : testLightWeightMapGet0010
     * @tc.desc      : Testing LightWeightMap set difference value by same key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapGet0010', 0, () => {
      const TAG = 'testLightWeightMapGet0010';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("squirrel", 456);
        expect(lightWeightMap.get("squirrel")).assertEqual(456);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GET_1100
     * @tc.name      : testLightWeightMapGet0011
     * @tc.desc      : Testing LightWeightMap set key with empty string
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapGet0011', 0, () => {
      const TAG = 'testLightWeightMapGet0011';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set('', 123);
        expect(lightWeightMap.get('')).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GETINDEXOFKEY_0100
     * @tc.name      : testLightWeightMapGetIndexOfKey0001
     * @tc.desc      : Testing LightWeightMap set difference length string key and get index by key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapGetIndexOfKey0001', 0, () => {
      const TAG = 'testLightWeightMapGetIndexOfKey0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("a", 123);
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("b", 356);
        lightWeightMap.set("sparrow", 123);
        lightWeightMap.set("g", 4356);
        lightWeightMap.forEach((value: number, key: string) => {
          console.log(`${TAG}, key=${key}, vaue=${value}`);
        });
        expect(lightWeightMap.getIndexOfKey("squirrel") !== -1).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GETINDEXOFKEY_0200
     * @tc.name      : testLightWeightMapGetIndexOfKey0002
     * @tc.desc      : Testing LightWeightMap get index by not existed key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapGetIndexOfKey0002', 0, () => {
      const TAG = 'testLightWeightMapGetIndexOfKey0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        expect(lightWeightMap.getIndexOfKey("a")).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GETINDEXOFKEY_0300
     * @tc.name      : testLightWeightMapGetIndexOfKey0003
     * @tc.desc      : Testing LightWeightMap get index by complex key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapGetIndexOfKey0003', 0, () => {
      const TAG = 'testLightWeightMapGetIndexOfKey0003';

      interface ComplexKey {
        name: string;
        gender: string;
        age: number;
      }

      const key: ComplexKey = {
        name: 'squirrel',
        gender: 'male',
        age: 30,
      };
      try {
        let lightWeightMap: LightWeightMap<ComplexKey, number> = new LightWeightMap();
        lightWeightMap.set(key, 123);
        expect(lightWeightMap.getIndexOfKey(key) !== -1).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GETINDEXOFKEY_0400
     * @tc.name      : testLightWeightMapGetIndexOfKey0004
     * @tc.desc      : Testing LightWeightMap get index by null or undefined key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapGetIndexOfKey0004', 0, () => {
      const TAG = 'testLightWeightMapGetIndexOfKey0004';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        expect(lightWeightMap.getIndexOfKey(null)).assertEqual(-1);
        expect(lightWeightMap.getIndexOfKey(undefined)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GETINDEXOFKEY_0500
     * @tc.name      : testLightWeightMapGetIndexOfKey0005
     * @tc.desc      : Testing LightWeightMap get index by key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapGetIndexOfKey0005', 0, () => {
      const TAG = 'testLightWeightMapGetIndexOfKey0005';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        expect(lightWeightMap.getIndexOfKey("sparrow") !== -1).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GETINDEXOFVALUE_0100
     * @tc.name      : testLightWeightMapGetIndexOfValue0001
     * @tc.desc      : Testing LightWeightMap set difference length string key and get index by value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapGetIndexOfValue0001', 0, () => {
      const TAG = 'testLightWeightMapGetIndexOfValue0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("a", 100);
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("b", 356);
        lightWeightMap.set("sparrow", 123);
        lightWeightMap.set("g", 456);
        lightWeightMap.forEach((value: number, key: string) => {
          console.log(`${TAG} key=${key}, vaue=${value}`);
        });
        expect(lightWeightMap.getIndexOfValue(123) !== -1).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GETINDEXOFVALUE_0200
     * @tc.name      : testLightWeightMapGetIndexOfValue0002
     * @tc.desc      : Testing LightWeightMap get index by null or undefined value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapGetIndexOfValue0002', 0, () => {
      const TAG = 'testLightWeightMapGetIndexOfValue0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        expect(lightWeightMap.getIndexOfValue(null)).assertEqual(-1);
        expect(lightWeightMap.getIndexOfValue(undefined)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GETINDEXOFVALUE_0300
     * @tc.name      : testLightWeightMapGetIndexOfValue0003
     * @tc.desc      : Testing LightWeightMap get index by not existed value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapGetIndexOfValue0003', 0, () => {
      const TAG = 'testLightWeightMapGetIndexOfValue0003';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        expect(lightWeightMap.getIndexOfValue(124)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GETINDEXOFVALUE_0400
     * @tc.name      : testLightWeightMapGetIndexOfValue0004
     * @tc.desc      : Testing LightWeightMap get index by value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapGetIndexOfValue0004', 0, () => {
      const TAG = 'testLightWeightMapGetIndexOfValue0004';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        expect(lightWeightMap.getIndexOfValue(123) !== -1).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GETKEYAT_0100
     * @tc.name      : testLightWeightMapGetKeyAt0001
     * @tc.desc      : Testing LightWeightMap get key by index
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapGetKeyAt0001', 0, () => {
      const TAG = 'testLightWeightMapGetKeyAt0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        let index = lightWeightMap.getIndexOfKey("squirrel");
        expect(index !== -1).assertTrue();
        expect(lightWeightMap.getKeyAt(index)).assertEqual("squirrel");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GETKEYAT_0200
     * @tc.name      : testLightWeightMapGetKeyAt0002
     * @tc.desc      : Testing LightWeightMap get key by null or undefined index
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapGetKeyAt0002', 0, () => {
      const TAG = 'testLightWeightMapGetKeyAt0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.getKeyAt(null);
        lightWeightMap.getKeyAt(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GETKEYAT_0300
     * @tc.name      : testLightWeightMapGetKeyAt0003
     * @tc.desc      : Testing LightWeightMap get key by outside length index
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapGetKeyAt0003', 0, () => {
      const TAG = 'testLightWeightMapGetKeyAt0003';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        lightWeightMap.getKeyAt(10);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_SETALL_0100
     * @tc.name      : testLightWeightMapSetAll0001
     * @tc.desc      : Testing LightWeightMap set data from other LightWeightMap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapSetAll0001', 0, () => {
      const TAG = 'testLightWeightMapSetAll0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        let map: LightWeightMap<string, number> = new LightWeightMap();
        map.setAll(lightWeightMap);
        expect(map.length).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_SETALL_0200
     * @tc.name      : testLightWeightMapSetAll0002
     * @tc.desc      : Testing LightWeightMap set data from other empty LightWeightMap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapSetAll0002', 0, () => {
      const TAG = 'testLightWeightMapSetAll0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.setAll(new LightWeightMap());
        expect(lightWeightMap.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_SETALL_0300
     * @tc.name      : testLightWeightMapSetAll0003
     * @tc.desc      : Testing LightWeightMap set data from null or undefined LightWeightMap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapSetAll0003', 0, () => {
      const TAG = 'testLightWeightMapSetAll0003';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.setAll(null);
        lightWeightMap.setAll(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_SET_0100
     * @tc.name      : testLightWeightMapSet0001
     * @tc.desc      : Testing LightWeightMap set string key and larger number value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapSet0001', 0, () => {
      const TAG = 'testLightWeightMapSet0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", Number.MAX_VALUE);
        expect(lightWeightMap.get("squirrel")).assertEqual(Number.MAX_VALUE);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_SET_0200
     * @tc.name      : testLightWeightMapSet0002
     * @tc.desc      : Testing LightWeightMap set large string key and number value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapSet0002', 0, () => {
      const TAG = 'testLightWeightMapSet0002';
      const key: string = Array(10000).map((_: undefined, index) => `${index}`).join('');
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set(key, 123);
        expect(lightWeightMap.get(key)).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_SET_0300
     * @tc.name      : testLightWeightMapSet0003
     * @tc.desc      : Testing LightWeightMap set string key and null or undefined value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapSet0003', 0, () => {
      const TAG = 'testLightWeightMapSet0003';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", null);
        expect(lightWeightMap.get("squirrel")).assertNull();
        lightWeightMap.set("squirrel", undefined);
        expect(lightWeightMap.get("squirrel")).assertUndefined();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_SET_0400
     * @tc.name      : testLightWeightMapSet0004
     * @tc.desc      : Testing LightWeightMap set key and value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapSet0004', 0, () => {
      const TAG = 'testLightWeightMapSet0004';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        expect(lightWeightMap.get("squirrel")).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_REMOVE_0100
     * @tc.name      : testLightWeightMapRemove0001
     * @tc.desc      : Testing LightWeightMap remove data by key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapRemove0001', 0, () => {
      const TAG = 'testLightWeightMapRemove0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        expect(lightWeightMap.remove("sparrow")).assertEqual(356);
        expect(lightWeightMap.hasKey("sparrow")).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_REMOVE_0200
     * @tc.name      : testLightWeightMapRemove0002
     * @tc.desc      : Testing LightWeightMap remove data by null or undefined key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapRemove0002', 0, () => {
      const TAG = 'testLightWeightMapRemove0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        expect(lightWeightMap.remove(null)).assertUndefined();
        expect(lightWeightMap.remove(undefined)).assertUndefined();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_REMOVE_0300
     * @tc.name      : testLightWeightMapRemove0003
     * @tc.desc      : Testing LightWeightMap remove data by not existed key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapRemove0003', 0, () => {
      const TAG = 'testLightWeightMapRemove0003';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        expect(lightWeightMap.remove("sparrow")).assertUndefined();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_REMOVE_0400
     * @tc.name      : testLightWeightMapRemove0004
     * @tc.desc      : Testing LightWeightMap remove data by large string key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapRemove0004', 0, () => {
      const TAG = 'testLightWeightMapRemove0004';
      const key: string = Array(10000).map((_: undefined, index) => `${index}`).join('');
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set(key, 123);
        expect(lightWeightMap.remove(key)).assertEqual(123);
        expect(lightWeightMap.hasKey(key)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_REMOVE_0500
     * @tc.name      : testLightWeightMapRemove0005
     * @tc.desc      : Testing LightWeightMap remove data by large number key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapRemove0005', 0, () => {
      const TAG = 'testLightWeightMapRemove0005';
      try {
        let lightWeightMap: LightWeightMap<number, string> = new LightWeightMap();
        lightWeightMap.set(Number.MAX_VALUE, "squirrel");
        expect(lightWeightMap.remove(Number.MAX_VALUE)).assertEqual("squirrel");
        expect(lightWeightMap.hasKey(Number.MAX_VALUE)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_REMOVEAT_0100
     * @tc.name      : testLightWeightMapRemoveAt0001
     * @tc.desc      : Testing LightWeightMap remove data by index
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapRemoveAt0001', 0, () => {
      const TAG = 'testLightWeightMapRemoveAt0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        let index = lightWeightMap.getIndexOfKey("squirrel");
        expect(index !== -1).assertTrue();
        expect(lightWeightMap.removeAt(index)).assertTrue();
        expect(lightWeightMap.hasKey("squirrel")).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_REMOVEAT_0200
     * @tc.name      : testLightWeightMapRemoveAt0002
     * @tc.desc      : Testing LightWeightMap remove data by negative number index
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapRemoveAt0002', 0, () => {
      const TAG = 'testLightWeightMapRemoveAt0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        expect(lightWeightMap.removeAt(-1)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_REMOVEAT_0300
     * @tc.name      : testLightWeightMapRemoveAt0003
     * @tc.desc      : Testing LightWeightMap remove data by outside length index
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapRemoveAt0003', 0, () => {
      const TAG = 'testLightWeightMapRemoveAt0003';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        expect(lightWeightMap.removeAt(10)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_SETVALUEAT_0100
     * @tc.name      : testLightWeightMapSetValueAt0001
     * @tc.desc      : Testing LightWeightMap set value by index
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapSetValueAt0001', 0, () => {
      const TAG = 'testLightWeightMapSetValueAt0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        let index = lightWeightMap.getIndexOfKey("squirrel");
        expect(index !== -1).assertTrue();
        expect(lightWeightMap.setValueAt(index, 3546)).assertTrue();
        expect(lightWeightMap.getValueAt(index)).assertEqual(3546);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_SETVALUEAT_0200
     * @tc.name      : testLightWeightMapSetValueAt0002
     * @tc.desc      : Testing LightWeightMap set null or undefined value by index
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapSetValueAt0002', 0, () => {
      const TAG = 'testLightWeightMapSetValueAt0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        expect(lightWeightMap.setValueAt(0, null)).assertTrue();
        expect(lightWeightMap.setValueAt(0, undefined)).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_SETVALUEAT_0300
     * @tc.name      : testLightWeightMapSetValueAt0003
     * @tc.desc      : Testing LightWeightMap set value by negative number index
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapSetValueAt0003', 0, () => {
      const TAG = 'testLightWeightMapSetValueAt0003';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.setValueAt(-1, 356);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_SETVALUEAT_0400
     * @tc.name      : testLightWeightMapSetValueAt0004
     * @tc.desc      : Testing LightWeightMap set value by null or undefined index
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapSetValueAt0004', 0, () => {
      const TAG = 'testLightWeightMapSetValueAt0004';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.setValueAt(null, 356);
        lightWeightMap.setValueAt(undefined, 356);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_SETVALUEAT_0500
     * @tc.name      : testLightWeightMapSetValueAt0005
     * @tc.desc      : Testing LightWeightMap set large number value by index
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapSetValueAt0005', 0, () => {
      const TAG = 'testLightWeightMapSetValueAt0005';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        expect(lightWeightMap.setValueAt(0, Number.MAX_VALUE)).assertTrue();
        expect(lightWeightMap.getValueAt(0)).assertEqual(Number.MAX_VALUE);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_SETVALUEAT_0600
     * @tc.name      : testLightWeightMapSetValueAt0006
     * @tc.desc      : Testing LightWeightMap set large string value by index
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapSetValueAt0006', 0, () => {
      const TAG = 'testLightWeightMapSetValueAt0006';
      const value: string = Array(10000).map((_: undefined, index) => `${index}`).join('');
      try {
        let lightWeightMap: LightWeightMap<string, string> = new LightWeightMap();
        lightWeightMap.set("squirrel", "sparrow");
        expect(lightWeightMap.setValueAt(0, value)).assertTrue();
        expect(lightWeightMap.getValueAt(0)).assertEqual(value);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GETVALUEAT_0100
     * @tc.name      : testLightWeightMapGetValueAt0001
     * @tc.desc      : Testing LightWeightMap get value by index
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapGetValueAt0001', 0, () => {
      const TAG = 'testLightWeightMapGetValueAt0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        let index = lightWeightMap.getIndexOfKey("squirrel");
        expect(index !== -1).assertTrue();
        expect(lightWeightMap.getValueAt(index)).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GETVALUEAT_0200
     * @tc.name      : testLightWeightMapGetValueAt0002
     * @tc.desc      : Testing LightWeightMap get value by null or undefined index
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapGetValueAt0002', 0, () => {
      const TAG = 'testLightWeightMapGetValueAt0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        lightWeightMap.getValueAt(null);
        lightWeightMap.getValueAt(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GETVALUEAT_0300
     * @tc.name      : testLightWeightMapGetValueAt0003
     * @tc.desc      : Testing LightWeightMap get value by outside length index
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapGetValueAt0003', 0, () => {
      const TAG = 'testLightWeightMapGetValueAt0003';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        lightWeightMap.getValueAt(10);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_CLEAR_0100
     * @tc.name      : testLightWeightMapClear0001
     * @tc.desc      : Testing LightWeightMap clear data
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapClear0001', 0, () => {
      const TAG = 'testLightWeightMapClear0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        lightWeightMap.clear();
        expect(lightWeightMap.isEmpty()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_CLEAR_0200
     * @tc.name      : testLightWeightMapClear0002
     * @tc.desc      : Testing LightWeightMap add data after clear data
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapClear0002', 0, () => {
      const TAG = 'testLightWeightMapClear0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.clear();
        lightWeightMap.set("a", 123);
        lightWeightMap.set("b", 356);
        expect(lightWeightMap.length).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_CLEAR_0300
     * @tc.name      : testLightWeightMapClear0003
     * @tc.desc      : Testing LightWeightMap clear data for a empty LightWeightMap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapClear0003', 0, () => {
      const TAG = 'testLightWeightMapClear0003';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.clear();
        expect(lightWeightMap.isEmpty()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_KEYS_0100
     * @tc.name      : testLightWeightMapKeys0001
     * @tc.desc      : Testing LightWeightMap get all key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapKeys0001', 0, () => {
      const TAG = 'testLightWeightMapKeys0001';
      let arr: Array<string> = [];
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        let iter: IterableIterator<string> = lightWeightMap.keys();
        let temp: IteratorResult<string> = iter.next();
        while (!temp.done) {
          console.log(`${TAG} key: ${temp.value}`);
          arr.push(temp.value);
          temp = iter.next();
        }
        expect(arr.sort()).assertDeepEquals(["sparrow", "squirrel"]);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_KEYS_0200
     * @tc.name      : testLightWeightMapKeys0002
     * @tc.desc      : Testing LightWeightMap get all key for an empty LightWeightMap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapKeys0002', 0, () => {
      const TAG = 'testLightWeightMapKeys0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        let iter: IterableIterator<string> = lightWeightMap.keys();
        let temp: IteratorResult<string> = iter.next();
        expect(temp.done).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_KEYS_0300
     * @tc.name      : testLightWeightMapKeys0003
     * @tc.desc      : Testing LightWeightMap get all key for a LightWeightMap contain large string key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapKeys0003', 0, () => {
      const TAG = 'testLightWeightMapKeys0003';
      const key: string = Array(10000).map((_: undefined, index) => `${index}`).join('');
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set(key, 123);
        let iter: IterableIterator<string> = lightWeightMap.keys();
        let temp: IteratorResult<string> = iter.next();
        expect(temp.done).assertFalse();
        expect(temp.value).assertEqual(key);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_VALUES_0100
     * @tc.name      : testLightWeightMapValues0001
     * @tc.desc      : Testing LightWeightMap get all value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapValues0001', 0, () => {
      const TAG = 'testLightWeightMapValues0001';
      let arr: Array<number> = [];
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        let iter: IterableIterator<number> = lightWeightMap.values();
        let temp: IteratorResult<number> = iter.next();
        while (!temp.done) {
          console.log(`${TAG} value: ${temp.value}`);
          arr.push(temp.value);
          temp = iter.next();
        }
        expect(arr.sort()).assertDeepEquals([123, 356]);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_VALUES_0200
     * @tc.name      : testLightWeightMapValues0002
     * @tc.desc      : Testing LightWeightMap get all value for an empty LightWeightMap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapValues0002', 0, () => {
      const TAG = 'testLightWeightMapValues0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        let iter: IterableIterator<number> = lightWeightMap.values();
        let temp: IteratorResult<number> = iter.next();
        expect(temp.done).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_VALUES_0300
     * @tc.name      : testLightWeightMapValues0003
     * @tc.desc      : Testing LightWeightMap get all value for a LightWeightMap contain large string value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapValues0003', 0, () => {
      const TAG = 'testLightWeightMapValues0003';
      const value: string = Array(10000).map((_: undefined, index) => `${index}`).join('');
      try {
        let lightWeightMap: LightWeightMap<string, string> = new LightWeightMap();
        lightWeightMap.set("squirrel", value);
        let iter: IterableIterator<string> = lightWeightMap.values();
        let temp: IteratorResult<string> = iter.next();
        expect(temp.done).assertFalse();
        expect(temp.value).assertEqual(value);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_FOREACH_0100
     * @tc.name      : testLightWeightMapForeach0001
     * @tc.desc      : Testing LightWeightMap use forEach and remove function
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapForeach0001', 0, () => {
      const TAG = 'testLightWeightMapForeach0001';
      try {
        let lightWeightMap: LightWeightMap<number, number> = new LightWeightMap();
        for (let i = 0; i < 10; i++) {
          lightWeightMap.set(i, 100 + i);
        }
        lightWeightMap.forEach((value: number, key: number) => {
          expect(lightWeightMap.remove(key)).assertEqual(value);
        });
        console.log(`${TAG}, length: ${lightWeightMap.length}`);
        lightWeightMap.forEach((value: number, key: number) => {
          console.log(`${TAG}, key: ${key}, value: ${value}`);
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_FOREACH_0200
     * @tc.name      : testLightWeightMapForeach0002
     * @tc.desc      : Testing LightWeightMap use forEach to iterate over each item
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapForeach0002', 0, () => {
      const TAG = 'testLightWeightMapForeach0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("sparrow", 123);
        lightWeightMap.set("gull", 357);
        lightWeightMap.forEach((value: number, key: string) => {
          if (key === "sparrow") {
            expect(value).assertEqual(123);
          } else if (key === "gull") {
            expect(value).assertEqual(357);
          } else {
            console.error(`${TAG}, unknown key: ${key}, unknown value: ${value}`);
            expect().assertFail();
          }
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_FOREACH_0300
     * @tc.name      : testLightWeightMapForeach0003
     * @tc.desc      : Testing LightWeightMap use forEach to iterate over each item for a LightWeightMap contain duplicate value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapForeach0003', 0, () => {
      const TAG = 'testLightWeightMapForeach0003';
      const VALUE = 100;
      try {
        let lightWeightMap: LightWeightMap<number, number> = new LightWeightMap();
        for (let i = 0; i < 10; i++) {
          lightWeightMap.set(i, VALUE);
        }
        expect(lightWeightMap.length).assertEqual(10);
        lightWeightMap.forEach((value: number) => {
          expect(value).assertEqual(VALUE);
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_FOREACH_0400
     * @tc.name      : testLightWeightMapForeach0004
     * @tc.desc      : Testing LightWeightMap use forEach to iterate over each item for an empty LightWeightMap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapForeach0004', 0, () => {
      const TAG = 'testLightWeightMapForeach0004';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        let tmp = 0;
        lightWeightMap.forEach(() => tmp++);
        expect(tmp).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_ENTRIES_0100
     * @tc.name      : testLightWeightMapEntries0001
     * @tc.desc      : Testing LightWeightMap use entries and remove function
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapEntries0001', 0, () => {
      const TAG = 'testLightWeightMapEntries0001';
      try {
        let lightWeightMap: LightWeightMap<number, string> = new LightWeightMap();
        for (let i = 0; i < 10; i++) {
          lightWeightMap.set(i, `${i}`);
        }
        let iter: IterableIterator<[number, string]> = lightWeightMap.entries();
        let temp: IteratorResult<[number, string]> = iter.next();
        while (!temp.done) {
          expect(lightWeightMap.remove(temp.value[0])).assertEqual(temp.value[1]);
          temp = iter.next();
        }
        console.log(`${TAG}, length: ${lightWeightMap.length}`);
        iter = lightWeightMap.entries();
        temp = iter.next();
        while (!temp.done) {
          console.log(`${TAG}, key: ${temp.value[0]}, value: ${temp.value[1]}`);
          temp = iter.next();
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_ENTRIES_0200
     * @tc.name      : testLightWeightMapEntries0002
     * @tc.desc      : Testing LightWeightMap use entries to iterate over each item
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapEntries0002', 0, () => {
      const TAG = 'testLightWeightMapEntries0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        let iter: IterableIterator<[string, number]> = lightWeightMap.entries();
        let temp: IteratorResult<[string, number]> = iter.next();
        while (!temp.done) {
          if (temp.value[0] === "squirrel") {
            expect(temp.value[1]).assertEqual(123);
          } else if (temp.value[0] === "sparrow") {
            expect(temp.value[1]).assertEqual(356);
          } else {
            console.error(`${TAG} failed, unknown key: ${temp.value[0]}, unknown value: ${temp.value[1]}`);
            expect().assertFail();
          }
          temp = iter.next();
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_ENTRIES_0300
     * @tc.name      : testLightWeightMapEntries0003
     * @tc.desc      : Testing LightWeightMap use entries to iterate over each item for a LightWeightMap contain duplicate value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapEntries0003', 0, () => {
      const TAG = 'testLightWeightMapEntries0003';
      const VALUE = 100;
      try {
        let lightWeightMap: LightWeightMap<number, number> = new LightWeightMap();
        for (let i = 0; i < 10; i++) {
          lightWeightMap.set(i, VALUE);
        }
        expect(lightWeightMap.length).assertEqual(10);
        let iter: IterableIterator<[number, number]> = lightWeightMap.entries();
        let temp: IteratorResult<[number, number]> = iter.next();
        while (!temp.done) {
          expect(temp.value[0]).assertLess(10);
          expect(temp.value[1]).assertEqual(VALUE);
          temp = iter.next();
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_ENTRIES_0400
     * @tc.name      : testLightWeightMapEntries0004
     * @tc.desc      : Testing LightWeightMap use entries to iterate over each item for an empty LightWeightMap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapEntries0004', 0, () => {
      const TAG = 'testLightWeightMapEntries0004';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        let iter: IterableIterator<[string, number]> = lightWeightMap.entries();
        let temp: IteratorResult<[string, number]> = iter.next();
        expect(temp.done).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_TOSTRING_0100
     * @tc.name      : testLightWeightMapToString0001
     * @tc.desc      : Testing LightWeightMap convert to string
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapToString0001', 0, () => {
      const TAG = 'testLightWeightMapToString0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        expect(lightWeightMap.toString()).assertEqual('sparrow:356,squirrel:123');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_TOSTRING_0200
     * @tc.name      : testLightWeightMapToString0002
     * @tc.desc      : Testing LightWeightMap convert to string for an empty LightWeightMap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapToString0002', 0, () => {
      const TAG = 'testLightWeightMapToString0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        expect(lightWeightMap.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_TOSTRING_0300
     * @tc.name      : testLightWeightMapToString0003
     * @tc.desc      : Testing LightWeightMap convert to string for a LightWeightMap contain duplicate value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapToString0003', 0, () => {
      const TAG = 'testLightWeightMapToString0003';
      const VALUE = 'VALUE';
      try {
        let lightWeightMap: LightWeightMap<number, string> = new LightWeightMap();
        for (let i = 0; i < 5; i++) {
          lightWeightMap.set(i, VALUE);
        }
        expect(lightWeightMap.toString()).assertEqual('0:VALUE,1:VALUE,2:VALUE,3:VALUE,4:VALUE');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_SYMBOLITERATOR_0100
     * @tc.name      : testLightWeightMapSymbolIterator0001
     * @tc.desc      : Testing LightWeightMap use [Symbol.iterator] and remove function
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapSymbolIterator0001', 0, () => {
      const TAG = 'testLightWeightMapSymbolIterator0001';
      try {
        let lightWeightMap: LightWeightMap<number, string> = new LightWeightMap();
        for (let i = 0; i < 10; i++) {
          lightWeightMap.set(i, `${i}`);
        }
        let iter: IterableIterator<[number, string]> = lightWeightMap[Symbol.iterator]();
        let temp: IteratorResult<[number, string]> = iter.next();
        while (!temp.done) {
          expect(lightWeightMap.remove(temp.value[0])).assertEqual(temp.value[1]);
          temp = iter.next();
        }
        console.log(`${TAG}, length: ${lightWeightMap.length}`);
        iter = lightWeightMap[Symbol.iterator]();
        temp = iter.next();
        while (!temp.done) {
          console.log(`${TAG}, key: ${temp.value[0]}, value: ${temp.value[1]}`);
          temp = iter.next();
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_SYMBOLITERATOR_0200
     * @tc.name      : testLightWeightMapSymbolIterator0002
     * @tc.desc      : Testing LightWeightMap use [Symbol.iterator] to iterate over each item
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapSymbolIterator0002', 0, () => {
      const TAG = 'testLightWeightMapSymbolIterator0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        let iter = lightWeightMap[Symbol.iterator]();
        let temp: IteratorResult<[string, number]> = iter.next();
        while (!temp.done) {
          if (temp.value[0] === "squirrel") {
            expect(temp.value[1]).assertEqual(123);
          } else if (temp.value[0] === "sparrow") {
            expect(temp.value[1]).assertEqual(356);
          } else {
            console.error(`${TAG} failed, unknown key: ${temp.value[0]}, unknown value: ${temp.value[1]}`);
            expect().assertFail();
          }
          temp = iter.next();
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_SYMBOLITERATOR_0300
     * @tc.name      : testLightWeightMapSymbolIterator0003
     * @tc.desc      : Testing LightWeightMap use [Symbol.iterator] to iterate over each item for a LightWeightMap contain duplicate value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapSymbolIterator0003', 0, () => {
      const TAG = 'testLightWeightMapSymbolIterator0003';
      const VALUE = 'VALUE';
      try {
        let lightWeightMap: LightWeightMap<number, string> = new LightWeightMap();
        for (let i = 0; i < 10; i++) {
          lightWeightMap.set(i, VALUE);
        }
        let iter: IterableIterator<[number, string]> = lightWeightMap[Symbol.iterator]();
        let temp: IteratorResult<[number, string]> = iter.next();
        while (!temp.done) {
          expect(temp.value[0]).assertLess(10);
          expect(temp.value[1]).assertEqual(VALUE);
          temp = iter.next();
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_SYMBOLITERATOR_0400
     * @tc.name      : testLightWeightMapSymbolIterator0004
     * @tc.desc      : Testing LightWeightMap use [Symbol.iterator] to iterate over each item for an empty LightWeightMap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLightWeightMapSymbolIterator0004', 0, () => {
      const TAG = 'testLightWeightMapSymbolIterator0004';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap();
        let iter = lightWeightMap[Symbol.iterator]();
        let temp: IteratorResult<[string, number]> = iter.next();
        expect(temp.done).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
  });
}