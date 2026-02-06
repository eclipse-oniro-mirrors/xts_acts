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

export default function swiperWidthTest() {

  describe('SwiperWidthTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testSwiperWidth001
     * @tc.number SUB_ARKUI_CAPI_SWIPER_WIDTH_0100
     * @tc.desc   testing width for swiper with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperWidth001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperWidth001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperWidth002
     * @tc.number SUB_ARKUI_CAPI_SWIPER_WIDTH_0200
     * @tc.desc   testing width for swiper with normal abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperWidth002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperWidth002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSwiperWidth003
     * @tc.number SUB_ARKUI_CAPI_SWIPER_WIDTH_0300
     * @tc.desc   testing width for swiper with large value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperWidth003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperWidth003()).assertEqual(0)
      done()
    })

  })
}
