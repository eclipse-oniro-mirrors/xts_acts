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

export default function swiperIndicatorTest() {

  describe('SwiperIndicatorTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_INDICATOR_0100
     * @tc.name       : testSwiperIndicator001
     * @tc.desc       : testing indicator for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperIndicator001', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperIndicator001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_INDICATOR_0200
     * @tc.name       : testSwiperIndicator002
     * @tc.desc       : testing indicator for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperIndicator002', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperIndicator002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_INDICATOR_0300
     * @tc.name       : testSwiperIndicator003
     * @tc.desc       : testing indicator for swiper with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testSwiperIndicator003', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperIndicator003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_INDICATOR_0400
     * @tc.name       : testSwiperIndicator004
     * @tc.desc       : testing indicator for swiper with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testSwiperIndicator004', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperIndicator004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_INDICATOR_0500
     * @tc.name       : testSwiperIndicator005
     * @tc.desc       : testing indicator for swiper with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testSwiperIndicator005', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperIndicator005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_INDICATOR_0600
     * @tc.name       : testSwiperIndicator006
     * @tc.desc       : testing indicator for swiper with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testSwiperIndicator006', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperIndicator006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_INDICATOR_0700
     * @tc.name       : testSwiperIndicator007
     * @tc.desc       : testing indicator for swiper with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testSwiperIndicator007', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperIndicator007()).assertEqual(0)
      done()
    })

  })
}
