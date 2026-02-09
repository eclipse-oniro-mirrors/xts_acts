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

export default function  () {

  describe('TextInputFontWeightTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testTextInputFontWeight001
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_WEIGHT_0100
     * @tc.desc   testing fontWeight for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputFontWeight001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputFontWeight001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputFontWeight002
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_WEIGHT_0200
     * @tc.desc   testing fontWeight for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputFontWeight002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputFontWeight002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputFontWeight003
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_WEIGHT_0300
     * @tc.desc   testing fontWeight for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputFontWeight003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputFontWeight003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputFontWeight004
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_WEIGHT_0400
     * @tc.desc   testing fontWeight for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputFontWeight004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputFontWeight004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputFontWeight005
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_WEIGHT_0500
     * @tc.desc   testing fontWeight for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputFontWeight005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputFontWeight005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputFontWeight006
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_WEIGHT_0600
     * @tc.desc   testing fontWeight for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputFontWeight006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputFontWeight006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputFontWeight007
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_WEIGHT_0700
     * @tc.desc   testing fontWeight for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputFontWeight007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputFontWeight007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputFontWeight008
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_WEIGHT_0800
     * @tc.desc   testing fontWeight for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputFontWeight008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputFontWeight008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputFontWeight009
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_WEIGHT_0900
     * @tc.desc   testing fontWeight for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputFontWeight009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputFontWeight009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputFontWeight010
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_WEIGHT_1000
     * @tc.desc   testing fontWeight for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputFontWeight010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputFontWeight010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputFontWeight011
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_WEIGHT_1100
     * @tc.desc   testing fontWeight for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputFontWeight011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputFontWeight011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputFontWeight012
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_WEIGHT_1200
     * @tc.desc   testing fontWeight for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputFontWeight012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputFontWeight012()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputFontWeight013
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_WEIGHT_1300
     * @tc.desc   testing fontWeight for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputFontWeight013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputFontWeight013()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputFontWeight014
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_WEIGHT_1400
     * @tc.desc   testing fontWeight for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputFontWeight014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputFontWeight014()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputFontWeight015
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_WEIGHT_1500
     * @tc.desc   testing fontWeight for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputFontWeight015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputFontWeight015()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputFontWeight016
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_WEIGHT_1600
     * @tc.desc   testing fontWeight for textInput with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputFontWeight016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputFontWeight016()).assertEqual(0)
      done()
    })

  })
}
