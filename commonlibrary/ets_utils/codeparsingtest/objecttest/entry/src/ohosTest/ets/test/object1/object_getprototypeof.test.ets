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
import { ObjectGetPrototypeOfTest001, ObjectGetPrototypeOfTest002,
  ObjectGetPrototypeOfTest003,
  ObjectGetPrototypeOfTest004,
  ObjectGetPrototypeOfTest005,
  ObjectGetPrototypeOfTest006,
  ObjectGetPrototypeOfTest007,
  ObjectGetPrototypeOfTest008,
  ObjectGetPrototypeOfTest009,
  ObjectGetPrototypeOfTest010,
  ObjectGetPrototypeOfTest011,
  ObjectGetPrototypeOfTest012,
  ObjectGetPrototypeOfTest013,
  ObjectGetPrototypeOfTest014,
  ObjectGetPrototypeOfTest015,
  ObjectGetPrototypeOfTest016,
  ObjectGetPrototypeOfTest017,
  ObjectGetPrototypeOfTest018,
  ObjectGetPrototypeOfTest019,
  ObjectGetPrototypeOfTest020,
  ObjectGetPrototypeOfTest021,
  ObjectGetPrototypeOfTest022,
  ObjectGetPrototypeOfTest023,
  ObjectGetPrototypeOfTest024,
  ObjectGetPrototypeOfTest025,
  ObjectGetPrototypeOfTest026,
  ObjectGetPrototypeOfTest027,
  ObjectGetPrototypeOfTest028,
  ObjectGetPrototypeOfTest029,
  ObjectGetPrototypeOfTest030,
  ObjectGetPrototypeOfTest031,
  ObjectGetPrototypeOfTest032,
  ObjectGetPrototypeOfTest033,
  ObjectGetPrototypeOfTest034,
  ObjectGetPrototypeOfTest035,
  ObjectGetPrototypeOfTest036,
  ObjectGetPrototypeOfTest037,
  ObjectGetPrototypeOfTest038,
  ObjectGetPrototypeOfTest039,
  ObjectGetPrototypeOfTest040,
  ObjectGetPrototypeOfTest041,
  ObjectGetPrototypeOfTest042,
  ObjectGetPrototypeOfTest043,
  ObjectGetPrototypeOfTest044,
  ObjectGetPrototypeOfTest045,
  ObjectGetPrototypeOfTest046,
  ObjectGetPrototypeOfTest047,
  ObjectGetPrototypeOfTest048,
  ObjectGetPrototypeOfTest049,
  ObjectGetPrototypeOfTest050,
  ObjectGetPrototypeOfTest051,
  ObjectGetPrototypeOfTest052,
  ObjectGetPrototypeOfTest053,
  ObjectGetPrototypeOfTest054,
  ObjectGetPrototypeOfTest055,
  ObjectGetPrototypeOfTest056,
  ObjectGetPrototypeOfTest057,
  ObjectGetPrototypeOfTest058,
  ObjectGetPrototypeOfTest059,
  ObjectGetPrototypeOfTest060,
  ObjectGetPrototypeOfTest061,
  ObjectGetPrototypeOfTest062,
  ObjectGetPrototypeOfTest063,
  ObjectGetPrototypeOfTest064,
  ObjectGetPrototypeOfTest065,
  ObjectGetPrototypeOfTest066,
  ObjectGetPrototypeOfTest067,
  ObjectGetPrototypeOfTest068,
  ObjectGetPrototypeOfTest069,
  ObjectGetPrototypeOfTest070,
  ObjectGetPrototypeOfTest071,
  ObjectGetPrototypeOfTest072,
  ObjectGetPrototypeOfTest073,
  ObjectGetPrototypeOfTest074,
  ObjectGetPrototypeOfTest075,
  ObjectGetPrototypeOfTest076,
  ObjectGetPrototypeOfTest077,
  ObjectGetPrototypeOfTest078,
  ObjectGetPrototypeOfTest079,
  ObjectGetPrototypeOfTest080,
  ObjectGetPrototypeOfTest081,
  ObjectGetPrototypeOfTest082,
  ObjectGetPrototypeOfTest083,
  ObjectGetPrototypeOfTest084,
  ObjectGetPrototypeOfTest085,
  ObjectGetPrototypeOfTest086,
  ObjectGetPrototypeOfTest087,
  ObjectGetPrototypeOfTest088,
  ObjectGetPrototypeOfTest089,
  ObjectGetPrototypeOfTest090,
  ObjectGetPrototypeOfTest091,
  ObjectGetPrototypeOfTest092,
  ObjectGetPrototypeOfTest093,
  ObjectGetPrototypeOfTest094,
  ObjectGetPrototypeOfTest095,
  ObjectGetPrototypeOfTest096,
  ObjectGetPrototypeOfTest097,
  ObjectGetPrototypeOfTest098,
  ObjectGetPrototypeOfTest100,
  ObjectGetPrototypeOfTest101,
  ObjectGetPrototypeOfTest102,
  ObjectGetPrototypeOfTest103,
  ObjectGetPrototypeOfTest104,
  ObjectGetPrototypeOfTest105,
  ObjectGetPrototypeOfTest106,
  ObjectGetPrototypeOfTest107,
  ObjectGetPrototypeOfTest108,
  ObjectGetPrototypeOfTest109,
  ObjectGetPrototypeOfTest110,
  ObjectGetPrototypeOfTest111,
  ObjectGetPrototypeOfTest112,
  ObjectGetPrototypeOfTest113,
  ObjectGetPrototypeOfTest114,
  ObjectGetPrototypeOfTest115,
  ObjectGetPrototypeOfTest116,
  ObjectGetPrototypeOfTest117,
  ObjectGetPrototypeOfTest118,
  ObjectGetPrototypeOfTest119,
  ObjectGetPrototypeOfTest120,
  ObjectGetPrototypeOfTest121,
  ObjectGetPrototypeOfTest122,
  ObjectGetPrototypeOfTest123,
  ObjectGetPrototypeOfTest124,
  ObjectGetPrototypeOfTest125,
  ObjectGetPrototypeOfTest126,
  ObjectGetPrototypeOfTest127,
  ObjectGetPrototypeOfTest128,
  ObjectGetPrototypeOfTest129,
  ObjectGetPrototypeOfTest130 } from './object_getprototypeof';

function sleep(time: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, time));
}

export default function ObjectGetPrototypeOfTest() {
  describe('ObjectGetPrototypeOfTest', () => {
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
     * @tc.number SUB_PROTOTYPE_GET_0010
     * @tc.name ObjectGetPrototypeOfTest001
     * @tc.desc Test prototype query of ordinary objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest001()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0020
     * @tc.name ObjectGetPrototypeOfTest002
     * @tc.desc Test prototype query of array objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest002()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0030
     * @tc.name ObjectGetPrototypeOfTest003
     * @tc.desc Test prototype query of constructor instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest003()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0040
     * @tc.name ObjectGetPrototypeOfTest004
     * @tc.desc Test prototype query of objects with null prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest004()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0050
     * @tc.name ObjectGetPrototypeOfTest005
     * @tc.desc Test prototype query of boxed primitive types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ObjectGetPrototypeOfTest005();
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0060
     * @tc.name ObjectGetPrototypeOfTest006
     * @tc.desc Test prototype query of ES6 class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest006()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0070
     * @tc.name ObjectGetPrototypeOfTest007
     * @tc.desc Test prototype query of inherited class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = ObjectGetPrototypeOfTest007();
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0080
     * @tc.name ObjectGetPrototypeOfTest008
     * @tc.desc Test exception throwing when parameter is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ObjectGetPrototypeOfTest008();
        expect(true).assertEqual(false);
      } catch (e) {
        expect(e instanceof TypeError).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0090
     * @tc.name ObjectGetPrototypeOfTest009
     * @tc.desc Test exception throwing when parameter is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ObjectGetPrototypeOfTest009();
        expect(true).assertEqual(false);
      } catch (e) {
        expect(e instanceof TypeError).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0100
     * @tc.name ObjectGetPrototypeOfTest010
     * @tc.desc Test prototype query of function objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest010()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0110
     * @tc.name ObjectGetPrototypeOfTest011
     * @tc.desc Test prototype query of Date object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest011()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0120
     * @tc.name ObjectGetPrototypeOfTest012
     * @tc.desc Test prototype query of RegExp object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest012()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0130
     * @tc.name ObjectGetPrototypeOfTest013
     * @tc.desc Test prototype query of Map object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest013()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0140
     * @tc.name ObjectGetPrototypeOfTest014
     * @tc.desc Test prototype query of Set object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest014()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0150
     * @tc.name ObjectGetPrototypeOfTest015
     * @tc.desc Test prototype query of Proxy object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest015()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0160
     * @tc.name ObjectGetPrototypeOfTest016
     * @tc.desc Test prototype query of Promise object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest016()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0170
     * @tc.name ObjectGetPrototypeOfTest017
     * @tc.desc Test prototype query of Boolean object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest017()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0180
     * @tc.name ObjectGetPrototypeOfTest018
     * @tc.desc Test prototype query of Symbol object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest018()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0190
     * @tc.name ObjectGetPrototypeOfTest019
     * @tc.desc Test prototype query of Error object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest019()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0200
     * @tc.name ObjectGetPrototypeOfTest020
     * @tc.desc Test prototype query of TypeError object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest020()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0210
     * @tc.name ObjectGetPrototypeOfTest021
     * @tc.desc Test prototype query of ArrayBuffer object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest021()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0220
     * @tc.name ObjectGetPrototypeOfTest022
     * @tc.desc Test prototype query of Uint8Array object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest022()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0230
     * @tc.name ObjectGetPrototypeOfTest023
     * @tc.desc Test prototype query of Function prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest023()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0240
     * @tc.name ObjectGetPrototypeOfTest024
     * @tc.desc Test prototype query of Object.prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest024()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0250
     * @tc.name ObjectGetPrototypeOfTest025
     * @tc.desc Test prototype query of inherited class prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest025()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0260
     * @tc.name ObjectGetPrototypeOfTest026
     * @tc.desc Test prototype query of bound function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest026()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0270
     * @tc.name ObjectGetPrototypeOfTest027
     * @tc.desc Test prototype query of arrow function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest027()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0280
     * @tc.name ObjectGetPrototypeOfTest028
     * @tc.desc Test prototype query of class expression instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest028()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0290
     * @tc.name ObjectGetPrototypeOfTest029
     * @tc.desc Test prototype query of generator function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest029()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0300
     * @tc.name ObjectGetPrototypeOfTest030
     * @tc.desc Test prototype query of generator instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest030()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0310
     * @tc.name ObjectGetPrototypeOfTest031
     * @tc.desc Test prototype query of WeakMap object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest031()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0320
     * @tc.name ObjectGetPrototypeOfTest032
     * @tc.desc Test prototype query of WeakSet object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest032()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0330
     * @tc.name ObjectGetPrototypeOfTest033
     * @tc.desc Test prototype query of DataView object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest033()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0340
     * @tc.name ObjectGetPrototypeOfTest034
     * @tc.desc Test prototype query of URIError object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest034()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0350
     * @tc.name ObjectGetPrototypeOfTest035
     * @tc.desc Test prototype query of RangeError object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest035()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0360
     * @tc.name ObjectGetPrototypeOfTest036
     * @tc.desc Test prototype query of EvalError object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest036()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0370
     * @tc.name ObjectGetPrototypeOfTest037
     * @tc.desc Test prototype query of ReferenceError object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest037()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0380
     * @tc.name ObjectGetPrototypeOfTest038
     * @tc.desc Test prototype query of SyntaxError object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest038()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0390
     * @tc.name ObjectGetPrototypeOfTest039
     * @tc.desc Test prototype query of Float64Array object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest039()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0400
     * @tc.name ObjectGetPrototypeOfTest040
     * @tc.desc Test prototype query of Int32Array object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest040()).assertEqual(true);
    });
    /**
     * @tc.number SUB_PROTOTYPE_GET_0410
     * @tc.name ObjectGetPrototypeOfTest041
     * @tc.desc Test prototype query of Int16Array object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest041()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0420
     * @tc.name ObjectGetPrototypeOfTest042
     * @tc.desc Test prototype query of Int8Array object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest042()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0430
     * @tc.name ObjectGetPrototypeOfTest043
     * @tc.desc Test prototype query of Uint32Array object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest043()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0440
     * @tc.name ObjectGetPrototypeOfTest044
     * @tc.desc Test prototype query of Uint16Array object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest044()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0450
     * @tc.name ObjectGetPrototypeOfTest045
     * @tc.desc Test prototype query of Float32Array object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest045()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0460
     * @tc.name ObjectGetPrototypeOfTest046
     * @tc.desc Test prototype query of BigInt object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest046()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0470
     * @tc.name ObjectGetPrototypeOfTest047
     * @tc.desc Test prototype query of BigInt64Array object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest047()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0480
     * @tc.name ObjectGetPrototypeOfTest048
     * @tc.desc Test prototype query of BigUint64Array object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest048()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0490
     * @tc.name ObjectGetPrototypeOfTest049
     * @tc.desc Test prototype query of Intl.DateTimeFormat object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest049()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0500
     * @tc.name ObjectGetPrototypeOfTest050
     * @tc.desc Test prototype query of Intl.NumberFormat object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest050()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0510
     * @tc.name ObjectGetPrototypeOfTest051
     * @tc.desc Test prototype query of Intl.Collator object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest051()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0520
     * @tc.name ObjectGetPrototypeOfTest052
     * @tc.desc Test prototype query of WeakRef object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest052()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0530
     * @tc.name ObjectGetPrototypeOfTest053
     * @tc.desc Test prototype query of FinalizationRegistry object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest053()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0540
     * @tc.name ObjectGetPrototypeOfTest054
     * @tc.desc Test prototype query of ArrayBuffer.transfer instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('ObjectGetPrototypeOfTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   expect(ObjectGetPrototypeOfTest054()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0550
     * @tc.name ObjectGetPrototypeOfTest055
     * @tc.desc Test prototype query of RegExp.exec result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest055()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0560
     * @tc.name ObjectGetPrototypeOfTest056
     * @tc.desc Test prototype query of String.raw instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest056()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0570
     * @tc.name ObjectGetPrototypeOfTest057
     * @tc.desc Test prototype query of Number.EPSILON wrapper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest057()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0580
     * @tc.name ObjectGetPrototypeOfTest058
     * @tc.desc Test prototype query of Math object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest058()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0590
     * @tc.name ObjectGetPrototypeOfTest059
     * @tc.desc Test prototype query of JSON object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest059()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0600
     * @tc.name ObjectGetPrototypeOfTest060
     * @tc.desc Test prototype query of arguments object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest060()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0610
     * @tc.name ObjectGetPrototypeOfTest061
     * @tc.desc Test prototype query of DOMException object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('ObjectGetPrototypeOfTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   expect(ObjectGetPrototypeOfTest061()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0620
     * @tc.name ObjectGetPrototypeOfTest062
     * @tc.desc Test prototype query of URL object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('ObjectGetPrototypeOfTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   expect(ObjectGetPrototypeOfTest062()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0630
     * @tc.name ObjectGetPrototypeOfTest063
     * @tc.desc Test prototype query of URLSearchParams object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('ObjectGetPrototypeOfTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   expect(ObjectGetPrototypeOfTest063()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0640
     * @tc.name ObjectGetPrototypeOfTest064
     * @tc.desc Test prototype query of TextEncoder object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('ObjectGetPrototypeOfTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   expect(ObjectGetPrototypeOfTest064()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0650
     * @tc.name ObjectGetPrototypeOfTest065
     * @tc.desc Test prototype query of TextDecoder object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('ObjectGetPrototypeOfTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   expect(ObjectGetPrototypeOfTest065()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0660
     * @tc.name ObjectGetPrototypeOfTest066
     * @tc.desc Test prototype query of ArrayBuffer.slice result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest066()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0670
     * @tc.name ObjectGetPrototypeOfTest067
     * @tc.desc Test prototype query of Map iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest067()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0680
     * @tc.name ObjectGetPrototypeOfTest068
     * @tc.desc Test prototype query of Set iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest068()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0690
     * @tc.name ObjectGetPrototypeOfTest069
     * @tc.desc Test prototype query of String iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest069()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0700
     * @tc.name ObjectGetPrototypeOfTest070
     * @tc.desc Test prototype query of Array iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest070()).assertEqual(true);
    });
    /**
     * @tc.number SUB_PROTOTYPE_GET_0710
     * @tc.name ObjectGetPrototypeOfTest071
     * @tc.desc Test prototype query of Intl.Locale object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest071()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0720
     * @tc.name ObjectGetPrototypeOfTest072
     * @tc.desc Test prototype query of Intl.PluralRules object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest072()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0730
     * @tc.name ObjectGetPrototypeOfTest073
     * @tc.desc Test prototype query of Intl.RelativeTimeFormat object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest073()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0740
     * @tc.name ObjectGetPrototypeOfTest074
     * @tc.desc Test prototype query of Intl.ListFormat object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest074()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0750
     * @tc.name ObjectGetPrototypeOfTest075
     * @tc.desc Test prototype query of Intl.DateTimeFormat formatToParts result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest075()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0760
     * @tc.name ObjectGetPrototypeOfTest076
     * @tc.desc Test prototype query of ArrayBuffer.isView result (TypedArray)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest076()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0770
     * @tc.name ObjectGetPrototypeOfTest077
     * @tc.desc Test prototype query of Symbol.iterator function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest077()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0780
     * @tc.name ObjectGetPrototypeOfTest078
     * @tc.desc Test prototype query of Promise.all result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest078()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0790
     * @tc.name ObjectGetPrototypeOfTest079
     * @tc.desc Test prototype query of Promise.race result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest079()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0800
     * @tc.name ObjectGetPrototypeOfTest080
     * @tc.desc Test prototype query of Error.captureStackTrace result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest080()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0810
     * @tc.name ObjectGetPrototypeOfTest081
     * @tc.desc Test prototype query of Number.isFinite wrapper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest081()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0820
     * @tc.name ObjectGetPrototypeOfTest082
     * @tc.desc Test prototype query of String.fromCharCode result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest082()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0830
     * @tc.name ObjectGetPrototypeOfTest083
     * @tc.desc Test prototype query of Array.from result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest083()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0840
     * @tc.name ObjectGetPrototypeOfTest084
     * @tc.desc Test prototype query of Array.of result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest084()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0850
     * @tc.name ObjectGetPrototypeOfTest085
     * @tc.desc Test prototype query of Map.prototype.entries iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest085()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0860
     * @tc.name ObjectGetPrototypeOfTest086
     * @tc.desc Test prototype query of Set.prototype.keys iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest086()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0870
     * @tc.name ObjectGetPrototypeOfTest087
     * @tc.desc Test prototype query of Generator.prototype.next result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest087()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0880
     * @tc.name ObjectGetPrototypeOfTest088
     * @tc.desc Test prototype query of Object.create with custom prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest088()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0890
     * @tc.name ObjectGetPrototypeOfTest089
     * @tc.desc Test prototype query of Object.freeze result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest089()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0900
     * @tc.name ObjectGetPrototypeOfTest090
     * @tc.desc Test prototype query of Object.seal result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest090()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0910
     * @tc.name ObjectGetPrototypeOfTest091
     * @tc.desc Test prototype query of Object.preventExtensions result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest091()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0920
     * @tc.name ObjectGetPrototypeOfTest092
     * @tc.desc Test prototype query of Reflect.construct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest092()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0930
     * @tc.name ObjectGetPrototypeOfTest093
     * @tc.desc Test prototype query of Proxy handler apply result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest093()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0940
     * @tc.name ObjectGetPrototypeOfTest094
     * @tc.desc Test prototype query of Symbol.toStringTag object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest094()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0950
     * @tc.name ObjectGetPrototypeOfTest095
     * @tc.desc Test prototype query of RegExp.lastMatch object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        expect(ObjectGetPrototypeOfTest095()).assertEqual(true);
        expect(true).assertEqual(false);
      } catch (e) {
        expect(e instanceof TypeError).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0960
     * @tc.name ObjectGetPrototypeOfTest096
     * @tc.desc Test prototype query of Array.prototype.concat result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest096()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0970
     * @tc.name ObjectGetPrototypeOfTest097
     * @tc.desc Test prototype query of String.prototype.split result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest097()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0980
     * @tc.name ObjectGetPrototypeOfTest098
     * @tc.desc Test prototype query of Map.prototype.get result (primitive)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest098()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_0990
     * @tc.name ObjectGetPrototypeOfTest099
     * @tc.desc Test prototype query of Set.prototype.values iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest098()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_1000
     * @tc.name ObjectGetPrototypeOfTest100
     * @tc.desc Test prototype query of WeakMap.prototype.get result (object)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest100()).assertEqual(true);
    });
    /**
     * @tc.number SUB_PROTOTYPE_GET_1010
     * @tc.name ObjectGetPrototypeOfTest101
     * @tc.desc Test prototype query of Intl.NumberFormat formatToParts result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest101()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_1020
     * @tc.name ObjectGetPrototypeOfTest102
     * @tc.desc Test prototype query of Function.prototype.bind result (with arguments)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest102()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_1030
     * @tc.name ObjectGetPrototypeOfTest103
     * @tc.desc Test prototype query of Array.prototype.slice result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest103()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_1040
     * @tc.name ObjectGetPrototypeOfTest104
     * @tc.desc Test prototype query of String.prototype.substring result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest104()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_1050
     * @tc.name ObjectGetPrototypeOfTest105
     * @tc.desc Test prototype query of Number.prototype.toFixed result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest105()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_1060
     * @tc.name ObjectGetPrototypeOfTest106
     * @tc.desc Test prototype query of Date.prototype.toISOString result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest106()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_1070
     * @tc.name ObjectGetPrototypeOfTest107
     * @tc.desc Test prototype query of RegExp.prototype.exec result (null case)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        expect(ObjectGetPrototypeOfTest107()).assertEqual(true);
        expect(true).assertEqual(false);
      } catch (e) {
        expect(e instanceof TypeError).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_1080
     * @tc.name ObjectGetPrototypeOfTest108
     * @tc.desc Test prototype query of Map.prototype.forEach callback context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest108()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_1090
     * @tc.name ObjectGetPrototypeOfTest109
     * @tc.desc Test prototype query of Set.prototype.delete return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest109()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_1100
     * @tc.name ObjectGetPrototypeOfTest110
     * @tc.desc Test prototype query of WeakMap.prototype.has return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest110()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_1110
     * @tc.name ObjectGetPrototypeOfTest111
     * @tc.desc Test prototype query of Symbol.prototype.description wrapper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest111()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_1120
     * @tc.name ObjectGetPrototypeOfTest112
     * @tc.desc Test prototype query of Error.prototype.stack wrapper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest112()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_1130
     * @tc.name ObjectGetPrototypeOfTest113
     * @tc.desc Test prototype query of ArrayBuffer.prototype.byteLength wrapper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest113()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_1140
     * @tc.name ObjectGetPrototypeOfTest114
     * @tc.desc Test prototype query of DataView.prototype.getUint8 result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest114()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_1150
     * @tc.name ObjectGetPrototypeOfTest115
     * @tc.desc Test prototype query of Generator.prototype.throw result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest115()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_1160
     * @tc.name ObjectGetPrototypeOfTest116
     * @tc.desc Test prototype query of Promise.prototype.catch result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest116()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_1170
     * @tc.name ObjectGetPrototypeOfTest117
     * @tc.desc Test prototype query of Promise.prototype.finally result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest117()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_1180
     * @tc.name ObjectGetPrototypeOfTest118
     * @tc.desc Test prototype query of Object.keys result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest118()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_1190
     * @tc.name ObjectGetPrototypeOfTest119
     * @tc.desc Test prototype query of Object.values result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest119()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_1200
     * @tc.name ObjectGetPrototypeOfTest120
     * @tc.desc Test prototype query of Object.entries result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest120()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_1210
     * @tc.name ObjectGetPrototypeOfTest121
     * @tc.desc Test prototype query of Reflect.getOwnPropertyDescriptor result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest121()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_1220
     * @tc.name ObjectGetPrototypeOfTest122
     * @tc.desc Test prototype query of Math.abs result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest122()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_1230
     * @tc.name ObjectGetPrototypeOfTest123
     * @tc.desc Test prototype query of JSON.parse result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest123()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_1240
     * @tc.name ObjectGetPrototypeOfTest124
     * @tc.desc Test prototype query of JSON.stringify result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest124()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_1250
     * @tc.name ObjectGetPrototypeOfTest125
     * @tc.desc Test prototype query of BigInt.prototype.toString result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest125()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_1260
     * @tc.name ObjectGetPrototypeOfTest126
     * @tc.desc Test prototype query of Array.prototype.flat result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest126()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_1270
     * @tc.name ObjectGetPrototypeOfTest127
     * @tc.desc Test prototype query of Array.prototype.filter result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest127()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_1280
     * @tc.name ObjectGetPrototypeOfTest128
     * @tc.desc Test prototype query of String.prototype.match result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest128()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_1290
     * @tc.name ObjectGetPrototypeOfTest129
     * @tc.desc Test prototype query of String.prototype.replace result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest129()).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_GET_1300
     * @tc.name ObjectGetPrototypeOfTest130
     * @tc.desc Test prototype query of RegExp.prototype.test result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectGetPrototypeOfTest130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ObjectGetPrototypeOfTest130()).assertEqual(true);
    });
  });
}