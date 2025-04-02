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

export default function swiperClipTest() {

  describe('SwiperClipTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_CLIP_0100
     * @tc.name       : testSwiperClip001
     * @tc.desc       : testing clip for swiper with normal rect value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperClip001', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperClip001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_CLIP_0200
     * @tc.name       : testSwiperClip002
     * @tc.desc       : testing clip for swiper with abnormal rect value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testSwiperClip002', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperClip002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_CLIP_0300
     * @tc.name       : testSwiperClip003
     * @tc.desc       : testing clip for swiper with large rect value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperClip003', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperClip003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_CLIP_0400
     * @tc.name       : testSwiperClip004
     * @tc.desc       : testing clip for swiper with normal circle value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperClip004', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperClip004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_CLIP_0500
     * @tc.name       : testSwiperClip005
     * @tc.desc       : testing clip for swiper with abnormal circle value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testSwiperClip005', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperClip005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_CLIP_0600
     * @tc.name       : testSwiperClip006
     * @tc.desc       : testing clip for swiper with large circle value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperClip006', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperClip006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_CLIP_0700
     * @tc.name       : testSwiperClip007
     * @tc.desc       : testing clip for swiper with normal ellipse value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperClip007', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperClip007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_CLIP_0800
     * @tc.name       : testSwiperClip008
     * @tc.desc       : testing clip for swiper with abnormal ellipse value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testSwiperClip008', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperClip008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_CLIP_0900
     * @tc.name       : testSwiperClip009
     * @tc.desc       : testing clip for swiper with large ellipse value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperClip009', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperClip009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_CLIP_1000
     * @tc.name       : testSwiperClip010
     * @tc.desc       : testing clip for swiper with normal path value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperClip010', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperClip010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_CLIP_1100
     * @tc.name       : testSwiperClip011
     * @tc.desc       : testing clip for swiper with abnormal path value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testSwiperClip011', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperClip011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_CLIP_1200
     * @tc.name       : testSwiperClip012
     * @tc.desc       : testing clip for swiper with large path value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperClip012', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperClip012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_CLIP_1300
     * @tc.name       : testSwiperClip013
     * @tc.desc       : testing clip for swiper with normal bool value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperClip013', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperClip013()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_CLIP_1400
     * @tc.name       : testSwiperClip014
     * @tc.desc       : testing clip for swiper with normal bool value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperClip014', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperClip014()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_CLIP_1500
     * @tc.name       : testSwiperClip015
     * @tc.desc       : testing clip for swiper with abnormal bool value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testSwiperClip015', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperClip015()).assertEqual(0)
      done()
    })

  })
}
