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

export default function commonAttrsForegroundBlurStyleTest() {

  describe('CommonAttrsForegroundBlurStyleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCommonAttrsForegroundBlurStyle001
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_0100
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_THIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundBlurStyle001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundBlurStyle002
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_0200
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_REGULAR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundBlurStyle002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundBlurStyle003
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_0300
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_THICK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundBlurStyle003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundBlurStyle004
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_0400
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_BACKGROUND_THIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundBlurStyle004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundBlurStyle005
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_0500
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_BACKGROUND_REGULAR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundBlurStyle005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundBlurStyle006
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_0600
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_BACKGROUND_THICK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundBlurStyle006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundBlurStyle007
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_0700
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_BACKGROUND_ULTRA_THICK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundBlurStyle007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundBlurStyle008
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_0800
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_NONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundBlurStyle008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundBlurStyle009
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_0900
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_COMPONENT_ULTRA_THIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundBlurStyle009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundBlurStyle010
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_1000
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_COMPONENT_THIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundBlurStyle010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundBlurStyle011
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_1100
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_COMPONENT_REGULAR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundBlurStyle011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundBlurStyle012
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_1200
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_COMPONENT_THICK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundBlurStyle012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle012()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundBlurStyle013
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_1300
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_BLUR_STYLE_COMPONENT_ULTRA_THICK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundBlurStyle013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle013()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundBlurStyle014
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_1400
     * @tc.desc   testing foregroundBlurStyle for stack with -100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundBlurStyle014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle014()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundBlurStyle015
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_1500
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_COLOR_MODE_SYSTEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundBlurStyle015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle015()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundBlurStyle016
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_1600
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_COLOR_MODE_LIGHT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundBlurStyle016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle016()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundBlurStyle017
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_1700
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_COLOR_MODE_DARK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundBlurStyle017', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle017()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundBlurStyle018
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_1800
     * @tc.desc   testing foregroundBlurStyle for stack with ArkUI_ColorMode -100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundBlurStyle018', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle018()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundBlurStyle019
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_1900
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_ADAPTIVE_COLOR_DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundBlurStyle019', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle019()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundBlurStyle020
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_2000
     * @tc.desc   testing foregroundBlurStyle for stack with ARKUI_ADAPTIVE_COLOR_AVERAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundBlurStyle020', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle020()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundBlurStyle021
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_2100
     * @tc.desc   testing foregroundBlurStyle for stack with ArkUI_AdaptiveColor -100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundBlurStyle021', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle021()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundBlurStyle022
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_2200
     * @tc.desc   testing foregroundBlurStyle for stack with grayScale [-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundBlurStyle022', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle022()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundBlurStyle023
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_2300
     * @tc.desc   testing foregroundBlurStyle for stack with grayScale [0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundBlurStyle023', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle023()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundBlurStyle024
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_2400
     * @tc.desc   testing foregroundBlurStyle for stack with grayScale [20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundBlurStyle024', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle024()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundBlurStyle025
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_2500
     * @tc.desc   testing foregroundBlurStyle for stack with grayScale [127
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundBlurStyle025', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle025()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundBlurStyle026
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_2600
     * @tc.desc   testing foregroundBlurStyle for stack with grayScale [200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundBlurStyle026', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle026()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundBlurStyle027
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_2700
     * @tc.desc   testing foregroundBlurStyle for stack with grayScale -1]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundBlurStyle027', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle027()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundBlurStyle028
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_2800
     * @tc.desc   testing foregroundBlurStyle for stack with grayScale 0]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundBlurStyle028', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle028()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundBlurStyle029
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_2900
     * @tc.desc   testing foregroundBlurStyle for stack with grayScale 20]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundBlurStyle029', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle029()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundBlurStyle030
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_3000
     * @tc.desc   testing foregroundBlurStyle for stack with grayScale 127]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundBlurStyle030', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle030()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundBlurStyle031
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_3100
     * @tc.desc   testing foregroundBlurStyle for stack with grayScale 200]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundBlurStyle031', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle031()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundBlurStyle032
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_FOREGROUNDBLURSTYLE_3200
     * @tc.desc   testing foregroundBlurStyle for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundBlurStyle032', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundBlurStyle032()).assertEqual(0)
      done()
    })

  })
}
