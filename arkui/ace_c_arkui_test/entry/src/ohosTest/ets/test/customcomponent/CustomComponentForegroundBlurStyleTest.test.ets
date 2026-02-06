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

export default function customComponentForegroundBlurStyleTest() {

  describe('CustomComponentForegroundBlurStyleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCustomComponentForegroundBlurStyle001
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_0100
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_THIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentForegroundBlurStyle001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentForegroundBlurStyle002
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_0200
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_REGULAR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentForegroundBlurStyle002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentForegroundBlurStyle003
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_0300
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_THICK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentForegroundBlurStyle003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentForegroundBlurStyle004
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_0400
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_BACKGROUND_THIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentForegroundBlurStyle004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentForegroundBlurStyle005
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_0500
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_BACKGROUND_REGULAR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentForegroundBlurStyle005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentForegroundBlurStyle006
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_0600
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_BACKGROUND_THICK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentForegroundBlurStyle006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentForegroundBlurStyle007
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_0700
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_BACKGROUND_ULTRA_THICK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentForegroundBlurStyle007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentForegroundBlurStyle008
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_0800
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_NONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentForegroundBlurStyle008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentForegroundBlurStyle009
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_0900
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_COMPONENT_ULTRA_THIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentForegroundBlurStyle009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentForegroundBlurStyle010
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_1000
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_COMPONENT_THIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentForegroundBlurStyle010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentForegroundBlurStyle011
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_1100
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_COMPONENT_REGULAR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentForegroundBlurStyle011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentForegroundBlurStyle012
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_1200
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_COMPONENT_THICK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentForegroundBlurStyle012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle012()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentForegroundBlurStyle013
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_1300
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_COMPONENT_ULTRA_THICK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentForegroundBlurStyle013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle013()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentForegroundBlurStyle014
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_1400
     * @tc.desc   testing foregroundBlurStyle for stack with -100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentForegroundBlurStyle014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle014()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentForegroundBlurStyle015
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_1500
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_COLOR_MODE_SYSTEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentForegroundBlurStyle015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle015()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentForegroundBlurStyle016
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_1600
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_COLOR_MODE_LIGHT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentForegroundBlurStyle016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle016()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentForegroundBlurStyle017
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_1700
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_COLOR_MODE_DARK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentForegroundBlurStyle017', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle017()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentForegroundBlurStyle018
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_1800
     * @tc.desc   testing foregroundBlurStyle for stack with ArkUI_ColorMode -100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentForegroundBlurStyle018', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle018()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentForegroundBlurStyle019
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_1900
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_ADAPTIVE_COLOR_DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentForegroundBlurStyle019', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle019()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentForegroundBlurStyle020
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_2000
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_ADAPTIVE_COLOR_AVERAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentForegroundBlurStyle020', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle020()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentForegroundBlurStyle021
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_2100
     * @tc.desc   testing foregroundBlurStyle for stack with ArkUI_AdaptiveColor -100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentForegroundBlurStyle021', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle021()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentForegroundBlurStyle022
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_2200
     * @tc.desc   testing foregroundBlurStyle for stack with grayScale [-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentForegroundBlurStyle022', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle022()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentForegroundBlurStyle023
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_2300
     * @tc.desc   testing foregroundBlurStyle for stack with grayScale [0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentForegroundBlurStyle023', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle023()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentForegroundBlurStyle024
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_2400
     * @tc.desc   testing foregroundBlurStyle for stack with grayScale [20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentForegroundBlurStyle024', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle024()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentForegroundBlurStyle025
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_2500
     * @tc.desc   testing foregroundBlurStyle for stack with grayScale [127
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentForegroundBlurStyle025', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle025()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentForegroundBlurStyle026
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_2600
     * @tc.desc   testing foregroundBlurStyle for stack with grayScale [200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentForegroundBlurStyle026', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle026()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentForegroundBlurStyle027
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_2700
     * @tc.desc   testing foregroundBlurStyle for stack with grayScale -1]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentForegroundBlurStyle027', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle027()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentForegroundBlurStyle028
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_2800
     * @tc.desc   testing foregroundBlurStyle for stack with grayScale 0]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentForegroundBlurStyle028', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle028()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentForegroundBlurStyle029
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_2900
     * @tc.desc   testing foregroundBlurStyle for stack with grayScale 20]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentForegroundBlurStyle029', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle029()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentForegroundBlurStyle030
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_3000
     * @tc.desc   testing foregroundBlurStyle for stack with grayScale 127]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentForegroundBlurStyle030', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle030()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentForegroundBlurStyle031
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_3100
     * @tc.desc   testing foregroundBlurStyle for stack with grayScale 200]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentForegroundBlurStyle031', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle031()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentForegroundBlurStyle032
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOREGROUNDBLURSTYLE_3200
     * @tc.desc   testing foregroundBlurStyle for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentForegroundBlurStyle032', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentForegroundBlurStyle032()).assertEqual(0)
      done()
    })

  })
}
