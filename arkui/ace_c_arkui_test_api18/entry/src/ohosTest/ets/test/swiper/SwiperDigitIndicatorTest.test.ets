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

export default function swiperDigitIndicatorTest() {

  describe('swiperDigitIndicatorTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_INDICATOR_0100
     * @tc.name       : testSwiperDigitIndicator001
     * @tc.desc       : testing Indicator for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperDigitIndicator001', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testSwiperDigitIndicator001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_DIGITINDICATOR_0200
     * @tc.name       : testSwiperDigitIndicator002
     * @tc.desc       : testing DigitIndicator for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperDigitIndicator002', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testSwiperDigitIndicator002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_DIGITINDICATOR_0300
     * @tc.name       : testSwiperDigitIndicator003
     * @tc.desc       : testing DigitIndicator for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperDigitIndicator003', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testSwiperDigitIndicator003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_DIGITINDICATOR_0400
     * @tc.name       : testSwiperDigitIndicator004
     * @tc.desc       : testing DigitIndicator for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperDigitIndicator004', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testSwiperDigitIndicator004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_DIGITINDICATOR_0500
     * @tc.name       : testSwiperDigitIndicator005
     * @tc.desc       : testing DigitIndicator for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperDigitIndicator005', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testSwiperDigitIndicator005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_DIGITINDICATOR_0600
     * @tc.name       : testSwiperDigitIndicator006
     * @tc.desc       : testing DigitIndicator for swiper with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperDigitIndicator006', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testSwiperDigitIndicator006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_DIGITINDICATOR_0700
     * @tc.name       : testSwiperDigitIndicator007
     * @tc.desc       : testing DigitIndicator for swiper with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperDigitIndicator007', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testSwiperDigitIndicator007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_DIGITINDICATOR_0800
     * @tc.name       : testSwiperDigitIndicator008
     * @tc.desc       : testing DigitIndicator for swiper with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperDigitIndicator008', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testSwiperDigitIndicator008()).assertEqual(0)
      done()
    })

  })
}
