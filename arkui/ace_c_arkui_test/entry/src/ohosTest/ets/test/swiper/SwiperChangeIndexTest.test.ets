/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function swiperChangeIndexTest() {

  describe('SwiperChangeIndexTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testSwiperChangeIndex001
     * @tc.number SUB_ARKUI_CAPI_SWIPER_TO_INDEX_0100
     * @tc.desc   testing changeIndex for swiper with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperChangeIndex001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperChangeIndex001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperChangeIndex002
     * @tc.number SUB_ARKUI_CAPI_SWIPER_TO_INDEX_0200
     * @tc.desc   testing changeIndex for swiper with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperChangeIndex002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperChangeIndex002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperChangeIndex003
     * @tc.number SUB_ARKUI_CAPI_SWIPER_TO_INDEX_0300
     * @tc.desc   testing changeIndex for swiper with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperChangeIndex003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperChangeIndex003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperChangeIndex004
     * @tc.number SUB_ARKUI_CAPI_SWIPER_TO_INDEX_0400
     * @tc.desc   testing changeIndex for swiper with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperChangeIndex004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperChangeIndex004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperChangeIndex005
     * @tc.number SUB_ARKUI_CAPI_SWIPER_TO_INDEX_0500
     * @tc.desc   testing changeIndex for swiper with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperChangeIndex005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperChangeIndex005()).assertEqual(0)
      done()
    })

  })
}
