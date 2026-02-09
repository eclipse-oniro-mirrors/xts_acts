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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import {
  ObjectIsPrototypeofTest001,
  ObjectIsPrototypeofTest002,
  ObjectIsPrototypeofTest003,
  ObjectIsPrototypeofTest004,
  ObjectIsPrototypeofTest005,
  ObjectIsPrototypeofTest006,
  ObjectIsPrototypeofTest007,
  ObjectIsPrototypeofTest008,
  ObjectIsPrototypeofTest009,
  ObjectIsPrototypeofTest010,
  ObjectIsPrototypeofTest011,
  ObjectIsPrototypeofTest012,
  ObjectIsPrototypeofTest013,
  ObjectIsPrototypeofTest014,
  ObjectIsPrototypeofTest015,
  ObjectIsPrototypeofTest017,
  ObjectIsPrototypeofTest018,
  ObjectIsPrototypeofTest019,
  ObjectIsPrototypeofTest020,
  ObjectIsPrototypeofTest021,
  ObjectIsPrototypeofTest022,
  ObjectIsPrototypeofTest023,
  ObjectIsPrototypeofTest024,
  ObjectIsPrototypeofTest025,
  ObjectIsPrototypeofTest026,
  ObjectIsPrototypeofTest027,
  ObjectIsPrototypeofTest028,
  ObjectIsPrototypeofTest029,
  ObjectIsPrototypeofTest030,
  ObjectIsPrototypeofTest031,
  ObjectIsPrototypeofTest032,
  ObjectIsPrototypeofTest033,
  ObjectIsPrototypeofTest034,
  ObjectIsPrototypeofTest035,
  ObjectIsPrototypeofTest036,
  ObjectIsPrototypeofTest037,
  ObjectIsPrototypeofTest038,
  ObjectIsPrototypeofTest039,
  ObjectIsPrototypeofTest040,
  ObjectIsPrototypeofTest041,
  ObjectIsPrototypeofTest042,
  ObjectIsPrototypeofTest043,
  ObjectIsPrototypeofTest044,
  ObjectIsPrototypeofTest045,
  ObjectIsPrototypeofTest046,
  ObjectIsPrototypeofTest047,
  ObjectIsPrototypeofTest048,
  ObjectIsPrototypeofTest049,
  ObjectIsPrototypeofTest050,
  ObjectIsPrototypeofTest051,
  ObjectIsPrototypeofTest052,
  ObjectIsPrototypeofTest053,
  ObjectIsPrototypeofTest054,
  ObjectIsPrototypeofTest055,
  ObjectIsPrototypeofTest056,
  ObjectIsPrototypeofTest057,
  ObjectIsPrototypeofTest058,
  ObjectIsPrototypeofTest059,
  ObjectIsPrototypeofTest060,
  ObjectIsPrototypeofTest061,
  ObjectIsPrototypeofTest062,
  ObjectIsPrototypeofTest063,
  ObjectIsPrototypeofTest064,
  ObjectIsPrototypeofTest065,
  ObjectIsPrototypeofTest066,
  ObjectIsPrototypeofTest067,
  ObjectIsPrototypeofTest068,
  ObjectIsPrototypeofTest069
} from './object_jsprototypeof';

export async function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

export default function ObjectIsPrototypeOfTest() {
  describe('ObjectIsPrototypeOfTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(30)
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
     * @tc.number SUB_ISPROTOTYPEOF_GET_0010
     * @tc.name ObjectIsPrototypeofTest001
     * @tc.desc Test prototype query of ordinary objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest001();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertFalse();
      expect(result[3]).assertFalse();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0020
     * @tc.name ObjectIsPrototypeofTest002
     * @tc.desc Test prototype query of array objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest002();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertFalse();
    });
    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0030
     * @tc.name ObjectIsPrototypeofTest003
     * @tc.desc Test prototype query of primitive values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest003();

      expect(result[0]).assertFalse();
      expect(result[1]).assertFalse();
      expect(result[2]).assertFalse();
      expect(result[3]).assertFalse();
      expect(result[4]).assertFalse();
      expect(result[5]).assertFalse();
      expect(result[6]).assertFalse();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0040
     * @tc.name ObjectIsPrototypeofTest004
     * @tc.desc Test prototype query of wrapper objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest004();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertTrue();
      expect(result[5]).assertTrue();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0050
     * @tc.name ObjectIsPrototypeofTest005
     * @tc.desc Test error scenario when 'this' is null/undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ObjectIsPrototypeofTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest005();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0060
     * @tc.name ObjectIsPrototypeofTest006
     * @tc.desc Test prototype query of null-prototype objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest006();

      expect(result[0]).assertFalse();
      expect(result[1]).assertTrue();
      expect(result[2]).assertFalse();
      expect(result[3]).assertFalse();
      expect(result[4]).assertFalse();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0070
     * @tc.name ObjectIsPrototypeofTest007
     * @tc.desc Test prototype query in inheritance chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest007();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertTrue();
      expect(result[5]).assertTrue();
    });
    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0080
     * @tc.name ObjectIsPrototypeofTest008
     * @tc.desc Test prototype query of function objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest008();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertTrue();
      expect(result[5]).assertFalse();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0090
     * @tc.name ObjectIsPrototypeofTest009
     * @tc.desc Test prototype query of Date objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest009();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertFalse();
      expect(result[5]).assertFalse();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0100
     * @tc.name ObjectIsPrototypeofTest010
     * @tc.desc Test prototype query of RegExp objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest010();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertTrue();
      expect(result[5]).assertFalse();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0110
     * @tc.name ObjectIsPrototypeofTest011
     * @tc.desc Test prototype query of generator objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ObjectIsPrototypeofTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest011();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertFalse();
      expect(result[5]).assertFalse();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0120
     * @tc.name ObjectIsPrototypeofTest012
     * @tc.desc Test prototype query of promise objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest012();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertFalse();
      expect(result[5]).assertFalse();
    });
    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0130
     * @tc.name ObjectIsPrototypeofTest013
     * @tc.desc Test prototype query of Map objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest013();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertFalse();
      expect(result[5]).assertFalse();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0140
     * @tc.name ObjectIsPrototypeofTest014
     * @tc.desc Test prototype query of Set objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest014();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertFalse();
      expect(result[5]).assertFalse();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0150
     * @tc.name ObjectIsPrototypeofTest015
     * @tc.desc Test prototype query of ArrayBuffer objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest015();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertFalse();
      expect(result[5]).assertFalse();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0160
     * @tc.name ObjectIsPrototypeofTest016
     * @tc.desc Test prototype query of TypedArray (Uint8Array) objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest015();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertFalse();
      expect(result[5]).assertFalse();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0170
     * @tc.name ObjectIsPrototypeofTest017
     * @tc.desc Test prototype query of Error objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest017();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertTrue();
      expect(result[5]).assertTrue();
      expect(result[6]).assertFalse();
    });
    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0180
     * @tc.name ObjectIsPrototypeofTest018
     * @tc.desc Test prototype query of BigInt objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest018();

      expect(result[0]).assertFalse();
      expect(result[1]).assertFalse();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertFalse();
      expect(result[5]).assertFalse();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0190
     * @tc.name ObjectIsPrototypeofTest019
     * @tc.desc Test prototype query of Symbol objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest019();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertFalse();
      expect(result[5]).assertFalse();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0200
     * @tc.name ObjectIsPrototypeofTest020
     * @tc.desc Test prototype query of WeakMap objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest020();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertFalse();
      expect(result[5]).assertFalse();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0210
     * @tc.name ObjectIsPrototypeofTest021
     * @tc.desc Test prototype query of WeakSet objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest021();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertFalse();
      expect(result[5]).assertFalse();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0220
     * @tc.name ObjectIsPrototypeofTest022
     * @tc.desc Test prototype query of DataView objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest022();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertFalse();
      expect(result[5]).assertFalse();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0230
     * @tc.name ObjectIsPrototypeofTest023
     * @tc.desc Test prototype query of Intl objects (Intl.DateTimeFormat)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest023();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertFalse();
      expect(result[5]).assertFalse();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0240
     * @tc.name ObjectIsPrototypeofTest024
     * @tc.desc Test prototype query of PromiseRejectionEvent (non-Web API context)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest024();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertFalse();
    });
    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0250
     * @tc.name ObjectIsPrototypeofTest025
     * @tc.desc Test prototype query of multiple TypedArray types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest025();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertTrue();
      expect(result[5]).assertTrue();
      expect(result[6]).assertTrue();
      expect(result[7]).assertFalse();
      expect(result[8]).assertFalse();
      expect(result[9]).assertFalse();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0260
     * @tc.name ObjectIsPrototypeofTest026
     * @tc.desc Test prototype query of multiple Intl subclasses
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest026();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertFalse();
      expect(result[5]).assertFalse();
      expect(result[6]).assertTrue();
      expect(result[7]).assertTrue();
      expect(result[8]).assertFalse();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0270
     * @tc.name ObjectIsPrototypeofTest027
     * @tc.desc Test prototype query of nested DataView scenarios
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest027();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertFalse();
      expect(result[5]).assertFalse();
      expect(result[6]).assertTrue();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0280
     * @tc.name ObjectIsPrototypeofTest028
     * @tc.desc Test prototype query of Symbol wrapper variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest028();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertTrue();
      expect(result[5]).assertFalse();
      expect(result[6]).assertFalse();
      expect(result[7]).assertFalse();
      expect(result[8]).assertFalse();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0290
     * @tc.name ObjectIsPrototypeofTest029
     * @tc.desc Test prototype query of WeakMap/WeakSet with different key types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest029();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertTrue();
      expect(result[5]).assertTrue();
      expect(result[6]).assertFalse();
      expect(result[7]).assertFalse();
    });
    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0300
     * @tc.name ObjectIsPrototypeofTest030
     * @tc.desc Test prototype query of AsyncGenerator vs Generator objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ObjectIsPrototypeofTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest030();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertFalse();
      expect(result[3]).assertFalse();
      expect(result[4]).assertTrue();
      expect(result[5]).assertTrue();
      expect(result[6]).assertTrue();
      expect(result[7]).assertTrue();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0310
     * @tc.name ObjectIsPrototypeofTest031
     * @tc.desc Test prototype query of BigInt vs Number wrapper objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest031();

      expect(result[0]).assertFalse();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertFalse();
      expect(result[5]).assertFalse();
      expect(result[6]).assertFalse();
      expect(result[7]).assertFalse();
      expect(result[8]).assertFalse();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0320
     * @tc.name ObjectIsPrototypeofTest032
     * @tc.desc Test prototype query of Error subclasses (TypeError/RangeError)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest032();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertFalse();
      expect(result[5]).assertFalse();
      expect(result[6]).assertTrue();
      expect(result[7]).assertTrue();
      expect(result[8]).assertTrue();
      expect(result[9]).assertFalse();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0330
     * @tc.name ObjectIsPrototypeofTest033
     * @tc.desc Test prototype query of Intl.RelativeTimeFormat vs Intl.ListFormat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest033();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertFalse();
      expect(result[5]).assertFalse();
      expect(result[6]).assertTrue();
      expect(result[7]).assertTrue();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0340
     * @tc.name ObjectIsPrototypeofTest034
     * @tc.desc Test prototype query of frozen/sealed objects with custom prototypes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ObjectIsPrototypeofTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest034();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertTrue();
      expect(result[5]).assertTrue();
      expect(result[6]).assertTrue();
    });
    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0350
     * @tc.name ObjectIsPrototypeofTest035
     * @tc.desc Test prototype query of Proxy-wrapped objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ObjectIsPrototypeofTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest035();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertTrue();
      expect(result[5]).assertTrue();
      expect(result[6]).assertFalse();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0360
     * @tc.name ObjectIsPrototypeofTest036
     * @tc.desc Test prototype query of Reflect-related object operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ObjectIsPrototypeofTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest036();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertFalse();
      expect(result[5]).assertFalse();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0370
     * @tc.name ObjectIsPrototypeofTest037
     * @tc.desc Test prototype query of AsyncFunction vs Function objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ObjectIsPrototypeofTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest037();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertFalse();
      expect(result[5]).assertTrue();
      expect(result[6]).assertTrue();
      expect(result[7]).assertTrue();
      expect(result[8]).assertTrue();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0380
     * @tc.name ObjectIsPrototypeofTest038
     * @tc.desc Test prototype query of nested prototype chains (3+ levels)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest038();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertFalse();
      expect(result[5]).assertTrue();
      expect(result[6]).assertTrue();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0390
     * @tc.name ObjectIsPrototypeofTest039
     * @tc.desc Test prototype query of Symbol.iterator-related objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ObjectIsPrototypeofTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest039();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertFalse();
      expect(result[4]).assertFalse();
      expect(result[5]).assertTrue();
      expect(result[6]).assertTrue();
    });
    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0400
     * @tc.name ObjectIsPrototypeofTest040
     * @tc.desc Test prototype query of FinalizationRegistry objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ObjectIsPrototypeofTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest040();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertFalse();
      expect(result[5]).assertFalse();
      expect(result[6]).assertTrue();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0410
     * @tc.name ObjectIsPrototypeofTest041
     * @tc.desc Test prototype query of WeakRef objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ObjectIsPrototypeofTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest041();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertFalse();
      expect(result[5]).assertFalse();
      expect(result[6]).assertTrue();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0420
     * @tc.name ObjectIsPrototypeofTest042
     * @tc.desc Test prototype query of Intl.Locale objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest042();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertTrue();
      expect(result[5]).assertFalse();
      expect(result[6]).assertFalse();
      expect(result[7]).assertTrue();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0430
     * @tc.name ObjectIsPrototypeofTest043
     * @tc.desc Test prototype query of Array-like objects (non-Array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest043();

      expect(result[0]).assertFalse();
      expect(result[1]).assertFalse();
      expect(result[2]).assertFalse();
      expect(result[3]).assertTrue();
      expect(result[4]).assertTrue();
      expect(result[5]).assertTrue();
      expect(result[6]).assertTrue();
      expect(result[7]).assertTrue();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0440
     * @tc.name ObjectIsPrototypeofTest044
     * @tc.desc Test prototype query of bound functions vs regular functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ObjectIsPrototypeofTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest044();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertTrue();
      expect(result[5]).assertFalse();
      expect(result[6]).assertTrue();
    });
    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0450
     * @tc.name ObjectIsPrototypeofTest045
     * @tc.desc Test prototype query of SharedArrayBuffer objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ObjectIsPrototypeofTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest045();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertFalse();
      expect(result[5]).assertFalse();
      expect(result[6]).assertTrue();
      expect(result[7]).assertFalse();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0460
     * @tc.name ObjectIsPrototypeofTest046
     * @tc.desc Test prototype query of Intl.NumberFormat with different styles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest046();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertTrue();
      expect(result[5]).assertTrue();
      expect(result[6]).assertFalse();
      expect(result[7]).assertFalse();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0470
     * @tc.name ObjectIsPrototypeofTest047
     * @tc.desc Test prototype query of bound generator functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ObjectIsPrototypeofTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest047();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertTrue();
      expect(result[5]).assertTrue();
      expect(result[6]).assertFalse();
      expect(result[7]).assertFalse();
      expect(result[8]).assertTrue();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0480
     * @tc.name ObjectIsPrototypeofTest048
     * @tc.desc Test prototype query of Intl.DisplayNames objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest048();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertTrue();
      expect(result[5]).assertTrue();
      expect(result[6]).assertFalse();
      expect(result[7]).assertFalse();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0490
     * @tc.name ObjectIsPrototypeofTest049
     * @tc.desc Test prototype query of non-constructible built-in prototypes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ObjectIsPrototypeofTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest049();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertTrue();
      expect(result[5]).assertTrue();
      expect(result[6]).assertTrue();
      expect(result[7]).assertTrue();
      expect(result[8]).assertTrue();
      expect(result[9]).assertTrue();
      expect(result[10]).assertTrue();
    });
    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0500
     * @tc.name ObjectIsPrototypeofTest050
     * @tc.desc Test prototype query of user-defined class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest050();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertTrue();
      expect(result[5]).assertFalse();
      expect(result[6]).assertTrue();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0510
     * @tc.name ObjectIsPrototypeofTest051
     * @tc.desc Test prototype query of user-defined constructor instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest051();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertFalse();
      expect(result[5]).assertTrue();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0520
     * @tc.name ObjectIsPrototypeofTest052
     * @tc.desc Test prototype query of user-defined mixin-based objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ObjectIsPrototypeofTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest052();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertFalse();
      expect(result[3]).assertFalse();
      expect(result[4]).assertTrue();
      expect(result[5]).assertTrue();
      expect(result[6]).assertTrue();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0530
     * @tc.name ObjectIsPrototypeofTest053
     * @tc.desc Test prototype query of user-defined nested objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest053();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertTrue();
      expect(result[5]).assertFalse();
      expect(result[6]).assertTrue();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0540
     * @tc.name ObjectIsPrototypeofTest054
     * @tc.desc Test prototype query of user-defined proxy-wrapped custom objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ObjectIsPrototypeofTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest054();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertTrue();
      expect(result[5]).assertFalse();
    });
    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0550
     * @tc.name ObjectIsPrototypeofTest055
     * @tc.desc Test prototype query of objects exported from ES module-like structures
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest055();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertTrue();
      expect(result[5]).assertFalse();
      expect(result[6]).assertFalse();
      expect(result[7]).assertTrue();
      expect(result[8]).assertTrue();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0560
     * @tc.name ObjectIsPrototypeofTest056
     * @tc.desc Test prototype query of closure-encapsulated private objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ObjectIsPrototypeofTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest056();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertFalse();
      expect(result[4]).assertTrue();
      expect(result[5]).assertFalse();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0570
     * @tc.name ObjectIsPrototypeofTest057
     * @tc.desc Test prototype query of user-defined factory function objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest057();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertTrue();
      expect(result[5]).assertTrue();
      expect(result[6]).assertFalse();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0580
     * @tc.name ObjectIsPrototypeofTest058
     * @tc.desc Test prototype query of user-defined frozen/sealed custom objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ObjectIsPrototypeofTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest058();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertTrue();
      expect(result[5]).assertFalse();
      expect(result[6]).assertFalse();
    });
    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0590
     * @tc.name ObjectIsPrototypeofTest059
     * @tc.desc Test isPrototypeOf with null as the method caller (this = null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ObjectIsPrototypeofTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest059();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0600
     * @tc.name ObjectIsPrototypeofTest060
     * @tc.desc Test isPrototypeOf with undefined as the method caller (this = undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ObjectIsPrototypeofTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest060();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0610
     * @tc.name ObjectIsPrototypeofTest061
     * @tc.desc Test isPrototypeOf with null as the argument (check if prototype is in null's chain)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest061();

      expect(result[0]).assertFalse();
      expect(result[1]).assertFalse();
      expect(result[2]).assertFalse();
      expect(result[3]).assertFalse();
      expect(result[4]).assertFalse();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0620
     * @tc.name ObjectIsPrototypeofTest062
     * @tc.desc Test isPrototypeOf with undefined as the argument (check if prototype is in undefined's chain)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectIsPrototypeofTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest062();

      expect(result[0]).assertFalse();
      expect(result[1]).assertFalse();
      expect(result[2]).assertFalse();
      expect(result[3]).assertFalse();
      expect(result[4]).assertFalse();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0630
     * @tc.name ObjectIsPrototypeofTest063
     * @tc.desc Test isPrototypeOf with mixed null/undefined and valid objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ObjectIsPrototypeofTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest063();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertFalse();
      expect(result[3]).assertFalse();
      expect(result[4]).assertFalse();
      expect(result[5]).assertFalse();
      expect(result[6]).assertFalse();
      expect(result[7]).assertTrue();
      expect(result[8]).assertTrue();
    });
    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0640
     * @tc.name ObjectIsPrototypeofTest064
     * @tc.desc Test prototype query of mixed chain: null-prototype object → ordinary object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ObjectIsPrototypeofTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest064();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertFalse();
      expect(result[4]).assertFalse();
      expect(result[5]).assertTrue();
      expect(result[6]).assertTrue();
      expect(result[7]).assertFalse();
      expect(result[8]).assertFalse();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0650
     * @tc.name ObjectIsPrototypeofTest065
     * @tc.desc Test prototype query of mixed chain: ordinary object → null-prototype object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ObjectIsPrototypeofTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest065();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertTrue();
      expect(result[5]).assertFalse();
      expect(result[6]).assertTrue();
      expect(result[7]).assertFalse();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0660
     * @tc.name ObjectIsPrototypeofTest066
     * @tc.desc Test prototype query of deep mixed chain: null-proto → ordinary → null-proto → instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ObjectIsPrototypeofTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest066();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertTrue();
      expect(result[5]).assertFalse();
      expect(result[6]).assertFalse();
      expect(result[7]).assertFalse();
      expect(result[8]).assertTrue();
      expect(result[9]).assertFalse();
      expect(result[10]).assertFalse();
    });
    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0670
     * @tc.name ObjectIsPrototypeofTest067
     * @tc.desc Test prototype query in mixed chain with property shadowing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ObjectIsPrototypeofTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest067();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertFalse();
      expect(result[4]).assertTrue();
      expect(result[5]).assertTrue();
      expect(result[6]).assertTrue();
      expect(result[7]).assertTrue();
      expect(result[8]).assertTrue();
      expect(result[9]).assertTrue();
      expect(result[10]).assertTrue();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0680
     * @tc.name ObjectIsPrototypeofTest068
     * @tc.desc Test prototype query in mixed chain with method overriding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ObjectIsPrototypeofTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest068();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertTrue();
      expect(result[5]).assertTrue();
      expect(result[6]).assertTrue();
      expect(result[7]).assertTrue();
      expect(result[8]).assertTrue();
      expect(result[9]).assertTrue();
      expect(result[10]).assertTrue();
    });

    /**
     * @tc.number SUB_ISPROTOTYPEOF_GET_0690
     * @tc.name ObjectIsPrototypeofTest069
     * @tc.desc Test prototype query in mixed chain with shadowed prototype methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ObjectIsPrototypeofTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const result: boolean[] = ObjectIsPrototypeofTest069();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertFalse();
      expect(result[4]).assertFalse();
      expect(result[5]).assertTrue();
      expect(result[6]).assertTrue();
      expect(result[7]).assertTrue();
      expect(result[8]).assertTrue();
      expect(result[9]).assertTrue();
      expect(result[10]).assertFalse();
      expect(result[11]).assertFalse();
    });
  })
}
