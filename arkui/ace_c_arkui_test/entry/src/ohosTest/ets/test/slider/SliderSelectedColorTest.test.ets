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

export default function sliderSelectedColorTest() {

  describe('SliderSelectedColorTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_SLIDER_SELECTEDCOLOR_0200
     * @tc.name: testSliderSelectedColor002
     * @tc.desc: testing selectedColor for slider with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSliderSelectedColor002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderSelectedColor002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_SLIDER_SELECTEDCOLOR_0300
     * @tc.name: testSliderSelectedColor003
     * @tc.desc: testing selectedColor for slider with boundary value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSliderSelectedColor003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderSelectedColor003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_SLIDER_SELECTEDCOLOR_0400
     * @tc.name: testSliderSelectedColor004
     * @tc.desc: testing selectedColor for slider with boundary value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSliderSelectedColor004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderSelectedColor004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_SLIDER_SELECTEDCOLOR_0500
     * @tc.name: testSliderSelectedColor005
     * @tc.desc: testing selectedColor for slider with full transparent black value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSliderSelectedColor005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderSelectedColor005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_SLIDER_SELECTEDCOLOR_0600
     * @tc.name: testSliderSelectedColor006
     * @tc.desc: testing selectedColor for slider with translucent black value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSliderSelectedColor006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderSelectedColor006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_SLIDER_SELECTEDCOLOR_0700
     * @tc.name: testSliderSelectedColor007
     * @tc.desc: testing selectedColor for slider with zero value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSliderSelectedColor007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderSelectedColor007()).assertEqual(0)
      done()
    })


  })
}
