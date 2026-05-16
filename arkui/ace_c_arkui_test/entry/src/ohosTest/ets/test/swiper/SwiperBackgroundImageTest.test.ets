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

export default function swiperBackgroundImageTest() {

  describe('SwiperBackgroundImageTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testSwiperBackgroundImage001
     * @tc.number SUB_ARKUI_CAPI_SWIPER_BACKGROUNDIMAGE_0100
     * @tc.desc   testing backgroundImage for swiper with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperBackgroundImage001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperBackgroundImage001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperBackgroundImage002
     * @tc.number SUB_ARKUI_CAPI_SWIPER_BACKGROUNDIMAGE_0200
     * @tc.desc   testing backgroundImage for swiper with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperBackgroundImage002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperBackgroundImage002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperBackgroundImage003
     * @tc.number SUB_ARKUI_CAPI_SWIPER_BACKGROUNDIMAGE_0300
     * @tc.desc   testing backgroundImage for swiper with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperBackgroundImage003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperBackgroundImage003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperBackgroundImage004
     * @tc.number SUB_ARKUI_CAPI_SWIPER_BACKGROUNDIMAGE_0400
     * @tc.desc   testing backgroundImage for swiper with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperBackgroundImage004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperBackgroundImage004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperBackgroundImage005
     * @tc.number SUB_ARKUI_CAPI_SWIPER_BACKGROUNDIMAGE_0500
     * @tc.desc   testing backgroundImage for swiper with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperBackgroundImage005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperBackgroundImage005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperBackgroundImage006
     * @tc.number SUB_ARKUI_CAPI_SWIPER_BACKGROUNDIMAGE_0600
     * @tc.desc   testing backgroundImage for swiper with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperBackgroundImage006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperBackgroundImage006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperBackgroundImage007
     * @tc.number SUB_ARKUI_CAPI_SWIPER_BACKGROUNDIMAGE_0700
     * @tc.desc   testing default values of backgroundImage property of the swiper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperBackgroundImage007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperBackgroundImage007()).assertEqual(0)
      done()
    })

  })
}
