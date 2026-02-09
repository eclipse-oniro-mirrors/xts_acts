/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  SetSpeciesTest001,
  SetSpeciesTest002,
  SetSpeciesTest003,
  SetSpeciesTest004,
  SetSpeciesTest005,
  SetSpeciesTest006,
  SetSpeciesTest007,
  SetSpeciesTest008,
  SetSpeciesTest009,
  SetSpeciesTest010,
  SetSpeciesTest011,
  SetSpeciesTest012,
  SetSpeciesTest013,
  SetSpeciesTest014,
  SetSpeciesTest015,
  SetSpeciesTest016,
  SetSpeciesTest017,
  SetSpeciesTest018,
  SetSpeciesTest019,
  SetSpeciesTest020,
  SetSpeciesTest021,
  SetSpeciesTest022,
  SetSpeciesTest023,
  SetSpeciesTest024,
  SetSpeciesTest025,
  SetSpeciesTest026,
  SetSpeciesTest027,
  SetSpeciesTest028,
  SetSpeciesTest029,
  SetSpeciesTest030,
  SetSpeciesTest032,
  SetSpeciesTest033,
  SetSpeciesTest034,
  SetSpeciesTest035,
  SetSpeciesTest036,
  SetSpeciesTest037,
  SetSpeciesTest038,
  SetSpeciesTest039,
  SetSpeciesTest040,
  SetSpeciesTest041,
  SetSpeciesTest042,
  SetSpeciesTest043,
  SetSpeciesTest044,
  SetSpeciesTest045,
  SetSpeciesTest046,
  SetSpeciesTest047,
  SetSpeciesTest048,
  SetSpeciesTest049,
  SetSpeciesTest050,
  SetSpeciesTest051,
  SetSpeciesTest052,
  SetSpeciesTest053,
  SetSpeciesTest054,
  SetSpeciesTest055,
  SetSpeciesTest056,
  SetSpeciesTest057,
  SetSpeciesTest058,
  SetSpeciesTest059,
  SetSpeciesTest060,
  SetSpeciesTest061,
  SetSpeciesTest062,
  SetSpeciesTest063,
  SetSpeciesTest064,
  SetSpeciesTest065,
  SetSpeciesTest066,
  SetSpeciesTest067,
  SetSpeciesTest069,
  SetSpeciesTest071,
  SetSpeciesTest072,
  SetSpeciesTest073,
  SetSpeciesTest074,
  SetSpeciesTest075,
  SetSpeciesTest076,
  SetSpeciesTest077,
  SetSpeciesTest078,
  SetSpeciesTest079,
  SetSpeciesTest080,
  SetSpeciesTest081,
  SetSpeciesTest082,
  SetSpeciesTest083,
  SetSpeciesTest084,
  SetSpeciesTest085,
  SetSpeciesTest086,
  SetSpeciesTest087,
  SetSpeciesTest088,
  SetSpeciesTest089,
  SetSpeciesTest090,
  SetSpeciesTest091,
  SetSpeciesTest092,
  SetSpeciesTest093,
  SetSpeciesTest094,
  SetSpeciesTest095,
  SetSpeciesTest096,
  SetSpeciesTest097,
  SetSpeciesTest098,
  SetSpeciesTest099,
  SetSpeciesTest100
} from './SetSymbol';

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function SetSymbolTest() {
  describe('SetSymbolTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(50);
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
     * @tc.name   SetSpeciesTest001
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_0100
     * @tc.desc   Default Set[Symbol.species] should return Set constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetSpeciesTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const species = SetSpeciesTest001();
      expect(species).assertEqual(Set);
    });

    /**
     * @tc.name   SetSpeciesTest002
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_0200
     * @tc.desc   constructor[Symbol.species] of Set instance should return Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetSpeciesTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(SetSpeciesTest002() === Set).assertEqual(true);
    });

    /**
     * @tc.name   SetSpeciesTest003
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_0300
     * @tc.desc   Custom Set subclass should use its own constructor as species by default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetSpeciesTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const species = SetSpeciesTest003();
      expect(species).assertEqual(true);
    });

    /**
     * @tc.name   SetSpeciesTest004
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_0400
     * @tc.desc   constructor[Symbol.species] of MySet instance should return MySet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetSpeciesTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class MySet extends Set {
      }

      const mySetInstance = new MySet();
      expect(SetSpeciesTest004(mySetInstance) === MySet).assertEqual(true);
    });

    /**
     * @tc.name   SetSpeciesTest005
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_0500
     * @tc.desc   Overridden MySet[Symbol.species] should return Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetSpeciesTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const species = SetSpeciesTest005();
      expect(species).assertEqual(Set);
    });

    /**
     * @tc.name   SetSpeciesTest006
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_0600
     * @tc.desc   species of overridden MySet instance should return Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetSpeciesTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetSpeciesTest006() === Set).assertEqual(true);
    });

    /**
     * @tc.name   SetSpeciesTest007
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_0700
     * @tc.desc   Set[Symbol.species] should be a static getter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetSpeciesTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = SetSpeciesTest007() as (object | undefined | boolean)[];
      expect(result[0]).not().assertUndefined();
      expect(result[1]).assertUndefined();
      expect(result[2]).assertUndefined();
    });

    /**
     * @tc.name   SetSpeciesTest008
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_0800
     * @tc.desc   Set[Symbol.species] should not be writable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetSpeciesTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetSpeciesTest008()).assertUndefined();
    });

    /**
     * @tc.name   SetSpeciesTest009
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_0900
     * @tc.desc   Set[Symbol.species] should be configurable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetSpeciesTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetSpeciesTest009()).assertEqual(true);
    });

    /**
     * @tc.name   SetSpeciesTest010
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_1000
     * @tc.desc   'this' in custom species getter should point to constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetSpeciesTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetSpeciesTest010()).assertEqual(true);
    });

    /**
     * @tc.name   SetSpeciesTest011
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_1100
     * @tc.desc   Subclass of MySet should inherit species from MySet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      expect(SetSpeciesTest011()).assertEqual(true);
    });

    /**
     * @tc.name   SetSpeciesTest012
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_1200
     * @tc.desc   Subclass of MySet with overridden species should return Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      expect(SetSpeciesTest012()).assertEqual(true);
    });

    /**
     * @tc.name   SetSpeciesTest013
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_1300
     * @tc.desc   Multiple calls to Set[Symbol.species] should return the same constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetSpeciesTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = SetSpeciesTest013();
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(true);
    });

    /**
     * @tc.name   SetSpeciesTest014
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_1400
     * @tc.desc   Multiple calls to MySet[Symbol.species] should return the same constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetSpeciesTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = SetSpeciesTest014();
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(true);
    });

    /**
     * @tc.name   SetSpeciesTest015
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_1500
     * @tc.desc   Multiple calls to overridden MySet species should return the same Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetSpeciesTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = SetSpeciesTest015();
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(true);
    });

    /**
     * @tc.name   SetSpeciesTest016
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_1600
     * @tc.desc   Set species should work with create method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetSpeciesTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = SetSpeciesTest016() as (boolean | (object | number)[])[];
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   SetSpeciesTest017
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_1700
     * @tc.desc   MySet species should create MySet instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetSpeciesTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = SetSpeciesTest017() as (boolean | (object | number)[])[];
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   SetSpeciesTest018
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_1800
     * @tc.desc   Overridden MySet species should create Set instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetSpeciesTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = SetSpeciesTest018() as (boolean | (object | number)[])[];
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(false);
    });

    /**
     * @tc.name   SetSpeciesTest019
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_1900
     * @tc.desc   Set[Symbol.species] should be accessible via Reflect.get
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetSpeciesTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetSpeciesTest019()).assertEqual(true);
    });

    /**
     * @tc.name   SetSpeciesTest020
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_2000
     * @tc.desc   MySet[Symbol.species] should be accessible via Reflect.get
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetSpeciesTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetSpeciesTest020()).assertEqual(true);
    });

    /**
     * @tc.name   SetSpeciesTest021
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_2100
     * @tc.desc   Attempting to assign Set[Symbol.species] should throw error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetSpeciesTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isErrorThrown = false;
      try {
        SetSpeciesTest021();
      } catch (error) {
        isErrorThrown = error instanceof TypeError;
      }
      expect(isErrorThrown).assertEqual(true);
    });

    /**
     * @tc.name   SetSpeciesTest022
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_2200
     * @tc.desc   Attempting to delete Set[Symbol.species] should be allowed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetSpeciesTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetSpeciesTest022()).assertEqual(false);
    });

    /**
     * @tc.name   SetSpeciesTest023
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_2300
     * @tc.desc   Restoring deleted Set[Symbol.species] should take effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetSpeciesTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetSpeciesTest023()).assertEqual(true);
    });

    /**
     * @tc.name   SetSpeciesTest024
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_2400
     * @tc.desc   Set species should support subclass instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetSpeciesTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetSpeciesTest024()).assertEqual(true);
    });

    /**
     * @tc.name   SetSpeciesTest025
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_2500
     * @tc.desc   Overridden species should create parent Set instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetSpeciesTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = SetSpeciesTest025();
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(false);
    });

    /**
     * @tc.name   SetSpeciesTest026
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_2600
     * @tc.desc   Species should preserve data when creating new instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetSpeciesTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = SetSpeciesTest026();
      const newSet = result[0];
      const originalSet = result[1];

      expect(newSet.size).assertEqual(originalSet.size);
      originalSet.forEach(value => {
        expect(newSet.has(value)).assertEqual(true);
      });
    });

    /**
     * @tc.name   SetSpeciesTest027
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_2700
     * @tc.desc   Species should handle empty Set correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetSpeciesTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      const result = SetSpeciesTest027();

      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(true);
    });

    /**
     * @tc.name   SetSpeciesTest028
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_2800
     * @tc.desc   Species should work with non-primitive values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = SetSpeciesTest028();

      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(true);
      expect(result[2]).assertEqual(false);
    });

    /**
     * @tc.name   SetSpeciesTest029
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_2900
     * @tc.desc   Custom species should maintain subclass methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = SetSpeciesTest029() as (number | boolean)[];

      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(true);
    });

    /**
     * @tc.name   SetSpeciesTest030
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_3000
     * @tc.desc   Symbol.species should be used by Set methods that return new Sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = SetSpeciesTest030() as (boolean | number[])[];

      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(false);
      expect(result[2]).assertDeepEquals([4, 5]);
    });

    /**
     * @tc.name   SetSpeciesTest032
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_3200
     * @tc.desc   Species should handle boolean values correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetSpeciesTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetSpeciesTest032()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   SetSpeciesTest033
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_3300
     * @tc.desc   Species should handle string values correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetSpeciesTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetSpeciesTest033()).assertDeepEquals(['a', 'b', 'c']);
    });

    /**
     * @tc.name   SetSpeciesTest034
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_3400
     * @tc.desc   Species should handle null values correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetSpeciesTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetSpeciesTest034()).assertDeepEquals([null, 1]);
    });

    /**
     * @tc.name   SetSpeciesTest035
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_3500
     * @tc.desc   Species should handle undefined values correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetSpeciesTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetSpeciesTest035()).assertDeepEquals([undefined, 1]);
    });

    /**
     * @tc.name   SetSpeciesTest036
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_3600
     * @tc.desc   Species should handle NaN values correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetSpeciesTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const copy = SetSpeciesTest036();

      expect(copy.has(NaN)).assertEqual(true);
      expect(copy.size).assertEqual(2);
    });

    /**
     * @tc.name   SetSpeciesTest037
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_3700
     * @tc.desc   Species should handle mixed primitive types correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetSpeciesTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetSpeciesTest037()).assertDeepEquals([1, '1', true, false]);
    });

    /**
     * @tc.name   SetSpeciesTest038
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_3800
     * @tc.desc   Species should handle Date objects correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const date1 = new Date(2023, 0, 1);
      const date2 = new Date(2023, 0, 1);
      const copy = SetSpeciesTest038(date1, date2) as Set<Date>;

      expect(copy.size).assertEqual(2);
      expect(copy.has(date1)).assertEqual(true);
    });

    /**
     * @tc.name   SetSpeciesTest039
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_3900
     * @tc.desc   Species should handle RegExp objects correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const regex1 = /test/;
      const regex2 = /test/;
      const copy = SetSpeciesTest039(regex1, regex2) as Set<RegExp>;

      expect(copy.size).assertEqual(2);
      expect(copy.has(regex1)).assertEqual(true);
    });

    /**
     * @tc.name   SetSpeciesTest040
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_4000
     * @tc.desc   Species should handle function objects correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const func1 = () => {
      };
      const func2 = () => {
      };
      const copy = SetSpeciesTest040(func1, func2) as Set<Function>;

      expect(copy.size).assertEqual(2);
      expect(copy.has(func1)).assertEqual(true);
    });

    /**
     * @tc.name   SetSpeciesTest041
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_4100
     * @tc.desc   Symbol.species should be used in custom map method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = SetSpeciesTest041() as (boolean | number[])[];

      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(false);
      expect(result[2]).assertDeepEquals([2, 4, 6]);
    });

    /**
     * @tc.name   SetSpeciesTest042
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_4200
     * @tc.desc   Symbol.species should be used in custom filter method with chaining
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = SetSpeciesTest042() as (boolean | number[])[];

      expect(result[0]).assertEqual(true);
      expect(result[1]).assertDeepEquals([3, 4]);
    });

    /**
     * @tc.name   SetSpeciesTest043
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_4300
     * @tc.desc   Symbol.species should work with union operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const union = SetSpeciesTest043() as (boolean | number[])[];

      expect(union[0]).assertEqual(true);
      expect(union[1]).assertDeepEquals([1, 2, 3, 4, 5]);
    });

    /**
     * @tc.name   SetSpeciesTest044
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_4400
     * @tc.desc   Symbol.species should work with intersection operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const intersection = SetSpeciesTest044() as (boolean | number[])[];

      expect(intersection[0]).assertEqual(true);
      expect(intersection[1]).assertDeepEquals([3, 4]);
    });

    /**
     * @tc.name   SetSpeciesTest045
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_4500
     * @tc.desc   Custom species returning subclass should maintain behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const newSet = SetSpeciesTest045();

      expect(newSet[0]).assertEqual(true);
      expect(newSet[1]).assertEqual(false);
    });

    /**
     * @tc.name   SetSpeciesTest046
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_4600
     * @tc.desc   Symbol.species should work with large datasets
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest046', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {
      const copy = SetSpeciesTest046() as Set<number>;

      expect(copy.size).assertEqual(1000);
      expect(copy.has(999)).assertEqual(true);
      expect(copy.has(1000)).assertEqual(false);
    });

    /**
     * @tc.name   SetSpeciesTest047
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_4700
     * @tc.desc   Symbol.species should maintain object references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      expect(SetSpeciesTest047()).assertEqual('modified');
    });

    /**
     * @tc.name   SetSpeciesTest048
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_4800
     * @tc.desc   Symbol.species should work with frozen objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = SetSpeciesTest048();

      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(1);
    });

    /**
     * @tc.name   SetSpeciesTest049
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_4900
     * @tc.desc   Symbol.species should work with sealed objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = SetSpeciesTest049();

      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.name   SetSpeciesTest050
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_5000
     * @tc.desc   Symbol.species should handle circular references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = SetSpeciesTest050();

      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(true);
    });

    /**
     * @tc.name   SetSpeciesTest051
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_5100
     * @tc.desc   Symbol.species should work with inherited methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = SetSpeciesTest051() as (boolean | number[])[];

      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(false);
      expect(result[2]).assertDeepEquals([2, 4, 6]);
    });

    /**
     * @tc.name   SetSpeciesTest052
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_5200
     * @tc.desc   Symbol.species should work with async operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = SetSpeciesTest052() as Promise<(boolean | number[])[]>;
      expect((await result).pop()).assertDeepEquals([1, 2, 3]);
      expect((await result).pop()).assertEqual(true);
    });

    /**
     * @tc.name   SetSpeciesTest053
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_5300
     * @tc.desc   Symbol.species should work with generator functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      expect(SetSpeciesTest053()).assertDeepEquals([4, 8, 12]);
    });

    /**
     * @tc.name   SetSpeciesTest054
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_5400
     * @tc.desc   Symbol.species should work with custom Symbol.iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      expect(SetSpeciesTest054()).assertDeepEquals([3, 2, 1]);
    });

    /**
     * @tc.name   SetSpeciesTest055
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_5500
     * @tc.desc   Symbol.species should handle modified prototype methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      expect(SetSpeciesTest055()).assertDeepEquals([4, 8]);
    });

    /**
     * @tc.name   SetSpeciesTest056
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_5600
     * @tc.desc   Symbol.species should work with proxied Sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const newSet = SetSpeciesTest056() as (boolean | number[])[];

      expect(newSet[0]).assertEqual(true);
      expect(newSet[1]).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   SetSpeciesTest057
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_5700
     * @tc.desc   Symbol.species should work with extended prototype chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = SetSpeciesTest057();

      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(false);
      expect(result[2]).assertEqual(false);
    });

    /**
     * @tc.name   SetSpeciesTest058
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_5800
     * @tc.desc   Symbol.species should work with dynamically added methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = SetSpeciesTest058() as (boolean | number[])[];

      expect(result[0]).assertEqual(true);
      expect(result[1]).assertDeepEquals([2, 4, 6]);
    });

    /**
     * @tc.name   SetSpeciesTest059
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_5900
     * @tc.desc   Symbol.species should work with static methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = SetSpeciesTest059();

      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(false);
    });

    /**
     * @tc.name   SetSpeciesTest060
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_6000
     * @tc.desc   Symbol.species should work with subclass that overrides constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      expect(SetSpeciesTest060()).assertDeepEquals([2, 4, 6]);
    });

    /**
     * @tc.name   SetSpeciesTest061
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_6100
     * @tc.desc   Symbol.species should work with toJSON method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      expect(SetSpeciesTest061()).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   SetSpeciesTest062
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_6200
     * @tc.desc   Symbol.species should work with from method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = SetSpeciesTest062();

      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(false);
    });

    /**
     * @tc.name   SetSpeciesTest063
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_6300
     * @tc.desc   Symbol.species should work with custom has method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const newSet = SetSpeciesTest063();

      expect(newSet.has(1)).assertEqual(true);
      expect(newSet.has('1')).assertEqual(true);
    });

    /**
     * @tc.name   SetSpeciesTest064
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_6400
     * @tc.desc   Symbol.species should work with custom delete method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      expect(SetSpeciesTest064()).assertDeepEquals([4, 6]);
    });

    /**
     * @tc.name   SetSpeciesTest065
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_6500
     * @tc.desc   Symbol.species should handle species returning non-Set constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = SetSpeciesTest065() as (boolean | number[])[];

      expect(result[0]).assertEqual(true);
      expect(result[1]).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   SetSpeciesTest066
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_6600
     * @tc.desc   Symbol.species should work with species that requires parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      expect(SetSpeciesTest066()).assertDeepEquals(["num:1", "num:2", "num:3"]);
    });

    /**
     * @tc.name   SetSpeciesTest067
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_6700
     * @tc.desc   Symbol.species should work with multiple inheritance levels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = SetSpeciesTest067();
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(false);
      expect(result[2]).assertEqual(false);
    });


    /**
     * @tc.name   SetSpeciesTest069
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_6900
     * @tc.desc   Symbol.species should work with typed arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      expect(SetSpeciesTest069()).assertDeepEquals([1, 2, 3, 4]);
    });


    /**
     * @tc.name   SetSpeciesTest071
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_7100
     * @tc.desc   Symbol.species should work with weak references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = SetSpeciesTest071();
      expect((await result).pop()).assertEqual(2);
      expect((await result).pop()).assertEqual(true);
      expect((await result).pop()).assertEqual(true);
    });

    /**
     * @tc.name   SetSpeciesTest072
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_7200
     * @tc.desc   Symbol.species should work with observable pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      expect(SetSpeciesTest072()).assertDeepEquals([3]);
    });

    /**
     * @tc.name   SetSpeciesTest073
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_7300
     * @tc.desc   Symbol.species should work with immutable pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = SetSpeciesTest073() as (number | boolean)[];

      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(true);
    });

    /**
     * @tc.name   SetSpeciesTest074
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_7400
     * @tc.desc   Symbol.species should work with cached instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = SetSpeciesTest074() as (boolean | number[])[];
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   SetSpeciesTest075
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_7500
     * @tc.desc   Symbol.species should work with time-based expiration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = SetSpeciesTest075();
      expect((await result).pop()).assertEqual(false);
      expect((await result).pop()).assertEqual(false);
    });

    /**
     * @tc.name   SetSpeciesTest076
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_7600
     * @tc.desc   Symbol.species should work with encrypted values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      expect(SetSpeciesTest076()).assertDeepEquals([4, 7, 6]);
    });

    /**
     * @tc.name   SetSpeciesTest077
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_7700
     * @tc.desc   Symbol.species should work with compressed data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      expect(SetSpeciesTest077()).assertDeepEquals([1, 5, 9]);
    });

    /**
     * @tc.name   SetSpeciesTest078
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_7800
     * @tc.desc   Symbol.species should work with sorted sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      expect(SetSpeciesTest078()).assertDeepEquals([1, 2, 3, 4]);
    });

    /**
     * @tc.name   SetSpeciesTest079
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_7900
     * @tc.desc   Symbol.species should work with filtered views
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      expect(SetSpeciesTest079()).assertDeepEquals([2, 4]);
    });

    /**
     * @tc.name   SetSpeciesTest080
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_8000
     * @tc.desc   Symbol.species should work with transformed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      expect(SetSpeciesTest080()).assertDeepEquals([2, 4, 6]);
    });

    /**
     * @tc.name   SetSpeciesTest081
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_8100
     * @tc.desc   Symbol.species should work with event emitters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      expect(SetSpeciesTest081()).assertDeepEquals([3]);
    });

    /**
     * @tc.name   SetSpeciesTest082
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_8200
     * @tc.desc   Symbol.species should work with transactional sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      expect(SetSpeciesTest082()).assertDeepEquals([
        { type: 'add', value: 1 },
        { type: 'add', value: 2 },
        { type: 'add', value: 3 },
        { type: 'add', value: 4 }
      ]);
    });

    /**
     * @tc.name   SetSpeciesTest083
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_8300
     * @tc.desc   Symbol.species should work with versioned sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = SetSpeciesTest083();
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.name   SetSpeciesTest084
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_8400
     * @tc.desc   Symbol.species should work with validating sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      expect(SetSpeciesTest084()).assertDeepEquals([5]);
    });

    /**
     * @tc.name   SetSpeciesTest085
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_8500
     * @tc.desc   Symbol.species should work with mapped properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = SetSpeciesTest085() as (boolean | number[])[];
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   SetSpeciesTest086
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_8600
     * @tc.desc   Symbol.species should work with composite sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      expect(SetSpeciesTest086()).assertDeepEquals([1, 2, 5, 3, 4]);
    });

    /**
     * @tc.name   SetSpeciesTest087
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_8700
     * @tc.desc   Symbol.species should work with observable collections
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      expect(SetSpeciesTest087()).assertDeepEquals([
        { action: 'add', value: 1 },
        { action: 'add', value: 2 },
        { action: 'add', value: 3 },
        { action: 'add', value: 4 }
      ]);
    });

    /**
     * @tc.name   SetSpeciesTest088
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_8800
     * @tc.desc   Symbol.species should work with paginated sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = SetSpeciesTest088() as (boolean | number[])[];
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertDeepEquals([3, 4]);
    });

    /**
     * @tc.name   SetSpeciesTest089
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_8900
     * @tc.desc   Symbol.species should work with queryable sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = SetSpeciesTest089() as (boolean | number[])[];
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertDeepEquals([2, 4]);
    });

    /**
     * @tc.name   SetSpeciesTest090
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_9000
     * @tc.desc   Symbol.species should work with grouped sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = SetSpeciesTest090() as (boolean | number[])[];
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(true);
      expect(result[2]).assertDeepEquals([2, 4, 6]);
    });

    /**
     * @tc.name   SetSpeciesTest091
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_9100
     * @tc.desc   Symbol.species should work with nested sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = SetSpeciesTest091() as (boolean | number[])[];
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertDeepEquals([1, 2, 3, 4]);
    });

    /**
     * @tc.name   SetSpeciesTest092
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_9200
     * @tc.desc   Symbol.species should work with indexed sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      expect(SetSpeciesTest092()).assertDeepEquals({ id: 2, name: 'B' });
    });

    /**
     * @tc.name   SetSpeciesTest093
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_9300
     * @tc.desc   Symbol.species should work with ordered sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = SetSpeciesTest093() as (boolean | number[])[];
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertDeepEquals([1, 2, 3, 4]);
    });

    /**
     * @tc.name   SetSpeciesTest094
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_9400
     * @tc.desc   Symbol.species should work with linked sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = SetSpeciesTest094() as string[];
      expect(result[0]).assertEqual('b');
      expect(result[1]).assertEqual('c');
      expect(result[2]).assertUndefined();
      expect(result[3]).assertUndefined();
    });

    /**
     * @tc.name   SetSpeciesTest095
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_9500
     * @tc.desc   Symbol.species should work with tagged sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = SetSpeciesTest095() as (boolean | number[])[];
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertDeepEquals([]);
    });

    /**
     * @tc.name   SetSpeciesTest096
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_9600
     * @tc.desc   Symbol.species should work with weighted sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = SetSpeciesTest096() as number[];
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(3);
    });

    /**
     * @tc.name   SetSpeciesTest097
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_9700
     * @tc.desc   Symbol.species should work with time-stamped sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      expect(SetSpeciesTest097()).assertEqual('b');
    });

    /**
     * @tc.name   SetSpeciesTest098
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_9800
     * @tc.desc   Symbol.species should work with priority sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      expect(SetSpeciesTest098()).assertEqual('task2');
    });

    /**
     * @tc.name   SetSpeciesTest099
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_9900
     * @tc.desc   Symbol.species should work with validated transactions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = SetSpeciesTest099() as (boolean | number[])[];
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertDeepEquals([1, 2, 3, 4]);
    });

    /**
     * @tc.name   SetSpeciesTest100
     * @tc.number SUB_BUILTINS_SET_SPECIES_TEST_10000
     * @tc.desc   Symbol.species should work with complex data transformations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetSpeciesTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = SetSpeciesTest100() as (boolean | number[])[];
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertDeepEquals([1, 4, 9]);
    });

  });
}