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

export default function swiperEffectModeTest() {

  describe('SwiperEffectModeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_EDGE_EFFECT_MODE_0100
     * @tc.name       : testSwiperEffectMode001
     * @tc.desc       : testing effectMode for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperEffectMode001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperEffectMode001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_EDGE_EFFECT_MODE_0200
     * @tc.name       : testSwiperEffectMode002
     * @tc.desc       : testing effectMode for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperEffectMode002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperEffectMode002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_EDGE_EFFECT_MODE_0300
     * @tc.name       : testSwiperEffectMode003
     * @tc.desc       : testing effectMode for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperEffectMode003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperEffectMode003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_EDGE_EFFECT_MODE_0400
     * @tc.name       : testSwiperEffectMode004
     * @tc.desc       : testing effectMode for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperEffectMode004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperEffectMode004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_EDGE_EFFECT_MODE_0500
     * @tc.name       : testSwiperEffectMode005
     * @tc.desc       : testing effectMode for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperEffectMode005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperEffectMode005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_EDGE_EFFECT_MODE_0600
     * @tc.name       : testSwiperEffectMode006
     * @tc.desc       : testing effectMode for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperEffectMode006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperEffectMode006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_EDGE_EFFECT_MODE_0700
     * @tc.name       : testSwiperEffectMode007
     * @tc.desc       : testing effectMode for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperEffectMode007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperEffectMode007()).assertEqual(0)
      done()
    })
  })
}
