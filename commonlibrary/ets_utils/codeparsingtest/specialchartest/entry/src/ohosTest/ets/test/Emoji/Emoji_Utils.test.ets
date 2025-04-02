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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { ArkTSUtils } from '@kit.ArkTS'
export default function EmojiUtilsTest() {
  describe('EmojiUtilsTest', () => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_0100
     * @tc.name       : testUtilsRequest_0001
     * @tc.desc       : Test the Buffer interface includes request with input emoji \ud83d\ude0a.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilsRequest_0001', 0, () => {
      let TAG = 'testUtilsRequest_0001';
      try {
        let lockName = '\ud83d\ude0a';
        let lock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request(lockName);
        expect(lock.name).assertEqual(lockName);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_0200
     * @tc.name       : testUtilsRequest_0002
     * @tc.desc       : Test the Buffer interface includes request with input emoji \ud83d\udc64.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testUtilsRequest_0002', 0, () => {
      let TAG = 'testUtilsRequest_0002';
      try {
        let lockName = '\ud83d\udc64';
        let lock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request(lockName);
        expect(lock.name).assertEqual(lockName);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_0300
     * @tc.name       : testUtilsRequest_0003
     * @tc.desc       : Test the Buffer interface includes request with input emoji \ud83d\udc6b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testUtilsRequest_0003', 0, () => {
      let TAG = 'testUtilsRequest_0003';
      try {
        let lockName = '\ud83d\udc6b';
        let lock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request(lockName);
        expect(lock.name).assertEqual(lockName);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_0400
     * @tc.name       : testUtilsRequest_0004
     * @tc.desc       : Test the Buffer interface includes request with input emoji \u260e.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 4
     */
    it('testUtilsRequest_0004', 0, () => {
      let TAG = 'testUtilsRequest_0004';
      try {
        let lockName = '\u260e';
        let lock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request(lockName);
        expect(lock.name).assertEqual(lockName);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_0500
     * @tc.name       : testUtilsRequest_0005
     * @tc.desc       : Test the Buffer interface includes request with input emoji \ud83d\udc79.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 5
     */
    it('testUtilsRequest_0005', 0, () => {
      let TAG = 'testUtilsRequest_0005';
      try {
        let lockName = '\ud83d\udc79';
        let lock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request(lockName);
        expect(lock.name).assertEqual(lockName);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_0600
     * @tc.name       : testUtilsRequest_0006
     * @tc.desc       : Test the Buffer interface includes request with input emoji \ud83d\udd5b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 6
     */
    it('testUtilsRequest_0006', 0, () => {
      let TAG = 'testUtilsRequest_0006';
      try {
        let lockName = '\ud83d\udd5b';
        let lock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request(lockName);
        expect(lock.name).assertEqual(lockName);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_0700
     * @tc.name       : testUtilsRequest_0007
     * @tc.desc       : Test the Buffer interface includes request with input emoji \ud83c\udf4f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 7
     */
    it('testUtilsRequest_0007', 0, () => {
      let TAG = 'testUtilsRequest_0007';
      try {
        let lockName = '\ud83c\udf4f';
        let lock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request(lockName);
        expect(lock.name).assertEqual(lockName);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_0800
     * @tc.name       : testUtilsRequest_0008
     * @tc.desc       : Test the Buffer interface includes request with input emoji \ud83d\udd03.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 8
     */
    it('testUtilsRequest_0008', 0, () => {
      let TAG = 'testUtilsRequest_0008';
      try {
        let lockName = '\ud83d\udd03';
        let lock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request(lockName);
        expect(lock.name).assertEqual(lockName);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_0900
     * @tc.name       : testUtilsRequest_0009
     * @tc.desc       : Test the Buffer interface includes request with input emoji \ud83c\udf41.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 9
     */
    it('testUtilsRequest_0009', 0, () => {
      let TAG = 'testUtilsRequest_0009';
      try {
        let lockName = '\ud83c\udf41';
        let lock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request(lockName);
        expect(lock.name).assertEqual(lockName);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_01000
     * @tc.name       : testUtilsRequest_00010
     * @tc.desc       : Test the Buffer interface includes request with input emoji \u2666.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 10
     */
    it('testUtilsRequest_00010', 0, () => {
      let TAG = 'testUtilsRequest_00010';
      try {
        let lockName = '\u2666';
        let lock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request(lockName);
        expect(lock.name).assertEqual(lockName);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_01100
     * @tc.name       : testUtilsRequest_00011
     * @tc.desc       : Test the Buffer interface includes request with input emoji \ud83d\udc48.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 11
     */
    it('testUtilsRequest_00011', 0, () => {
      let TAG = 'testUtilsRequest_00011';
      try {
        let lockName = '\ud83d\udc48';
        let lock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request(lockName);
        expect(lock.name).assertEqual(lockName);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_01200
     * @tc.name       : testUtilsRequest_00012
     * @tc.desc       : Test the Buffer interface includes request with input emoji \ud83e\udd3c\u200d\u2642\ufe0f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 12
     */
    it('testUtilsRequest_00012', 0, () => {
      let TAG = 'testUtilsRequest_00012';
      try {
        let lockName = '\ud83e\udd3c\u200d\u2642\ufe0f';
        let lock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request(lockName);
        expect(lock.name).assertEqual(lockName);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TREEMAP_0100
     * @tc.name       : testUtilsQuery_0001
     * @tc.desc       : Test the Buffer interface includes request with input emoji \ud83d\ude0a.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilsQuery_0001', 0, () => {
      let TAG = 'testUtilsQuery_0001';
      try {
        let lockName = '\ud83d\ude0a';
        let lock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request(lockName);
        let state = ArkTSUtils.locks.AsyncLock.query(lockName);
        expect(state instanceof ArkTSUtils.locks.AsyncLockState).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    });
  })
}