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

export default function commonAttrsForegroundBlurStyleTest() {

  describe('CommonAttrsForegroundBlurStyleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_0100
    * @tc.name       : testCommonAttrsForegroundBlurStyle001
    * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_THIN
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCommonAttrsForegroundBlurStyle001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_0200
     * @tc.name       : testCommonAttrsForegroundBlurStyle002
     * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_REGULAR
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsForegroundBlurStyle002', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_0300
     * @tc.name       : testCommonAttrsForegroundBlurStyle003
     * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_THICK
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsForegroundBlurStyle003', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_0400
     * @tc.name       : testCommonAttrsForegroundBlurStyle004
     * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_BACKGROUND_THIN
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsForegroundBlurStyle004', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_0500
     * @tc.name       : testCommonAttrsForegroundBlurStyle005
     * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_BACKGROUND_REGULAR
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsForegroundBlurStyle005', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_0600
     * @tc.name       : testCommonAttrsForegroundBlurStyle006
     * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_BACKGROUND_THICK
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsForegroundBlurStyle006', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_0700
     * @tc.name       : testCommonAttrsForegroundBlurStyle007
     * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_BACKGROUND_ULTRA_THICK
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsForegroundBlurStyle007', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_0800
     * @tc.name       : testCommonAttrsForegroundBlurStyle008
     * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_NONE
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsForegroundBlurStyle008', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_0900
     * @tc.name       : testCommonAttrsForegroundBlurStyle009
     * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_COMPONENT_ULTRA_THIN
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsForegroundBlurStyle009', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_1000
     * @tc.name       : testCommonAttrsForegroundBlurStyle010
     * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_COMPONENT_THIN
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsForegroundBlurStyle010', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_1100
     * @tc.name       : testCommonAttrsForegroundBlurStyle011
     * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_COMPONENT_REGULAR
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsForegroundBlurStyle011', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_1200
     * @tc.name       : testCommonAttrsForegroundBlurStyle012
     * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_COMPONENT_THICK
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsForegroundBlurStyle012', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_1300
     * @tc.name       : testCommonAttrsForegroundBlurStyle013
     * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_COMPONENT_ULTRA_THICK
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsForegroundBlurStyle013', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle013()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_1400
     * @tc.name       : testCommonAttrsForegroundBlurStyle014
     * @tc.desc       : testing foregroundBlurStyle for stack with -100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCommonAttrsForegroundBlurStyle014', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle014()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_1500
     * @tc.name       : testCommonAttrsForegroundBlurStyle015
     * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_COLOR_MODE_SYSTEM
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsForegroundBlurStyle015', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle015()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_1600
     * @tc.name       : testCommonAttrsForegroundBlurStyle016
     * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_COLOR_MODE_LIGHT
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsForegroundBlurStyle016', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle016()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_1700
     * @tc.name       : testCommonAttrsForegroundBlurStyle017
     * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_COLOR_MODE_DARK
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsForegroundBlurStyle017', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle017()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_1800
     * @tc.name       : testCommonAttrsForegroundBlurStyle018
     * @tc.desc       : testing foregroundBlurStyle for stack with ArkUI_ColorMode -100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCommonAttrsForegroundBlurStyle018', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle018()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_1900
     * @tc.name       : testCommonAttrsForegroundBlurStyle019
     * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_ADAPTIVE_COLOR_DEFAULT
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsForegroundBlurStyle019', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle019()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_2000
     * @tc.name       : testCommonAttrsForegroundBlurStyle020
     * @tc.desc       : testing foregroundBlurStyle for stack with ARKUI_ADAPTIVE_COLOR_AVERAGE
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsForegroundBlurStyle020', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle020()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_2100
     * @tc.name       : testCommonAttrsForegroundBlurStyle021
     * @tc.desc       : testing foregroundBlurStyle for stack with ArkUI_AdaptiveColor -100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCommonAttrsForegroundBlurStyle021', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle021()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_2200
     * @tc.name       : testCommonAttrsForegroundBlurStyle022
     * @tc.desc       : testing foregroundBlurStyle for stack with grayScale [-1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCommonAttrsForegroundBlurStyle022', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle022()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_2300
     * @tc.name       : testCommonAttrsForegroundBlurStyle023
     * @tc.desc       : testing foregroundBlurStyle for stack with grayScale [0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsForegroundBlurStyle023', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle023()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_2400
     * @tc.name       : testCommonAttrsForegroundBlurStyle024
     * @tc.desc       : testing foregroundBlurStyle for stack with grayScale [20
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsForegroundBlurStyle024', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle024()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_2500
     * @tc.name       : testCommonAttrsForegroundBlurStyle025
     * @tc.desc       : testing foregroundBlurStyle for stack with grayScale [127
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsForegroundBlurStyle025', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle025()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_2600
     * @tc.name       : testCommonAttrsForegroundBlurStyle026
     * @tc.desc       : testing foregroundBlurStyle for stack with grayScale [200
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCommonAttrsForegroundBlurStyle026', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle026()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_2700
     * @tc.name       : testCommonAttrsForegroundBlurStyle027
     * @tc.desc       : testing foregroundBlurStyle for stack with grayScale -1]
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCommonAttrsForegroundBlurStyle027', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle027()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_2800
     * @tc.name       : testCommonAttrsForegroundBlurStyle028
     * @tc.desc       : testing foregroundBlurStyle for stack with grayScale 0]
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsForegroundBlurStyle028', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle028()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_2900
     * @tc.name       : testCommonAttrsForegroundBlurStyle029
     * @tc.desc       : testing foregroundBlurStyle for stack with grayScale 20]
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsForegroundBlurStyle029', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle029()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_3000
     * @tc.name       : testCommonAttrsForegroundBlurStyle030
     * @tc.desc       : testing foregroundBlurStyle for stack with grayScale 127]
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsForegroundBlurStyle030', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle030()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_3100
     * @tc.name       : testCommonAttrsForegroundBlurStyle031
     * @tc.desc       : testing foregroundBlurStyle for stack with grayScale 200]
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCommonAttrsForegroundBlurStyle031', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle031()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_3200
     * @tc.name       : testCommonAttrsForegroundBlurStyle032
     * @tc.desc       : testing foregroundBlurStyle for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsForegroundBlurStyle032', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle032()).assertEqual(0)
      done()
    })

  })
}
