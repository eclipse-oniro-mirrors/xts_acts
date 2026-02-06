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

export default function swiperNextMarginTest() {

  describe('SwiperNextMarginTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testSwiperNextMargin001
     * @tc.number SUB_ARKUI_CAPI_SWIPER_NEXT_MARGIN_0100
     * @tc.desc   testing nextMargin for swiper with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperNextMargin001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperNextMargin001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperNextMargin002
     * @tc.number SUB_ARKUI_CAPI_SWIPER_NEXT_MARGIN_0200
     * @tc.desc   testing nextMargin for swiper with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperNextMargin002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperNextMargin002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperNextMargin003
     * @tc.number SUB_ARKUI_CAPI_SWIPER_NEXT_MARGIN_0300
     * @tc.desc   testing nextMargin for swiper with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperNextMargin003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperNextMargin003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperNextMargin004
     * @tc.number SUB_ARKUI_CAPI_SWIPER_NEXT_MARGIN_0400
     * @tc.desc   testing nextMargin for swiper with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperNextMargin004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperNextMargin004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperNextMargin005
     * @tc.number SUB_ARKUI_CAPI_SWIPER_NEXT_MARGIN_0500
     * @tc.desc   testing nextMargin for swiper with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperNextMargin005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperNextMargin005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperNextMargin006
     * @tc.number SUB_ARKUI_CAPI_SWIPER_NEXT_MARGIN_0600
     * @tc.desc   testing nextMargin for swiper with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperNextMargin006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperNextMargin006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperNextMargin007
     * @tc.number SUB_ARKUI_CAPI_SWIPER_NEXT_MARGIN_0700
     * @tc.desc   testing nextMargin for swiper with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperNextMargin007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperNextMargin007()).assertEqual(0)
      done()
    })

  })
}
