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

export default function swiperIndicatorTest() {

  describe('SwiperIndicatorTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testSwiperIndicator001
     * @tc.number SUB_ARKUI_CAPI_SWIPER_INDICATOR_0100
     * @tc.desc   testing indicator for swiper with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperIndicator001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperIndicator001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperIndicator002
     * @tc.number SUB_ARKUI_CAPI_SWIPER_INDICATOR_0200
     * @tc.desc   testing indicator for swiper with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperIndicator002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperIndicator002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperIndicator003
     * @tc.number SUB_ARKUI_CAPI_SWIPER_INDICATOR_0300
     * @tc.desc   testing indicator for swiper with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperIndicator003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperIndicator003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperIndicator004
     * @tc.number SUB_ARKUI_CAPI_SWIPER_INDICATOR_0400
     * @tc.desc   testing indicator for swiper with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperIndicator004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperIndicator004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperIndicator005
     * @tc.number SUB_ARKUI_CAPI_SWIPER_INDICATOR_0500
     * @tc.desc   testing indicator for swiper with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperIndicator005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperIndicator005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperIndicator006
     * @tc.number SUB_ARKUI_CAPI_SWIPER_INDICATOR_0600
     * @tc.desc   testing indicator for swiper with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperIndicator006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperIndicator006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperIndicator007
     * @tc.number SUB_ARKUI_CAPI_SWIPER_INDICATOR_0700
     * @tc.desc   testing indicator for swiper with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperIndicator007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperIndicator007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperIndicator008
     * @tc.number SUB_ARKUI_CAPI_SWIPER_INDICATOR_0800
     * @tc.desc   testing indicator for swiper with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperIndicator008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperIndicator008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperIndicator009
     * @tc.number SUB_ARKUI_CAPI_SWIPER_INDICATOR_0900
     * @tc.desc   testing indicator for swiper with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperIndicator009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperIndicator009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperIndicator010
     * @tc.number SUB_ARKUI_CAPI_SWIPER_INDICATOR_1000
     * @tc.desc   testing indicator for swiper with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperIndicator010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperIndicator010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperIndicator011
     * @tc.number SUB_ARKUI_CAPI_SWIPER_INDICATOR_1100
     * @tc.desc   testing indicator for swiper with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperIndicator011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperIndicator011()).assertEqual(0)
      done()
    })

  })
}
