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

export default function columnForegroundBlurStyleTest() {

  describe('ColumnForegroundBlurStyleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testColumnForegroundBlurStyle001
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_0100
     * @tc.desc   testing foregroundBlurStyle for column with ARKUI_BLUR_STYLE_THIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testColumnForegroundBlurStyle001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testColumnForegroundBlurStyle002
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_0200
     * @tc.desc   testing foregroundBlurStyle for column with ARKUI_BLUR_STYLE_REGULAR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testColumnForegroundBlurStyle002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testColumnForegroundBlurStyle003
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_0300
     * @tc.desc   testing foregroundBlurStyle for column with ARKUI_BLUR_STYLE_THICK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testColumnForegroundBlurStyle003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testColumnForegroundBlurStyle004
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_0400
     * @tc.desc   testing foregroundBlurStyle for column with ARKUI_BLUR_STYLE_BACKGROUND_THIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testColumnForegroundBlurStyle004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testColumnForegroundBlurStyle005
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_0500
     * @tc.desc   testing foregroundBlurStyle for column with ARKUI_BLUR_STYLE_BACKGROUND_REGULAR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testColumnForegroundBlurStyle005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testColumnForegroundBlurStyle006
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_0600
     * @tc.desc   testing foregroundBlurStyle for column with ARKUI_BLUR_STYLE_BACKGROUND_THICK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testColumnForegroundBlurStyle006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testColumnForegroundBlurStyle007
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_0700
     * @tc.desc   testing foregroundBlurStyle for column with ARKUI_BLUR_STYLE_BACKGROUND_ULTRA_THICK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testColumnForegroundBlurStyle007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testColumnForegroundBlurStyle008
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_0800
     * @tc.desc   testing foregroundBlurStyle for column with ARKUI_BLUR_STYLE_NONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testColumnForegroundBlurStyle008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testColumnForegroundBlurStyle009
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_0900
     * @tc.desc   testing foregroundBlurStyle for column with ARKUI_BLUR_STYLE_COMPONENT_ULTRA_THIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testColumnForegroundBlurStyle009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testColumnForegroundBlurStyle010
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_1000
     * @tc.desc   testing foregroundBlurStyle for column with ARKUI_BLUR_STYLE_COMPONENT_THIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testColumnForegroundBlurStyle010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testColumnForegroundBlurStyle011
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_1100
     * @tc.desc   testing foregroundBlurStyle for column with ARKUI_BLUR_STYLE_COMPONENT_REGULAR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testColumnForegroundBlurStyle011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testColumnForegroundBlurStyle012
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_1200
     * @tc.desc   testing foregroundBlurStyle for column with ARKUI_BLUR_STYLE_COMPONENT_THICK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testColumnForegroundBlurStyle012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle012()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testColumnForegroundBlurStyle013
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_1300
     * @tc.desc   testing foregroundBlurStyle for column with ARKUI_BLUR_STYLE_COMPONENT_ULTRA_THICK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testColumnForegroundBlurStyle013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle013()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testColumnForegroundBlurStyle014
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_1400
     * @tc.desc   testing foregroundBlurStyle for column with -100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testColumnForegroundBlurStyle014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle014()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testColumnForegroundBlurStyle015
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_1500
     * @tc.desc   testing foregroundBlurStyle for column with ARKUI_COLOR_MODE_SYSTEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testColumnForegroundBlurStyle015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle015()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testColumnForegroundBlurStyle016
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_1600
     * @tc.desc   testing foregroundBlurStyle for column with ARKUI_COLOR_MODE_LIGHT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testColumnForegroundBlurStyle016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle016()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testColumnForegroundBlurStyle017
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_1700
     * @tc.desc   testing foregroundBlurStyle for column with ARKUI_COLOR_MODE_DARK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testColumnForegroundBlurStyle017', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle017()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testColumnForegroundBlurStyle018
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_1800
     * @tc.desc   testing foregroundBlurStyle for column with ArkUI_ColorMode -100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testColumnForegroundBlurStyle018', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle018()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testColumnForegroundBlurStyle019
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_1900
     * @tc.desc   testing foregroundBlurStyle for column with ARKUI_ADAPTIVE_COLOR_DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testColumnForegroundBlurStyle019', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle019()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testColumnForegroundBlurStyle020
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_2000
     * @tc.desc   testing foregroundBlurStyle for column with ARKUI_ADAPTIVE_COLOR_AVERAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testColumnForegroundBlurStyle020', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle020()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testColumnForegroundBlurStyle021
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_2100
     * @tc.desc   testing foregroundBlurStyle for column with ArkUI_AdaptiveColor -100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testColumnForegroundBlurStyle021', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle021()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testColumnForegroundBlurStyle022
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_2200
     * @tc.desc   testing foregroundBlurStyle for column with grayScale [-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testColumnForegroundBlurStyle022', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle022()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testColumnForegroundBlurStyle023
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_2300
     * @tc.desc   testing foregroundBlurStyle for column with grayScale [0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testColumnForegroundBlurStyle023', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle023()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testColumnForegroundBlurStyle024
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_2400
     * @tc.desc   testing foregroundBlurStyle for column with grayScale [20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testColumnForegroundBlurStyle024', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle024()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testColumnForegroundBlurStyle025
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_2500
     * @tc.desc   testing foregroundBlurStyle for column with grayScale [127
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testColumnForegroundBlurStyle025', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle025()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testColumnForegroundBlurStyle026
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_2600
     * @tc.desc   testing foregroundBlurStyle for column with grayScale [200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testColumnForegroundBlurStyle026', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle026()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testColumnForegroundBlurStyle027
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_2700
     * @tc.desc   testing foregroundBlurStyle for column with grayScale -1]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testColumnForegroundBlurStyle027', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle027()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testColumnForegroundBlurStyle028
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_2800
     * @tc.desc   testing foregroundBlurStyle for column with grayScale 0]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testColumnForegroundBlurStyle028', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle028()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testColumnForegroundBlurStyle029
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_2900
     * @tc.desc   testing foregroundBlurStyle for column with grayScale 20]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testColumnForegroundBlurStyle029', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle029()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testColumnForegroundBlurStyle030
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_3000
     * @tc.desc   testing foregroundBlurStyle for column with grayScale 127]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testColumnForegroundBlurStyle030', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle030()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testColumnForegroundBlurStyle031
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_3100
     * @tc.desc   testing foregroundBlurStyle for column with grayScale 200]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testColumnForegroundBlurStyle031', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle031()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testColumnForegroundBlurStyle032
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDBLURSTYLE_3200
     * @tc.desc   testing foregroundBlurStyle for column with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testColumnForegroundBlurStyle032', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testColumnForegroundBlurStyle032()).assertEqual(0)
      done()
    })

  })
}
