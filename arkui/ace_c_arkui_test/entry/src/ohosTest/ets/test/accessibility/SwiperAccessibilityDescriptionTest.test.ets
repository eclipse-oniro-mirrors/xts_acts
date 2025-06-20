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

export default function swiperAccessibilityDescriptionTest() {

  describe('SwiperAccessibilityDescriptionTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_ACCESSIBILITYDESCRIPTION_0100
     * @tc.name       : testSwiperAccessibilityDescription001
     * @tc.desc       : testing accessibilityDescription for Swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperAccessibilityDescription001', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperAccessibilityDescription001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_ACCESSIBILITYDESCRIPTION_0200
     * @tc.name       : testSwiperAccessibilityDescription002
     * @tc.desc       : testing accessibilityDescription for Swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperAccessibilityDescription002', 0, async (done: Function) => {
      expect(nativeFunc.testSwiperAccessibilityDescription002()).assertEqual(0)
      done()
    })
  })
}
