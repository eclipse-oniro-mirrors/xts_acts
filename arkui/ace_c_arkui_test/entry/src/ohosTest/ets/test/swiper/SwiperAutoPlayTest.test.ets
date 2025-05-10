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

export default function swiperAutoPlayTest() {

  describe('SwiperAutoPlayTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_AUTOPLAY_0100
     * @tc.name       : testSwiperAutoPlay001
     * @tc.desc       : testing autoPlay for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperAutoPlay001', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperAutoPlay001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_AUTOPLAY_0200
     * @tc.name       : testSwiperAutoPlay002
     * @tc.desc       : testing autoPlay for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperAutoPlay002', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperAutoPlay002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_AUTOPLAY_0300
     * @tc.name       : testSwiperAutoPlay003
     * @tc.desc       : testing autoPlay for swiper with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testSwiperAutoPlay003', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperAutoPlay003()).assertEqual(0)
      done()
    })

  })
}
