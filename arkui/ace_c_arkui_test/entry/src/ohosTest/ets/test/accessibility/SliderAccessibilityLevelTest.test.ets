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

export default function sliderAccessibilityLevelTest() {

  describe('SliderAccessibilityLevelTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SLIDER_ACCESSIBILITYLEVEL_0100
     * @tc.name       : testSliderAccessibilityLevel001
     * @tc.desc       : testing accessibilityLevel for Slider with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSliderAccessibilityLevel001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderAccessibilityLevel001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SLIDER_ACCESSIBILITYLEVEL_0200
     * @tc.name       : testSliderAccessibilityLevel002
     * @tc.desc       : testing accessibilityLevel for Slider with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSliderAccessibilityLevel002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderAccessibilityLevel002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SLIDER_ACCESSIBILITYLEVEL_0300
     * @tc.name       : testSliderAccessibilityLevel003
     * @tc.desc       : testing accessibilityLevel for Slider with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSliderAccessibilityLevel003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderAccessibilityLevel003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SLIDER_ACCESSIBILITYLEVEL_0400
     * @tc.name       : testSliderAccessibilityLevel004
     * @tc.desc       : testing accessibilityLevel for Slider with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSliderAccessibilityLevel004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderAccessibilityLevel004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SLIDER_ACCESSIBILITYLEVEL_0500
     * @tc.name       : testSliderAccessibilityLevel005
     * @tc.desc       : testing accessibilityLevel for Slider with alnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testSliderAccessibilityLevel005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderAccessibilityLevel005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SLIDER_ACCESSIBILITYLEVEL_0600
     * @tc.name       : testSliderAccessibilityLevel006
     * @tc.desc       : testing accessibilityLevel for Slider with alnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testSliderAccessibilityLevel006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderAccessibilityLevel006()).assertEqual(0)
      done()
    })
  })
}
