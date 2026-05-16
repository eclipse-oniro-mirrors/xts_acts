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

export default function buttonFontWeightTest() {

  describe('ButtonFontWeightTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testButtonFontWeight001
     * @tc.number SUB_ARKUI_CAPI_BUTTON_FONTWEIGHT_0100
     * @tc.desc   testing fontSize for button with ARKUI_FONT_WEIGHT_W100 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testButtonFontWeight001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testButtonFontWeight001()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testButtonFontWeight002
     * @tc.number SUB_ARKUI_CAPI_BUTTON_FONTWEIGHT_0200
     * @tc.desc   testing fontSize for button with ARKUI_FONT_WEIGHT_W200 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testButtonFontWeight002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testButtonFontWeight002()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testButtonFontWeight003
     * @tc.number SUB_ARKUI_CAPI_BUTTON_FONTWEIGHT_0300
     * @tc.desc   testing fontSize for button with ARKUI_FONT_WEIGHT_W300 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testButtonFontWeight003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testButtonFontWeight003()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testButtonFontWeight004
     * @tc.number SUB_ARKUI_CAPI_BUTTON_FONTWEIGHT_0400
     * @tc.desc   testing fontSize for button with ARKUI_FONT_WEIGHT_W400 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testButtonFontWeight004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testButtonFontWeight004()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testButtonFontWeight005
     * @tc.number SUB_ARKUI_CAPI_BUTTON_FONTWEIGHT_0500
     * @tc.desc   testing fontSize for button with ARKUI_FONT_WEIGHT_W500 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testButtonFontWeight005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testButtonFontWeight005()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testButtonFontWeight006
     * @tc.number SUB_ARKUI_CAPI_BUTTON_FONTWEIGHT_0600
     * @tc.desc   testing fontSize for button with ARKUI_FONT_WEIGHT_W600 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testButtonFontWeight006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testButtonFontWeight006()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testButtonFontWeight007
     * @tc.number SUB_ARKUI_CAPI_BUTTON_FONTWEIGHT_0700
     * @tc.desc   testing fontSize for button with ARKUI_FONT_WEIGHT_W700 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testButtonFontWeight007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testButtonFontWeight007()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testButtonFontWeight008
     * @tc.number SUB_ARKUI_CAPI_BUTTON_FONTWEIGHT_0800
     * @tc.desc   testing fontSize for button with ARKUI_FONT_WEIGHT_W800 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testButtonFontWeight008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testButtonFontWeight008()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testButtonFontWeight009
     * @tc.number SUB_ARKUI_CAPI_BUTTON_FONTWEIGHT_0900
     * @tc.desc   testing fontSize for button with ARKUI_FONT_WEIGHT_W900 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testButtonFontWeight009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testButtonFontWeight009()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testButtonFontWeight010
     * @tc.number SUB_ARKUI_CAPI_BUTTON_FONTWEIGHT_1000
     * @tc.desc   testing fontSize for button with ARKUI_FONT_WEIGHT_BOLD value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testButtonFontWeight010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testButtonFontWeight010()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testButtonFontWeight011
     * @tc.number SUB_ARKUI_CAPI_BUTTON_FONTWEIGHT_1100
     * @tc.desc   testing fontSize for button with ARKUI_FONT_WEIGHT_NORMAL value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testButtonFontWeight011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testButtonFontWeight011()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testButtonFontWeight012
     * @tc.number SUB_ARKUI_CAPI_BUTTON_FONTWEIGHT_1200
     * @tc.desc   testing fontSize for button with ARKUI_FONT_WEIGHT_BOLDER value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testButtonFontWeight012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testButtonFontWeight012()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testButtonFontWeight013
     * @tc.number SUB_ARKUI_CAPI_BUTTON_FONTWEIGHT_1300
     * @tc.desc   testing fontSize for button with ARKUI_FONT_WEIGHT_LIGHTER value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testButtonFontWeight013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testButtonFontWeight013()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testButtonFontWeight014
     * @tc.number SUB_ARKUI_CAPI_BUTTON_FONTWEIGHT_1400
     * @tc.desc   testing fontSize for button with ARKUI_FONT_WEIGHT_MEDIUM value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testButtonFontWeight014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testButtonFontWeight014()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testButtonFontWeight015
     * @tc.number SUB_ARKUI_CAPI_BUTTON_FONTWEIGHT_1500
     * @tc.desc   testing fontSize for button with ARKUI_FONT_WEIGHT_REGULAR value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testButtonFontWeight015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testButtonFontWeight015()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testButtonFontWeight016
     * @tc.number SUB_ARKUI_CAPI_BUTTON_FONTWEIGHT_1600
     * @tc.desc   testing fontSize for button with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testButtonFontWeight016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testButtonFontWeight016()).assertEqual(0)
      done();
    })
  })
}
