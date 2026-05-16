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

import { expect, describe, it, afterEach, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function textAreaFontWeightTest() {

  describe('TextAreaFontWeightTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   testTextAreaFontWeight001
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_FONTWEIGHT_0100
     * @tc.desc   testing fontWeight for TextArea with ARKUI_FONT_WEIGHT_W100 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaFontWeight001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaFontWeight001()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaFontWeight002
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_FONTWEIGHT_0200
     * @tc.desc   testing fontWeight for TextArea with ARKUI_FONT_WEIGHT_W200 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaFontWeight002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaFontWeight002()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaFontWeight003
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_FONTWEIGHT_0300
     * @tc.desc   testing FontWeight for textArea with ARKUI_FONT_WEIGHT_W300 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaFontWeight003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaFontWeight003()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaFontWeight004
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_FONTWEIGHT_0400
     * @tc.desc   testing FontWeight for textArea with ARKUI_FONT_WEIGHT_W400 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaFontWeight004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaFontWeight004()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaFontWeight005
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_FONTWEIGHT_0500
     * @tc.desc   testing FontWeight for textArea with ARKUI_FONT_WEIGHT_W500 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaFontWeight005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaFontWeight005()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaFontWeight006
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_FONTWEIGHT_0600
     * @tc.desc   testing FontWeight for textArea with ARKUI_FONT_WEIGHT_W600 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaFontWeight006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaFontWeight006()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaFontWeight007
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_FONTWEIGHT_0700
     * @tc.desc   testing FontWeight for textArea with ARKUI_FONT_WEIGHT_W700 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaFontWeight007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaFontWeight007()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaFontWeight008
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_FONTWEIGHT_0800
     * @tc.desc   testing FontWeight for textArea with ARKUI_FONT_WEIGHT_W800 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaFontWeight008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaFontWeight008()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaFontWeight009
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_FONTWEIGHT_0900
     * @tc.desc   testing FontWeight for textArea with ARKUI_FONT_WEIGHT_W900 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaFontWeight009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaFontWeight009()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaFontWeight010
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_FONTWEIGHT_1000
     * @tc.desc   testing FontWeight for textArea with ARKUI_FONT_WEIGHT_BOLD value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaFontWeight010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaFontWeight010()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaFontWeight011
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_FONTWEIGHT_1100
     * @tc.desc   testing FontWeight for textArea with ARKUI_FONT_WEIGHT_NORMAL value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaFontWeight011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaFontWeight011()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaFontWeight012
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_FONTWEIGHT_1200
     * @tc.desc   testing FontWeight for textArea with ARKUI_FONT_WEIGHT_BOLDER value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaFontWeight012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaFontWeight012()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaFontWeight013
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_FONTWEIGHT_1300
     * @tc.desc   testing FontWeight for textArea with ARKUI_FONT_WEIGHT_LIGHTER value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaFontWeight013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaFontWeight013()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaFontWeight014
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_FONTWEIGHT_1400
     * @tc.desc   testing FontWeight for textArea with ARKUI_FONT_WEIGHT_MEDIUM value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaFontWeight014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaFontWeight014()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaFontWeight015
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_FONTWEIGHT_1500
     * @tc.desc   testing FontWeight for textArea with ARKUI_FONT_WEIGHT_REGULAR value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaFontWeight015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaFontWeight015()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaFontWeight016
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_FONTWEIGHT_1600
     * @tc.desc   testing FontWeight for textArea with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaFontWeight016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaFontWeight016()).assertEqual(0)
      done();
    });
  })
}
