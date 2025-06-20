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

export default function textFontWeightTest() {

  describe('TextFontWeightTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONTWEIGHT_0100
     * @tc.name       : testTextFontWeight001
     * @tc.desc       : testing fontWeight for text with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFontWeight001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFontWeight001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONTWEIGHT_0200
     * @tc.name       : testTextFontWeight002
     * @tc.desc       : testing fontWeight for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFontWeight002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFontWeight002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONTWEIGHT_0300
     * @tc.name       : testTextFontWeight003
     * @tc.desc       : testing fontWeight for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFontWeight003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFontWeight003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONTWEIGHT_0400
     * @tc.name       : testTextFontWeight004
     * @tc.desc       : testing fontWeight for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFontWeight004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFontWeight004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONTWEIGHT_0500
     * @tc.name       : testTextFontWeight005
     * @tc.desc       : testing fontWeight for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFontWeight005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFontWeight005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONTWEIGHT_0600
     * @tc.name       : testTextFontWeight006
     * @tc.desc       : testing fontWeight for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFontWeight006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFontWeight006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONTWEIGHT_0700
     * @tc.name       : testTextFontWeight007
     * @tc.desc       : testing fontWeight for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFontWeight007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFontWeight007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONTWEIGHT_0800
     * @tc.name       : testTextFontWeight008
     * @tc.desc       : testing fontWeight for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFontWeight008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFontWeight008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONTWEIGHT_0900
     * @tc.name       : testTextFontWeight009
     * @tc.desc       : testing fontWeight for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFontWeight009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFontWeight009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONTWEIGHT_1000
     * @tc.name       : testTextFontWeight010
     * @tc.desc       : testing fontWeight for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFontWeight010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFontWeight010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONTWEIGHT_1100
     * @tc.name       : testTextFontWeight011
     * @tc.desc       : testing fontWeight for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFontWeight011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFontWeight011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONTWEIGHT_1200
     * @tc.name       : testTextFontWeight012
     * @tc.desc       : testing fontWeight for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFontWeight012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFontWeight012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONTWEIGHT_1300
     * @tc.name       : testTextFontWeight013
     * @tc.desc       : testing fontWeight for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFontWeight013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFontWeight013()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONTWEIGHT1400
     * @tc.name       : testTextFontWeight014
     * @tc.desc       : testing fontWeight for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFontWeight014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFontWeight014()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONTWEIGHT_1500
     * @tc.name       : testTextFontWeight015
     * @tc.desc       : testing fontWeight for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFontWeight015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFontWeight015()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONTWEIGHT_1600
     * @tc.name       : testTextFontWeight016
     * @tc.desc       : testing fontWeight for text with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTextFontWeight016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFontWeight016()).assertEqual(0)
      done()
    })
  })
}
