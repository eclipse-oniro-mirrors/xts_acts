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

export default function sliderAccessibilityGroupTest() {

  describe('SliderAccessibilityGroupTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SLIDER_ACCESSIBILITYGROUP_0100
     * @tc.name       : testSliderAccessibilityGroup001
     * @tc.desc       : testing accessibilityGroup for Slider with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSliderAccessibilityGroup001', 0, async (done: Function) => {
      expect(nativeFunc.testSliderAccessibilityGroup001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SLIDER_ACCESSIBILITYGROUP_0200
     * @tc.name       : testSliderAccessibilityGroup002
     * @tc.desc       : testing accessibilityGroup for Slider with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSliderAccessibilityGroup002', 0, async (done: Function) => {
      expect(nativeFunc.testSliderAccessibilityGroup002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SLIDER_ACCESSIBILITYGROUP_0300
     * @tc.name       : testSliderAccessibilityGroup003
     * @tc.desc       : testing accessibilityGroup for Slider with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testSliderAccessibilityGroup003', 0, async (done: Function) => {
      expect(nativeFunc.testSliderAccessibilityGroup003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SLIDER_ACCESSIBILITYGROUP_0400
     * @tc.name       : testSliderAccessibilityGroup004
     * @tc.desc       : testing accessibilityGroup for Slider with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testSliderAccessibilityGroup004', 0, async (done: Function) => {
      expect(nativeFunc.testSliderAccessibilityGroup004()).assertEqual(0)
      done()
    })
  })
}
