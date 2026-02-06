/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import hilog from '@ohos.hilog'
import Utils from './Util.test';
export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
class A {
  a: number;
}
export default function EsWeakMapTest() {
  describe('EsWeakMapTest', ():void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await sleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach((): void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll((): void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number ES_BUILTINS_WEAKMAP_0001
     * @tc.name ESWeakMapTest0001
     * @tc.desc Test ES Builtins-Api in WeakMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESWeakMapTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESWeakMapTest0001';
      console.info(`${caseName}, test start`);
      let wm = new WeakMap<object, string>();
      expect(wm.delete(new Object)).assertEqual(false)
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_WEAKMAP_0002
     * @tc.name ESWeakMapTest0002
     * @tc.desc Test ES Builtins-Api in WeakMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESWeakMapTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESWeakMapTest0002';
      console.info(`${caseName}, test start`);
      let map = new WeakMap<boolean, string>();
      expect(map.delete(false)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_WEAKMAP_0003
     * @tc.name ESWeakMapTest0003
     * @tc.desc Test ES Builtins-Api in WeakMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESWeakMapTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESWeakMapTest0003';
      console.info(`${caseName}, test start`);
      let map = new WeakMap<Object,string>();
      expect(map.delete(0)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_WEAKMAP_0004
     * @tc.name ESWeakMapTest0004
     * @tc.desc Test ES Builtins-Api in WeakMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESWeakMapTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESWeakMapTest0004';
      console.info(`${caseName}, test start`);
      let map = new WeakMap<string, string>();
      expect(map.delete('')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_WEAKMAP_0005
     * @tc.name ESWeakMapTest0005
     * @tc.desc Test ES Builtins-Api in WeakMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESWeakMapTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESWeakMapTest0005';
      console.info(`${caseName}, test start`);
      let map = new Map<object, object>();
      let weakMap = new WeakMap<object, object>();
      expect(weakMap.get(map)).assertEqual(undefined);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_WEAKMAP_0006
     * @tc.name ESWeakMapTest0006
     * @tc.desc Test ES Builtins-Api in WeakMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESWeakMapTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESWeakMapTest0006';
      console.info(`${caseName}, test start`);
      let set = new Set<string>();
      let weakMap = new WeakMap<object, object>();
      expect(weakMap.get(set)).assertEqual(undefined);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_WEAKMAP_0007
     * @tc.name ESWeakMapTest0007
     * @tc.desc Test ES Builtins-Api in WeakMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESWeakMapTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESWeakMapTest0007';
      console.info(`${caseName}, test start`);
      let weakMap = new WeakMap<object, string>();
      expect(weakMap.get([1])).assertEqual(undefined);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_WEAKMAP_0008
     * @tc.name ESWeakMapTest0008
     * @tc.desc Test ES Builtins-Api in WeakMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESWeakMapTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESWeakMapTest0008';
      console.info(`${caseName}, test start`);
      let map = new WeakMap<object,string>();
      expect(map.has([1])).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_WEAKMAP_0009
     * @tc.name ESWeakMapTest0009
     * @tc.desc Test ES Builtins-Api in WeakMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESWeakMapTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESWeakMapTest0009';
      console.info(`${caseName}, test start`);
      let weakMap = new WeakMap<object,string>();
      let map = new Map<string,string>();
      expect(weakMap.has(map)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_WEAKMAP_0010
     * @tc.name ESWeakMapTest0010
     * @tc.desc Test ES Builtins-Api in WeakMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESWeakMapTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESWeakMapTest0010';
      console.info(`${caseName}, test start`);
      let obj: A = {a:1}
      let weakMap = new WeakMap<object,string>();
      expect(weakMap.has(obj)).assertEqual(false)
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_WEAKMAP_0011
     * @tc.name ESWeakMapTest0011
     * @tc.desc Test ES Builtins-Api in WeakMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESWeakMapTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESWeakMapTest0011';
      console.info(`${caseName}, test start`);
      let weakMap = new WeakMap<object,string>();
      let set = new Set<string>();
      expect(weakMap.has(set)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_WEAKMAP_0012
     * @tc.name ESWeakMapTest0012
     * @tc.desc Test ES Builtins-Api in WeakMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESWeakMapTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESWeakMapTest0012';
      console.info(`${caseName}, test start`);
      let weakMap = new WeakMap<object, string>();
      let map = new WeakMap<object, string>();
      expect(weakMap.has(map)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_WEAKMAP_0013
     * @tc.name ESWeakMapTest0013
     * @tc.desc Test ES Builtins-Api in WeakMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESWeakMapTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESWeakMapTest0013';
      console.info(`${caseName}, test start`);
      let weakMap = new WeakMap<object, string>();
      expect(weakMap.has(false)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_WEAKMAP_0014
     * @tc.name ESWeakMapTest0014
     * @tc.desc Test ES Builtins-Api in WeakMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESWeakMapTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESWeakMapTest0014';
      console.info(`${caseName}, test start`);
      let weakMap = new WeakMap<object, string>();
      expect(weakMap.has(0)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_WEAKMAP_0015
     * @tc.name ESWeakMapTest0015
     * @tc.desc Test ES Builtins-Api in WeakMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESWeakMapTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESWeakMapTest0015';
      console.info(`${caseName}, test start`);
      let weakMap = new WeakMap<object, string>();
      expect(weakMap.has("false")).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_WEAKMAP_0016
     * @tc.name ESWeakMapTest0016
     * @tc.desc Test ES Builtins-Api in WeakMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESWeakMapTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESWeakMapTest0016';
      console.info(`${caseName}, test start`);
      let map = new WeakMap<Array<number>, string>();
      let arr : Array<number> = [1];
      map.set(arr, "1s");
      expect(map.get(arr)).assertEqual("1s");
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_WEAKMAP_0017
     * @tc.name ESWeakMapTest0017
     * @tc.desc Test ES Builtins-Api in WeakMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESWeakMapTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESWeakMapTest0017';
      console.info(`${caseName}, test start`);
      let weakMap = new WeakMap<Map<string,string>,string>();
      let map = new Map<string,string>();
      weakMap.set(map, "1s");
      expect(weakMap.get(map)).assertEqual("1s");
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_WEAKMAP_0018
     * @tc.name ESWeakMapTest0018
     * @tc.desc Test ES Builtins-Api in WeakMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESWeakMapTest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESWeakMapTest0018';
      console.info(`${caseName}, test start`);
      let obj: A = {a:1}
      let weakMap = new WeakMap<A,string>();
      weakMap.set(obj,"1");
      expect(weakMap.get(obj)).assertEqual("1");
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_WEAKMAP_0019
     * @tc.name ESWeakMapTest0019
     * @tc.desc Test ES Builtins-Api in WeakMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESWeakMapTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESWeakMapTest0019';
      console.info(`${caseName}, test start`);
      let weakMap = new WeakMap<Set<string>,string>();
      let set = new Set<string>();
      weakMap.set(set,"1");
      expect(weakMap.get(set)).assertEqual("1");
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_WEAKMAP_0020
     * @tc.name ESWeakMapTest0020
     * @tc.desc Test ES Builtins-Api in WeakMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESWeakMapTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESWeakMapTest0020';
      console.info(`${caseName}, test start`);
      let weakMap = new WeakMap<WeakMap<object, string>, string>();
      let map = new WeakMap<object, string>();
      weakMap.set(map, "1");
      expect(weakMap.get(map)).assertEqual("1");
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_WEAKMAP_0021
     * @tc.name ESWeakMapTest0021
     * @tc.desc Test ES Builtins-Api in WeakMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESWeakMapTest0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESWeakMapTest0021';
      console.info(`${caseName}, test start`);
      let weakMap = new WeakMap<object, string>();
      let threw = false;
      try {
        weakMap.set(false, "1");
        expect(false).assertTrue();
      } catch (e) {
        threw = true;
        expect(threw).assertEqual(true);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_WEAKMAP_0022
     * @tc.name ESWeakMapTest0022
     * @tc.desc Test ES Builtins-Api in WeakMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESWeakMapTest0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESWeakMapTest0022';
      console.info(`${caseName}, test start`);
      let weakMap = new WeakMap<object, string>();
      let threw = false;
      try {
        weakMap.set(1, "1");
        expect(false).assertTrue();
      } catch (e) {
        threw = true;
        expect(threw).assertEqual(true);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_WEAKMAP_0023
     * @tc.name ESWeakMapTest0023
     * @tc.desc Test ES Builtins-Api in WeakMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESWeakMapTest0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESWeakMapTest0023';
      console.info(`${caseName}, test start`);
      let weakMap = new WeakMap<object, string>();
      let threw = false;
      try {
        weakMap.set("1", "1");
        expect(false).assertTrue();
      } catch (e) {
        threw = true;
        expect(threw).assertEqual(true);
      }
      console.info(`${caseName}, test end`);
    });

  })
}
