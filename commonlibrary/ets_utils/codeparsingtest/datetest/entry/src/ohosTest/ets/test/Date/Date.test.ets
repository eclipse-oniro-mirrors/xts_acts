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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function dateTest() {
  describe('DateTest', () => {
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
     * @tc.name   testGetDate0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_0100
     * @tc.desc   Test the function of the interface GetDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testGetDate0001";
      try {
        const birthday = new Date();
        const result = birthday.getDate();
        console.log(`${TAG} result:` + result);
        expect([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28,
          29, 30, 31]).assertContain(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetDate0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_0200
     * @tc.desc   Test the function of the interface GetDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDate0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testGetDate0002";
      try {
        const birthday = new Date('August 1, 1975 23:15:30');
        const result = birthday.getDate();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetDate0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_0300
     * @tc.desc   Test the function of the interface GetDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDate0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testGetDate0003";
      try {
        const birthday = new Date('August 19, 1975 23:15:30');
        const result = birthday.getDate();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(19);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetDate0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_0400
     * @tc.desc   Test the function of the interface GetDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDate0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testGetDate0004";
      try {
        const birthday = new Date('August 31, 1975 23:15:30');
        const result = birthday.getDate();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetDate0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_0500
     * @tc.desc   Test the function of the interface GetDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDate0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testGetDate0005";
      try {
        const birthday = new Date('February 31, 1975 23:15:30');
        const result = birthday.getDate();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetDate0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_0600
     * @tc.desc   Test the function of the interface GetDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDate0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testGetDate0006";
      try {
        const birthday = new Date('April 31, 1975 23:15:30');
        const result = birthday.getDate();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetDate0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_0700
     * @tc.desc   Test the function of the interface GetDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDate0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testGetDate0007";
      try {
        const birthday = new Date('February 29, 2024 23:15:30');
        const result = birthday.getDate();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(29);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetDate0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_0800
     * @tc.desc   Test the function of the interface GetDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDate0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testGetDate0008";
      try {
        const birthday = new Date('August 0, 1975 23:15:30');
        const result = birthday.getDate();
        console.log(`${TAG} result:` + result);
        expect(Number.isNaN(result)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetDate0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_0900
     * @tc.desc   Test the function of the interface GetDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDate0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testGetDate0009";
      try {
        const birthday = new Date('August 32, 1975 23:15:30');
        const result = birthday.getDate();
        console.log(`${TAG} result:` + result);
        expect(Number.isNaN(result)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetDate0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_1000
     * @tc.desc   Test the function of the interface GetDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDate0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testGetDate0010";
      try {
        const birthday = new Date('');
        const result = birthday.getDate();
        console.log(`${TAG} result:` + result);
        expect(Number.isNaN(result)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetDay0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_1100
     * @tc.desc   Test the function of the interface GetDay.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDay0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testGetDay0001";
      try {
        const birthday = new Date();
        const result = birthday.getDay();
        console.log(`${TAG} result:` + result);
        expect([0, 1, 2, 3, 4, 5, 6]).assertContain(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetDay0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_1200
     * @tc.desc   Test the function of the interface GetDay.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDay0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testGetDay0002";
      try {
        const birthday = new Date('August 17, 1975 23:15:30');
        const result = birthday.getDay();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetDay0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_1300
     * @tc.desc   Test the function of the interface GetDay.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDay0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testGetDay0003";
      try {
        const birthday = new Date('August 19, 1975 23:15:30');
        const result = birthday.getDay();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetDay0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_1400
     * @tc.desc   Test the function of the interface GetDay.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDay0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testGetDay0004";
      try {
        const birthday = new Date('August 23, 1975 23:15:30');
        const result = birthday.getDay();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetDay0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_1500
     * @tc.desc   Test the function of the interface GetDay.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDay0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testGetDay0005";
      try {
        const birthday = new Date('August 0, 1975 23:15:30');
        const result = birthday.getDay();
        expect(Number.isNaN(result)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetDay0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_1600
     * @tc.desc   Test the function of the interface GetDay.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDay0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testGetDay0006";
      try {
        const birthday = new Date('August 32, 1975 23:15:30');
        const result = birthday.getDay();
        console.log(`${TAG} result:` + result);
        expect(Number.isNaN(result)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetDay0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_1700
     * @tc.desc   Test the function of the interface GetDay.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDay0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testGetDay0007";
      try {
        const birthday = new Date('');
        const result = birthday.getDay();
        console.log(`${TAG} result:` + result);
        expect(Number.isNaN(result)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetFullYear0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_1800
     * @tc.desc   Test the function of the interface GetFullYear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetFullYear0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testGetFullYear0001";
      try {
        const birthday = new Date();
        const result = birthday.getFullYear();
        console.log(`${TAG} result:` + result);
        expect(result < 2124 && result > 1924).assertTrue();
        expect(result).assertEqual(birthday.getFullYear());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetFullYear0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_1900
     * @tc.desc   Test the function of the interface GetFullYear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetFullYear0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testGetFullYear0002";
      try {
        const moonLanding = new Date('July 20, 50 00:20:18');
        const result = moonLanding.getFullYear();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(1950);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetFullYear0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_2000
     * @tc.desc   Test the function of the interface GetFullYear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetFullYear0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testGetFullYear0003";
      try {
        const moonLanding = new Date('July 20, 00 00:20:18');
        const result = moonLanding.getFullYear();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(2000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetFullYear0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_2100
     * @tc.desc   Test the function of the interface GetFullYear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetFullYear0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testGetFullYear0004";
      try {
        const moonLanding = new Date('July 20, 49 00:20:18');
        const result = moonLanding.getFullYear();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(2049);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetFullYear0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_2200
     * @tc.desc   Test the function of the interface GetFullYear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetFullYear0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testGetFullYear0005";
      try {
        const moonLanding = new Date('');
        const result = moonLanding.getFullYear();
        console.log(`${TAG} result:` + result);
        expect(Number.isNaN(result)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetHours0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_2300
     * @tc.desc   Test the function of the interface GetHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHours0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testGetHours0001";
      try {
        const birthday = new Date();
        const result = birthday.getHours();
        console.log(`${TAG} result:` + result);
        expect([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23])
          .assertContain(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetHours0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_2400
     * @tc.desc   Test the function of the interface GetHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHours0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testGetHours0002";
      try {
        const birthday = new Date('March 13, 08 00:20');
        const result = birthday.getHours();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetHours0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_2500
     * @tc.desc   Test the function of the interface GetHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHours0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testGetHours0003";
      try {
        const birthday = new Date('March 13, 08 04:20');
        const result = birthday.getHours();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetHours0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_2600
     * @tc.desc   Test the function of the interface GetHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHours0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testGetHours0004";
      try {
        const birthday = new Date('March 13, 08 23:00');
        const result = birthday.getHours();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(23);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetHours0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_2700
     * @tc.desc   Test the function of the interface GetHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHours0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testGetHours0005";
      try {
        const birthday = new Date('');
        const result = birthday.getHours();
        console.log(`${TAG} result:` + result);
        expect(Number.isNaN(result)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetMilliSeconds0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_2800
     * @tc.desc   Test the function of the interface MilliSeconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMilliSeconds0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetMilliSeconds0001";
      try {
        const moonLanding = new Date('July 20, 69 00:20:18');
        moonLanding.setMilliseconds(0);
        const result = moonLanding.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result >= 0 && result <= 999).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetMilliSeconds0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_2900
     * @tc.desc   Test the function of the interface MilliSeconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMilliSeconds0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetMilliSeconds0002";
      try {
        const moonLanding = new Date('July 20, 69 00:20:18');
        moonLanding.setMilliseconds(123);
        const result = moonLanding.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetMilliSeconds0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_3000
     * @tc.desc   Test the function of the interface MilliSeconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMilliSeconds0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetMilliSeconds0003";
      try {
        const moonLanding = new Date('July 20, 69 00:20:18');
        moonLanding.setMilliseconds(999);
        const result = moonLanding.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(999);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetMilliSeconds0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_3100
     * @tc.desc   Test the function of the interface MilliSeconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMilliSeconds0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetMilliSeconds0004";
      try {
        const moonLanding = new Date('July 20, 69 00:20:18');
        moonLanding.setMilliseconds(1000);
        const result = moonLanding.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetMilliSeconds0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_3200
     * @tc.desc   Test the function of the interface MilliSeconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMilliSeconds0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetMilliSeconds0005";
      try {
        const moonLanding = new Date('July 20, 69 00:20:18');
        moonLanding.setMilliseconds(-1);
        const result = moonLanding.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(999);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetMinutes0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_3300
     * @tc.desc   Test the function of the interface GetMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMinutes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetMinutes0001";
      try {
        const birthday = new Date();
        const result = birthday.getMinutes();
        console.log(`${TAG} result:` + result);
        expect(result >= 0 && result <= 59).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetMinutes0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_3400
     * @tc.desc   Test the function of the interface GetMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMinutes0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetMinutes0002";
      try {
        const birthday = new Date('March 13, 08 04:00');
        const result = birthday.getMinutes();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetMinutes0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_3500
     * @tc.desc   Test the function of the interface GetMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMinutes0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetMinutes0003";
      try {
        const birthday = new Date('March 13, 08 04:20');
        const result = birthday.getMinutes();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(20);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetMinutes0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_3600
     * @tc.desc   Test the function of the interface GetMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMinutes0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetMinutes0004";
      try {
        const birthday = new Date('March 13, 08 04:59');
        const result = birthday.getMinutes();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(59);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetMinutes0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_3700
     * @tc.desc   Test the function of the interface GetMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMinutes0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetMinutes0005";
      try {
        const birthday = new Date('March 13, 08 04:60');
        const result = birthday.getMinutes();
        console.log(`${TAG} result:` + result);
        expect(Number.isNaN(result)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetMinutes0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_3800
     * @tc.desc   Test the function of the interface GetMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMinutes0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetMinutes0006";
      try {
        const birthday = new Date('');
        const result = birthday.getMinutes();
        console.log(`${TAG} result:` + result);
        expect(Number.isNaN(result)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetMonth0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_3900
     * @tc.desc   Test the function of the interface GetMonth.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMonth0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetMonth0001";
      try {
        const moonLanding = new Date();
        const result = moonLanding.getMonth();
        console.log(`${TAG} result:` + result);
        expect([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]).assertContain(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetMonth0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_4000
     * @tc.desc   Test the function of the interface GetMonth.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMonth0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetMonth0002";
      try {
        const moonLanding = new Date('January 20, 69 00:20:18');
        const result = moonLanding.getMonth();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetMonth0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_4100
     * @tc.desc   Test the function of the interface GetMonth.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMonth0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetMonth0003";
      try {
        const moonLanding = new Date('July 20, 69 00:20:18');
        const result = moonLanding.getMonth();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetMonth0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_4200
     * @tc.desc   Test the function of the interface GetMonth.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMonth0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetMonth0004";
      try {
        const moonLanding = new Date('December 20, 69 00:20:18');
        const result = moonLanding.getMonth();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(11);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetMonth0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_4300
     * @tc.desc   Test the function of the interface GetMonth.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMonth0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetMonth0005";
      try {
        const moonLanding = new Date('');
        const result = moonLanding.getMonth();
        console.log(`${TAG} result:` + result);
        expect(Number.isNaN(result)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetSeconds0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_4400
     * @tc.desc   Test the function of the interface GetSeconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetSeconds0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetSeconds0001";
      try {
        const moonLanding = new Date();
        const result = moonLanding.getSeconds();
        console.log(`${TAG} result:` + result);
        expect(result >= 0 && result <= 59).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetSeconds0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_4500
     * @tc.desc   Test the function of the interface GetSeconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetSeconds0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetSeconds0002";
      try {
        const moonLanding = new Date('January 20, 69 00:20:00');
        const result = moonLanding.getSeconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetSeconds0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_4600
     * @tc.desc   Test the function of the interface GetSeconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetSeconds0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetSeconds0003";
      try {
        const moonLanding = new Date('July 20, 69 00:20:18');
        const result = moonLanding.getSeconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(18);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetSeconds0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_4700
     * @tc.desc   Test the function of the interface GetSeconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetSeconds0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetSeconds0004";
      try {
        const moonLanding = new Date('December 20, 69 00:20:59');
        const result = moonLanding.getSeconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(59);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetSeconds0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_4800
     * @tc.desc   Test the function of the interface GetSeconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetSeconds0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetSeconds0005";
      try {
        const moonLanding = new Date('');
        const result = moonLanding.getSeconds();
        console.log(`${TAG} result:` + result);
        expect(Number.isNaN(result)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTime0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_4900
     * @tc.desc   Test the function of the interface GetTime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTime0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetTime0001";
      try {
        const moonLanding = new Date();
        const copy = new Date();
        console.log(`${TAG} result:` + copy.setTime(moonLanding.getTime()));
        expect(copy.setTime(moonLanding.getTime())).assertEqual(copy.setTime(moonLanding.getTime()));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTime0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_5000
     * @tc.desc   Test the function of the interface GetTime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTime0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetTime0002";
      try {
        const moonLanding = new Date('January 20, 69 00:20:00');
        const copy = new Date();
        console.log(`${TAG} result:` + copy.setTime(moonLanding.getTime()));
        expect(copy.setTime(moonLanding.getTime())).assertEqual(-29922000000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTime0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_5100
     * @tc.desc   Test the function of the interface GetTime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTime0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetTime0003";
      try {
        const moonLanding = new Date('July 20, 69 00:20:18');
        const copy = new Date();
        console.log(`${TAG} result:` + copy.setTime(moonLanding.getTime()));
        expect(copy.setTime(moonLanding.getTime())).assertEqual(-14283582000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTime0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_5200
     * @tc.desc   Test the function of the interface GetTime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTime0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetTime0004";
      try {
        const moonLanding = new Date('December 20, 69 00:20:59');
        const copy = new Date();
        console.log(`${TAG} result:` + copy.setTime(moonLanding.getTime()));
        expect(copy.setTime(moonLanding.getTime())).assertEqual(-1064341000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTime0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_5300
     * @tc.desc   Test the function of the interface GetTime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTime0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetTime0005";
      try {
        const moonLanding = new Date('');
        const copy = new Date();
        console.log(`${TAG} result:` + copy.setTime(moonLanding.getTime()));
        expect(Number.isNaN(copy.setTime(moonLanding.getTime()))).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTimezoneOffset0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_5400
     * @tc.desc   Test the function of the interface GetTimezoneOffset.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTimezoneOffset0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetTimezoneOffset0001";
      try {
        const date1 = new Date();
        const result = date1.getTimezoneOffset();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(-480);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTimezoneOffset0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_5500
     * @tc.desc   Test the function of the interface GetTimezoneOffset.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTimezoneOffset0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetTimezoneOffset0002";
      try {
        const date1 = new Date();
        const date2 = new Date('August 19, 1975 23:15:30 GMT-02:00');
        const result = date1.getTimezoneOffset() === date2.getTimezoneOffset();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTimezoneOffset0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_5600
     * @tc.desc   Test the function of the interface GetTimezoneOffset.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTimezoneOffset0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetTimezoneOffset0003";
      try {
        const date1 = new Date('August 19, 1975 23:15:30 GMT+07:00');
        const date2 = new Date('August 19, 1975 23:15:30 GMT-02:00');
        const result = date1.getTimezoneOffset() === date2.getTimezoneOffset();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetTimezoneOffset0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_5700
     * @tc.desc   Test the function of the interface GetTimezoneOffset.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTimezoneOffset0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetTimezoneOffset0004";
      try {
        const date1 = new Date('');
        const result = date1.getTimezoneOffset();
        console.log(`${TAG} result:` + result);
        expect(Number.isNaN(result)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCDate0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_5800
     * @tc.desc   Test the function of the interface GetUTCDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCDate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCDate0001";
      try {
        const date1 = new Date();
        const date2 = new Date();
        const result = date1.getUTCDate();
        console.log(`${TAG} result:` + result);
        expect(result >= 1 && result <= 31).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCDate0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_5900
     * @tc.desc   Test the function of the interface GetUTCDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCDate0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCDate0002";
      try {
        const date1 = new Date('August 1, 1975 23:15:30 GMT+11:00');
        const result = date1.getUTCDate();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCDate0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_6000
     * @tc.desc   Test the function of the interface GetUTCDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCDate0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCDate0003";
      try {
        const birthday = new Date('August 19, 1975 23:15:30');
        const result = birthday.getUTCDate();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(19);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCDate0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_6100
     * @tc.desc   Test the function of the interface GetUTCDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCDate0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCDate0004";
      try {
        const birthday = new Date('August 31, 1975 23:15:30');
        const result = birthday.getUTCDate();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCDate0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_6200
     * @tc.desc   Test the function of the interface GetUTCDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCDate0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCDate0005";
      try {
        const birthday = new Date('February 31, 1975 23:15:30');
        const result = birthday.getUTCDate();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCDate0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_6300
     * @tc.desc   Test the function of the interface GetUTCDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCDate0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCDate0006";
      try {
        const birthday = new Date('April 31, 1975 23:15:30');
        const result = birthday.getUTCDate();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCDate0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_6400
     * @tc.desc   Test the function of the interface GetUTCDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCDate0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCDate0007";
      try {
        const birthday = new Date('February 29, 2024 23:15:30');
        const result = birthday.getUTCDate();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(29);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCDate0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_6500
     * @tc.desc   Test the function of the interface GetUTCDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCDate0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCDate0008";
      try {
        const birthday = new Date('August 0, 1975 23:15:30');
        const result = birthday.getUTCDate();
        console.log(`${TAG} result:` + result);
        expect(Number.isNaN(result)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCDate0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_6600
     * @tc.desc   Test the function of the interface GetUTCDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCDate0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCDate0009";
      try {
        const birthday = new Date('August 32, 1975 23:15:30');
        const result = birthday.getUTCDate();
        console.log(`${TAG} result:` + result);
        expect(Number.isNaN(result)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCDate0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_6700
     * @tc.desc   Test the function of the interface GetUTCDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCDate0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCDate0010";
      try {
        const birthday = new Date('');
        const result = birthday.getUTCDate();
        console.log(`${TAG} result:` + result);
        expect(Number.isNaN(result)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCDay0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_6800
     * @tc.desc   Test the function of the interface GetUTCDay.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCDay0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCDay0001";
      try {
        const birthday = new Date();
        const result = birthday.getUTCDay();
        console.log(`${TAG} result:` + result);
        expect([0, 1, 2, 3, 4, 5, 6]).assertContain(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCDay0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_6900
     * @tc.desc   Test the function of the interface GetUTCDay.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCDay0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCDay0002";
      try {
        const birthday = new Date('August 17, 1975 23:15:30 GMT+11:00');
        const result = birthday.getUTCDay();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCDay0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_7000
     * @tc.desc   Test the function of the interface GetUTCDay.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCDay0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCDay0003";
      try {
        const birthday = new Date('August 19, 1975 23:15:30 GMT+11:00');
        const result = birthday.getUTCDay();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCDay0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_7100
     * @tc.desc   Test the function of the interface GetUTCDay.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCDay0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCDay0004";
      try {
        const birthday = new Date('August 23, 1975 23:15:30 GMT+11:00');
        const result = birthday.getUTCDay();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCDay0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_7200
     * @tc.desc   Test the function of the interface GetUTCDay.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCDay0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCDay0005";
      try {
        const birthday = new Date('August 0, 1975 23:15:30 GMT+11:00');
        const result = birthday.getUTCDay();
        console.log(`${TAG} result:` + result);
        expect(Number.isNaN(result)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCDay0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_7300
     * @tc.desc   Test the function of the interface GetUTCDay.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCDay0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCDay0006";
      try {
        const birthday = new Date('August 32, 1975 23:15:30 GMT+11:00');
        const result = birthday.getUTCDay();
        console.log(`${TAG} result:` + result);
        expect(Number.isNaN(result)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCDay0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_7400
     * @tc.desc   Test the function of the interface GetUTCDay.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCDay0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCDay0007";
      try {
        const birthday = new Date('');
        const result = birthday.getUTCDay();
        console.log(`${TAG} result:` + result);
        expect(Number.isNaN(result)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCFullYear0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_7500
     * @tc.desc   Test the function of the interface GetUTCFullYear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCFullYear0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCFullYear0001";
      try {
        const moonLanding = new Date();
        const result = moonLanding.getUTCFullYear();
        console.log(`${TAG} result:` + result);
        expect(result > 1924 && result < 2124).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCFullYear0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_7600
     * @tc.desc   Test the function of the interface GetUTCFullYear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCFullYear0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCFullYear0002";
      try {
        const moonLanding = new Date('July 20, 50 00:20:18 GMT+11:00');
        const result = moonLanding.getUTCFullYear();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(1950);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCFullYear0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_7700
     * @tc.desc   Test the function of the interface GetUTCFullYear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCFullYear0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCFullYear0003";
      try {
        const moonLanding = new Date('July 20, 00 00:20:18 GMT+11:00');
        const result = moonLanding.getUTCFullYear();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(2000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCFullYear0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_7800
     * @tc.desc   Test the function of the interface GetUTCFullYear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCFullYear0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCFullYear0004";
      try {
        const moonLanding = new Date('July 20, 49 00:20:18 GMT+11:00');
        const result = moonLanding.getUTCFullYear();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(2049);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCFullYear0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_7900
     * @tc.desc   Test the function of the interface GetUTCFullYear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCFullYear0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCFullYear0005";
      try {
        const moonLanding = new Date('');
        const result = moonLanding.getUTCFullYear();
        console.log(`${TAG} result:` + result);
        expect(Number.isNaN(result)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCHours0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_8100
     * @tc.desc   Test the function of the interface GetUTCHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCHours0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCHours0002";
      try {
        const birthday = new Date('March 13, 08 00:20 GMT-00:00');
        const result = birthday.getUTCHours();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCHours0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_8200
     * @tc.desc   Test the function of the interface GetUTCHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCHours0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCHours0003";
      try {
        const birthday = new Date('March 13, 08 04:20 GMT-00:00');
        const result = birthday.getUTCHours();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCHours0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_8300
     * @tc.desc   Test the function of the interface GetUTCHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCHours0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCHours0004";
      try {
        const birthday = new Date('March 13, 08 23:00 GMT-00:00');
        const result = birthday.getUTCHours();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(23);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCHours0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_8400
     * @tc.desc   Test the function of the interface GetUTCHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCHours0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCHours0005";
      try {
        const birthday = new Date('');
        const result = birthday.getUTCHours();
        console.log(`${TAG} result:` + result);
        expect(Number.isNaN(result)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCMilliseconds0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_8500
     * @tc.desc   Test the function of the interface GetUTCMilliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCMilliseconds0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCMilliseconds0001";
      try {
        const moonLanding = new Date('July 20, 69 00:20:18 GMT+11:00');
        moonLanding.setMilliseconds(0);
        const result = moonLanding.getUTCMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCMilliseconds0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_8600
     * @tc.desc   Test the function of the interface GetUTCMilliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCMilliseconds0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCMilliseconds0002";
      try {
        const moonLanding = new Date('July 20, 69 00:20:18 GMT+11:00');
        moonLanding.setMilliseconds(123);
        const result = moonLanding.getUTCMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCMilliseconds0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_8700
     * @tc.desc   Test the function of the interface GetUTCMilliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCMilliseconds0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCMilliseconds0003";
      try {
        const moonLanding = new Date('July 20, 69 00:20:18 GMT+11:00');
        moonLanding.setMilliseconds(999);
        const result = moonLanding.getUTCMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(999);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCMilliseconds0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_8800
     * @tc.desc   Test the function of the interface GetUTCMilliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCMilliseconds0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCMilliseconds0004";
      try {
        const moonLanding = new Date('July 20, 69 00:20:18 GMT+11:00');
        moonLanding.setMilliseconds(1000);
        const result = moonLanding.getUTCMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCMilliseconds0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_8900
     * @tc.desc   Test the function of the interface GetUTCMilliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCMilliseconds0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCMilliseconds0005";
      try {
        const moonLanding = new Date('July 20, 69 00:20:18 GMT+11:00');
        moonLanding.setMilliseconds(-1);
        const result = moonLanding.getUTCMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(999);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCMinutes0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_9000
     * @tc.desc   Test the function of the interface GetUTCMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCMinutes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCMinutes0001";
      try {
        const birthday = new Date();
        const result = birthday.getUTCMinutes();
        console.log(`${TAG} result:` + result);
        expect(result >= 0 && result <= 59).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCMinutes0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_9100
     * @tc.desc   Test the function of the interface GetUTCMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCMinutes0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCMinutes0002";
      try {
        const birthday = new Date('March 13, 08 04:00 GMT+11:00');
        const result = birthday.getUTCMinutes();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCMinutes0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_9200
     * @tc.desc   Test the function of the interface GetUTCMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCMinutes0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCMinutes0003";
      try {
        const birthday = new Date('March 13, 08 04:20 GMT+11:00');
        const result = birthday.getUTCMinutes();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(20);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCMinutes0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_9300
     * @tc.desc   Test the function of the interface GetUTCMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCMinutes0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCMinutes0004";
      try {
        const birthday = new Date('March 13, 08 04:59 GMT+11:00');
        const result = birthday.getUTCMinutes();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(59);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCMinutes0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_9400
     * @tc.desc   Test the function of the interface GetUTCMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCMinutes0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCMinutes0005";
      try {
        const birthday = new Date('March 13, 08 04:60');
        const result = birthday.getUTCMinutes();
        console.log(`${TAG} result:` + result);
        expect(Number.isNaN(result)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCMinutes0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_9500
     * @tc.desc   Test the function of the interface GetUTCMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCMinutes0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCMinutes0006";
      try {
        const birthday = new Date('');
        const result = birthday.getUTCMinutes();
        console.log(`${TAG} result:` + result);
        expect(Number.isNaN(result)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCMonth0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_9600
     * @tc.desc   Test the function of the interface GetUTCMonth.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCMonth0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCMonth0001";
      try {
        const moonLanding = new Date();
        const result = moonLanding.getUTCMonth();
        console.log(`${TAG} result:` + result);
        expect([0,1,2,3,4,5,6,7,8,9,10,11]).assertContain(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCMonth0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_9700
     * @tc.desc   Test the function of the interface GetUTCMonth.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCMonth0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCMonth0002";
      try {
        const moonLanding = new Date('January 31, 1975, 23:15:30 GMT+11:00');
        const result = moonLanding.getUTCMonth();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCMonth0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_9800
     * @tc.desc   Test the function of the interface GetUTCMonth.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCMonth0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCMonth0003";
      try {
        const moonLanding = new Date('July 31, 1975, 23:15:30 GMT+11:00');
        const result = moonLanding.getUTCMonth();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCMonth0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_9900
     * @tc.desc   Test the function of the interface GetUTCMonth.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCMonth0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCMonth0004";
      try {
        const moonLanding = new Date('December 31, 1975, 23:15:30 GMT+11:00');
        const result = moonLanding.getUTCMonth();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(11);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCMonth0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_10000
     * @tc.desc   Test the function of the interface GetUTCMonth.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCMonth0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCMonth0005";
      try {
        const moonLanding = new Date('');
        const result = moonLanding.getUTCMonth();
        console.log(`${TAG} result:` + result);
        expect(Number.isNaN(result)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCSeconds0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_10100
     * @tc.desc   Test the function of the interface GetUTCSeconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCSeconds0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCSeconds0001";
      try {
        const moonLanding = new Date();
        const result = moonLanding.getSeconds();
        console.log(`${TAG} result:` + result);
        expect(result>=0&& result<=59).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCSeconds0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_10200
     * @tc.desc   Test the function of the interface GetUTCSeconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCSeconds0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCSeconds0002";
      try {
        const moonLanding = new Date('January 20, 1969, 20:18:00 UTC');
        const result = moonLanding.getSeconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCSeconds0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_10300
     * @tc.desc   Test the function of the interface GetUTCSeconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCSeconds0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCSeconds0003";
      try {
        const moonLanding = new Date('July 20, 1969, 20:18:18 UTC');
        const result = moonLanding.getSeconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(18);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCSeconds0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_10400
     * @tc.desc   Test the function of the interface GetUTCSeconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCSeconds0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCSeconds0004";
      try {
        const moonLanding = new Date('December 20, 1969, 20:18:59 UTC');
        const result = moonLanding.getSeconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(59);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetUTCSeconds0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_10500
     * @tc.desc   Test the function of the interface GetUTCSeconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUTCSeconds0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUTCSeconds0005";
      try {
        const moonLanding = new Date('');
        const result = moonLanding.getSeconds();
        console.log(`${TAG} result:` + result);
        expect(Number.isNaN(result)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetDate0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_10600
     * @tc.desc   Test the function of the interface SetDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetDate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetDate0001";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setDate(0);
        const result = event.getDate();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetDate0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_10700
     * @tc.desc   Test the function of the interface SetDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetDate0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetDate0002";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setDate(1);
        const result = event.getDate();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetDate0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_10800
     * @tc.desc   Test the function of the interface SetDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetDate0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetDate0003";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setDate(14);
        const result = event.getDate();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(14);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetDate0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_10900
     * @tc.desc   Test the function of the interface SetDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetDate0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetDate0004";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setDate(31);
        const result = event.getDate();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetDate0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_11000
     * @tc.desc   Test the function of the interface SetDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetDate0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetDate0005";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setDate(32);
        const result = event.getDate();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetDate0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_11100
     * @tc.desc   Test the function of the interface SetDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetDate0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetDate0006";
      try {
        const event = new Date('February 19, 1975 23:15:30');
        event.setDate(28);
        const result = event.getDate();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(28);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetDate0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_11200
     * @tc.desc   Test the function of the interface SetDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetDate0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetDate0007";
      try {
        const event = new Date('February 19, 1975 23:15:30');
        event.setDate(29);
        const result = event.getDate();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetDate0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_11300
     * @tc.desc   Test the function of the interface SetDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetDate0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetDate0008";
      try {
        const event = new Date('June 19, 1975 23:15:30');
        event.setDate(30);
        const result = event.getDate();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(30);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetDate0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_11400
     * @tc.desc   Test the function of the interface SetDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetDate0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetDate0009";
      try {
        const event = new Date('June 19, 1975 23:15:30');
        event.setDate(31);
        const result = event.getDate();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetFullYear0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_11500
     * @tc.desc   Test the function of the interface SetFullYear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetFullYear0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetFullYear0001";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setFullYear(0);
        const result = event.getFullYear();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetFullYear0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_11600
     * @tc.desc   Test the function of the interface SetFullYear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetFullYear0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetFullYear0002";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setFullYear(1969);
        const result = event.getFullYear();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(1969);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetFullYear0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_11700
     * @tc.desc   Test the function of the interface SetFullYear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetFullYear0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetFullYear0003";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setFullYear(9999);
        const result = event.getFullYear();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(9999);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetFullYear0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_11800
     * @tc.desc   Test the function of the interface SetFullYear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetFullYear0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetFullYear0004";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setFullYear(1999, 11, 3);
        const result = event.getFullYear();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(1999);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetFullYear0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_11900
     * @tc.desc   Test the function of the interface SetFullYear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetFullYear0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetFullYear0005";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setFullYear(1999, 12, 30);
        const result = event.getFullYear();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(2000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetFullYear0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_12000
     * @tc.desc   Test the function of the interface SetFullYear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetFullYear0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetFullYear0006";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setFullYear(1999, 11, 32);
        const result = event.getFullYear();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(2000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetHours0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_12100
     * @tc.desc   Test the function of the interface SetHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetHours0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetHours0001";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setHours(-1);
        const result = "Mon Aug 18 1975 23:15:30 GMT+0800";
        console.log(`${TAG} event:` + event + ',result:' + result);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetHours0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_122000
     * @tc.desc   Test the function of the interface SetHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetHours0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetHours0002";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setHours(0);
        const result = "Tue Aug 19 1975 00:15:30 GMT+0800";
        console.log(`${TAG} event:` + event + ',result:' + result);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetHours0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_123000
     * @tc.desc   Test the function of the interface SetHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetHours0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetHours0003";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setHours(23);
        const result = "Tue Aug 19 1975 23:15:30 GMT+0800";
        console.log(`${TAG} event:` + event + ',result:' + result);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetHours0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_124000
     * @tc.desc   Test the function of the interface SetHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetHours0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetHours0004";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setHours(24);
        const result = "Wed Aug 20 1975 00:15:30 GMT+0800";
        console.log(`${TAG} event:` + event + ',result:' + result);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetHours0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_125000
     * @tc.desc   Test the function of the interface SetHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetHours0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetHours0005";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setHours(1, -1);
        const result = "Tue Aug 19 1975 00:59:30 GMT+0800";
        console.log(`${TAG} event:` + event + ',result:' + result);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetHours0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_126000
     * @tc.desc   Test the function of the interface SetHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetHours0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetHours0006";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setHours(1, 0);
        const result = "Tue Aug 19 1975 01:00:30 GMT+0800";
        console.log(`${TAG} event:` + event + ',result:' + result);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetHours0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_127000
     * @tc.desc   Test the function of the interface SetHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetHours0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetHours0007";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setHours(1, 59);
        const result = "Tue Aug 19 1975 01:59:30 GMT+0800";
        console.log(`${TAG} event:` + event + ',result:' + result);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetHours0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_128000
     * @tc.desc   Test the function of the interface SetHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetHours0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetHours0008";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setHours(1, 60);
        const result = "Tue Aug 19 1975 02:00:30 GMT+0800";
        console.log(`${TAG} event:` + event + ',result:' + result);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetHours0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_129000
     * @tc.desc   Test the function of the interface SetHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetHours0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetHours0009";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setHours(1, 2, -1);
        const result = "Tue Aug 19 1975 01:01:59 GMT+0800";
        console.log(`${TAG} event:` + event + ',result:' + result);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetHours0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_130000
     * @tc.desc   Test the function of the interface SetHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetHours0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetHours0010";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setHours(1, 2, 0);
        const result = "Tue Aug 19 1975 01:02:00 GMT+0800";
        console.log(`${TAG} event:` + event + ',result:' + result);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetHours0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_131000
     * @tc.desc   Test the function of the interface SetHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetHours0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetHours0011";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setHours(1, 2, 59);
        const result = "Tue Aug 19 1975 01:02:59 GMT+0800";
        console.log(`${TAG} event:` + event + ',result:' + result);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetHours0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_132000
     * @tc.desc   Test the function of the interface SetHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetHours0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetHours0012";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setHours(1, 2, 60);
        const result = "Tue Aug 19 1975 01:03:00 GMT+0800";
        console.log(`${TAG} event:` + event + ',result:' + result);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetHours0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_133000
     * @tc.desc   Test the function of the interface SetHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetHours0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetHours0013";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setHours(1, 2, 3, -1);
        const result = event.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(999);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetHours0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_134000
     * @tc.desc   Test the function of the interface SetHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetHours0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetHours0014";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setHours(1, 2, 3, 0);
        const result = event.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetHours0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_135000
     * @tc.desc   Test the function of the interface SetHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetHours0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetHours0015";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setHours(1, 2, 3, 999);
        const result = event.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(999);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetHours0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_136000
     * @tc.desc   Test the function of the interface SetHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetHours0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetHours0016";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setHours(1, 2, 3, 1000);
        const result = event.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetMilliseconds0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_137000
     * @tc.desc   Test the function of the interface SetMilliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetMilliseconds0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetMilliseconds0001";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMilliseconds(-1);
        const result = event.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(999);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetMilliseconds0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_138000
     * @tc.desc   Test the function of the interface SetMilliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetMilliseconds0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetMilliseconds0002";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMilliseconds(0);
        const result = event.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetMilliseconds0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_139000
     * @tc.desc   Test the function of the interface SetMilliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetMilliseconds0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetMilliseconds0003";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMilliseconds(456);
        const result = event.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(456);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetMilliseconds0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_140000
     * @tc.desc   Test the function of the interface SetMilliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetMilliseconds0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetMilliseconds0004";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMilliseconds(999);
        const result = event.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(999);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetMilliseconds0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_141000
     * @tc.desc   Test the function of the interface SetMilliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetMilliseconds0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetMilliseconds0005";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMilliseconds(1000);
        const result = event.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetMinutes0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_142000
     * @tc.desc   Test the function of the interface SetMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetMinutes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetMinutes0001";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMinutes(-1);
        const result = "Tue Aug 19 1975 22:59:30 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetMinutes0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_143000
     * @tc.desc   Test the function of the interface SetMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetMinutes0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetMinutes0002";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMinutes(0);
        const result = "Tue Aug 19 1975 23:00:30 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetMinutes0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_144000
     * @tc.desc   Test the function of the interface SetMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetMinutes0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetMinutes0003";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMinutes(59);
        const result = "Tue Aug 19 1975 23:59:30 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetMinutes0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_145000
     * @tc.desc   Test the function of the interface SetMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetMinutes0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetMinutes0004";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMinutes(60);
        const result = "Wed Aug 20 1975 00:00:30 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetMinutes0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_146000
     * @tc.desc   Test the function of the interface SetMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetMinutes0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetMinutes0005";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMinutes(2, -1);
        const result = "Tue Aug 19 1975 23:01:59 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetMinutes0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_147000
     * @tc.desc   Test the function of the interface SetMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetMinutes0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetMinutes0006";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMinutes(2, 0);
        const result = "Tue Aug 19 1975 23:02:00 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetMinutes0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_148000
     * @tc.desc   Test the function of the interface SetMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetMinutes0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetMinutes0007";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMinutes(2, 59);
        const result = "Tue Aug 19 1975 23:02:59 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetMinutes0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_149000
     * @tc.desc   Test the function of the interface SetMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetMinutes0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetMinutes0008";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMinutes(2, 60);
        const result = "Tue Aug 19 1975 23:03:00 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetMinutes0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_150000
     * @tc.desc   Test the function of the interface SetMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetMinutes0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetMinutes0009";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMinutes(2, 3, -1);
        const result = event.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(999);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetMinutes0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_151000
     * @tc.desc   Test the function of the interface SetMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetMinutes0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetMinutes0010";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMinutes(2, 3, 0);
        const result = event.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetMinutes0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_152000
     * @tc.desc   Test the function of the interface SetMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetMinutes0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetMinutes0011";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMinutes(2, 3, 999);
        const result = event.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(999);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetMinutes0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_153000
     * @tc.desc   Test the function of the interface SetMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetMinutes0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetMinutes0012";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMinutes(2, 3, 1000);
        const result = event.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetMonth0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_154000
     * @tc.desc   Test the function of the interface SetMonth.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetMonth0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetMonth0001";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMonth(-1);
        const result = event.getMonth();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(11);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetMonth0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_155000
     * @tc.desc   Test the function of the interface SetMonth.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetMonth0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetMonth0002";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMonth(0);
        const result = event.getMonth();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetMonth0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_156000
     * @tc.desc   Test the function of the interface SetMonth.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetMonth0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetMonth0003";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMonth(3);
        const result = event.getMonth();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetMonth0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_157000
     * @tc.desc   Test the function of the interface SetMonth.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetMonth0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetMonth0004";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMonth(11);
        const result = event.getMonth();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(11);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetMonth0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_158000
     * @tc.desc   Test the function of the interface SetMonth.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetMonth0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetMonth0005";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMonth(12);
        const result = event.getMonth();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetMonth0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_159000
     * @tc.desc   Test the function of the interface SetMonth.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetMonth0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetMonth0006";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMonth(8, 0);
        const result = 'Sun Aug 31 1975 23:15:30 GMT+0800';
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetMonth0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_160000
     * @tc.desc   Test the function of the interface SetMonth.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetMonth0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetMonth0007";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMonth(8, 1);
        const result = 'Mon Sep 01 1975 23:15:30 GMT+0800';
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetMonth0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_161000
     * @tc.desc   Test the function of the interface SetMonth.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetMonth0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetMonth0008";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMonth(9, 16);
        const result = 'Thu Oct 16 1975 23:15:30 GMT+0800';
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetMonth0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_162000
     * @tc.desc   Test the function of the interface SetMonth.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetMonth0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetMonth0009";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMonth(7, 31);
        const result = 'Sun Aug 31 1975 23:15:30 GMT+0800';
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetMonth0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_163000
     * @tc.desc   Test the function of the interface SetMonth.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetMonth0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetMonth0010";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMonth(7, 32);
        const result = 'Mon Sep 01 1975 23:15:30 GMT+0800';
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetSeconds0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_164000
     * @tc.desc   Test the function of the interface SetSeconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSeconds0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetSeconds0001";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setSeconds(-1);
        const result = 'Tue Aug 19 1975 23:14:59 GMT+0800';
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetSeconds0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_165000
     * @tc.desc   Test the function of the interface SetSeconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSeconds0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetSeconds0002";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setSeconds(0);
        const result = 'Tue Aug 19 1975 23:15:00 GMT+0800';
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetSeconds0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_166000
     * @tc.desc   Test the function of the interface SetSeconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSeconds0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetSeconds0003";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setSeconds(59);
        const result = "Tue Aug 19 1975 23:15:59 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetSeconds0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_167000
     * @tc.desc   Test the function of the interface SetSeconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSeconds0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetSeconds0004";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setSeconds(60);
        const result = "Tue Aug 19 1975 23:16:00 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetSeconds0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_168000
     * @tc.desc   Test the function of the interface SetSeconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSeconds0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetSeconds0005";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setSeconds(3, -1);
        const result = event.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(999);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetSeconds0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_169000
     * @tc.desc   Test the function of the interface SetSeconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSeconds0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetSeconds0006";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setSeconds(3, 0);
        const result = event.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetSeconds0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_170000
     * @tc.desc   Test the function of the interface SetSeconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSeconds0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetSeconds0007";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setSeconds(3, 999);
        const result = event.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(999);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetSeconds0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_171000
     * @tc.desc   Test the function of the interface SetSeconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSeconds0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetSeconds0008";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setSeconds(3, 1000);
        const result = event.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetTime0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_172000
     * @tc.desc   Test the function of the interface SetTime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetTime0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetTime0001";
      try {
        const launchDate = new Date('July 1, 1999, 12:00:00');
        const futureDate = new Date();
        futureDate.setTime(launchDate.getTime());
        const result = "Thu Jul 01 1999 12:00:00 GMT+0800";
        console.log(`${TAG} result:` + futureDate);
        expect(futureDate.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetTime0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_173000
     * @tc.desc   Test the function of the interface SetTime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetTime0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetTime0002";
      try {
        const launchDate = new Date('July 1, 1999, 12:00:00');
        const futureDate = new Date();
        futureDate.setTime(launchDate.getTime());
        const fiveMinutesInMillis = 5 * 60 * 1000;
        futureDate.setTime(futureDate.getTime() + fiveMinutesInMillis);
        const result = "Thu Jul 01 1999 12:05:00 GMT+0800";
        console.log(`${TAG} result:` + futureDate);
        expect(futureDate.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetTime0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_174000
     * @tc.desc   Test the function of the interface SetTime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetTime0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetTime0003";
      try {
        const launchDate = new Date('July 1, 1999, 12:00:00');
        const futureDate = new Date();
        futureDate.setTime(launchDate.getTime());
        const result = "Thu Jul 01 1999 12:00:00 GMT+0800";
        console.log(`${TAG} result:` + futureDate);
        expect(futureDate.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetTime0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_175000
     * @tc.desc   Test the function of the interface SetTime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetTime0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetTime0004";
      try {
        const launchDate = new Date('July 1, 1999, 12:00:00');
        const futureDate = new Date();
        futureDate.setTime(launchDate.getTime());
        const fiveMinutesInMillis = 5 * 60 * 1000;
        futureDate.setTime(futureDate.getTime() - fiveMinutesInMillis);
        const result = "Thu Jul 01 1999 11:55:00 GMT+0800";
        console.log(`${TAG} result:` + futureDate);
        expect(futureDate.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetTime0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_176000
     * @tc.desc   Test the function of the interface SetTime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetTime0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetTime0005";
      try {
        const launchDate = new Date('July 1, 1999, 12:00:00');
        const futureDate = new Date();
        futureDate.setTime(999);
        const result = "Thu Jan 01 1970 08:00:00 GMT+0800";
        console.log(`${TAG} result:` + futureDate);
        expect(futureDate.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetTime0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_177000
     * @tc.desc   Test the function of the interface SetTime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetTime0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetTime0006";
      try {
        const launchDate = new Date('July 1, 1999, 12:00:00');
        const futureDate = new Date();
        futureDate.setTime(1000);
        const result = "Thu Jan 01 1970 08:00:01 GMT+0800";
        console.log(`${TAG} result:` + futureDate);
        expect(futureDate.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetUTCDate0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_178000
     * @tc.desc   Test the function of the interface SetUTCDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCDate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCDate0001";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCDate(0);
        const result = event.getUTCDate();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetUTCDate0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_179000
     * @tc.desc   Test the function of the interface SetUTCDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCDate0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCDate0002";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCDate(1);
        const result = event.getUTCDate();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetUTCDate0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_180000
     * @tc.desc   Test the function of the interface SetUTCDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCDate0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCDate0003";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCDate(14);
        const result = event.getUTCDate();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(14);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetUTCDate0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_181000
     * @tc.desc   Test the function of the interface SetUTCDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCDate0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCDate0004";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCDate(31);
        const result = event.getUTCDate();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetUTCDate0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_182000
     * @tc.desc   Test the function of the interface SetUTCDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCDate0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCDate0005";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCDate(32);
        const result = event.getUTCDate();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetUTCDate0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_183000
     * @tc.desc   Test the function of the interface SetUTCDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCDate0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCDate0006";
      try {
        const event = new Date('February 19, 1975 23:15:30');
        event.setUTCDate(28);
        const result = event.getUTCDate();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(28);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetUTCDate0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_184000
     * @tc.desc   Test the function of the interface SetUTCDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCDate0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCDate0007";
      try {
        const event = new Date('February 19, 1975 23:15:30');
        event.setUTCDate(29);
        const result = event.getUTCDate();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetUTCDate0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_185000
     * @tc.desc   Test the function of the interface SetUTCDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCDate0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCDate0008";
      try {
        const event = new Date('June 19, 1975 23:15:30');
        event.setUTCDate(30);
        const result = event.getUTCDate();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(30);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCDate0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_186000
     * @tc.desc   Test the function of the interface SetUTCDate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCDate0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCDate0009";
      try {
        const event = new Date('June 19, 1975 23:15:30');
        event.setUTCDate(31);
        const result = event.getUTCDate();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCFullYear0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_187000
     * @tc.desc   Test the function of the interface SetUTCFullYear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCFullYear0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCFullYear0001";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCFullYear(0);
        const result = event.getUTCFullYear();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCFullYear0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_188000
     * @tc.desc   Test the function of the interface SetUTCFullYear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCFullYear0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCFullYear0002";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCFullYear(1969);
        const result = event.getUTCFullYear();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(1969);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCFullYear0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_189000
     * @tc.desc   Test the function of the interface SetUTCFullYear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCFullYear0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCFullYear0003";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCFullYear(9999);
        const result = event.getUTCFullYear();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(9999);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCFullYear0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_190000
     * @tc.desc   Test the function of the interface SetUTCFullYear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCFullYear0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCFullYear0004";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCFullYear(1999, 11, 3);
        const result = event.getUTCFullYear();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(1999);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCFullYear0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_191000
     * @tc.desc   Test the function of the interface SetUTCFullYear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCFullYear0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCFullYear0005";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCFullYear(1999, 12, 30);
        const result = event.getUTCFullYear();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(2000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCFullYear0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_192000
     * @tc.desc   Test the function of the interface SetUTCFullYear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCFullYear0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCFullYear0006";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCFullYear(1999, 11, 32);
        const result = event.getUTCFullYear();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(2000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCHours0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_193000
     * @tc.desc   Test the function of the interface SetUTCHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCHours0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCHours0001";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCHours(-1);
        const result = "Tue Aug 19 1975 07:15:30 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCHours0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_194000
     * @tc.desc   Test the function of the interface SetUTCHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCHours0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCHours0002";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCHours(0);
        const result = "Tue Aug 19 1975 08:15:30 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCHours0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_195000
     * @tc.desc   Test the function of the interface SetUTCHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCHours0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCHours0003";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCHours(23);
        const result = "Wed Aug 20 1975 07:15:30 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCHours0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_196000
     * @tc.desc   Test the function of the interface SetUTCHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCHours0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCHours0004";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCHours(24);
        const result = "Wed Aug 20 1975 08:15:30 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCHours0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_197000
     * @tc.desc   Test the function of the interface SetUTCHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCHours0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCHours0005";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCHours(1, -1);
        const result = "Tue Aug 19 1975 08:59:30 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCHours0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_198000
     * @tc.desc   Test the function of the interface SetUTCHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCHours0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCHours0006";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCHours(1, 0);
        const result = "Tue Aug 19 1975 09:00:30 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCHours0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_19900
     * @tc.desc   Test the function of the interface SetUTCHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCHours0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCHours0007";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCHours(1, 59);
        const result = "Tue Aug 19 1975 09:59:30 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCHours0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_20000
     * @tc.desc   Test the function of the interface SetUTCHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCHours0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCHours0008";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCHours(1, 60);
        const result = "Tue Aug 19 1975 10:00:30 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCHours0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_20100
     * @tc.desc   Test the function of the interface SetUTCHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCHours0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCHours0009";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCHours(1, 2, -1);
        const result = "Tue Aug 19 1975 09:01:59 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCHours0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_20200
     * @tc.desc   Test the function of the interface SetUTCHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCHours0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCHours0010";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCHours(1, 2, 0);
        const result = "Tue Aug 19 1975 09:02:00 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCHours0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_20300
     * @tc.desc   Test the function of the interface SetUTCHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCHours0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCHours0011";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCHours(1, 2, 59);
        const result = "Tue Aug 19 1975 09:02:59 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCHours0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_20400
     * @tc.desc   Test the function of the interface SetUTCHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCHours0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCHours0012";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCHours(1, 2, 60);
        const result = "Tue Aug 19 1975 09:03:00 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCHours0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_20500
     * @tc.desc   Test the function of the interface SetUTCHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCHours0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCHours0013";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCHours(1, 2, 3, -1);
        const result = event.getUTCMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(999);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCHours0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_20600
     * @tc.desc   Test the function of the interface SetUTCHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCHours0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCHours0014";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCHours(1, 2, 3, 0);
        const result = event.getUTCMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCHours0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_20700
     * @tc.desc   Test the function of the interface SetUTCHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCHours0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCHours0015";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCHours(1, 2, 3, 999);
        const result = event.getUTCMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(999);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCHours0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_20800
     * @tc.desc   Test the function of the interface SetUTCHours.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCHours0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCHours0016";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCHours(1, 2, 3, 1000);
        const result = event.getUTCMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCMilliseconds0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_20900
     * @tc.desc   Test the function of the interface SetUTCMilliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCMilliseconds0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCMilliseconds0001";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCMilliseconds(-1);
        const result = event.getUTCMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(999);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCMilliseconds0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_21000
     * @tc.desc   Test the function of the interface SetUTCMilliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCMilliseconds0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCMilliseconds0002";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCMilliseconds(0);
        const result = event.getUTCMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCMilliseconds0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_21100
     * @tc.desc   Test the function of the interface SetUTCMilliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCMilliseconds0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCMilliseconds0003";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCMilliseconds(456);
        const result = event.getUTCMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(456);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCMilliseconds0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_21200
     * @tc.desc   Test the function of the interface SetUTCMilliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCMilliseconds0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCMilliseconds0004";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCMilliseconds(999);
        const result = event.getUTCMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(999);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCMilliseconds0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_21300
     * @tc.desc   Test the function of the interface SetUTCMilliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCMilliseconds0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCMilliseconds0005";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCMilliseconds(1000);
        const result = event.getUTCMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCMinutes0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_21400
     * @tc.desc   Test the function of the interface SetUTCMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCMinutes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCMinutes0001";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCMinutes(-1);
        const result = "Tue Aug 19 1975 22:59:30 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCMinutes0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_21500
     * @tc.desc   Test the function of the interface SetUTCMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCMinutes0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCMinutes0002";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCMinutes(0);
        const result = "Tue Aug 19 1975 23:00:30 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCMinutes0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_21600
     * @tc.desc   Test the function of the interface SetUTCMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCMinutes0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCMinutes0003";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCMinutes(59);
        const result = "Tue Aug 19 1975 23:59:30 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCMinutes0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_21700
     * @tc.desc   Test the function of the interface SetUTCMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCMinutes0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCMinutes0004";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCMinutes(60);
        const result = "Wed Aug 20 1975 00:00:30 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCMinutes0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_21800
     * @tc.desc   Test the function of the interface SetUTCMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCMinutes0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCMinutes0005";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCMinutes(2, -1);
        const result = "Tue Aug 19 1975 23:01:59 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCMinutes0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_21900
     * @tc.desc   Test the function of the interface SetUTCMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCMinutes0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCMinutes0006";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCMinutes(2, 0);
        const result = "Tue Aug 19 1975 23:02:00 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCMinutes0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_22000
     * @tc.desc   Test the function of the interface SetUTCMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCMinutes0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCMinutes0007";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCMinutes(2, 59);
        const result = "Tue Aug 19 1975 23:02:59 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCMinutes0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_221000
     * @tc.desc   Test the function of the interface SetUTCMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCMinutes0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCMinutes0008";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCMinutes(2, 60);
        const result = "Tue Aug 19 1975 23:03:00 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCMinutes0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_222000
     * @tc.desc   Test the function of the interface SetUTCMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCMinutes0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCMinutes0009";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCMinutes(2, 3, -1);
        const result = event.getUTCMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(999);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCMinutes0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_223000
     * @tc.desc   Test the function of the interface SetUTCMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCMinutes0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCMinutes0010";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCMinutes(2, 3, 0);
        const result = event.getUTCMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCMinutes0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_224000
     * @tc.desc   Test the function of the interface SetUTCMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCMinutes0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCMinutes0011";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCMinutes(2, 3, 999);
        const result = event.getUTCMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(999);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCMinutes0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_225000
     * @tc.desc   Test the function of the interface SetUTCMinutes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCMinutes0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCMinutes0012";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCMinutes(2, 3, 1000);
        const result = event.getUTCMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCMonth0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_226000
     * @tc.desc   Test the function of the interface SetUTCMonth.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCMonth0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCMonth0001";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCMonth(-1);
        const result = event.getUTCMonth();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(11);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCMonth0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_227000
     * @tc.desc   Test the function of the interface SetUTCMonth.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCMonth0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCMonth0002";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCMonth(0);
        const result = event.getUTCMonth();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCMonth0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_228000
     * @tc.desc   Test the function of the interface SetUTCMonth.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCMonth0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCMonth0003";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCMonth(3);
        const result = event.getUTCMonth();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCMonth0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_229000
     * @tc.desc   Test the function of the interface SetUTCMonth.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCMonth0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCMonth0004";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCMonth(11);
        const result = event.getUTCMonth();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(11);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCMonth0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_230000
     * @tc.desc   Test the function of the interface SetUTCMonth.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCMonth0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCMonth0005";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCMonth(12);
        const result = event.getUTCMonth();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCMonth0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_231000
     * @tc.desc   Test the function of the interface SetUTCMonth.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCMonth0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCMonth0006";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCMonth(8, 0);
        const result = "Sun Aug 31 1975 23:15:30 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCMonth0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_232000
     * @tc.desc   Test the function of the interface SetUTCMonth.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCMonth0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCMonth0007";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCMonth(8, 1);
        const result = "Mon Sep 01 1975 23:15:30 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCMonth0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_233000
     * @tc.desc   Test the function of the interface SetUTCMonth.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCMonth0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCMonth0008";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCMonth(9, 16);
        const result = "Thu Oct 16 1975 23:15:30 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCMonth0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_234000
     * @tc.desc   Test the function of the interface SetUTCMonth.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCMonth0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCMonth0009";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCMonth(7, 31);
        const result = "Sun Aug 31 1975 23:15:30 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCMonth0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_235000
     * @tc.desc   Test the function of the interface SetUTCMonth.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCMonth0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCMonth0010";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCMonth(7, 32);
        const result = "Mon Sep 01 1975 23:15:30 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCSeconds0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_236000
     * @tc.desc   Test the function of the interface SetUTCSeconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCSeconds0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCSeconds0001";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCSeconds(-1);
        const result = "Tue Aug 19 1975 23:14:59 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCSeconds0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_237000
     * @tc.desc   Test the function of the interface SetUTCSeconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCSeconds0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCSeconds0002";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCSeconds(0);
        const result = "Tue Aug 19 1975 23:15:00 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCSeconds0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_238000
     * @tc.desc   Test the function of the interface SetUTCSeconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCSeconds0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCSeconds0003";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCSeconds(59);
        const result = "Tue Aug 19 1975 23:15:59 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCSeconds0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_239000
     * @tc.desc   Test the function of the interface SetUTCSeconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCSeconds0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCSeconds0004";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCSeconds(60);
        const result = "Tue Aug 19 1975 23:16:00 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCSeconds0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_240000
     * @tc.desc   Test the function of the interface SetUTCSeconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCSeconds0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCSeconds0005";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCSeconds(3, -1);
        const result = event.getUTCMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(999);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCSeconds0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_241000
     * @tc.desc   Test the function of the interface SetUTCSeconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCSeconds0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCSeconds0006";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCSeconds(3, 0);
        const result = event.getUTCMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCSeconds0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_242000
     * @tc.desc   Test the function of the interface SetUTCSeconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCSeconds0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCSeconds0007";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCSeconds(3, 999);
        const result = event.getUTCMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(999);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetUTCSeconds0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_24300
     * @tc.desc   Test the function of the interface SetUTCSeconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUTCSeconds0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetUTCSeconds0008";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setUTCSeconds(3, 1000);
        const result = event.getUTCMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testDateToDateString0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_24400
     * @tc.desc   Test the function of the Interface toDateString().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToDateString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToDateString0001";
      try {
        const event = new Date(1993, 6, 28, 14, 39, 7);
        expect(event.toString()).assertEqual("Wed Jul 28 1993 14:39:07 GMT+0800");
        expect(event.toDateString()).assertEqual("Wed Jul 28 1993");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testDateToDateString0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_24500
     * @tc.desc   Test the function of the Interface toDateString().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToDateString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToDateString0002";
      try {
        const event = new Date(1993, 6, 28);
        expect(event.toDateString()).assertEqual("Wed Jul 28 1993");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testDateToDateString0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_24600
     * @tc.desc   Test the function of the Interface toDateString().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToDateString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToDateString0003";
      try {
        const event = new Date();
        const now = new Date();
        const eventTimeString = event.toString();
        const nowTimeString = now.toString();
        const eventDateString = event.toDateString();
        const nowDateString = now.toDateString();
        expect(eventTimeString.includes(nowTimeString.slice(0, 24))).assertTrue();
        expect(eventDateString).assertEqual(nowDateString);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testDateToDateString0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_24700
     * @tc.desc   Test the function of the Interface toDateString().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToDateString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToDateString0004";
      try {
        const event = new Date("");
        expect(event.toString()).assertEqual("Invalid Date");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testDateToDateString0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_24800
     * @tc.desc   Test the function of the Interface toDateString().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToDateString0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToDateString0005";
      try {
        const event = new Date(1996, 1, 29);
        expect(event.toDateString()).assertEqual("Thu Feb 29 1996");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testDateToDateString0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_24900
     * @tc.desc   Test the function of the Interface toDateString().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToDateString0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToDateString0006";
      try {
        const event = new Date(1997, 1, 29);
        expect(event.toDateString()).assertEqual("Sat Mar 01 1997");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testDateToDateString0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_25000
     * @tc.desc   Test the function of the Interface toDateString().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToDateString0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToDateString0007";
      try {
        const event = new Date(2024, 7, 32);
        expect(event.toDateString()).assertEqual("Sun Sep 01 2024");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testDateToDateString0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_25100
     * @tc.desc   Test the function of the Interface toDateString().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToDateString0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToDateString0008";
      try {
        const event = new Date(2024, 8, 31);
        expect(event.toDateString()).assertEqual("Tue Oct 01 2024");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testDateToISOString0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_25200
     * @tc.desc   Test the function of the Interface toISOString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToISOString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testDateToISOString0001';
      try {
        const event = new Date('05 October 2011 14:48 UTC');
        expect(event.toString()).assertEqual("Wed Oct 05 2011 22:48:00 GMT+0800");
        expect(event.toISOString()).assertEqual("2011-10-05T14:48:00.000Z");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testDateToISOString0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_25300
     * @tc.desc   Test the function of the Interface toISOString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToISOString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testDateToISOString0002';
      try {
        const event = new Date();
        const now = event.toISOString();
        const expected = event.toISOString();
        expect(now).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testDateToISOString0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_25400
     * @tc.desc   Test the function of the Interface toISOString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToISOString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testDateToISOString0003';
      try {
        const event = new Date(0);
        expect(event.toISOString()).assertEqual("1970-01-01T00:00:00.000Z");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testDateToISOString0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_25500
     * @tc.desc   Test the function of the Interface ToISOString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToISOString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testDateToISOString0004';
      try {
        const event = new Date('');
        event.toISOString();
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('range error');
      }
    });

    /**
     * @tc.name   testDateToISOString0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_25600
     * @tc.desc   Test the function of the Interface ToISOString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToISOString0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testDateToISOString0005';
      try {
        const event = new Date('32 October 2011 14:48 UTC');
        event.toISOString();
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('range error');
      }
    });

    /**
     * @tc.name   testDateToISOString0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_25700
     * @tc.desc   Test the function of the Interface ToISOString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToISOString0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testDateToISOString0006';
      try {
        const event = new Date('05 October 2011 14:48:01.123 UTC');
        expect(event.toISOString()).assertEqual("2011-10-05T14:48:01.123Z");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testDateToISOString0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_25800
     * @tc.desc   Test the function of the Interface ToISOString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToISOString0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testDateToISOString0007';
      try {
        const event = new Date('05 October 2011 14:48:02 UTC');
        expect(event.toISOString()).assertEqual("2011-10-05T14:48:02.000Z");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testDateToISOString0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_25900
     * @tc.desc   Test the function of the Interface ToISOString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToISOString0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testDateToISOString0008';
      try {
        const event = new Date('05 October 2011 14:48:03.1 UTC');
        expect(event.toISOString()).assertEqual("2011-10-05T14:48:03.100Z");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testDateToJSON0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_26000
     * @tc.desc   Test the function of the Interface toJSON().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testDateToJSON0001",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToJSON0001";
      try {
        const event = new Date(1993, 6, 28, 14, 39, 7);
        expect(event.toJSON()).assertEqual('1993-07-28T06:39:07.000Z');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testDateToJSON0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_26100
     * @tc.desc   Test the function of the Interface toJSON().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testDateToJSON0002",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToJSON0002";
      try {
        const event = new Date(1993, 6, 28);
        expect(event.toJSON()).assertEqual('1993-07-27T16:00:00.000Z');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testDateToJSON0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_26200
     * @tc.desc   Test the function of the Interface toJSON().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testDateToJSON0003",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToJSON0003";
      try {
        const event = new Date();
        const expectedISOString = event.toISOString();
        expect(event.toJSON()).assertEqual(expectedISOString);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testDateToJSON0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_26300
     * @tc.desc   Test the function of the Interface toJSON().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testDateToJSON0004",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToJSON0004";
      try {
        const event = new Date("");
        expect(event.toJSON()).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testDateToJSON0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_26400
     * @tc.desc   Test the function of the Interface toJSON().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testDateToJSON0005",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToJSON0005";
      try {
        const event = new Date(1996, 1, 29);
        expect(event.toJSON()).assertEqual("1996-02-28T16:00:00.000Z");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testDateToJSON0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_26500
     * @tc.desc   Test the function of the Interface toJSON().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testDateToJSON0006",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToJSON0006";
      try {
        const event = new Date(1997, 1, 29);
        expect(event.toJSON()).assertEqual("1997-02-28T16:00:00.000Z");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testDateToJSON0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_26600
     * @tc.desc   Test the function of the Interface toJSON().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testDateToJSON0007",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToJSON0007";
      try {
        const event = new Date(2024, 7, 32);
        expect(event.toJSON()).assertEqual("2024-08-31T16:00:00.000Z");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testDateToJSON0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_26700
     * @tc.desc   Test the function of the Interface toJSON().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testDateToJSON0008",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToJSON0008";
      try {
        const event = new Date(2024, 8, 31);
        expect(event.toJSON()).assertEqual("2024-09-30T16:00:00.000Z");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testDateToLocaleDateString0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_26800
     * @tc.desc   Test the function of the Interface Date.toLocaleDateString()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testDateToLocaleDateString0001",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToLocaleDateString0001";
      try {
        const event = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));
        expect(event.toLocaleDateString()).assertEqual('12/20/2012');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testDateToLocaleDateString0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_26900
     * @tc.desc   Test the function of the Interface Date.toLocaleDateString()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testDateToLocaleDateString0002",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToLocaleDateString0002";
      try {
        const event = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));
        expect(event.toLocaleDateString('de-DE')).assertEqual('20.12.2012');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testDateToLocaleDateString0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_27000
     * @tc.desc   Test the function of the Interface Date.toLocaleDateString()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testDateToLocaleDateString0003",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToLocaleDateString0003";
      try {
        const event = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));
        const options: Intl.DateTimeFormatOptions = {
          weekday: 'long',
          year: 'numeric',
          month: 'long',
          day: 'numeric',
        };
        expect(event.toLocaleDateString('de-DE', options)).assertEqual('Donnerstag, 20. Dezember 2012');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testDateToLocaleDateString0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_27100
     * @tc.desc   Test the function of the Interface Date.toLocaleDateString()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testDateToLocaleDateString0004",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToLocaleDateString0004";
      try {
        const event = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));
        const options: Intl.DateTimeFormatOptions = {
          weekday: 'long',
          year: 'numeric',
          month: 'long',
          day: 'numeric',
        };
        expect(event.toLocaleDateString('ar-EG', options)).assertEqual('الخميس، ٢٠ ديسمبر، ٢٠١٢');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToLocaleDateString0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_27200
     * @tc.desc   Test the function of the Interface Date.toLocaleDateString()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testDateToLocaleDateString0005",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToLocaleDateString0005";
      try {
        const event = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));
        const options: Intl.DateTimeFormatOptions = {
          weekday: 'long',
          year: 'numeric',
          month: 'long',
          day: 'numeric',
        };
        expect(event.toLocaleDateString(undefined, options)).assertEqual('Thursday, December 20, 2012');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToLocaleDateString0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_27300
     * @tc.desc   Test the function of the Interface Date.toLocaleDateString()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testDateToLocaleDateString0006",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToLocaleDateString0006";
      try {
        const event = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));
        event.toLocaleDateString('');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("invalid locale");
      }
    })
    /**
     * @tc.name   testDateToLocaleDateString0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_27400
     * @tc.desc   Test the function of the Interface Date.toLocaleDateString()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testDateToLocaleDateString0007",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToLocaleDateString0007";
      try {
        const event = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));
        expect(event.toLocaleDateString("en-US")).assertEqual("12/20/2012");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToLocaleDateString0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_27500
     * @tc.desc   Test the function of the Interface Date.toLocaleDateString()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testDateToLocaleDateString0008",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToLocaleDateString0008";
      try {
        const event = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));
        expect(event.toLocaleDateString("en-GB")).assertEqual("20/12/2012");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToLocaleDateString0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_27600
     * @tc.desc   Test the function of the Interface Date.toLocaleDateString()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testDateToLocaleDateString0009",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToLocaleDateString0009";
      try {
        const event = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));
        expect(event.toLocaleDateString("ko-KR")).assertEqual("2012. 12. 20.");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDataToUTCString0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_27700
     * @tc.desc   Return the primitive value of a Date object. Overrides the Object.prototype.valueOf() method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDataToUTCString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataToUTCString0001";
      try {
        const event = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));
        expect(event.toLocaleDateString("fa-IR")).assertEqual("۲۰۱۲/۱۲/۲۰");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDataValueOf0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_27800
     * @tc.desc   Translate to English: "Convert a Dateobject to a string using the UTC time zone.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDataValueOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataValueOf0001";
      try {
        const event = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));
        expect(event.toLocaleDateString("ar-EG")).assertEqual("٢٠‏/١٢‏/٢٠١٢");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDataValueOf0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_27900
     * @tc.desc   Translate to English: "Convert a Dateobject to a string using the UTC time zone.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDataValueOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataValueOf0002";
      try {
        const event = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));
        expect(event.toLocaleDateString("ja-JP-u-ca-japanese")).assertEqual("H24/12/20");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDataValueOf0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_28000
     * @tc.desc   Translate to English: "Convert a Dateobject to a string using the UTC time zone.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDataValueOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataValueOf0003";
      try {
        const event = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));
        expect(event.toLocaleDateString(["ban", "id"])).assertEqual("20/12/2012");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToLocaleStringConstEvent0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_28100
     * @tc.desc   Test the function of the interface ToLocaleString().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToLocaleStringConstEvent0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDateToLocaleStringConstEvent0001';
      try {
        const event = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));
        const formattedDate = event.toLocaleString('en-GB', {
          timeZone: 'UTC'
        });
        expect(formattedDate).assertEqual("20/12/2012, 03:00:00");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToLocaleStringConstEvent0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_28200
     * @tc.desc   Test the function of the interface ToLocaleString().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToLocaleStringConstEvent0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDateToLocaleStringConstEvent0002';
      try {
        const event = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));
        const formattedDate = event.toLocaleString('ko-KR', {
          timeZone: 'UTC'
        });
        expect(formattedDate).assertEqual("2012. 12. 20. 오전 3:00:00");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToLocaleStringConstEvent0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_28300
     * @tc.desc   Test the function of the interface ToLocaleString().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToLocaleStringConstEvent0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToLocaleStringConstEvent0003";
      try {
        const event = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));
        const result = event.toLocaleString();
        expect(result).assertEqual("12/20/2012, 11:00:00 AM");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToLocaleStringConstEvent0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_28400
     * @tc.desc   Test the function of the interface ToLocaleString().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToLocaleStringConstEvent0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToLocaleStringConstEvent0004";
      try {
        const event = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));
        const result = event.toLocaleString("");
        expect(result).assertEqual("12/20/2012, 11:00:00 AM");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToLocaleStringConstEvent0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_28500
     * @tc.desc   Test the function of the interface ToLocaleString().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToLocaleStringConstEvent0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToLocaleStringConstEvent0005";
      try {
        const event = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));
        const result = event.toLocaleString('en-GB');
        expect(result).assertEqual("20/12/2012, 11:00:00");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToLocaleStringConstEvent0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_28600
     * @tc.desc   Test the function of the interface ToLocaleString().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToLocaleStringConstEvent0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToLocaleStringConstEvent0006";
      try {
        const event = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));
        const result = event.toLocaleString(undefined, {
          timeZone: 'UTC'
        });
        expect(result).assertEqual("12/20/2012, 3:00:00 AM");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToLocaleStringDate0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_28700
     * @tc.desc   Test the function of the interface toLocaleString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToLocaleStringDate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToLocaleStringDate0001";
      try {
        const date = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));
        expect(date.toLocaleString("en-US")).assertEqual("12/20/2012, 11:00:00 AM");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToLocaleStringDate0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_28800
     * @tc.desc   Test the function of the interface BigInt.prototype.toString with 254n.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToLocaleStringDate0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToLocaleStringDate0002";
      try {
        let date = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));
        let value = date.toLocaleString("en-GB");
        expect(value).assertEqual("20/12/2012, 11:00:00");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToLocaleStringDate0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_28900
     * @tc.desc   Test the function of the interface BigInt.prototype.toString with 254n.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToLocaleStringDate0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToLocaleStringDate0003";
      try {
        let date = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));
        let value = date.toLocaleString("ko-KR");
        expect(value).assertEqual("2012. 12. 20. 오전 11:00:00");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToLocaleStringDate0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_29000
     * @tc.desc   Test the function of the interface BigInt.prototype.toString with 254n.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToLocaleStringDate0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToLocaleStringDate0004";
      try {
        let date = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));
        let value = date.toLocaleString("ar-EG");
        expect(value).assertEqual("٢٠‏/١٢‏/٢٠١٢، ١١:٠٠:٠٠ ص");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToLocaleStringDate0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_29100
     * @tc.desc   Test the function of the interface BigInt.prototype.toString with 254n.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToLocaleStringDate0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToLocaleStringDate0005";
      try {
        let date = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));
        let value = date.toLocaleString("ja-JP-u-ca-japanese");
        expect(value).assertEqual("H24/12/20 11:00:00");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToLocaleStringDate0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_29200
     * @tc.desc   Test the function of the interface BigInt.prototype.toString with 254n.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToLocaleStringDate0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToLocaleStringDate0006";
      try {
        let date = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));
        date.toLocaleString(date.toLocaleString(["ban", "id"]));
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("invalid locale");
      }
    })
    /**
     * @tc.name   testDateToLocaleTimeString0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_29300
     * @tc.desc   Test the function of the interface ToLocaleTimeString().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToLocaleTimeString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDateToLocaleTimeString0001';
      try {
        const event = new Date('August 19, 1975 23:15:30 GMT+00:00');
        expect(event.toLocaleTimeString('en-US')).assertEqual("7:15:30 AM");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToLocaleTimeString0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_29400
     * @tc.desc   Test the function of the interface ToLocaleTimeString().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToLocaleTimeString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDateToLocaleTimeString0002';
      try {
        const event = new Date('August 19, 1975 23:15:30 GMT+00:00');
        expect(event.toLocaleTimeString('it-IT')).assertEqual("07:15:30");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToLocaleTimeString0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_29500
     * @tc.desc   Test the function of the interface ToLocaleTimeString().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToLocaleTimeString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDateToLocaleTimeString0003';
      try {
        const event = new Date('August 19, 1975 23:15:30 GMT+00:00');
        expect(event.toLocaleTimeString('ar-EG')).assertEqual("٧:١٥:٣٠ ص");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToLocaleTimeString0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_29600
     * @tc.desc   Test the function of the interface ToLocaleTimeString().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToLocaleTimeString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDateToLocaleTimeString0004';
      try {
        const event = new Date('August 19, 1975 23:15:30 GMT+00:00');
        event.toLocaleTimeString('');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('invalid locale');
      }
    })
    /**
     * @tc.name   testDateToLocaleTimeString0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_29700
     * @tc.desc   Test the function of the interface ToLocaleTimeString().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToLocaleTimeString0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDateToLocaleTimeString0005';
      try {
        const event = new Date('August 19, 1975 23:15:30 GMT+00:00');
        const result = event.toLocaleTimeString();
        const expectedTime = new Date(event.getTime()).toLocaleTimeString();
        expect(result).assertEqual(expectedTime);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToLocaleTimeString0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_29800
     * @tc.desc   Test the function of the interface ToLocaleTimeString().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToLocaleTimeString0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDateToLocaleTimeString0006';
      try {
        const date = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));
        expect(date.toLocaleTimeString("en-US")).assertEqual("11:00:00 AM");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToLocaleTimeString0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_29900
     * @tc.desc   Test the function of the interface toLocaleTimeString().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToLocaleTimeString0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToLocaleTimeString0007";
      try {
        const date = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));
        let result = date.toLocaleTimeString("en-GB");
        expect(result).assertEqual("11:00:00");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToLocaleTimeString0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_30000
     * @tc.desc   Test the function of the interface toLocaleTimeString().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToLocaleTimeString0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToLocaleTimeString0008";
      try {
        const date = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));
        let result = date.toLocaleTimeString("ko-KR");
        expect(result).assertEqual("오전 11:00:00");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToLocaleTimeString0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_30100
     * @tc.desc   Test the function of the interface toLocaleTimeString().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToLocaleTimeString0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToLocaleTimeString0009";
      try {
        const date = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));
        let result = date.toLocaleTimeString("ar-EG");
        expect(result).assertEqual("١١:٠٠:٠٠ ص");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToLocaleTimeString0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_30200
     * @tc.desc   Test the function of the interface toLocaleTimeString().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToLocaleTimeString0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToLocaleTimeString0010";
      try {
        const date = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));
        let result = date.toLocaleTimeString(["ban", "id"]);
        expect(result).assertEqual("11.00.00");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToLocaleTimeString0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_30300
     * @tc.desc   Test the function of the interface toLocaleTimeString().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToLocaleTimeString0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToLocaleTimeString0011";
      try {
        const date = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));
        const options: Intl.DateTimeFormatOptions = {
          timeZone: "UTC",
          timeZoneName: "short"
        };
        const result = date.toLocaleTimeString("en-US", options);
        expect(result).assertEqual("3:00:00 AM UTC");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToLocaleTimeString0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_30400
     * @tc.desc   Test the function of the interface toLocaleTimeString().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToLocaleTimeString0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToLocaleTimeString0012";
      try {
        const date = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));
        const options: Intl.DateTimeFormatOptions = {
          hour12: false
        };
        const result = date.toLocaleTimeString("en-US", options);
        expect(result).assertEqual("11:00:00");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToLocaleTimeString0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_30500
     * @tc.desc   Test the function of the interface toLocaleTimeString().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToLocaleTimeString0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToLocaleTimeString0013";
      try {
        const date = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));
        const options: Intl.DateTimeFormatOptions = {
          timeZone: "UTC",
          timeZoneName: "short",
          hour: "2-digit",
          minute: "2-digit"
        };
        const result = date.toLocaleTimeString([], options);
        expect(result).assertEqual('03:00 AM UTC');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToString0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_30600
     * @tc.desc   Test the function of the interface toString().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToString0001";
      try {
        const event: Date = new Date('August 19, 1975 23:15:30');
        expect(event.toString()).assertEqual('Tue Aug 19 1975 23:15:30 GMT+0800');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToString0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_30700
     * @tc.desc   Test the function of the interface toString().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToString0002";
      try {
        const x: Date = new Date();
        expect(x.toString()).assertEqual(new Date().toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToString0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_30800
     * @tc.desc   Test the function of the interface toString().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToString0003";
      try {
        const x: Date = new Date(' ');
        expect(x.toString()).assertEqual('Invalid Date')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToTimeString0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_30900
     * @tc.desc   Test the function of the interface toTimeString().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToTimeString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToTimeString0001";
      try {
        const event: Date = new Date('August 19, 1975 23:15:30');
        expect(event.toTimeString()).assertEqual('23:15:30 GMT+0800');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToTimeString0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_31000
     * @tc.desc   Test the function of the interface toTimeString().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToTimeString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToTimeString0002";
      try {
        const x: Date = new Date();
        expect(x.toTimeString()).assertEqual(new Date().toTimeString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToTimeString0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_31100
     * @tc.desc   Test the function of the interface ToTimeString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToTimeString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToTimeString0003";
      try {
        const x = new Date(' ');
        const result = x.toTimeString();
        expect(result).assertEqual("Invalid Date");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToUTCString0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_31200
     * @tc.desc   Test the function of the interface ToUTCString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToUTCString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToUTCString0001";
      try {
        const event = new Date('14 Jun 2017 00:00:00 PDT');
        const result = event.toUTCString();
        expect(result).assertEqual("Invalid Date");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToUTCString0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_31300
     * @tc.desc   Test the function of the interface ToUTCString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToUTCString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = "testDateToUTCString0002";
      try {
        const x: Date = new Date();
        expect(x.toUTCString()).assertEqual(new Date().toUTCString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateToUTCString0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_31400
     * @tc.desc   Test the function of the interface ToUTCString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateToUTCString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateToUTCString0003";
      try {
        const x = new Date(' ');
        const result = x.toUTCString();
        expect(result).assertEqual("Invalid Date");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateValueOf0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_31500
     * @tc.desc   Test the function of the interface ValueOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateValueOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateValueOf0001";
      try {
        const date1 = new Date(Date.UTC(96, 1, 2, 3, 4, 5));
        const result = date1.valueOf();
        expect(result).assertEqual(823230245000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateValueOf0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_31600
     * @tc.desc   Test the function of the interface ValueOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateValueOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = "testDateValueOf0002";
      try {
        const x1 = new Date();
        await sleep(3);
        const x2 = new Date();
        const value1 = x1.valueOf();
        const value2 = x2.valueOf();
        const result = value2 > value1;
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDateValueOf0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DATE_31700
     * @tc.desc   Test the function of the interface ValueOf.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDateValueOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDateValueOf0003";
      try {
        const x = new Date(' ');
        const result = x.valueOf();
        expect(Number.isNaN(result)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
  })
}
