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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  TestType,
  Level,
  Size
} from '../../../../hypium/index';
import LightWeightMap from '@ohos.util.LightWeightMap';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import Utils from '../Util.test';

interface ComplexValue {
  name: string;
  gender: string;
  age: number;
}

interface ComplexKey {
  name: string;
  gender: string;
  age: number;
}

export default function LightWeightMapTest2() {
  describe('lightWeightMapTest2', (): void => {
    afterEach(() => {
      await Utils.msSleep(10)
    })
    /**
     * @tc.name   testLightWeightMapConstructor0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_CONSTRUCTOR_0100
     * @tc.desc   Testing LightWeightMap constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapConstructor0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        expect(!!lightWeightMap).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapIsEmpty0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_ISEMPTY_0100
     * @tc.desc   Testing LightWeightMap is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapIsEmpty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapIsEmpty0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        expect(lightWeightMap.isEmpty()).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapIsEmpty0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_ISEMPTY_0200
     * @tc.desc   Testing LightWeightMap has data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapIsEmpty0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapIsEmpty0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        expect(lightWeightMap.isEmpty()).assertFalse();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapIsEmpty0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_ISEMPTY_0300
     * @tc.desc   Testing LightWeightMap has data and remove
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapIsEmpty0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapIsEmpty0003';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.remove("squirrel");
        expect(lightWeightMap.isEmpty()).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapHasAll0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_HASALL_0100
     * @tc.desc   Testing LightWeightMap contain other LightWeightMap data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapHasAll0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapHasAll0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        let map: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        map.set("sparrow", 356);
        expect(lightWeightMap.hasAll(map)).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapHasKey0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_HASKEY_0100
     * @tc.desc   Testing LightWeightMap has key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapHasKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapHasKey0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        expect(lightWeightMap.hasKey("squirrel")).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapHasKey0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_HASKEY_0200
     * @tc.desc   Testing LightWeightMap has not existed key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapHasKey0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapHasKey0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        expect(lightWeightMap.hasKey('sparrow')).assertFalse();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapHasKey0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_HASKEY_0300
     * @tc.desc   Testing LightWeightMap has existed key with blank
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapHasKey0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapHasKey0003';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        expect(lightWeightMap.hasKey(' squirrel ')).assertFalse();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapHasValue0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_HASVALUE_0100
     * @tc.desc   Testing LightWeightMap has value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapHasValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapHasValue0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        expect(lightWeightMap.hasValue(123)).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapHasValue0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_HASVALUE_0200
     * @tc.desc   Testing LightWeightMap has not existed value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapHasValue0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapHasValue0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        expect(lightWeightMap.hasValue(124)).assertFalse();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapHasValue0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_HASVALUE_0300
     * @tc.desc   Testing LightWeightMap has existed value with blank
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapHasValue0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapHasValue0003';
      try {
        let lightWeightMap: LightWeightMap<string, string> = new LightWeightMap<string, string>();
        lightWeightMap.set('squirrel', 'sparrow');
        expect(lightWeightMap.hasValue(' sparrow ')).assertFalse();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapHasValue0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_HASVALUE_0500
     * @tc.desc   Testing LightWeightMap has complex value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapHasValue0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapHasValue0005';
      const value: ComplexValue = {
        name: 'squirrel',
        gender: 'male',
        age: 30,
      };
      try {
        let lightWeightMap: LightWeightMap<string, ComplexValue> = new LightWeightMap<string, ComplexValue>();
        lightWeightMap.set('key', value);
        expect(lightWeightMap.hasValue(value)).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapHasValue0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_HASVALUE_0600
     * @tc.desc   Testing LightWeightMap has large string value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapHasValue0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapHasValue0006';
      const value: string = Array(10000).map((_: undefined, index): String => `${index}`).join('');
      try {
        let lightWeightMap: LightWeightMap<string, string> = new LightWeightMap<string, string>();
        lightWeightMap.set('key', value);
        expect(lightWeightMap.hasValue(value)).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapIncreaseCapacityTo0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_INCREASECAPACITYTO_0100
     * @tc.desc   Testing LightWeightMap capacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapIncreaseCapacityTo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapIncreaseCapacityTo0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.increaseCapacityTo(10);
        expect(String(lightWeightMap.length)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapIncreaseCapacityTo0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_INCREASECAPACITYTO_0200
     * @tc.desc   Testing LightWeightMap capacity to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapIncreaseCapacityTo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapIncreaseCapacityTo0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.increaseCapacityTo(0);
        expect(String(lightWeightMap.length)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapIncreaseCapacityTo0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_INCREASECAPACITYTO_0300
     * @tc.desc   Testing LightWeightMap capacity to negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapIncreaseCapacityTo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapIncreaseCapacityTo0003';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.increaseCapacityTo(-1);
        expect(String(lightWeightMap.length)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapGet0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GET_0100
     * @tc.desc   Testing LightWeightMap get value by key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapGet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapGet0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        expect(String(lightWeightMap.get("sparrow"))).assertEqual('356');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapGet0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GET_0200
     * @tc.desc   Testing LightWeightMap get value by not existed key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapGet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapGet0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        expect(lightWeightMap.get("sparrow")).assertUndefined();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapGet0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GET_0300
     * @tc.desc   Testing LightWeightMap get value by existed key with blank
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapGet0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapGet0003';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        expect(lightWeightMap.get(" squirrel ")).assertUndefined();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapGet0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GET_0500
     * @tc.desc   Testing LightWeightMap get complex value by key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapGet0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapGet0005';
      const value: ComplexValue = {
        name: 'squirrel',
        gender: 'male',
        age: 30,
      };
      try {
        let lightWeightMap: LightWeightMap<string, ComplexValue> = new LightWeightMap<string, ComplexValue>();
        lightWeightMap.set("squirrel", value);
        expect(JSON.stringify(lightWeightMap.get("squirrel"))).assertEqual(JSON.stringify(value));
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapGet0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GET_0600
     * @tc.desc   Testing LightWeightMap get large string value by key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapGet0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapGet0006';
      const value: string = Array(10000).map((_: undefined, index): String => `${index}`).join('');
      try {
        let lightWeightMap: LightWeightMap<string, string> = new LightWeightMap<string, string>();
        lightWeightMap.set("squirrel", value);
        expect(lightWeightMap.get("squirrel")).assertEqual(value);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapGet0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GET_0700
     * @tc.desc   Testing LightWeightMap get value by complex key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapGet0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapGet0007';
      const key: ComplexKey = {
        name: 'squirrel',
        gender: 'male',
        age: 30,
      };
      try {
        let lightWeightMap: LightWeightMap<ComplexKey, number> = new LightWeightMap<ComplexKey, number>();
        lightWeightMap.set(key, 123);
        expect(String(lightWeightMap.get(key))).assertEqual('123');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapGet0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GET_0800
     * @tc.desc   Testing LightWeightMap get value by large string key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapGet0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapGet0008';
      const key: string = Array(10000).map((_: undefined, index): String => `${index}`).join('');
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set(key, 123);
        expect(String(lightWeightMap.get(key))).assertEqual('123');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapGet0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GET_0900
     * @tc.desc   Testing LightWeightMap get value by special string key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapGet0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapGet0009';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set('鸿蒙', 123);
        expect(String(lightWeightMap.get('鸿蒙'))).assertEqual('123');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapGet0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GET_1000
     * @tc.desc   Testing LightWeightMap set difference value by same key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapGet0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapGet0010';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("squirrel", 456);
        expect(String(lightWeightMap.get("squirrel"))).assertEqual('456');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapGet0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GET_1100
     * @tc.desc   Testing LightWeightMap set key with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapGet0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapGet0011';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set('', 123);
        expect(String(lightWeightMap.get(''))).assertEqual('123');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapGetIndexOfKey0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GETINDEXOFKEY_0100
     * @tc.desc   Testing LightWeightMap set difference length string key and get index by key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapGetIndexOfKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapGetIndexOfKey0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("a", 123);
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("b", 356);
        lightWeightMap.set("sparrow", 123);
        lightWeightMap.set("g", 4356);
        lightWeightMap.forEach((value: number, key: string): void => {
          console.log(`${TAG}, key=${key}, vaue=${value}`);
        });
        expect(lightWeightMap.getIndexOfKey("squirrel") !== -1).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapGetIndexOfKey0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GETINDEXOFKEY_0200
     * @tc.desc   Testing LightWeightMap get index by not existed key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapGetIndexOfKey0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapGetIndexOfKey0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        expect(String(lightWeightMap.getIndexOfKey("a"))).assertEqual('-1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapGetIndexOfKey0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GETINDEXOFKEY_0300
     * @tc.desc   Testing LightWeightMap get index by complex key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapGetIndexOfKey0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapGetIndexOfKey0003';
      const key: ComplexKey = {
        name: 'squirrel',
        gender: 'male',
        age: 30,
      };
      try {
        let lightWeightMap: LightWeightMap<ComplexKey, number> = new LightWeightMap<ComplexKey, number>();
        lightWeightMap.set(key, 123);
        expect(lightWeightMap.getIndexOfKey(key) !== -1).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapGetIndexOfKey0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GETINDEXOFKEY_0500
     * @tc.desc   Testing LightWeightMap get index by key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapGetIndexOfKey0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapGetIndexOfKey0005';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        expect(lightWeightMap.getIndexOfKey("sparrow") !== -1).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapGetIndexOfValue0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GETINDEXOFVALUE_0100
     * @tc.desc   Testing LightWeightMap set difference length string key and get index by value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapGetIndexOfValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapGetIndexOfValue0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("a", 100);
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("b", 356);
        lightWeightMap.set("sparrow", 123);
        lightWeightMap.set("g", 456);
        lightWeightMap.forEach((value: number, key: string): void => {
          console.log(`${TAG} key=${key}, vaue=${value}`);
        });
        expect(lightWeightMap.getIndexOfValue(123) !== -1).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapGetIndexOfValue0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GETINDEXOFVALUE_0300
     * @tc.desc   Testing LightWeightMap get index by not existed value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapGetIndexOfValue0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapGetIndexOfValue0003';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        expect(String(lightWeightMap.getIndexOfValue(124))).assertEqual('-1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapGetIndexOfValue0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GETINDEXOFVALUE_0400
     * @tc.desc   Testing LightWeightMap get index by value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapGetIndexOfValue0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapGetIndexOfValue0004';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        expect(lightWeightMap.getIndexOfValue(123) !== -1).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapGetKeyAt0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GETKEYAT_0100
     * @tc.desc   Testing LightWeightMap get key by index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapGetKeyAt0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapGetKeyAt0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        let index = lightWeightMap.getIndexOfKey("squirrel");
        expect(index !== -1).assertTrue();
        expect(lightWeightMap.getKeyAt(index)).assertEqual("squirrel");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapGetKeyAt0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GETKEYAT_0300
     * @tc.desc   Testing LightWeightMap get key by outside length index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapGetKeyAt0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapGetKeyAt0003';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        lightWeightMap.getKeyAt(10);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.name   testLightWeightMapSetAll0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_SETALL_0100
     * @tc.desc   Testing LightWeightMap set data from other LightWeightMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapSetAll0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapSetAll0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        let map: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        map.setAll(lightWeightMap);
        expect(String(map.length)).assertEqual('2');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapSetAll0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_SETALL_0200
     * @tc.desc   Testing LightWeightMap set data from other empty LightWeightMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapSetAll0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapSetAll0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.setAll(new LightWeightMap<string, number>());
        expect(String(lightWeightMap.length)).assertEqual('1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapSet0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_SET_0100
     * @tc.desc   Testing LightWeightMap set string key and larger number value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapSet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapSet0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", Number.MAX_VALUE);
        expect(String(lightWeightMap.get("squirrel"))).assertEqual(String(Number.MAX_VALUE));
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapSet0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_SET_0200
     * @tc.desc   Testing LightWeightMap set large string key and number value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapSet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapSet0002';
      const key: string = Array(10000).map((_: undefined, index): String => `${index}`).join('');
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set(key, 123);
        expect(String(lightWeightMap.get(key))).assertEqual('123');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapSet0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_SET_0400
     * @tc.desc   Testing LightWeightMap set key and value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapSet0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapSet0004';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        expect(String(lightWeightMap.get("squirrel"))).assertEqual('123');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapRemove0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_REMOVE_0100
     * @tc.desc   Testing LightWeightMap remove data by key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapRemove0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapRemove0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        expect(String(lightWeightMap.remove("sparrow"))).assertEqual('356');
        expect(lightWeightMap.hasKey("sparrow")).assertFalse();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapRemove0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_REMOVE_0300
     * @tc.desc   Testing LightWeightMap remove data by not existed key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapRemove0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapRemove0003';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        expect(lightWeightMap.remove("sparrow")).assertUndefined();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapRemove0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_REMOVE_0400
     * @tc.desc   Testing LightWeightMap remove data by large string key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapRemove0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapRemove0004';
      const key: string = Array(10000).map((_: undefined, index): String => `${index}`).join('');
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set(key, 123);
        expect(String(lightWeightMap.remove(key))).assertEqual('123');
        expect(lightWeightMap.hasKey(key)).assertFalse();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapRemove0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_REMOVE_0500
     * @tc.desc   Testing LightWeightMap remove data by large number key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapRemove0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapRemove0005';
      try {
        let lightWeightMap: LightWeightMap<number, string> = new LightWeightMap<number, string>();
        lightWeightMap.set(Number.MAX_VALUE, "squirrel");
        expect(lightWeightMap.remove(Number.MAX_VALUE)).assertEqual("squirrel");
        expect(lightWeightMap.hasKey(Number.MAX_VALUE)).assertFalse();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapRemoveAt0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_REMOVEAT_0100
     * @tc.desc   Testing LightWeightMap remove data by index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapRemoveAt0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapRemoveAt0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        let index = lightWeightMap.getIndexOfKey("squirrel");
        expect(index !== -1).assertTrue();
        expect(lightWeightMap.removeAt(index)).assertTrue();
        expect(lightWeightMap.hasKey("squirrel")).assertFalse();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapRemoveAt0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_REMOVEAT_0200
     * @tc.desc   Testing LightWeightMap remove data by negative number index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapRemoveAt0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapRemoveAt0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        expect(lightWeightMap.removeAt(-1)).assertFalse();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapRemoveAt0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_REMOVEAT_0300
     * @tc.desc   Testing LightWeightMap remove data by outside length index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapRemoveAt0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapRemoveAt0003';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        expect(lightWeightMap.removeAt(10)).assertFalse();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapSetValueAt0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_SETVALUEAT_0100
     * @tc.desc   Testing LightWeightMap set value by index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapSetValueAt0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapSetValueAt0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        let index = lightWeightMap.getIndexOfKey("squirrel");
        expect(index !== -1).assertTrue();
        expect(lightWeightMap.setValueAt(index, 3546)).assertTrue();
        expect(String(lightWeightMap.getValueAt(index))).assertEqual('3546');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapSetValueAt0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_SETVALUEAT_0300
     * @tc.desc   Testing LightWeightMap set value by negative number index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapSetValueAt0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapSetValueAt0003';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.setValueAt(-1, 356);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.name   testLightWeightMapSetValueAt0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_SETVALUEAT_0500
     * @tc.desc   Testing LightWeightMap set large number value by index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapSetValueAt0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapSetValueAt0005';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        expect(lightWeightMap.setValueAt(0, Number.MAX_VALUE)).assertTrue();
        expect(String(lightWeightMap.getValueAt(0))).assertEqual(String(Number.MAX_VALUE));
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapSetValueAt0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_SETVALUEAT_0600
     * @tc.desc   Testing LightWeightMap set large string value by index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapSetValueAt0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapSetValueAt0006';
      const value: string = Array(10000).map((_: undefined, index): String => `${index}`).join('');
      try {
        let lightWeightMap: LightWeightMap<string, string> = new LightWeightMap<string, string>();
        lightWeightMap.set("squirrel", "sparrow");
        expect(lightWeightMap.setValueAt(0, value)).assertTrue();
        expect(lightWeightMap.getValueAt(0)).assertEqual(value);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapGetValueAt0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GETVALUEAT_0100
     * @tc.desc   Testing LightWeightMap get value by index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapGetValueAt0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapGetValueAt0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        let index = lightWeightMap.getIndexOfKey("squirrel");
        expect(index !== -1).assertTrue();
        expect(String(lightWeightMap.getValueAt(index))).assertEqual('123');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapGetValueAt0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_GETVALUEAT_0300
     * @tc.desc   Testing LightWeightMap get value by outside length index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapGetValueAt0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapGetValueAt0003';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        lightWeightMap.getValueAt(10);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.name   testLightWeightMapClear0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_CLEAR_0100
     * @tc.desc   Testing LightWeightMap clear data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapClear0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapClear0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        lightWeightMap.clear();
        expect(lightWeightMap.isEmpty()).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapClear0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_CLEAR_0200
     * @tc.desc   Testing LightWeightMap add data after clear data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapClear0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapClear0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.clear();
        lightWeightMap.set("a", 123);
        lightWeightMap.set("b", 356);
        expect(String(lightWeightMap.length)).assertEqual('2');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapClear0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_CLEAR_0300
     * @tc.desc   Testing LightWeightMap clear data for a empty LightWeightMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapClear0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapClear0003';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.clear();
        expect(lightWeightMap.isEmpty()).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapKeys0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_KEYS_0100
     * @tc.desc   Testing LightWeightMap get all key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapKeys0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapKeys0001';
      let arr: Array<string> = new Array<string>();
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        let iter: IterableIterator<string> = lightWeightMap.keys();
        let temp: IteratorResult<string> = iter.next();
        while (!temp.done) {
          console.log(`${TAG} key: ${temp.value}`);
          arr.push(temp.value as String);
          temp = iter.next();
        }
        expect(arr.sort()).assertDeepEquals(["sparrow", "squirrel"]);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapKeys0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_KEYS_0200
     * @tc.desc   Testing LightWeightMap get all key for an empty LightWeightMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapKeys0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapKeys0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        let iter: IterableIterator<string> = lightWeightMap.keys();
        let temp: IteratorResult<string> = iter.next();
        expect(temp.done).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapKeys0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_KEYS_0300
     * @tc.desc   Testing LightWeightMap get all key for a LightWeightMap contain large string key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapKeys0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapKeys0003';
      const key: string = Array(10000).map((_: undefined, index): String => `${index}`).join('');
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set(key, 123);
        let iter: IterableIterator<string> = lightWeightMap.keys();
        let temp: IteratorResult<string> = iter.next();
        expect(temp.done).assertFalse();
        expect(temp.value).assertEqual(key);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapValues0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_VALUES_0100
     * @tc.desc   Testing LightWeightMap get all value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapValues0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapValues0001';
      let arr: Array<Int> = new Array<Int>();
      try {
        let lightWeightMap: LightWeightMap<string, Int> = new LightWeightMap<string, Int>();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        let iter: IterableIterator<Int> = lightWeightMap.values();
        let temp: IteratorResult<Int> = iter.next();
        while (!temp.done) {
          console.log(`${TAG} value: ${temp.value}`);
          arr.push(temp.value as Int);
          temp = iter.next();
        }
        expect(arr.sort().toString()).assertDeepEquals("123,356");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapValues0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_VALUES_0200
     * @tc.desc   Testing LightWeightMap get all value for an empty LightWeightMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapValues0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapValues0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        let iter: IterableIterator<Number> = lightWeightMap.values();
        let temp: IteratorResult<Number> = iter.next();
        expect(temp.done).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapValues0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_VALUES_0300
     * @tc.desc   Testing LightWeightMap get all value for a LightWeightMap contain large string value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapValues0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapValues0003';
      const value: string = Array(10000).map((_: undefined, index): String => `${index}`).join('');
      try {
        let lightWeightMap: LightWeightMap<string, string> = new LightWeightMap<string, string>();
        lightWeightMap.set("squirrel", value);
        let iter: IterableIterator<string> = lightWeightMap.values();
        let temp: IteratorResult<string> = iter.next();
        expect(temp.done).assertFalse();
        expect(temp.value).assertEqual(value);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapForeach0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_FOREACH_0100
     * @tc.desc   Testing LightWeightMap use forEach and remove function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapForeach0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapForeach0001';
      try {
        let lightWeightMap: LightWeightMap<number, number> = new LightWeightMap<number, number>();
        for (let i = 0; i < 10; i++) {
          lightWeightMap.set(i, 100 + i);
        }
        lightWeightMap.forEach((value: number, key: number): void => {
          expect(String(lightWeightMap.remove(key))).assertEqual(String(value));
        });
        console.log(`${TAG}, length: ${lightWeightMap.length}`);
        lightWeightMap.forEach((value: number, key: number): void => {
          console.log(`${TAG}, key: ${key}, value: ${value}`);
        });
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapForeach0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_FOREACH_0200
     * @tc.desc   Testing LightWeightMap use forEach to iterate over each item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapForeach0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapForeach0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("sparrow", 123);
        lightWeightMap.set("gull", 357);
        lightWeightMap.forEach((value: number, key: string): void => {
          if (key === "sparrow") {
            expect(String(value)).assertEqual('123');
          } else if (key === "gull") {
            expect(String(value)).assertEqual('357');
          } else {
            console.error(`${TAG}, unknown key: ${key}, unknown value: ${value}`);
            expect(false).assertFail();
          }
        });
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapForeach0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_FOREACH_0300
     * @tc.desc   Testing LightWeightMap use forEach to iterate over each item for a LightWeightMap contain duplicate value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapForeach0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapForeach0003';
      const VALUE: Number = 100;
      try {
        let lightWeightMap: LightWeightMap<Number, Number> = new LightWeightMap<Number, Number>();
        for (let i = 0; i < 10; i++) {
          lightWeightMap.set(i, VALUE);
        }
        expect(String(lightWeightMap.length)).assertEqual('10');
        lightWeightMap.forEach((value: Number): void => {
          expect(String(value)).assertEqual(String(VALUE));
        });
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapForeach0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_FOREACH_0400
     * @tc.desc   Testing LightWeightMap use forEach to iterate over each item for an empty LightWeightMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapForeach0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapForeach0004';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        let tmp = 0;
        lightWeightMap.forEach((): void => tmp++);
        expect(String(tmp)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapForeach0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_FOREACH_0500
     * @tc.desc   Testing LightWeightMap use forEach to check ArgThis
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapForeach0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapForeach0005';
      const VALUE: Number = 100;
      try {
        let lightWeightMap: LightWeightMap<Number, Number> = new LightWeightMap<Number, Number>();
        for (let i = 0; i < 10; i++) {
          lightWeightMap.set(i, VALUE);
        }
        expect(String(lightWeightMap.length)).assertEqual('10');
        lightWeightMap.forEach((value: Number, index: Number, lightWeightMap: LightWeightMap<Number, Number>): void => {
          expect(String(value)).assertEqual(String(VALUE));
          expect(String(lightWeightMap.length)).assertEqual('10');
        });

      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapEntries0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_ENTRIES_0100
     * @tc.desc   Testing LightWeightMap use entries and remove function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapEntries0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapEntries0001';
      try {
        let lightWeightMap: LightWeightMap<number, string> = new LightWeightMap<number, string>();
        for (let i = 0; i < 10; i++) {
          lightWeightMap.set(i, `${i}`);
        }
        let iter: IterableIterator<[Number, string]> = lightWeightMap.entries();
        let temp: IteratorResult<[Number, string]> = iter.next();
        while (!temp.done) {
          expect(lightWeightMap.remove(temp.value?.[0] as Number)).assertEqual(temp.value?.[1]);
          temp = iter.next();
        }
        console.log(`${TAG}, length: ${lightWeightMap.length}`);
        iter = lightWeightMap.entries();
        temp = iter.next();
        while (!temp.done) {
          console.log(`${TAG}, key: ${temp.value?.[0]}, value: ${temp.value?.[1]}`);
          temp = iter.next();
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapEntries0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_ENTRIES_0200
     * @tc.desc   Testing LightWeightMap use entries to iterate over each item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapEntries0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapEntries0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        let iter: IterableIterator<[string, Number]> = lightWeightMap.entries();
        let temp: IteratorResult<[string, Number]> = iter.next();
        while (!temp.done) {
          if (temp.value?.[0] === "squirrel") {
            expect(String(temp.value?.[1])).assertEqual('123');
          } else if (temp.value?.[0] === "sparrow") {
            expect(String(temp.value?.[1])).assertEqual('356');
          } else {
            console.error(`${TAG} failed, unknown key: ${temp.value?.[0]}, unknown value: ${temp.value?.[1]}`);
            expect(false).assertFail();
          }
          temp = iter.next();
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapEntries0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_ENTRIES_0300
     * @tc.desc   Testing LightWeightMap use entries to iterate over each item for a LightWeightMap contain duplicate value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapEntries0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapEntries0003';
      const VALUE = 100;
      try {
        let lightWeightMap: LightWeightMap<Number, Number> = new LightWeightMap<Number, Number>();
        for (let i = 0; i < 10; i++) {
          lightWeightMap.set(i, VALUE);
        }
        expect(String(lightWeightMap.length)).assertEqual('10');
        let iter: IterableIterator<[Number, Number]> = lightWeightMap.entries();
        let temp: IteratorResult<[Number, Number]> = iter.next();
        while (!temp.done) {
          expect(temp.value?.[0]).assertLess(10);
          expect(String(temp.value?.[1])).assertEqual(String(VALUE));
          temp = iter.next();
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapEntries0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_ENTRIES_0400
     * @tc.desc   Testing LightWeightMap use entries to iterate over each item for an empty LightWeightMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapEntries0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapEntries0004';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        let iter: IterableIterator<[string, Number]> = lightWeightMap.entries();
        let temp: IteratorResult<[string, Number]> = iter.next();
        expect(temp.done).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapToString0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_TOSTRING_0100
     * @tc.desc   Testing LightWeightMap convert to string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapToString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapToString0001';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        expect(lightWeightMap.toString()).assertEqual('sparrow:356,squirrel:123');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapToString0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_TOSTRING_0200
     * @tc.desc   Testing LightWeightMap convert to string for an empty LightWeightMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapToString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapToString0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        expect(lightWeightMap.toString()).assertEqual('');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapToString0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_TOSTRING_0300
     * @tc.desc   Testing LightWeightMap convert to string for a LightWeightMap contain duplicate value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapToString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapToString0003';
      const VALUE = 'VALUE';
      try {
        let lightWeightMap: LightWeightMap<number, string> = new LightWeightMap<number, string>();
        for (let i = 0; i < 5; i++) {
          lightWeightMap.set(i, VALUE);
        }
        expect(lightWeightMap.toString()).assertEqual('0:VALUE,1:VALUE,2:VALUE,3:VALUE,4:VALUE');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapSymbolIterator0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_SYMBOLITERATOR_0100
     * @tc.desc   Testing LightWeightMap use [Symbol.iterator] and remove function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapSymbolIterator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapSymbolIterator0001';
      try {
        let lightWeightMap: LightWeightMap<number, string> = new LightWeightMap<number, string>();
        for (let i = 0; i < 10; i++) {
          lightWeightMap.set(i, `${i}`);
        }
        let iter: IterableIterator<[Number, string]> = lightWeightMap.$_iterator();
        let temp: IteratorResult<[Number, string]> = iter.next();
        while (!temp.done) {
          expect(lightWeightMap.remove(temp.value?.[0] as Number)).assertEqual(temp.value?.[1]);
          temp = iter.next();
        }
        console.log(`${TAG}, length: ${lightWeightMap.length}`);
        iter = lightWeightMap.$_iterator();
        temp = iter.next();
        while (!temp.done) {
          console.log(`${TAG}, key: ${temp.value?.[0]}, value: ${temp.value?.[1]}`);
          temp = iter.next();
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapSymbolIterator0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_SYMBOLITERATOR_0200
     * @tc.desc   Testing LightWeightMap use [Symbol.iterator] to iterate over each item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapSymbolIterator0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapSymbolIterator0002';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        lightWeightMap.set("squirrel", 123);
        lightWeightMap.set("sparrow", 356);
        let iter = lightWeightMap.$_iterator();
        let temp: IteratorResult<[string, Number]> = iter.next();
        while (!temp.done) {
          if (temp.value?.[0] === "squirrel") {
            expect(String(temp.value?.[1])).assertEqual('123');
          } else if (temp.value?.[0] === "sparrow") {
            expect(String(temp.value?.[1])).assertEqual('356');
          } else {
            console.error(`${TAG} failed, unknown key: ${temp.value?.[0]}, unknown value: ${temp.value?.[1]}`);
            expect(false).assertFail();
          }
          temp = iter.next();
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapSymbolIterator0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_SYMBOLITERATOR_0300
     * @tc.desc   Testing LightWeightMap use [Symbol.iterator] to iterate over each item for a LightWeightMap contain duplicate value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapSymbolIterator0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapSymbolIterator0003';
      const VALUE = 'VALUE';
      try {
        let lightWeightMap: LightWeightMap<number, string> = new LightWeightMap<number, string>();
        for (let i = 0; i < 10; i++) {
          lightWeightMap.set(i, VALUE);
        }
        let iter: IterableIterator<[Number, string]> = lightWeightMap.$_iterator();
        let temp: IteratorResult<[Number, string]> = iter.next();
        while (!temp.done) {
          expect(temp.value?.[0]).assertLess(10);
          expect(temp.value?.[1]).assertEqual(VALUE);
          temp = iter.next();
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapSymbolIterator0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_SYMBOLITERATOR_0400
     * @tc.desc   Testing LightWeightMap use [Symbol.iterator] to iterate over each item for an empty LightWeightMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapSymbolIterator0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLightWeightMapSymbolIterator0004';
      try {
        let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
        let iter = lightWeightMap.$_iterator();
        let temp: IteratorResult<[string, Number]> = iter.next();
        expect(temp.done).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightMapIsEmpty0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTMAP_ISEMPTY_0600
     * @tc.desc   Testing LightWeightMap has data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapIsEmpty0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
      expect(lightWeightMap.length).assertEqual(0);
      lightWeightMap.set("squirrel1", 123);
      lightWeightMap.set("squirrel2", 456);
      lightWeightMap.set("squirrel2", 786);
      expect(lightWeightMap.length).assertEqual(2);
      lightWeightMap.set("squirrel3", 786);
      expect(lightWeightMap.length).assertEqual(3);
    });
  });
}