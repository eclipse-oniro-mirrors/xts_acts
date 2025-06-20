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

export default function columnForegroundBlurStyleTest() {

  describe('ColumnForegroundBlurStyleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_0100
     * @tc.name       : testColumnForegroundBlurStyle001
     * @tc.desc       : testing foregroundBlurStyle for column with ARKUI_BLUR_STYLE_THIN
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testColumnForegroundBlurStyle001', 0, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_0200
     * @tc.name       : testColumnForegroundBlurStyle002
     * @tc.desc       : testing foregroundBlurStyle for column with ARKUI_BLUR_STYLE_REGULAR
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testColumnForegroundBlurStyle002', 0, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_0300
     * @tc.name       : testColumnForegroundBlurStyle003
     * @tc.desc       : testing foregroundBlurStyle for column with ARKUI_BLUR_STYLE_THICK
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testColumnForegroundBlurStyle003', 0, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_0400
     * @tc.name       : testColumnForegroundBlurStyle004
     * @tc.desc       : testing foregroundBlurStyle for column with ARKUI_BLUR_STYLE_BACKGROUND_THIN
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testColumnForegroundBlurStyle004', 0, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_0500
     * @tc.name       : testColumnForegroundBlurStyle005
     * @tc.desc       : testing foregroundBlurStyle for column with ARKUI_BLUR_STYLE_BACKGROUND_REGULAR
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testColumnForegroundBlurStyle005', 0, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_0600
     * @tc.name       : testColumnForegroundBlurStyle006
     * @tc.desc       : testing foregroundBlurStyle for column with ARKUI_BLUR_STYLE_BACKGROUND_THICK
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testColumnForegroundBlurStyle006', 0, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_0700
     * @tc.name       : testColumnForegroundBlurStyle007
     * @tc.desc       : testing foregroundBlurStyle for column with ARKUI_BLUR_STYLE_BACKGROUND_ULTRA_THICK
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testColumnForegroundBlurStyle007', 0, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_0800
     * @tc.name       : testColumnForegroundBlurStyle008
     * @tc.desc       : testing foregroundBlurStyle for column with ARKUI_BLUR_STYLE_NONE
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testColumnForegroundBlurStyle008', 0, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_0900
     * @tc.name       : testColumnForegroundBlurStyle009
     * @tc.desc       : testing foregroundBlurStyle for column with ARKUI_BLUR_STYLE_COMPONENT_ULTRA_THIN
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testColumnForegroundBlurStyle009', 0, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_1000
     * @tc.name       : testColumnForegroundBlurStyle010
     * @tc.desc       : testing foregroundBlurStyle for column with ARKUI_BLUR_STYLE_COMPONENT_THIN
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testColumnForegroundBlurStyle010', 0, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_1100
     * @tc.name       : testColumnForegroundBlurStyle011
     * @tc.desc       : testing foregroundBlurStyle for column with ARKUI_BLUR_STYLE_COMPONENT_REGULAR
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testColumnForegroundBlurStyle011', 0, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_1200
     * @tc.name       : testColumnForegroundBlurStyle012
     * @tc.desc       : testing foregroundBlurStyle for column with ARKUI_BLUR_STYLE_COMPONENT_THICK
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testColumnForegroundBlurStyle012', 0, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_1300
     * @tc.name       : testColumnForegroundBlurStyle013
     * @tc.desc       : testing foregroundBlurStyle for column with ARKUI_BLUR_STYLE_COMPONENT_ULTRA_THICK
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testColumnForegroundBlurStyle013', 0, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle013()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_1400
     * @tc.name       : testColumnForegroundBlurStyle014
     * @tc.desc       : testing foregroundBlurStyle for column with -100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testColumnForegroundBlurStyle014', 0, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle014()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_1500
     * @tc.name       : testColumnForegroundBlurStyle015
     * @tc.desc       : testing foregroundBlurStyle for column with ARKUI_COLOR_MODE_SYSTEM
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testColumnForegroundBlurStyle015', 0, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle015()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_1600
     * @tc.name       : testColumnForegroundBlurStyle016
     * @tc.desc       : testing foregroundBlurStyle for column with ARKUI_COLOR_MODE_LIGHT
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testColumnForegroundBlurStyle016', 0, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle016()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_1700
     * @tc.name       : testColumnForegroundBlurStyle017
     * @tc.desc       : testing foregroundBlurStyle for column with ARKUI_COLOR_MODE_DARK
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testColumnForegroundBlurStyle017', 0, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle017()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_1800
     * @tc.name       : testColumnForegroundBlurStyle018
     * @tc.desc       : testing foregroundBlurStyle for column with ArkUI_ColorMode -100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testColumnForegroundBlurStyle018', 0, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle018()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_1900
     * @tc.name       : testColumnForegroundBlurStyle019
     * @tc.desc       : testing foregroundBlurStyle for column with ARKUI_ADAPTIVE_COLOR_DEFAULT
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testColumnForegroundBlurStyle019', 0, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle019()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_2000
     * @tc.name       : testColumnForegroundBlurStyle020
     * @tc.desc       : testing foregroundBlurStyle for column with ARKUI_ADAPTIVE_COLOR_AVERAGE
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testColumnForegroundBlurStyle020', 0, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle020()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_2100
     * @tc.name       : testColumnForegroundBlurStyle021
     * @tc.desc       : testing foregroundBlurStyle for column with ArkUI_AdaptiveColor -100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testColumnForegroundBlurStyle021', 0, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle021()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_2200
     * @tc.name       : testColumnForegroundBlurStyle022
     * @tc.desc       : testing foregroundBlurStyle for column with grayScale [-1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testColumnForegroundBlurStyle022', 0, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle022()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_2300
     * @tc.name       : testColumnForegroundBlurStyle023
     * @tc.desc       : testing foregroundBlurStyle for column with grayScale [0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testColumnForegroundBlurStyle023', 0, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle023()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_2400
     * @tc.name       : testColumnForegroundBlurStyle024
     * @tc.desc       : testing foregroundBlurStyle for column with grayScale [20
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testColumnForegroundBlurStyle024', 0, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle024()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_2500
     * @tc.name       : testColumnForegroundBlurStyle025
     * @tc.desc       : testing foregroundBlurStyle for column with grayScale [127
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testColumnForegroundBlurStyle025', 0, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle025()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_2600
     * @tc.name       : testColumnForegroundBlurStyle026
     * @tc.desc       : testing foregroundBlurStyle for column with grayScale [200
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testColumnForegroundBlurStyle026', 0, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle026()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_2700
     * @tc.name       : testColumnForegroundBlurStyle027
     * @tc.desc       : testing foregroundBlurStyle for column with grayScale -1]
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testColumnForegroundBlurStyle027', 0, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle027()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_2800
     * @tc.name       : testColumnForegroundBlurStyle028
     * @tc.desc       : testing foregroundBlurStyle for column with grayScale 0]
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testColumnForegroundBlurStyle028', 0, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle028()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_2900
     * @tc.name       : testColumnForegroundBlurStyle029
     * @tc.desc       : testing foregroundBlurStyle for column with grayScale 20]
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testColumnForegroundBlurStyle029', 0, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle029()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_3000
     * @tc.name       : testColumnForegroundBlurStyle030
     * @tc.desc       : testing foregroundBlurStyle for column with grayScale 127]
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testColumnForegroundBlurStyle030', 0, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle030()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_3100
     * @tc.name       : testColumnForegroundBlurStyle031
     * @tc.desc       : testing foregroundBlurStyle for column with grayScale 200]
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testColumnForegroundBlurStyle031', 0, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle031()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_3200
     * @tc.name       : testColumnForegroundBlurStyle032
     * @tc.desc       : testing foregroundBlurStyle for column with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testColumnForegroundBlurStyle032', 0, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle032()).assertEqual(0)
      done()
    })

  })
}
