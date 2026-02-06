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

export default function commonAttrsBackgroundBlurStyleTest() {

  describe('CommonAttrsBackgroundBlurStyleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDBLURSTYLE_0100
     * @tc.name       : testCommonAttrsBackgroundBlurStyle001
     * @tc.desc       : testing backgroundBlurStyle for commonAttrs with valid value Thin
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundBlurStyle001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundBlurStyle001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDBLURSTYLE_0200
     * @tc.name       : testCommonAttrsBackgroundBlurStyle002
     * @tc.desc       : testing backgroundBlurStyle for commonAttrs with valid value Regular
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundBlurStyle002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundBlurStyle002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDBLURSTYLE_0300
     * @tc.name       : testCommonAttrsBackgroundBlurStyle003
     * @tc.desc       : testing backgroundBlurStyle for commonAttrs with valid value Thick
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundBlurStyle003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundBlurStyle003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDBLURSTYLE_0400
     * @tc.name       : testCommonAttrsBackgroundBlurStyle004
     * @tc.desc       : testing backgroundBlurStyle for commonAttrs with valid value BACKGROUND_THIN
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundBlurStyle004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundBlurStyle004()).assertEqual(0)
      done()
    }) 

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDBLURSTYLE_0500
     * @tc.name       : testCommonAttrsBackgroundBlurStyle005
     * @tc.desc       : testing backgroundBlurStyle for commonAttrs with valid value BACKGROUND_REGULAR
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundBlurStyle005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundBlurStyle005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDBLURSTYLE_0600
     * @tc.name       : testCommonAttrsBackgroundBlurStyle006
     * @tc.desc       : testing backgroundBlurStyle for commonAttrs with valid value BACKGROUND_THICK
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundBlurStyle006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundBlurStyle006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDBLURSTYLE_0700
     * @tc.name       : testCommonAttrsBackgroundBlurStyle007
     * @tc.desc       : testing backgroundBlurStyle for commonAttrs with valid value BACKGROUND_ULTRA_THICK
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundBlurStyle007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundBlurStyle007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDBLURSTYLE_0800
     * @tc.name       : testCommonAttrsBackgroundBlurStyle008
     * @tc.desc       : testing backgroundBlurStyle for commonAttrs with valid value NONE
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundBlurStyle008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundBlurStyle008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDBLURSTYLE_0900
     * @tc.name       : testCommonAttrsBackgroundBlurStyle009
     * @tc.desc       : testing backgroundBlurStyle for commonAttrs with valid value COMPONENT_ULTRA_THIN
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundBlurStyle009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundBlurStyle009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDBLURSTYLE_1000
     * @tc.name       : testCommonAttrsBackgroundBlurStyle010
     * @tc.desc       : testing backgroundBlurStyle for commonAttrs with valid value COMPONENT_THIN
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundBlurStyle010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundBlurStyle010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDBLURSTYLE_1100
     * @tc.name       : testCommonAttrsBackgroundBlurStyle011
     * @tc.desc       : testing backgroundBlurStyle for commonAttrs with valid value COMPONENT_REGULAR
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundBlurStyle011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundBlurStyle011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDBLURSTYLE_1200
     * @tc.name       : testCommonAttrsBackgroundBlurStyle012
     * @tc.desc       : testing backgroundBlurStyle for commonAttrs with valid value COMPONENT_THICK
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundBlurStyle012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundBlurStyle012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDBLURSTYLE_1300
     * @tc.name       : testCommonAttrsBackgroundBlurStyle013
     * @tc.desc       : testing backgroundBlurStyle for commonAttrs with valid value COMPONENT_ULTRA_THICK
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundBlurStyle013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundBlurStyle013()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDBLURSTYLE_1400
     * @tc.name       : testCommonAttrsBackgroundBlurStyle014
     * @tc.desc       : testing backgroundBlurStyle for commonAttrs with valid value BACKGROUND_THIN, 
     *                  ColorMode with SYSTEM，and AdaptiveColor with DEFAULT
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundBlurStyle014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundBlurStyle014()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDBLURSTYLE_1500
     * @tc.name       : testCommonAttrsBackgroundBlurStyle015
     * @tc.desc       : testing backgroundBlurStyle for commonAttrs with valid value BACKGROUND_THIN，
     *                  ColorMode with LIGHT, and AdaptiveColor with DEFAULT
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundBlurStyle015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundBlurStyle015()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDBLURSTYLE_1600
     * @tc.name       : testCommonAttrsBackgroundBlurStyle016
     * @tc.desc       : testing backgroundBlurStyle for commonAttrs with valid value BACKGROUND_THIN，
     *                  ColorMode with DARK, and AdaptiveColor with DEFAULT
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundBlurStyle016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundBlurStyle016()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDBLURSTYLE_1700
     * @tc.name       : testCommonAttrsBackgroundBlurStyle017
     * @tc.desc       : testing backgroundBlurStyle for commonAttrs with valid value BACKGROUND_THIN，
     *                  ColorMode with SYSTEM, and AdaptiveColor with AVERAGE
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundBlurStyle017', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundBlurStyle017()).assertEqual(0)
      done()
    })
    
    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDBLURSTYLE_1800
     * @tc.name       : testCommonAttrsBackgroundBlurStyle018
     * @tc.desc       : testing backgroundBlurStyle for commonAttrs with valid value BACKGROUND_THIN，
     *                  ColorMode with LIGHT, and AdaptiveColor with AVERAGE
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundBlurStyle018', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundBlurStyle018()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDBLURSTYLE_1900
     * @tc.name       : testCommonAttrsBackgroundBlurStyle019
     * @tc.desc       : testing backgroundBlurStyle for commonAttrs with valid value BACKGROUND_THIN，
     *                  ColorMode with DARK, and AdaptiveColor with AVERAGE
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundBlurStyle019', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundBlurStyle019()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDBLURSTYLE_2000
     * @tc.name       : testCommonAttrsBackgroundBlurStyle020
     * @tc.desc       : testing backgroundBlurStyle for commonAttrs with valid value BACKGROUND_THIN and 
     *                  BlurDegree with -1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundBlurStyle020', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundBlurStyle020()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDBLURSTYLE_2100
     * @tc.name       : testCommonAttrsBackgroundBlurStyle021
     * @tc.desc       : testing backgroundBlurStyle for commonAttrs with valid value BACKGROUND_THIN and
     *                  BlurDegree with 0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundBlurStyle021', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundBlurStyle021()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDBLURSTYLE_2200
     * @tc.name       : testCommonAttrsBackgroundBlurStyle022
     * @tc.desc       : testing backgroundBlurStyle for commonAttrs with valid value BACKGROUND_THIN and 
     *                  BlurDegree with 0.5
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundBlurStyle022', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundBlurStyle022()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDBLURSTYLE_2300
     * @tc.name       : testCommonAttrsBackgroundBlurStyle023
     * @tc.desc       : testing backgroundBlurStyle for commonAttrs with valid value BACKGROUND_THIN and 
     *                  BlurDegree with 1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundBlurStyle023', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundBlurStyle023()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDBLURSTYLE_2400
     * @tc.name       : testCommonAttrsBackgroundBlurStyle024
     * @tc.desc       : testing backgroundBlurStyle for commonAttrs with valid value BACKGROUND_THIN and 
     *                  BlurDegree with 2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundBlurStyle024', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundBlurStyle024()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDBLURSTYLE_2500
     * @tc.name       : testCommonAttrsBackgroundBlurStyle025
     * @tc.desc       : testing backgroundBlurStyle for commonAttrs with valid value BACKGROUND_THIN, 
     *                  StartBoundary with 0, and EndBoundary with 127
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundBlurStyle025', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundBlurStyle025()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDBLURSTYLE_2600
     * @tc.name       : testCommonAttrsBackgroundBlurStyle026
     * @tc.desc       : testing backgroundBlurStyle for commonAttrs with valid value BACKGROUND_THIN, 
     *                  StartBoundary with 0, and EndBoundary with 64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundBlurStyle026', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundBlurStyle026()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDBLURSTYLE_2700
     * @tc.name       : testCommonAttrsBackgroundBlurStyle027
     * @tc.desc       : testing backgroundBlurStyle for commonAttrs with valid value BACKGROUND_THIN, 
     *                  StartBoundary with 64, and EndBoundary with 0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundBlurStyle027', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundBlurStyle027()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDBLURSTYLE_2800
     * @tc.name       : testCommonAttrsBackgroundBlurStyle028
     * @tc.desc       : testing backgroundBlurStyle for commonAttrs with valid value BACKGROUND_THIN, 
     *                  StartBoundary with 64, and EndBoundary with 127
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundBlurStyle028', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundBlurStyle028()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDBLURSTYLE_2900
     * @tc.name       : testCommonAttrsBackgroundBlurStyle029
     * @tc.desc       : testing backgroundBlurStyle for commonAttrs with valid value BACKGROUND_THIN, 
     *                  StartBoundary with -1, and EndBoundary with 127
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundBlurStyle029', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundBlurStyle029()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDBLURSTYLE_3000
     * @tc.name       : testCommonAttrsBackgroundBlurStyle030
     * @tc.desc       : testing backgroundBlurStyle for commonAttrs with valid value BACKGROUND_THIN, 
     *                  StartBoundary with 127, and EndBoundary with -1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundBlurStyle030', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundBlurStyle030()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDBLURSTYLE_3100
     * @tc.name       : testCommonAttrsBackgroundBlurStyle031
     * @tc.desc       : testing backgroundBlurStyle for commonAttrs with valid value BACKGROUND_THIN, 
     *                  StartBoundary with -1, and EndBoundary with -1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundBlurStyle031', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundBlurStyle031()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDBLURSTYLE_3200
     * @tc.name       : testCommonAttrsBackgroundBlurStyle032
     * @tc.desc       : testing backgroundBlurStyle for commonAttrs with valid value BACKGROUND_THIN, 
     *                  StartBoundary with 0, and EndBoundary with 150
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundBlurStyle032', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundBlurStyle032()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_BACKGROUNDBLURSTYLE_3300
     * @tc.name       : testCommonAttrsBackgroundBlurStyle033
     * @tc.desc       : testing resetAttribute backgroundBlurStyle for commonAttrs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBackgroundBlurStyle033', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBackgroundBlurStyle033()).assertEqual(0)
      done()
    })
  })
}
