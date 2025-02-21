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

export default function customComponentForegroundBlurStyleTest() {

  describe('CustomComponentForegroundBlurStyleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_0100
    * @tc.name       : testCustomComponentForegroundBlurStyle001
    * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_THIN
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCustomComponentForegroundBlurStyle001', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_0200
     * @tc.name       : testCustomComponentForegroundBlurStyle002
     * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_REGULAR
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentForegroundBlurStyle002', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_0300
     * @tc.name       : testCustomComponentForegroundBlurStyle003
     * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_THICK
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentForegroundBlurStyle003', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_0400
     * @tc.name       : testCustomComponentForegroundBlurStyle004
     * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_BACKGROUND_THIN
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentForegroundBlurStyle004', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_0500
     * @tc.name       : testCustomComponentForegroundBlurStyle005
     * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_BACKGROUND_REGULAR
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentForegroundBlurStyle005', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_0600
     * @tc.name       : testCustomComponentForegroundBlurStyle006
     * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_BACKGROUND_THICK
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentForegroundBlurStyle006', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_0700
     * @tc.name       : testCustomComponentForegroundBlurStyle007
     * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_BACKGROUND_ULTRA_THICK
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentForegroundBlurStyle007', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_0800
     * @tc.name       : testCustomComponentForegroundBlurStyle008
     * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_NONE
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentForegroundBlurStyle008', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_0900
     * @tc.name       : testCustomComponentForegroundBlurStyle009
     * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_COMPONENT_ULTRA_THIN
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentForegroundBlurStyle009', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_1000
     * @tc.name       : testCustomComponentForegroundBlurStyle010
     * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_COMPONENT_THIN
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentForegroundBlurStyle010', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_1100
     * @tc.name       : testCustomComponentForegroundBlurStyle011
     * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_COMPONENT_REGULAR
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentForegroundBlurStyle011', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_1200
     * @tc.name       : testCustomComponentForegroundBlurStyle012
     * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_COMPONENT_THICK
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentForegroundBlurStyle012', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_1300
     * @tc.name       : testCustomComponentForegroundBlurStyle013
     * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_COMPONENT_ULTRA_THICK
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentForegroundBlurStyle013', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle013()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_1400
     * @tc.name       : testCustomComponentForegroundBlurStyle014
     * @tc.desc       : testing foregroundBlurStyle for stack with -100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCustomComponentForegroundBlurStyle014', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle014()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_1500
     * @tc.name       : testCustomComponentForegroundBlurStyle015
     * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_COLOR_MODE_SYSTEM
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentForegroundBlurStyle015', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle015()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_1600
     * @tc.name       : testCustomComponentForegroundBlurStyle016
     * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_COLOR_MODE_LIGHT
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentForegroundBlurStyle016', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle016()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_1700
     * @tc.name       : testCustomComponentForegroundBlurStyle017
     * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_COLOR_MODE_DARK
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentForegroundBlurStyle017', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle017()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_1800
     * @tc.name       : testCustomComponentForegroundBlurStyle018
     * @tc.desc       : testing foregroundBlurStyle for stack with ArkUI_ColorMode -100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCustomComponentForegroundBlurStyle018', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle018()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_1900
     * @tc.name       : testCustomComponentForegroundBlurStyle019
     * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_ADAPTIVE_COLOR_DEFAULT
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentForegroundBlurStyle019', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle019()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_2000
     * @tc.name       : testCustomComponentForegroundBlurStyle020
     * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_ADAPTIVE_COLOR_AVERAGE
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentForegroundBlurStyle020', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle020()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_2100
     * @tc.name       : testCustomComponentForegroundBlurStyle021
     * @tc.desc       : testing foregroundBlurStyle for stack with ArkUI_AdaptiveColor -100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCustomComponentForegroundBlurStyle021', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle021()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_2200
     * @tc.name       : testCustomComponentForegroundBlurStyle022
     * @tc.desc       : testing foregroundBlurStyle for stack with grayScale [-1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCustomComponentForegroundBlurStyle022', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle022()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_2300
     * @tc.name       : testCustomComponentForegroundBlurStyle023
     * @tc.desc       : testing foregroundBlurStyle for stack with grayScale [0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentForegroundBlurStyle023', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle023()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_2400
     * @tc.name       : testCustomComponentForegroundBlurStyle024
     * @tc.desc       : testing foregroundBlurStyle for stack with grayScale [20
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentForegroundBlurStyle024', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle024()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_2500
     * @tc.name       : testCustomComponentForegroundBlurStyle025
     * @tc.desc       : testing foregroundBlurStyle for stack with grayScale [127
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentForegroundBlurStyle025', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle025()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_2600
     * @tc.name       : testCustomComponentForegroundBlurStyle026
     * @tc.desc       : testing foregroundBlurStyle for stack with grayScale [200
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCustomComponentForegroundBlurStyle026', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle026()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_2700
     * @tc.name       : testCustomComponentForegroundBlurStyle027
     * @tc.desc       : testing foregroundBlurStyle for stack with grayScale -1]
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCustomComponentForegroundBlurStyle027', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle027()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_2800
     * @tc.name       : testCustomComponentForegroundBlurStyle028
     * @tc.desc       : testing foregroundBlurStyle for stack with grayScale 0]
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentForegroundBlurStyle028', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle028()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_2900
     * @tc.name       : testCustomComponentForegroundBlurStyle029
     * @tc.desc       : testing foregroundBlurStyle for stack with grayScale 20]
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentForegroundBlurStyle029', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle029()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_3000
     * @tc.name       : testCustomComponentForegroundBlurStyle030
     * @tc.desc       : testing foregroundBlurStyle for stack with grayScale 127]
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentForegroundBlurStyle030', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle030()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_3100
     * @tc.name       : testCustomComponentForegroundBlurStyle031
     * @tc.desc       : testing foregroundBlurStyle for stack with grayScale 200]
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCustomComponentForegroundBlurStyle031', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle031()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_3200
     * @tc.name       : testCustomComponentForegroundBlurStyle032
     * @tc.desc       : testing foregroundBlurStyle for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentForegroundBlurStyle032', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle032()).assertEqual(0)
      done()
    })

  })
}
