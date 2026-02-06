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

export default function swiperPrevMarginTest() {

  describe('SwiperPrevMarginTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_PREV_MARGIN_0100
     * @tc.name       : testSwiperPrevMargin001
     * @tc.desc       : testing prevMargin for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperPrevMargin001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperPrevMargin001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_PREV_MARGIN_0200
     * @tc.name       : testSwiperPrevMargin002
     * @tc.desc       : testing prevMargin for swiper with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperPrevMargin002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperPrevMargin002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_PREV_MARGIN_0300
     * @tc.name       : testSwiperPrevMargin003
     * @tc.desc       : testing prevMargin for swiper with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperPrevMargin003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperPrevMargin003()).assertEqual(0)
      done()
    })

        /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_PREV_MARGIN_0400
     * @tc.name       : testSwiperPrevMargin004
     * @tc.desc       : testing prevMargin for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperPrevMargin004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperPrevMargin004()).assertEqual(0)
      done()
    })

        /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_PREV_MARGIN_0500
     * @tc.name       : testSwiperPrevMargin005
     * @tc.desc       : testing prevMargin for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperPrevMargin005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperPrevMargin005()).assertEqual(0)
      done()
    })

        /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_PREV_MARGIN_0600
     * @tc.name       : testSwiperPrevMargin006
     * @tc.desc       : testing prevMargin for swiper with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperPrevMargin006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperPrevMargin006()).assertEqual(0)
      done()
    })

        /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_PREV_MARGIN_0700
     * @tc.name       : testSwiperPrevMargin007
     * @tc.desc       : testing prevMargin for swiper with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperPrevMargin007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperPrevMargin007()).assertEqual(0)
      done()
    })

  })
}
