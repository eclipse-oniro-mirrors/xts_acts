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

export default function swiperBackgroundImageTest() {

  describe('SwiperBackgroundImageTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_BACKGROUNDIMAGE_0100
     * @tc.name       : testSwiperBackgroundImage001
     * @tc.desc       : testing backgroundImage for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperBackgroundImage001', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperBackgroundImage001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_BACKGROUNDIMAGE_0200
     * @tc.name       : testSwiperBackgroundImage002
     * @tc.desc       : testing backgroundImage for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperBackgroundImage002', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperBackgroundImage002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_BACKGROUNDIMAGE_0300
     * @tc.name       : testSwiperBackgroundImage003
     * @tc.desc       : testing backgroundImage for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperBackgroundImage003', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperBackgroundImage003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_BACKGROUNDIMAGE_0400
     * @tc.name       : testSwiperBackgroundImage004
     * @tc.desc       : testing backgroundImage for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperBackgroundImage004', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperBackgroundImage004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_BACKGROUNDIMAGE_0500
     * @tc.name       : testSwiperBackgroundImage005
     * @tc.desc       : testing backgroundImage for swiper with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testSwiperBackgroundImage005', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperBackgroundImage005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_BACKGROUNDIMAGE_0600
     * @tc.name       : testSwiperBackgroundImage006
     * @tc.desc       : testing backgroundImage for swiper with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testSwiperBackgroundImage006', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperBackgroundImage006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_BACKGROUNDIMAGE_0700
     * @tc.name       : testSwiperBackgroundImage007
     * @tc.desc       : testing default values of backgroundImage property of the swiper
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperBackgroundImage007', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperBackgroundImage007()).assertEqual(0)
      done()
    })

  })
}
