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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function swiperArrowStyleTest() {

  describe('swiperArrowStyleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testSwiperArrowStyle001
     * @tc.number SUB_ARKUI_CAPI_SWIPER_ARROWSTYLE_0100
     * @tc.desc   testing arrowStyle for swiper with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSwiperArrowStyle001', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testSwiperArrowStyle001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperArrowStyle002
     * @tc.number SUB_ARKUI_CAPI_SWIPER_ARROWSTYLE_0200
     * @tc.desc   testing arrowStyle for swiper with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSwiperArrowStyle002', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testSwiperArrowStyle002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperArrowStyle003
     * @tc.number SUB_ARKUI_CAPI_SWIPER_ARROWSTYLE_0300
     * @tc.desc   testing arrowStyle for swiper with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSwiperArrowStyle003', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testSwiperArrowStyle003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperArrowStyle004
     * @tc.number SUB_ARKUI_CAPI_SWIPER_ARROWSTYLE_0400
     * @tc.desc   testing arrowStyle for swiper with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSwiperArrowStyle004', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testSwiperArrowStyle004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperArrowStyle005
     * @tc.number SUB_ARKUI_CAPI_SWIPER_ARROWSTYLE_0500
     * @tc.desc   testing arrowStyle for swiper with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSwiperArrowStyle005', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testSwiperArrowStyle005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperArrowStyle006
     * @tc.number SUB_ARKUI_CAPI_SWIPER_ARROWSTYLE_0600
     * @tc.desc   testing arrowStyle for swiper with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSwiperArrowStyle006', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testSwiperArrowStyle006()).assertEqual(0)
      done()
    })

  })
}
