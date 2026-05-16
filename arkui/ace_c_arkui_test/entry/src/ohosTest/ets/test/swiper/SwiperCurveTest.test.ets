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

export default function swiperCurveTest() {

  describe('SwiperCurveTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testSwiperCurve001
     * @tc.number SUB_ARKUI_CAPI_SWIPER_CURVE_0100
     * @tc.desc   testing curve for swiper with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperCurve001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperCurve001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperCurve002
     * @tc.number SUB_ARKUI_CAPI_SWIPER_CURVE_0200
     * @tc.desc   testing curve for swiper with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperCurve002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperCurve002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperCurve003
     * @tc.number SUB_ARKUI_CAPI_SWIPER_CURVE_0300
     * @tc.desc   testing curve for swiper with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperCurve003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperCurve003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperCurve004
     * @tc.number SUB_ARKUI_CAPI_SWIPER_CURVE_0400
     * @tc.desc   testing curve for swiper with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperCurve004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperCurve004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperCurve005
     * @tc.number SUB_ARKUI_CAPI_SWIPER_CURVE_0500
     * @tc.desc   testing curve for swiper with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperCurve005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperCurve005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperCurve006
     * @tc.number SUB_ARKUI_CAPI_SWIPER_CURVE_0600
     * @tc.desc   testing curve for swiper with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperCurve006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperCurve006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperCurve007
     * @tc.number SUB_ARKUI_CAPI_SWIPER_CURVE_0700
     * @tc.desc   testing curve for swiper with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperCurve007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperCurve007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperCurve008
     * @tc.number SUB_ARKUI_CAPI_SWIPER_CURVE_0800
     * @tc.desc   testing curve for swiper with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperCurve008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperCurve008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperCurve009
     * @tc.number SUB_ARKUI_CAPI_SWIPER_CURVE_0900
     * @tc.desc   testing curve for swiper with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperCurve009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperCurve009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperCurve010
     * @tc.number SUB_ARKUI_CAPI_SWIPER_CURVE_1000
     * @tc.desc   testing curve for swiper with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperCurve010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperCurve010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperCurve011
     * @tc.number SUB_ARKUI_CAPI_SWIPER_CURVE_1100
     * @tc.desc   testing curve for swiper with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperCurve011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperCurve011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperCurve012
     * @tc.number SUB_ARKUI_CAPI_SWIPER_CURVE_1200
     * @tc.desc   testing curve for swiper with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperCurve012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperCurve012()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperCurve013
     * @tc.number SUB_ARKUI_CAPI_SWIPER_CURVE_1300
     * @tc.desc   testing curve for swiper with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperCurve013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperCurve013()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperCurve014
     * @tc.number SUB_ARKUI_CAPI_SWIPER_CURVE_1400
     * @tc.desc   testing curve for swiper with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperCurve014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperCurve014()).assertEqual(0)
      done()
    })

  })
}
