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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { collections, taskpool } from '@kit.ArkTS';
import {
  sleep,
  testInt32ArrayTaskPool0001,
  testInt32ArrayTaskPool0002,
  testInt32ArrayTaskPool0003,
  testInt32ArrayTaskPool0004,
  testInt32ArrayTaskPool0005,
  testInt32ArrayTaskPool0006,
  testInt32ArrayTaskPool0007,
  testInt32ArrayTaskPool0008,
  testInt32ArrayTaskPool0009,
  testInt32ArrayTaskPool0010,
  testInt32ArrayTaskPool0011,
  testInt32ArrayTaskPool0012,
  testInt32ArrayTaskPool0013,
  testInt32ArrayTaskPool0014,
  testInt32ArrayTaskPool0015,
  testInt32ArrayTaskPool0016,
  testInt32ArrayTaskPool0017,
  testInt32ArrayTaskPool0018,
  testInt32ArrayTaskPool0019,
  testInt32ArrayTaskPool0020,
  testInt32ArrayTaskPool0021,
  testInt32ArrayTaskPool0022,
  testInt32ArrayTaskPool0023,
  testInt32ArrayTaskPool0024,
  testInt32ArrayTaskPool0025,
  testInt32ArrayTaskPool0026,
  testInt32ArrayTaskPool0027,
  testInt32ArrayTaskPool0028,
  testInt32ArrayTaskPool0029,
  testInt32ArrayTaskPool0030,
  testInt32ArrayTaskPool0031,
  testInt32ArrayTaskPool0032,
  testInt32ArrayTaskPool0033,
  testInt32ArrayTaskPool0034,
  testInt32ArrayTaskPool0035,
  testInt32ArrayTaskPool0036,
  testInt32ArrayTaskPool0037,
  testInt32ArrayTaskPool0038,
  testInt32ArrayTaskPool0039,
  testInt32ArrayTaskPool0040,
  testInt32ArrayTaskPool0041,
  testInt32ArrayTaskPool0042,
  testInt32ArrayTaskPool0043,
  testInt32ArrayTaskPool0044,
  testInt32ArrayTaskPool0045,
  testInt32ArrayTaskPool0046,
  testInt32ArrayTaskPool0047,
  testInt32ArrayTaskPool0048,
  testInt32ArrayTaskPool0049,
  testInt32ArrayTaskPool0050,
  testInt32ArrayTaskPool0051,
  testInt32ArrayTaskPool0052,
  testInt32ArrayTaskPool0053,
  testInt32ArrayTaskPool0054,
  testInt32ArrayTaskPool0055,
  testInt32ArrayTaskPool0056,
  testInt32ArrayTaskPool0057,
  testInt32ArrayTaskPool0058,
  testInt32ArrayTaskPool0059,
  testInt32ArrayTaskPool0060,
  testInt32ArrayTaskPool0061,
  testInt32ArrayTaskPool0062,
  testInt32ArrayTaskPool0063,
  testInt32ArrayTaskPool0064,
  testInt32ArrayTaskPool0065,
  testInt32ArrayTaskPool0066,
  testInt32ArrayTaskPool0067,
  testInt32ArrayTaskPool0068,
  testInt32ArrayTaskPool0069,
  testInt32ArrayTaskPool0070,
  testInt32ArrayTaskPool0071,
  testInt32ArrayTaskPool0072,
  testInt32ArrayTaskPool0073,
  testInt32ArrayTaskPool0074,
  testInt32ArrayTaskPool0075,
  testInt32ArrayTaskPool0076,
  testInt32ArrayTaskPool0077,
  testInt32ArrayTaskPool0078,
  testInt32ArrayTaskPool0079,
  testInt32ArrayTaskPool0080,
  testInt32ArrayTaskPool0081,
  testInt32ArrayTaskPool0082,
  testInt32ArrayTaskPool0083,
  testInt32ArrayTaskPool0084,
  testInt32ArrayTaskPool0085,
  testInt32ArrayTaskPool0086,
  testInt32ArrayTaskPool0087,
  testInt32ArrayTaskPool0088,
  testInt32ArrayTaskPool0089,
  testInt32ArrayTaskPool0090,
  testInt32ArrayTaskPool0091,
  testInt32ArrayTaskPool0092,
  testInt32ArrayTaskPool0093,
  testInt32ArrayTaskPool0094,
  testInt32ArrayTaskPool0095,
  testInt32ArrayTaskPool0096,
  testInt32ArrayTaskPool0097,
  testInt32ArrayTaskPool0098,
  testInt32ArrayTaskPool0099,
  testInt32ArrayTaskPool0100,
  testInt32ArrayTaskPool0101,
  testInt32ArrayTaskPool0102,
  testInt32ArrayTaskPool0103,
  testInt32ArrayTaskPool0104,
  testInt32ArrayTaskPool0105,
  testInt32ArrayTaskPool0106,
  testInt32ArrayTaskPool0107,
  testInt32ArrayTaskPool0108,
  testInt32ArrayTaskPool0109,
  testInt32ArrayTaskPool0110,
  testInt32ArrayTaskPool0111,
  testInt32ArrayTaskPool0112,
  testInt32ArrayTaskPool0113,
  testInt32ArrayTaskPool0114,
  testInt32ArrayTaskPool0115,
  testInt32ArrayTaskPool0116,
  testInt32ArrayTaskPool0117,
  testInt32ArrayTaskPool0118,
  testInt32ArrayTaskPool0119,
  testInt32ArrayTaskPool0120,
  testInt32ArrayTaskPool0121,
  testInt32ArrayTaskPool0122,
  testInt32ArrayTaskPool0123,
  testInt32ArrayTaskPool0124,
  testInt32ArrayTaskPool0125,
  testInt32ArrayTaskPool0126,
  testInt32ArrayTaskPool0127,
  testInt32ArrayTaskPool0128,
  testInt32ArrayTaskPool0129,
  testInt32ArrayTaskPool0130,
  testInt32ArrayTaskPool0131,
  testInt32ArrayTaskPool0132,
  testInt32ArrayTaskPool0133,
  testInt32ArrayTaskPool0134,
  testInt32ArrayTaskPool0135,
  testInt32ArrayTaskPool0136,
  testInt32ArrayTaskPool0137,
  testInt32ArrayTaskPool0138,
  testInt32ArrayTaskPool0139,
  testInt32ArrayTaskPool0140,
  testInt32ArrayTaskPool0141,
  testInt32ArrayTaskPool0142,
  testInt32ArrayTaskPool0143,
  testInt32ArrayTaskPool0144,
  testInt32ArrayTaskPool0145,
  testInt32ArrayTaskPool0146,
  testInt32ArrayTaskPool0147,
  testInt32ArrayTaskPool0148,
  testInt32ArrayTaskPool0149,
  testInt32ArrayTaskPool0150,
  testInt32ArrayTaskPool0151,
  testInt32ArrayTaskPool0152,
  testInt32ArrayTaskPool0153,
  testInt32ArrayTaskPool0154,
  testInt32ArrayTaskPool0155,
  testInt32ArrayTaskPool0156,
  testInt32ArrayTaskPool0157,
  testInt32ArrayTaskPool0158,
  testInt32ArrayTaskPool0159,
  testInt32ArrayTaskPool0160,
  testInt32ArrayTaskPool0161,
  testInt32ArrayTaskPool0162,
  testInt32ArrayTaskPool0163,
  testInt32ArrayTaskPool0164,
  testInt32ArrayTaskPool0165,
  testInt32ArrayTaskPool0166,
  testInt32ArrayTaskPool0167,
  testInt32ArrayTaskPool0168,
  testInt32ArrayTaskPool0169,
  testInt32ArrayTaskPool0170,
  testInt32ArrayTaskPool0171,
  testInt32ArrayTaskPool0172,
  testInt32ArrayTaskPool0173,
  testInt32ArrayTaskPool0174,
  testInt32ArrayTaskPool0175,
  testInt32ArrayTaskPool0176,
  testInt32ArrayTaskPool0177,
  testInt32ArrayTaskPool0178,
  testInt32ArrayTaskPool0179,
  testInt32ArrayTaskPool0180,
  testInt32ArrayTaskPool0181,
  testInt32ArrayTaskPool0182,
  testInt32ArrayTaskPool0183,
  testInt32ArrayTaskPool0184,
  testInt32ArrayTaskPool0185,
  testInt32ArrayTaskPool0186,
  testInt32ArrayTaskPool0187,
} from '../TypedArray_function/int32Array_function';

export default function int32ArrayTaskPoolTest() {
  describe('int32ArrayTaskPoolTest', () => {
    /**
     * @tc.name   testInt32ArrayTaskPool0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_0100
     * @tc.desc   Testing the iterative ability of Int32Array using a for loop in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0001';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0001).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8,9,10');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_0200
     * @tc.desc   Testing the iterative ability of Int32Array using ... deconstruction in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0002';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0002).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8,9,10');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_0300
     * @tc.desc   Testing create an empty ArkTS TypedArray object with Int32Array in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0003';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0003).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })


    /**
     * @tc.name   testInt32ArrayTaskPool0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_0400
     * @tc.desc   Testing creation of ArkTS TypedArray object with invalid size in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0004';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0004).then((value) => {
            num++;
            expect(value).assertEqual('error');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_0500
     * @tc.desc   Testing ArrayLength constructs 0 parameter and checks the length in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0005';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0005).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_0600
     * @tc.desc   Testing ArrayLength constructs 10 parameter and checks the length in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0006';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0006).then((value) => {
            num++;
            expect(value).assertEqual(10);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_0700
     * @tc.desc   Testing ArrayLength constructs 100000 parameter and checks the length in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0007';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0007).then((value) => {
            num++;
            expect(value).assertEqual(100000);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_0800
     * @tc.desc   Testing construct an object from an ArrayLike in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0008';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0008).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_0900
     * @tc.desc   Testing construct an object from an ArrayBuffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0009';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0009).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_1000
     * @tc.desc   Testing construct an object from another ArkTS TypedArray in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0010';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0010).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_1100
     * @tc.desc   Testing create an ArrayBuffer with an empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0011';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0011).then((value) => {
            num++;
            expect(value).assertEqual('');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_1200
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0012';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0012).then((value) => {
            num++;
            expect(value).assertEqual('error');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_1300
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0013';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0013).then((value) => {
            num++;
            expect(value).assertEqual('error');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_1400
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0014';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0014).then((value) => {
            num++;
            expect(value).assertEqual('error');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_1500
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0015';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0015).then((value) => {
            num++;
            expect(value).assertEqual('');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_1600
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0016';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0016).then((value) => {
            num++;
            expect(value).assertEqual('error');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_1700
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0017';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0017).then((value) => {
            num++;
            expect(value).assertEqual('1,2');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_1800
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0018';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0018).then((value) => {
            num++;
            expect(value).assertEqual('error');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_1900
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0019';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0019).then((value) => {
            num++;
            expect(value).assertEqual('error');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_2000
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0020';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0020).then((value) => {
            num++;
            expect(value).assertEqual('error');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_2100
     * @tc.desc   Testing the 'from' interface with an array-like structure [1, 3, 5] in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0021';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0021).then((value) => {
            num++;
            expect(value).assertEqual('1,3,5');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_2200
     * @tc.desc   Testing the 'from' interface with an array-like structure [] in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0022';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0022).then((value) => {
            num++;
            expect(value).assertEqual('');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_2300
     * @tc.desc   Testing the array-like map function created from an object in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0023';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0023).then((value) => {
            num++;
            expect(value).assertEqual('0,1,2,3,4');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_2400
     * @tc.desc   Testing the array-like map function created from a character array in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0024';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0024).then((value) => {
            num++;
            expect(value).assertEqual('1,3,5');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_2500
     * @tc.desc   Testing the array-like map function created from a string in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0025';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0025).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_2600
     * @tc.desc   Testing the array-like map function created from a num array in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0026';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0026).then((value) => {
            num++;
            expect(value).assertEqual('1,3,5');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_2700
     * @tc.desc   Testing the array-like map function created from a nesting array in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0027';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0027).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_2800
     * @tc.desc   Testing the array-like map function without specifying a mapping function in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0028';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0028).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_2900
     * @tc.desc   Testing the array-like map function with specifying a mapping function in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0029';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0029).then((value) => {
            num++;
            expect(value).assertEqual('1,3,5');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_3000
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0030';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0030).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,2,3,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_3100
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0031';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0031).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_3200
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0032';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0032).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,1');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_3300
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0033';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0033).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_3400
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0034';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0034).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,1');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_3500
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0035';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0035).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,1');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_3600
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0036';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0036).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,3');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_3700
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0037';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0037).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_3800
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0038';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0038).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_3900
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0039';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0039).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,3');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_4000
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0040';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0040).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_4100
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0041';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0041).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_4200
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0042';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0042).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_4300
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0043';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0043).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_4400
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0044';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0044).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_4500
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0045';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0045).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_4600
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0046';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0046).then((value) => {
            num++;
            expect(value).assertEqual('3,4,5,6,7,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_4700
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0047';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0047).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_4800
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0048';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0048).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_4900
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0049';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0049).then((value) => {
            num++;
            expect(value).assertEqual('3,4,5,6,7,8,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_5000
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0050';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0050).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_5100
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0051';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0051).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_5200
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0052';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0052).then((value) => {
            num++;
            expect(value).assertEqual('1,2,1,2,3,4,5,6');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_5300
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0053';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0053).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_5400
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0054';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0054).then((value) => {
            num++;
            expect(value).assertEqual('1,2,1,2,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_5500
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0055';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0055).then((value) => {
            num++;
            expect(value).assertEqual('1,2,1,2,3,4,5,6');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_5600
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0056';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0056).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_5700
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0057';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0057).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_5800
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0058';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0058).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_5900
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0059';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0059).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_6000
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0060';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0060).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_6100
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0061';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0061).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_6200
     * @tc.desc   Testing whether it returns true when there are elements that meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0062';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0062).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_6300
     * @tc.desc   Testing whether it returns false when no elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0063';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0063).then((value) => {
            num++;
            expect(value).assertEqual(false);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_6400
     * @tc.desc   Testing whether it returns true when all elements that meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0064';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0064).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_6500
     * @tc.desc   Testing whether it returns true when all elements that meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0065';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0065).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_6600
     * @tc.desc   Testing whether it returns false when not all elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0066';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0066).then((value) => {
            num++;
            expect(value).assertEqual(false);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_6700
     * @tc.desc   Testing whether it returns false when no elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0067';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0067).then((value) => {
            num++;
            expect(value).assertEqual(false);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_6800
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0068';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0068).then((value) => {
            num++;
            expect(value).assertEqual('4,4,4,1,4,4,1,4,3');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_6900
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0069';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0069).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_7000
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0070';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0070).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_7100
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0071';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0071).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_7200
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0072';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0072).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,4');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_7300
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0073';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0073).then((value) => {
            num++;
            expect(value).assertEqual('4,4,4,4,4,6');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_7400
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0074';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0074).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_7500
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0075';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0075).then((value) => {
            num++;
            expect(value).assertEqual('4,4,3,4,5,6');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_7600
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0076';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0076).then((value) => {
            num++;
            expect(value).assertEqual('4,4,4,4,4,4');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_7700
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0077';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0077).then((value) => {
            num++;
            expect(value).assertEqual('1,2,4,4,4,6');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_7800
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0078';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0078).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_7900
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0079';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0079).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_8000
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0080';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0080).then((value) => {
            num++;
            expect(value).assertEqual('1,2,4,4,4,4');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_8100
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0081';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0081).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0082
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_8200
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0082';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0082).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0083
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_8300
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0083';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0083).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0084
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_8400
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0084';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0084).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0085
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_8500
     * @tc.desc   Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0085';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0085).then((value) => {
            num++;
            expect(value).assertEqual('0,2,4');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0086
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_8600
     * @tc.desc   Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0086';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0086).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0087
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_8700
     * @tc.desc   Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0087';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0087).then((value) => {
            num++;
            expect(value).assertEqual(' after set is 5,6');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0088
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_8800
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0088';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0088).then((value) => {
            num++;
            expect(value).assertEqual(3);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0089
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_8900
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0089';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0089).then((value) => {
            num++;
            expect(value).assertEqual(undefined);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0090
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_9000
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0090';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0090).then((value) => {
            num++;
            expect(value).assertEqual('undefined,5');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0091
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_9100
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0091';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0091).then((value) => {
            num++;
            expect(value).assertEqual(undefined);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0092
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_9200
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0092';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0092).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0093
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_9300
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0093';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0093).then((value) => {
            num++;
            expect(value).assertEqual(undefined);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0094
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_9400
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0094';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0094).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0095
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_9500
     * @tc.desc   Testing if findIndex returns the first element index that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0095';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0095).then((value) => {
            num++;
            expect(value).assertEqual(-1);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0096
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_9600
     * @tc.desc   Testing if findIndex returns the first element index that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0096';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0096).then((value) => {
            num++;
            expect(value).assertEqual(1);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0097
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_9700
     * @tc.desc   Testing if findIndex returns the first element index that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0097';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0097).then((value) => {
            num++;
            expect(value).assertEqual(-1);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0098
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_9800
     * @tc.desc   Testing if forEach executes the provided callback function for each element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0098';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0098).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0099
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_9900
     * @tc.desc   Testing if forEach executes the provided callback function for each element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0099';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0099).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_10000
     * @tc.desc   Testing if forEach executes the provided callback function for each element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0100';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0100).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0101
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_10100
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0101';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0101).then((value) => {
            num++;
            expect(value).assertEqual(-1);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0102
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_10200
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0102';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0102).then((value) => {
            num++;
            expect(value).assertEqual(-1);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0103
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_10300
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0103';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0103).then((value) => {
            num++;
            expect(value).assertEqual(1);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0104
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_10400
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0104';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0104).then((value) => {
            num++;
            expect(value).assertEqual(9);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0105
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_10500
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0105';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0105).then((value) => {
            num++;
            expect(value).assertEqual(6);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0106
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_10600
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0106';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0106).then((value) => {
            num++;
            expect(value).assertEqual(2);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0107
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_10700
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0107';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0107).then((value) => {
            num++;
            expect(value).assertEqual(3);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0108
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_10800
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0108';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0108).then((value) => {
            num++;
            expect(value).assertEqual(-1);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0109
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_10900
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0109';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0109).then((value) => {
            num++;
            expect(value).assertEqual('');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0110
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_11000
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0110';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0110).then((value) => {
            num++;
            expect(value).assertEqual('');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0111
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_11100
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0111';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0111).then((value) => {
            num++;
            expect(value).assertEqual("1,2,3,4,5");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0112
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_11200
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0112';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0112).then((value) => {
            num++;
            expect(value).assertEqual("12345");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0113
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_11300
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0113';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0113).then((value) => {
            num++;
            expect(value).assertEqual("1,2,3,4,5");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0114
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_11400
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0114';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0114).then((value) => {
            num++;
            expect(value).assertEqual("1/2/3/4/5");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0115
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_11500
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0115';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0115).then((value) => {
            num++;
            expect(value).assertEqual("1,。￥·2,。￥·3,。￥·4,。￥·5");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0116
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_11600
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0116';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0116).then((value) => {
            num++;
            expect(value).assertEqual("1녕하こんйте2녕하こんйте3녕하こんйте4녕하こんйте5");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0117
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_11700
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0117';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0117).then((value) => {
            num++;
            expect(value).assertEqual("1，2，3，4，5");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0118
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_11800
     * @tc.desc   Testing applying a callback function to each element to create a new ArkTS TypedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0118';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0118).then((value) => {
            num++;
            expect(value).assertEqual("");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0119
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_11900
     * @tc.desc   Testing applying a callback function to each element to create a new ArkTS TypedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0119';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0119).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0120
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_12000
     * @tc.desc   Testing applying a callback function to each element to create a new ArkTS TypedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0120';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0120).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0121
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_12100
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0121';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0121).then((value) => {
            num++;
            expect(value).assertEqual('error');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0122
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_12200
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0122';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0122).then((value) => {
            num++;
            expect(value).assertEqual(15);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0123
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_12300
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0123';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0123).then((value) => {
            num++;
            expect(value).assertEqual(23);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0124
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_12400
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0124';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0124).then((value) => {
            num++;
            expect(value).assertEqual('initialValue12345');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0125
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_12500
     * @tc.desc   Testing reverse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0125';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0125).then((value) => {
            num++;
            expect(value).assertEqual('');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0126
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_12600
     * @tc.desc   Testing reverse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0126';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0126).then((value) => {
            num++;
            expect(value).assertEqual('5,4,3,2,1');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0127
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_12700
     * @tc.desc   Testing reverse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0127';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0127).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0128
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_12800
     * @tc.desc   Testing the set of int32Array, offset is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0128';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0128).then((value) => {
            num++;
            expect(value).assertEqual("1,3,5,0,0,0,0,0");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0129
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_12900
     * @tc.desc   Testing the set of int32Array, offset is null, forEach succeed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0129';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0129).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0130
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_13000
     * @tc.desc   Testing the set of int32Array, offset is -1, return failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0130';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0130).then((value) => {
            num++;
            expect(value).assertEqual("error");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0131
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_13100
     * @tc.desc   Testing the set of int32Array, offset is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0131';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0131).then((value) => {
            num++;
            expect(value).assertEqual("1,3,5,0,0,0,0,0");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0132
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_13200
     * @tc.desc   Testing the set of int32Array, offset is 0, forEach succeed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0132';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0132).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0133
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_13300
     * @tc.desc   Testing the set of int32Array, offset is 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0133';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0133).then((value) => {
            num++;
            expect(value).assertEqual("0,0,1,3,5,0,0,0");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0134
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_13400
     * @tc.desc   Testing the set of int32Array, offset is 2, forEach succeed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0134';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0134).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0135
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_13500
     * @tc.desc   Testing the set of int32Array, offset is 10(overstep), return failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0135';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0135).then((value) => {
            num++;
            expect(value).assertEqual("error");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0136
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_13600
     * @tc.desc   Testing the Slice of int32Array, array is null, start is 1, end is 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0136';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0136).then((value) => {
            num++;
            expect(value).assertEqual("");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0137
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_13700
     * @tc.desc   Testing the Slice of int32Array, array is null, parameter is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0137';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0137).then((value) => {
            num++;
            expect(value).assertEqual("");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0138
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_13800
     * @tc.desc   Testing the Slice of int32Array, array is not null, parameter is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0138';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0138).then((value) => {
            num++;
            expect(value).assertEqual("1,2,3,4,5");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0139
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_13900
     * @tc.desc   Testing the Slice of int32Array, array is not null, parameter is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0139';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0139).then((value) => {
            num++;
            expect(value).assertEqual("1,2,3,4,5");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0140
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_14000
     * @tc.desc   Testing the Slice of int32Array, array is not null, parameter is -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0140';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0140).then((value) => {
          num++;
          expect(value).assertEqual("5");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0141
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_14100
     * @tc.desc   Testing the Slice of int32Array, array is not null, start is -1, end is -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0141';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0141).then((value) => {
          num++;
          expect(value).assertEqual("");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0142
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_14200
     * @tc.desc   Testing the Slice of int32Array, array is not null, start is -1, end is 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0142';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0142).then((value) => {
          num++;
          expect(value).assertEqual("");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0143
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_14300
     * @tc.desc   Testing the Slice of int32Array, array is not null, start is 0, end is -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0143';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0143).then((value) => {
          num++;
          expect(value).assertEqual("1,2,3,4");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0144
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_14400
     * @tc.desc   Testing the Slice of int32Array, array is not null, parameter is 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0144';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0144).then((value) => {
          num++;
          expect(value).assertEqual("3,4,5");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0145
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_14500
     * @tc.desc   Testing the Slice of int32Array, array is not null, parameter is 10(overstep).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0145';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0145).then((value) => {
          num++;
          expect(value).assertEqual("");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0146
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_14600
     * @tc.desc   Testing the Slice of int32Array, array is not null, parameter is 10(overstep).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0146';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0146).then((value) => {
          num++;
          expect(value).assertEqual("");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0147
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_14700
     * @tc.desc   Testing the Slice of int32Array, array is not null, parameter is 10(overstep).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0147';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0147).then((value) => {
          num++;
          expect(value).assertEqual("");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0148
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_14800
     * @tc.desc   Testing the Slice of int32Array, array is not null, start is 2, end is 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0148';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0148).then((value) => {
          num++;
          expect(value).assertEqual("3,4");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0149
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_14900
     * @tc.desc   Testing the sort of int32Array, array is null, parameter is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0149';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0149).then((value) => {
          num++;
          expect(value).assertEqual("");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0150
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_15000
     * @tc.desc   Testing the sort of int32Array, array is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0150';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0150).then((value) => {
          num++;
          expect(value).assertEqual("");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0151
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_15100
     * @tc.desc   Testing the sort of int32Array, array is not null, parameter is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0151';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0151).then((value) => {
          num++;
          expect(value).assertEqual("1,2,3,4,5");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0152
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_15200
     * @tc.desc   Testing the sort of int32Array, array is not null, parameter is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0152';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0152).then((value) => {
          num++;
          expect(value).assertEqual("1,2,3,4,5");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0153
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_15300
     * @tc.desc   Testing the sort of int32Array, array is not null, parameter is grade down.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0153';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0153).then((value) => {
          num++;
          expect(value).assertEqual("5,4,3,2,1");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0154
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_15400
     * @tc.desc   Testing the sort of int32Array, array is not null, set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0154';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0154).then((value) => {
          num++;
          expect(value).assertEqual("2,5,7,8,9");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0155
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_15500
     * @tc.desc   Testing the subarray of int32Array, array is not null, parameter is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0155';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0155).then((value) => {
          num++;
          expect(value).assertEqual("1,3,5,7,9");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0156
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_15600
     * @tc.desc   Testing the subarray of int32Array, array is not null, begin is -1, end is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0156';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0156).then((value) => {
          num++;
          expect(value).assertEqual("9");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0157
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_15700
     * @tc.desc   Testing the subarray of int32Array, array is not null, begin is -1, end is -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0157';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0157).then((value) => {
          num++;
          expect(value).assertEqual("");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0158
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_15800
     * @tc.desc   Testing the subarray of int32Array, array is not null, begin is -1, end is 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0158';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0158).then((value) => {
          num++;
          expect(value).assertEqual("");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0159
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_15900
     * @tc.desc   Testing the subarray of int32Array, array is not null, begin is -1, end is overstep.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0159';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0159).then((value) => {
          num++;
          expect(value).assertEqual("9");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0160
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_16000
     * @tc.desc   Testing the subarray of int32Array, array is not null, begin is 2, end is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0160';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0160).then((value) => {
          num++;
          expect(value).assertEqual("5,7,9");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testInt32ArrayTaskPool0161
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_16100
     * @tc.desc   Testing the subarray of int32Array, array is not null, begin is 2, end is -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0161';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0161).then((value) => {
          num++;
          expect(value).assertEqual("5,7");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testInt32ArrayTaskPool0162
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_16200
     * @tc.desc   Testing the subarray of int32Array, array is not null, begin is 2, end is 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0162';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0162).then((value) => {
          num++;
          expect(value).assertEqual("");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testInt32ArrayTaskPool0163
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_16300
     * @tc.desc   Testing the subarray of int32Array, array is not null, begin is 2, end is overstep.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0163';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0163).then((value) => {
          num++;
          expect(value).assertEqual("5,7,9");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testInt32ArrayTaskPool0164
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_16400
     * @tc.desc   Testing the subarray of int32Array, array is not null, begin is overstep, end is overstep.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0164';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0164).then((value) => {
          num++;
          expect(value).assertEqual("");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testInt32ArrayTaskPool0165
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_16500
     * @tc.desc   Testing Collections of int32array, array is [], at(1), return undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0165';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0165).then((value) => {
          num++;
          expect(value).assertEqual('undefined');
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testInt32ArrayTaskPool0166
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_16600
     * @tc.desc   Testing Collections of int32array, array is [1,2,3], at(3), return undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0166';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0166).then((value) => {
          num++;
          expect(value).assertEqual('undefined');
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testInt32ArrayTaskPool0167
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_16700
     * @tc.desc   Testing Collections of int32array, array is [1,2,3], at(-1), return element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0167';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0167).then((value) => {
          num++;
          expect(value).assertEqual(3);
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testInt32ArrayTaskPool0168
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_16800
     * @tc.desc   Testing Collections of int32array, array is [1,2,3], at(5), return undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0168';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0168).then((value) => {
          num++;
          expect(value).assertEqual('undefined');
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testInt32ArrayTaskPool0169
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_16900
     * @tc.desc   Testing Collections of int32array, array is [1,2,3], at(0), return element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0169';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0169).then((value) => {
          num++;
          expect(value).assertEqual(1);
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0170
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_17000
     * @tc.desc   Testing Collections of int32array, array is [], includes(2), return false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0170';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0170).then((value) => {
          num++;
          expect(value).assertEqual(false);
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testInt32ArrayTaskPool0171
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_17100
     * @tc.desc   Testing Collections of int32array, array is [1,2,3], includes(5,-1), return false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0171';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0171).then((value) => {
          num++;
          expect(value).assertEqual(false);
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testInt32ArrayTaskPool0172
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_17200
     * @tc.desc   Testing Collections of int32array, array is [1,2,3], includes(3,-1), return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0172';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0172).then((value) => {
          num++;
          expect(value).assertEqual(true);
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testInt32ArrayTaskPool0173
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_17300
     * @tc.desc   Testing Collections of int32array, array is [1,2,3], includes(10), return false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0173';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0173).then((value) => {
          num++;
          expect(value).assertEqual(false);
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testInt32ArrayTaskPool0174
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_17400
     * @tc.desc   Testing Collections of int32array, array is [1,2,3], includes(1), return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0174';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0174).then((value) => {
          num++;
          expect(value).assertEqual(true);
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testInt32ArrayTaskPool0175
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_17500
     * @tc.desc   Testing Collections of int32array, array is [1,2,3], includes(1,5), return false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0175';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0175).then((value) => {
          num++;
          expect(value).assertEqual(false);
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testInt32ArrayTaskPool0176
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_17600
     * @tc.desc   Testing Collections of int32array, array is [], entries(), undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0176';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0176).then((value) => {
          num++;
          expect(value).assertEqual('undefined');
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testInt32ArrayTaskPool0177
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_17700
     * @tc.desc   Testing Collections of int32array, array is [1,2,3], entries().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0177';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0177).then((value) => {
          num++;
          expect(value).assertEqual('0,1');
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testInt32ArrayTaskPool0178
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_17800
     * @tc.desc   Testing Collections of int32array, array is [], keys().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0178';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0178).then((value) => {
          num++;
          expect(value).assertEqual(0);
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testInt32ArrayTaskPool0179
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_17900
     * @tc.desc   Testing Collections of int32array, array is [1,2,3], keys(),iterator.next().value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0179';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0179).then((value) => {
          num++;
          expect(value).assertEqual('0,1,2');
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt32ArrayTaskPool0180
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_18000
     * @tc.desc   Testing Collections of int32array, array is [1,2,3], keys(),for iterator.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0180';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0180).then((value) => {
          num++;
          expect(value).assertEqual(true);
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testInt32ArrayTaskPool0181
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_18100
     * @tc.desc   Testing Collections of int32array, array is [], values().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0181';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0181).then((value) => {
          num++;
          expect(value).assertEqual(true);
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testInt32ArrayTaskPool0182
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_18200
     * @tc.desc   Testing Collections of int32array, array is [1,2,3], values(),iterator.next().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0182';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0182).then((value) => {
          num++;
          expect(value).assertEqual(true);
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testInt32ArrayTaskPool0183
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_18300
     * @tc.desc   Testing Collections of int32array, array is [1,2,3], values(),for value iterator.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0183';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0183).then((value) => {
          num++;
          expect(value).assertEqual(true);
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testInt32ArrayTaskPool0184
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_18400
     * @tc.desc   Testing Collections of int32array, array is [1,2,3], set array,values(),for value iterator.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0184';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0184).then((value) => {
          num++;
          expect(value).assertEqual(true);
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testInt32ArrayTaskPool0185
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_18500
     * @tc.desc   Testing Collections of int32array, array is [1,2,3], index < 0, array[index] = undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0185';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0185).then((value) => {
          num++;
          expect(value).assertEqual(true);
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testInt32ArrayTaskPool0186
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_18600
     * @tc.desc   Testing Collections of int32array, array is [1,2,3], index > arrayLength, array[index] = undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0186';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0186).then((value) => {
          num++;
          expect(value).assertEqual(true);
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testInt32ArrayTaskPool0187
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_TASK_POOL_18700
     * @tc.desc   Testing Collections of int32array, array is [1,2,3], 0 <= index < arrayLength, array[index] = array element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0187';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testInt32ArrayTaskPool0187).then((value) => {
          num++;
          expect(value).assertEqual(true);
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
  })
}