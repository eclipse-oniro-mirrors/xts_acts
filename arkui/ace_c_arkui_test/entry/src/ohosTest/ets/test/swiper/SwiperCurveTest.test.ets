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

import { beforeEach, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function swiperCurveTest() {

  describe('SwiperCurveTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_CURVE_0100
     * @tc.name       : testSwiperCurve001
     * @tc.desc       : testing curve for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperCurve001', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperCurve001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_CURVE_0200
     * @tc.name       : testSwiperCurve002
     * @tc.desc       : testing curve for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperCurve002', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperCurve002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_CURVE_0300
     * @tc.name       : testSwiperCurve003
     * @tc.desc       : testing curve for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperCurve003', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperCurve003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_CURVE_0400
     * @tc.name       : testSwiperCurve004
     * @tc.desc       : testing curve for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperCurve004', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperCurve004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_CURVE_0500
     * @tc.name       : testSwiperCurve005
     * @tc.desc       : testing curve for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperCurve005', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperCurve005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_CURVE_0600
     * @tc.name       : testSwiperCurve006
     * @tc.desc       : testing curve for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperCurve006', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperCurve006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_CURVE_0700
     * @tc.name       : testSwiperCurve007
     * @tc.desc       : testing curve for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperCurve007', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperCurve007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_CURVE_0800
     * @tc.name       : testSwiperCurve008
     * @tc.desc       : testing curve for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperCurve008', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperCurve008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_CURVE_0900
     * @tc.name       : testSwiperCurve009
     * @tc.desc       : testing curve for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperCurve009', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperCurve009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_CURVE_1000
     * @tc.name       : testSwiperCurve010
     * @tc.desc       : testing curve for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperCurve010', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperCurve010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_CURVE_1100
     * @tc.name       : testSwiperCurve011
     * @tc.desc       : testing curve for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperCurve011', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperCurve011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_CURVE_1200
     * @tc.name       : testSwiperCurve012
     * @tc.desc       : testing curve for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperCurve012', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperCurve012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_CURVE_1300
     * @tc.name       : testSwiperCurve013
     * @tc.desc       : testing curve for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperCurve013', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperCurve013()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_CURVE_1400
     * @tc.name       : testSwiperCurve014
     * @tc.desc       : testing curve for swiper with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testSwiperCurve014', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperCurve014()).assertEqual(0)
      done()
    })

  })
}
