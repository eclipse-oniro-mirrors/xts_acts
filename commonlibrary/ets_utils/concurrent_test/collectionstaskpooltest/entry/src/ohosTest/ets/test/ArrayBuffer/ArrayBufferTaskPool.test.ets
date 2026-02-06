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
import { taskpool } from '@kit.ArkTS';
import {
  sleep,
  testCollectionsArrayBuffer0001,
  testCollectionsArrayBuffer0002,
  testCollectionsArrayBuffer0003,
  testCollectionsArrayBuffer0004,
  testCollectionsArrayBuffer0005,
  testCollectionsArrayBuffer0006,
  testCollectionsArrayBuffer0007,
  testCollectionsArrayBuffer0008,
  testCollectionsArrayBuffer0009,
  testCollectionsArrayBuffer0010,
} from './ArrayBuffer_function';

export default function ArrayBufferTaskPoolTest() {
  describe('ArrayBufferTaskPoolTest', () => {
    /**
     * @tc.name   testCollectionsArrayBuffer0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_0100
     * @tc.desc   Testing Collections of ArrayBuffer, constructor -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArrayBuffer0001';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArrayBuffer0001).then((value) => {
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
     * @tc.name   testCollectionsArrayBuffer0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_0200
     * @tc.desc   Testing Collections of ArrayBuffer, constructor 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArrayBuffer0002';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArrayBuffer0002).then((value) => {
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
     * @tc.name   testCollectionsArrayBuffer0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_0300
     * @tc.desc   Testing Collections of ArrayBuffer, constructor 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArrayBuffer0003';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArrayBuffer0003).then((value) => {
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
     * @tc.name   testCollectionsArrayBuffer0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_0400
     * @tc.desc   Testing Collections of ArrayBuffer, slice(0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArrayBuffer0004';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArrayBuffer0004).then((value) => {
            num++;
            expect(value).assertEqual(5);
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
     * @tc.name   testCollectionsArrayBuffer0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_0500
     * @tc.desc   Testing Collections of ArrayBuffer, slice(-1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArrayBuffer0005';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArrayBuffer0005).then((value) => {
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
     * @tc.name   testCollectionsArrayBuffer0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_0600
     * @tc.desc   Testing Collections of ArrayBuffer, slice(2).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = "testCollectionsArrayBuffer0006";
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArrayBuffer0006).then((value) => {
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
     * @tc.name   testCollectionsArrayBuffer0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_0700
     * @tc.desc   Testing Collections of ArrayBuffer, slice(10).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = "testCollectionsArrayBuffer0007";
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArrayBuffer0007).then((value) => {
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
     * @tc.name   testCollectionsArrayBuffer0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_0800
     * @tc.desc   Testing Collections of ArrayBuffer, slice(2,4).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = "testCollectionsArrayBuffer0008";
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArrayBuffer0008).then((value) => {
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
     * @tc.name   testCollectionsArrayBuffer0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_0900
     * @tc.desc   Testing Collections of ArrayBuffer, slice(2,2).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = "testCollectionsArrayBuffer0009";
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArrayBuffer0009).then((value) => {
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
     * @tc.name   testCollectionsArrayBuffer0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_1000
     * @tc.desc   Testing Collections of ArrayBuffer, slice(2,0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArrayBuffer0010';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArrayBuffer0010).then((value) => {
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
  })
}