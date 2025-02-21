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

import { expect, describe, it, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function scrollBrightnessTest() {

  describe('ScrollBrightnessTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_BRIGHTNESS_0100
     * @tc.name       : testScrollBrightness001
     * @tc.desc       : testing brightness for scroll with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollBrightness001', 0, async (done: Function) => {
      expect(nativeFunc.testScrollBrightness001()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_BRIGHTNESS_0200
     * @tc.name       : testScrollBrightness002
     * @tc.desc       : testing brightness for scroll with max value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollBrightness002', 0, async (done: Function) => {
      expect(nativeFunc.testScrollBrightness002()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_BRIGHTNESS_0300
     * @tc.name       : testScrollBrightness003
     * @tc.desc       : testing brightness for scroll with min value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollBrightness003', 0, async (done: Function) => {
      expect(nativeFunc.testScrollBrightness003()).assertEqual(0)
      done();
    });
  })
}
