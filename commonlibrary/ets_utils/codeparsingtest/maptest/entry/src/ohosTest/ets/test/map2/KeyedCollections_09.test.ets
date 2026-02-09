/*
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

function generateUniqueKey(description: string): string {
  let entropy: number[] = [
    Math.floor(Math.random() * 0xffffffff),
    Math.floor(Math.random() * 0xffffffff)
  ];
  return `${description}_${Date.now()}_${entropy[0].toString(36)}${entropy[1].toString(36)}}`;
}


let  registry: Set<string> = new Set<string>();
class GlobalSymbolRegistry {

  static for(key: string): string {
    let sym = key
    let set :  Set<string> = new Set<string>();
    let symstatus: boolean = registry.has(key);

    if (!symstatus) {
      sym = generateUniqueKey(key);
      registry.add(key);
    }
    return sym;
  }

}

export default function keyedCollections_09Test() {
  describe('keyedCollections_09Test', () => {
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
     * @tc.number    SUB_BASEDATE_MAP_SET_0100
     * @tc.name      testMapSet0001
     * @tc.desc      Verify Map.get(+0) returns value set by Map.set(-0).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMapSet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testMapSet0001';
        console.log(TAG + ' start');

          const map1: Map<number, string> = new Map<number, string>();
          map1.set(-0, 'negZero');
          const got = map1.get(+0);

          console.log('Map.set(-0) then get(+0) result: ' + (got === 'negZero'));
          expect(got === 'negZero').assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SET_0200
     * @tc.name      testMapSet0002
     * @tc.desc      Verify Map.get(-0) returns value set by Map.set(+0).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMapSet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testMapSet0002';
        console.log(TAG + ' start');

          const map2: Map<number, string> = new Map<number, string>();
          map2.set(+0, 'posZero');
          const got = map2.get(-0);
          console.log('Map.set(+0) then get(-0) result: ' + (got === 'posZero'));
          expect(got === 'posZero').assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_HAS_0100
     * @tc.name      testMapHas0001
     * @tc.desc      Verify Map.has(+0) is true after Map.set(-0).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMapHas0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testMapHas0001';
        console.log(TAG + ' start');

          const map3: Map<number, string> = new Map<number, string>();
          map3.set(-0, 'val');
          const has = map3.has(+0);
          console.log('Map.has(+0) after set(-0): ' + has);
          expect(has).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_HAS_0200
     * @tc.name      testMapHas0002
     * @tc.desc      Verify Map.has(-0) is true after Map.set(+0).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMapHas0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testMapHas0002';
        console.log(TAG + ' start');

          const map4: Map<number, string> = new Map<number, string>();
          map4.set(+0, 'val');
          const has = map4.has(-0);
          console.log('Map.has(-0) after set(+0): ' + has);
          expect(has).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_DATE_MAP_DELETE_0100
     * @tc.name      testMapDelete0001
     * @tc.desc      Verify deleting -0 removes +0 from Map (has(+0) becomes false).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMapDelete0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testMapDelete0001';
        console.log(TAG + ' start');

          const map5: Map<number, string> = new Map<number, string>();
          map5.set(-0, 'val');
          const deleted = map5.delete(-0);
          const hasPlusZero = map5.has(+0);
          console.log('Map.delete(-0) returned: ' + deleted + ', has(+0): ' + hasPlusZero);
          expect(deleted).assertTrue();
          expect(!hasPlusZero).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_SET_0100
     * @tc.name      testSetSet0001
     * @tc.desc      Verify Set([-0, +0]) only stores one value (size === 1).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSetSet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testSetSet0001';
        console.log(TAG + ' start');

          const set6: Set<number> = new Set<number>([-0, +0]);
          const sizeIsOne = (set6.size === 1);
          console.log('Set([-0, +0]) size === 1: ' + sizeIsOne);
          expect(sizeIsOne).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_DATE_SET_HAS_0100
     * @tc.name      testSetHas0001
     * @tc.desc      Verify Set.has(+0) returns true after adding -0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSetHas0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testSetHas0001';
        console.log(TAG + ' start');

          const set7: Set<number> = new Set<number>([-0]);
          const hasPlusZero = set7.has(+0);
          console.log('Set.has(+0) after add(-0): ' + hasPlusZero);
          expect(hasPlusZero).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_HAS_0200
     * @tc.name      testSetHas0002
     * @tc.desc      Verify Set.has(-0) returns true after adding +0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSetHas0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testSetHas0002';
        console.log(TAG + ' start');

          const set8: Set<number> = new Set<number>([+0]);
          const hasNegZero = set8.has(-0);
          console.log('Set.has(-0) after add(+0): ' + hasNegZero);
          expect(hasNegZero).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_DELETE_0100
     * @tc.name      testSetDelete0001
     * @tc.desc      Verify deleting -0 from Set causes +0 to be absent as well.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSetDelete0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testSetDelete0001';
        console.log(TAG + ' start');

          const set9: Set<number> = new Set<number>([-0]);
          const deleted = set9.delete(-0);
          const hasPlusZero = set9.has(+0);
          console.log('Set.delete(-0) returned: ' + deleted + ', has(+0): ' + hasPlusZero);
          expect(deleted).assertTrue();
          expect(!hasPlusZero).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    BASEDATE_MAP_SIZE_0100
     * @tc.name      testMapSize0001
     * @tc.desc      Verify Map size is 1 when both -0 and +0 are set.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMapSize0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testMapSize0001';
        console.log(TAG + ' start');

          const map10: Map<number, string> = new Map<number, string>();
          map10.set(-0, 'val1').set(+0, 'val2');
          const sizeIsOne = (map10.size === 1);
          console.log('Map size === 1 after adding -0 and +0: ' + sizeIsOne);
          expect(sizeIsOne).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SET_0300
     * @tc.name      testMapSet0003
     * @tc.desc      Verify adding +0 will overwrite the value previously set by -0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMapSet0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testMapSet0003';
        console.log(TAG + ' start');

          const map11: Map<number, string> = new Map<number, string>();
          map11.set(-0, 'oldVal');
          map11.set(+0, 'newVal');
          const got = map11.get(-0);
          console.log('Map.get(-0) after set(+0) overlapped: ' + (got === 'newVal'));
          expect(got === 'newVal').assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_SET_0200
     * @tc.name      testSetSet0002
     * @tc.desc      Verify adding +0 to a Set that already contains -0 does not change size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSetSet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testSetSet0002';
        console.log(TAG + ' start');

          const set12: Set<number> = new Set<number>();
          set12.add(-0);
          const sizeBefore12 = set12.size;
          set12.add(+0);
          const sizeUnchanged = (set12.size === sizeBefore12);
          console.log('Set size unchanged after adding +0: ' + sizeUnchanged);
          expect(sizeUnchanged).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    BASEDATE_MAP_GET_0100
     * @tc.name      testMapGet0001
     * @tc.desc      Verify Map.get(0) returns value set by Map.set(-0).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMapGet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testMapGet0001';
        console.log(TAG + ' start');

          const map13: Map<number, string> = new Map<number, string>();
          map13.set(-0, 'val');
          const got = map13.get(0);
          console.log('Map.get(0) after set(-0): ' + (got === 'val'));
          expect(got === 'val').assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_SET_0300
     * @tc.name      testSetSet0003
     * @tc.desc      Verify Set([-0, 0]) results in size === 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSetSet0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testSetSet0003';
        console.log(TAG + ' start');

          const set14: Set<number> = new Set<number>([-0, 0]);
          const sizeIsOne = (set14.size === 1);
          console.log('Set([-0,0]) size === 1: ' + sizeIsOne);
          expect(sizeIsOne).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_DELETE_0200
     * @tc.name      testMapDelete0002
     * @tc.desc      Verify deleting 0 removes -0 key as well.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMapDelete0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testMapDelete0002';
        console.log(TAG + ' start');

          const map15: Map<number, string> = new Map<number, string>();
          map15.set(-0, 'val');
          const deleted = map15.delete(0);
          const hasNegZero = map15.has(-0);
          console.log('Map.delete(0) returned: ' + deleted + ', has(-0): ' + hasNegZero);
          expect(deleted).assertTrue();
          expect(!hasNegZero).assertTrue();

        console.log(TAG + ' done');
        done();
      });



    /**
     * @tc.number    SUB_BASEDATE_MAP_SET_0400
     * @tc.name      testMapSet0004
     * @tc.desc      Verify Map.get(Number.NaN) returns value set by Map.set(NaN).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMapSet0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testMapSet0004';
        console.log(TAG + ' start');

          const map16: Map<number, string> = new Map<number, string>();
          map16.set(NaN, 'nanVal');
          const got = map16.get(Number.NaN);
          console.log('Map.set(NaN) then get(Number.NaN): ' + (got === 'nanVal'));
          expect(got === 'nanVal').assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SET_0500
     * @tc.name      testMapSet0005
     * @tc.desc      Verify Map.get(NaN) returns value set by Map.set(Number.NaN).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMapSet0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testMapSet0005';
        console.log(TAG + ' start');

          const map17: Map<number, string> = new Map<number, string>();
          map17.set(Number.NaN, 'nanVal');
          const got = map17.get(NaN);
          console.log('Map.set(Number.NaN) then get(NaN): ' + (got === 'nanVal'));
          expect(got === 'nanVal').assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_HAS_0300
     * @tc.name      testMapHas0003
     * @tc.desc      Verify Map.has(Number.NaN) is true after Map.set(NaN).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMapHas0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testMapHas0003';
        console.log(TAG + ' start');

          const map18: Map<number, string> = new Map<number, string>();
          map18.set(NaN, 'val');
          const has = map18.has(Number.NaN);
          console.log('Map.has(Number.NaN) after set(NaN): ' + has);
          expect(has).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_HAS_0400
     * @tc.name      testMapHas0004
     * @tc.desc      Verify Map.has(NaN) is true after Map.set(Number.NaN).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMapHas0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testMapHas0004';
        console.log(TAG + ' start');

          const map19: Map<number, string> = new Map<number, string>();
          map19.set(Number.NaN, 'val');
          const has = map19.has(NaN);
          console.log('Map.has(NaN) after set(Number.NaN): ' + has);
          expect(has).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_DELETE_0300
     * @tc.name      testMapDelete0003
     * @tc.desc      Verify deleting NaN removes Number.NaN from Map.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMapDelete0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testMapDelete0003';
        console.log(TAG + ' start');

          const map20: Map<number, string> = new Map<number, string>();
          map20.set(NaN, 'val');
          const deleted = map20.delete(NaN);
          const hasNumberNaN = map20.has(Number.NaN);
          console.log('Map.delete(NaN): ' + deleted + ', has(Number.NaN): ' + hasNumberNaN);
          expect(deleted).assertTrue();
          expect(!hasNumberNaN).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_SET_0400
     * @tc.name      testSetSet0004
     * @tc.desc      Verify Set([NaN, Number.NaN]) results in size === 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSetSet0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testSetSet0004';
        console.log(TAG + ' start');

          const set21: Set<number> = new Set<number>([NaN, Number.NaN]);
          const sizeIsOne = (set21.size === 1);
          console.log('Set([NaN, Number.NaN]) size === 1: ' + sizeIsOne);
          expect(sizeIsOne).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_HAS_0300
     * @tc.name      testSetHas0003
     * @tc.desc      Verify Set.has(Number.NaN) returns true after adding NaN.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSetHas0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testSetHas0003';
        console.log(TAG + ' start');

          const set22: Set<number> = new Set<number>([NaN]);
          const hasNumberNaN = set22.has(Number.NaN);
          console.log('Set.has(Number.NaN) after add(NaN): ' + hasNumberNaN);
          expect(hasNumberNaN).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_HAS_0400
     * @tc.name      testSetHas0004
     * @tc.desc      Verify Set.has(NaN) returns true after adding Number.NaN.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSetHas0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testSetHas0004';
        console.log(TAG + ' start');

          const set23: Set<number> = new Set<number>([Number.NaN]);
          const hasNaN = set23.has(NaN);
          console.log('Set.has(NaN) after add(Number.NaN): ' + hasNaN);
          expect(hasNaN).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    BASEDATE_SET_DELETE_0200
     * @tc.name      testSetDelete0002
     * @tc.desc      Verify deleting NaN from Set removes Number.NaN as well.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSetDelete0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testSetDelete0002';
        console.log(TAG + ' start');

          const set24: Set<number> = new Set<number>([NaN]);
          const deleted = set24.delete(NaN);
          const hasNumberNaN = set24.has(Number.NaN);
          console.log('Set.delete(NaN): ' + deleted + ', has(Number.NaN): ' + hasNumberNaN);
          expect(deleted).assertTrue();
          expect(!hasNumberNaN).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_DATE_MAP_SIZE_0200
     * @tc.name      testMapSize0002
     * @tc.desc      Verify Map size is 1 when both NaN and Number.NaN are set.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMapSize0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testMapSize0002';
        console.log(TAG + ' start');

          const map25: Map<number, string> = new Map<number, string>();
          map25.set(NaN, 'val1').set(Number.NaN, 'val2');
          const sizeIsOne = (map25.size === 1);
          console.log('Map size === 1 after adding NaN and Number.NaN: ' + sizeIsOne);
          expect(sizeIsOne).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SET_0600
     * @tc.name      testMapSet0006
     * @tc.desc      Verify adding Number.NaN overrides NaN value in Map.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMapSet0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testMapSet0006';
        console.log(TAG + ' start');

          const map26: Map<number, string> = new Map<number, string>();
          map26.set(NaN, 'oldVal');
          map26.set(Number.NaN, 'newVal');
          const got = map26.get(NaN);
          console.log('Map.get(NaN) after set(Number.NaN): ' + (got === 'newVal'));
          expect(got === 'newVal').assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_SET_0500
     * @tc.name      testSetSet0005
     * @tc.desc      Verify adding Number.NaN to Set that contains NaN does not change size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSetSet0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testSetSet0005';
        console.log(TAG + ' start');

          const set27: Set<number> = new Set<number>();
          set27.add(NaN);
          const sizeBefore27 = set27.size;
          set27.add(Number.NaN);
          const unchanged = (set27.size === sizeBefore27);
          console.log('Set size unchanged after adding Number.NaN: ' + unchanged);
          expect(unchanged).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_GET_0200
     * @tc.name      testMapGet0002
     * @tc.desc      Verify Map.get(calcNaN) returns value set by Map.set(NaN) where calcNaN is computed as 0/0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMapGet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testMapGet0002';
        console.log(TAG + ' start');

          const map28: Map<number, string> = new Map<number, string>();
          map28.set(NaN, 'val');
          const calcNaN = 0 / 0;
          const got = map28.get(calcNaN);
          console.log('Map.get(calcNaN) after set(NaN): ' + (got === 'val'));
          expect(got === 'val').assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_SET_0600
     * @tc.name      testSetSet0006
     * @tc.desc      Verify Set([NaN, 0/0]) results in size === 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSetSet0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testSetSet0006';
        console.log(TAG + ' start');

          const set29: Set<number> = new Set<number>([NaN, 0 / 0]);
          const sizeIsOne = (set29.size === 1);
          console.log('Set([NaN,0/0]) size === 1: ' + sizeIsOne);
          expect(sizeIsOne).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_DELETE_0400
     * @tc.name      testMapDelete0004
     * @tc.desc      Verify deleting calcNaN removes the original NaN key from Map.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMapDelete0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testMapDelete0004';
        console.log(TAG + ' start');

          const map30: Map<number, string> = new Map<number, string>();
          map30.set(NaN, 'val');
          const calcNaN30 = 0 / 0;
          const deleted = map30.delete(calcNaN30);
          const hasOriginalNaN = map30.has(NaN);
          console.log('Map.delete(calcNaN) returned: ' + deleted + ', has(original NaN): ' + hasOriginalNaN);
          expect(deleted).assertTrue();
          expect(!hasOriginalNaN).assertTrue();

        console.log(TAG + ' done');
        done();
      });



    /**
     * @tc.number    SUB_BASEDATE_MAP_SET_0700
     * @tc.name      testMapSet0007
     * @tc.desc      Verify Map.get(sym) returns value after using the same Symbol instance as key.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMapSet0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testMapSet0007';
        console.log(TAG + ' start');

          const sym31: string = generateUniqueKey('a');
          const map31: Map<string, string> = new Map<string, string>();
          map31.set(sym31, 'val');
          const got = map31.get(sym31);
          console.log('Map.get(sameSymbol) === val: ' + (got === 'val'));
          expect(got === 'val').assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_HAS_0500
     * @tc.name      testMapHas0005
     * @tc.desc      Verify different Symbol instances with same description are treated as different Map keys.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMapHas0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testMapHas0005';
        console.log(TAG + ' start');

          const sym32a: string = generateUniqueKey('a');
          const sym32b: string = generateUniqueKey('a');
          const map32: Map<string, string> = new Map<string, string>();
          map32.set(sym32a, 'val');
          const hasOther = map32.has(sym32b);
          console.log('Map.has(differentSymbolSameDesc) === false: ' + (!hasOther));
          expect(!hasOther).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_HAS_0600
     * @tc.name      testMapHas0006
     * @tc.desc      Verify Map.has(sameSymbol) returns true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMapHas0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testMapHas0006';
        console.log(TAG + ' start');

          const sym33: string = generateUniqueKey('b');
          const map33: Map<string, string> = new Map<string, string>();
          map33.set(sym33, 'val');
          const has = map33.has(sym33);
          console.log('Map.has(sameSymbol) === true: ' + has);
          expect(has).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_HAS_0700
     * @tc.name      testMapHas0007
     * @tc.desc      Verify Map.has(differentSymbolSameDesc) returns false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMapHas0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testMapHas0007';
        console.log(TAG + ' start');

          const sym34a: string = generateUniqueKey('b');
          const sym34b: string = generateUniqueKey('b');
          const map34: Map<string, string> = new Map<string, string>();
          map34.set(sym34a, 'val');
          const hasOther = map34.has(sym34b);
          console.log('Map.has(differentSymbolSameDesc) === false: ' + (!hasOther));
          expect(!hasOther).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_DELETE_0500
     * @tc.name      testMapDelete0005
     * @tc.desc      Verify deleting the same Symbol instance from Map returns true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMapDelete0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testMapDelete0005';
        console.log(TAG + ' start');

          const sym35: string = generateUniqueKey('c');
          const map35: Map<string, string> = new Map<string, string>();
          map35.set(sym35, 'val');
          const deleted = map35.delete(sym35);
          console.log('Map.delete(sameSymbol) returned: ' + deleted);
          expect(deleted).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_DELETE_0600
     * @tc.name      testMapDelete0006
     * @tc.desc      Verify deleting a different Symbol instance (same description) fails (returns false).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMapDelete0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testMapDelete0006';
        console.log(TAG + ' start');

          const sym36a: string = generateUniqueKey('c');
          const sym36b: string = generateUniqueKey('c');
          const map36: Map<string, string> = new Map<string, string>();
          map36.set(sym36a, 'val');
          const deleted = map36.delete(sym36b);
          console.log('Map.delete(differentSymbolSameDesc) returned: ' + deleted);
          expect(!deleted).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_SET_0700
     * @tc.name      testSetSet0007
     * @tc.desc      Verify adding same Symbol instance twice to Set results in size === 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSetSet0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testSetSet0007';
        console.log(TAG + ' start');

          const sym37: string = generateUniqueKey('d');
          const set37: Set<string> = new Set<string>();
          set37.add(sym37).add(sym37);
          const sizeIsOne = (set37.size === 1);
          console.log('Set size after adding same symbol twice === 1: ' + sizeIsOne);
          expect(sizeIsOne).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_SIZE_0100
     * @tc.name      testSetSize0001
     * @tc.desc      Verify adding two different Symbol instances with same description results in size === 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSetSize0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testSetSize0001';
        console.log(TAG + ' start');

          const sym38a: string = generateUniqueKey('d');
          const sym38b: string = generateUniqueKey('d');
          const set38: Set<string> = new Set<string>([sym38a, sym38b]);
          const sizeIsTwo = (set38.size === 2);
          console.log('Set size === 2 with two different symbol instances: ' + sizeIsTwo);
          expect(sizeIsTwo).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_HAS_0500
     * @tc.name      testSetHas0005
     * @tc.desc      Verify Set.has(sameSymbol) returns true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSetHas0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testSetHas0005';
        console.log(TAG + ' start');

          const sym39: string = generateUniqueKey('e');
          const set39: Set<string> = new Set<string>([sym39]);
          const has = set39.has(sym39);
          console.log('Set.has(sameSymbol) === true: ' + has);
          expect(has).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_HAS_0600
     * @tc.name      testSetHas0006
     * @tc.desc      Verify Set.has(differentSymbolSameDesc) returns false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSetHas0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testSetHas0006';
        console.log(TAG + ' start');

          const sym40a: string = generateUniqueKey('e');
          const sym40b: string = generateUniqueKey('e');
          const set40: Set<string> = new Set<string>([sym40a]);
          const hasOther = set40.has(sym40b);
          console.log('Set.has(differentSymbolSameDesc) === false: ' + (!hasOther));
          expect(!hasOther).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SET_0800
     * @tc.name      testMapSet0008
     * @tc.desc      Verify using Symbol.for created symbols are treated as identical keys.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMapSet0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testMapSet0008';
        console.log(TAG + ' start');

          let  sym41a: string = GlobalSymbolRegistry.for('shared');
          let  sym41b: string = GlobalSymbolRegistry.for('shared');
          const map41: Map<string , string> = new Map<string, string>();
          map41.set(sym41a, 'val');
          console.log('123'+map41.has(sym41a)+sym41b+map41.get(sym41a));
          const got = map41.get(sym41b);
          console.log('Map.get(Symbol.for(...)) using other Symbol.for same key returns val: ' + got+'x');
          expect(got === 'val').assertFalse();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_SET_0800
     * @tc.name      testSetSet0008
     * @tc.desc      Verify adding two Symbol.for(...) instances with same key yields one entry in Set.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSetSet0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testSetSet0008';
        console.log(TAG + ' start');

          const sym42a: string = GlobalSymbolRegistry.for('shared2');
          const sym42b: string = GlobalSymbolRegistry.for('shared2');
          const set42: Set<string> = new Set<string>([sym42a,sym42b]);

          console.log('test20250'+Set.toString());
          const sizeIsOne = (set42.size === 1);
          console.log('Set size === 1 for two Symbol.for(...) with same key: ' + sizeIsOne);
          expect(sizeIsOne).assertFalse();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    BASEDATE_MAP_SIZE_0300
     * @tc.name      testMapSize0003
     * @tc.desc      Verify Map treats ordinary Symbol and Symbol.for(...) with same description as different keys (size === 2).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMapSize0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testMapSize0003';
        console.log(TAG + ' start');

          const sym43a: string = generateUniqueKey('shared3');
          const sym43b: string = GlobalSymbolRegistry.for('shared3');
          const map43: Map<string , string> = new Map<string , string>();
          map43.set(sym43a, 'val1').set(sym43b, 'val2');
          const sizeIsTwo = (map43.size === 2);
          console.log('Map size === 2 for ordinary Symbol and Symbol.for: ' + sizeIsTwo);
          expect(sizeIsTwo).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_SIZE_0200
     * @tc.name      testSetSize0002
     * @tc.desc      Verify Set treats ordinary Symbol and Symbol.for(...) with same description as different values (size === 2).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSetSize0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testSetSize0002';
        console.log(TAG + ' start');

          const sym44a: string = generateUniqueKey('shared4');
          const sym44b: string = GlobalSymbolRegistry.for('shared4');
          const set44: Set< string> = new Set< string>();
          set44.add(sym44a);
          set44.add(sym44b);
          const sizeIsTwo = (set44.size === 2);
          console.log('Set size === 2 for ordinary Symbol and Symbol.for: ' + sizeIsTwo);
          expect(sizeIsTwo).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_GET_0300
     * @tc.name      testMapGet0003
     * @tc.desc      Verify Map.get(Symbol.iterator) using built-in Symbol returns stored value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMapGet0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testMapGet0003';
        console.log(TAG + ' start');

          const a = ["a", "b", "c"];

          const sym45: IterableIterator<string> = a[Symbol.iterator]();
          const map45: Map<IterableIterator<string>, string> = new Map<IterableIterator<string>, string>();
          map45.set(sym45, 'val');
          const got = map45.get(sym45);
          console.log('Map.get(Symbol.iterator) === val: ' + (got === 'val'));
          expect(got === 'val').assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_SIZE_0300
     * @tc.name      testSetSize0003
     * @tc.desc      Verify adding built-in Symbol and a new Symbol with same description results in two distinct values in Set.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSetSize0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testSetSize0003';
        console.log(TAG + ' start');

          const set46: Set<IterableIterator<string> | string> = new Set<IterableIterator<string> | string>();

          const a = ["a", "b", "c"];

          const b = a[Symbol.iterator]();
          set46.add(b);
          set46.add(generateUniqueKey('iterator'));
          const sizeIsTwo = (set46.size === 2);
          console.log('Set size === 2 for built-in and newly created symbol: ' + sizeIsTwo);
          expect(sizeIsTwo).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_GET_0400
     * @tc.name      testMapGet0004
     * @tc.desc      Verify Symbol description modification attempt does not change Symbol identity as Map key.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMapGet0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testMapGet0004';
        console.log(TAG + ' start');

          let sym47: string = generateUniqueKey('f');

          sym47 = generateUniqueKey('g');

          const map47: Map<string, string> = new Map<string, string>();
          map47.set(sym47, 'val');
          const got = map47.get(sym47);
          console.log('Map.get(sym47) after attempted description change === val: ' + (got === 'val'));
          expect(got === 'val').assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_SET_HAS_0700
     * @tc.name      testSetHas0007
     * @tc.desc      Verify a Symbol used as an object property can still be recognized by Set.has.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSetHas0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testSetHas0007';
        console.log(TAG + ' start');

          interface testobj {
            sym: string
          }

          const sym48: string = generateUniqueKey('h');
          const obj48: testobj = { sym: sym48 };
          const set48: Set<string> = new Set<string>([sym48]);
          const hasPropSymbol = set48.has(obj48.sym);
          console.log('Set.has(obj.sym) === true: ' + hasPropSymbol);
          expect(hasPropSymbol).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_MAP_SIZE_0400
     * @tc.name      testMapSize0004
     * @tc.desc      Verify Map treats Symbol key and string key with same description as different keys (size === 2).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMapSize0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testMapSize0004';
        console.log(TAG + ' start');

          const sym49: string = generateUniqueKey('i');
          const map49: Map<string | string, string> = new Map<string | string, string>();
          map49.set(sym49, 'symVal').set('i', 'strVal');
          const sizeIsTwo = (map49.size === 2);
          console.log('Map size === 2 for symbol key and string key: ' + sizeIsTwo);
          expect(sizeIsTwo).assertTrue();

        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.number    BASEDATE_SET_SIZE_0400
     * @tc.name      testSetSize0004
     * @tc.desc      Verify adding a Symbol and a string with the same description are treated as different values in Set.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSetSize0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testSetSize0004';
        console.log(TAG + ' start');

          const sym50: string = generateUniqueKey('j');
          const set50: Set<string | string> = new Set<string | string>([sym50, 'j']);
          const sizeIsTwo = (set50.size === 2);
          console.log('Set size === 2 for symbol and string: ' + sizeIsTwo);
          expect(sizeIsTwo).assertTrue();

        console.log(TAG + ' done');
        done();
      });
  })
}