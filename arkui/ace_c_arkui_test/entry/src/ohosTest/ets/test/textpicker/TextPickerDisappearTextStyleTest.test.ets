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

export default function textPickerDisappearTextStyleTest() {

  describe('TextPickerDisappearTextStyleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testTextPickerDisappearTextStyle001
     * @tc.number SUB_ARKUI_CAPI_TEXTPICKER_DISAPPEARTEXTSTYLE_0100
     * @tc.desc   testing disappearTextStyle for textPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextPickerDisappearTextStyle001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerDisappearTextStyle001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextPickerDisappearTextStyle002
     * @tc.number SUB_ARKUI_CAPI_TEXTPICKER_DISAPPEARTEXTSTYLE_0200
     * @tc.desc   testing disappearTextStyle for textPicker with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextPickerDisappearTextStyle002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerDisappearTextStyle002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextPickerDisappearTextStyle003
     * @tc.number SUB_ARKUI_CAPI_TEXTPICKER_DISAPPEARTEXTSTYLE_0300
     * @tc.desc   testing disappearTextStyle for textPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextPickerDisappearTextStyle003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerDisappearTextStyle003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextPickerDisappearTextStyle004
     * @tc.number SUB_ARKUI_CAPI_TEXTPICKER_DISAPPEARTEXTSTYLE_0400
     * @tc.desc   testing disappearTextStyle for textPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextPickerDisappearTextStyle004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerDisappearTextStyle004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextPickerDisappearTextStyle005
     * @tc.number SUB_ARKUI_CAPI_TEXTPICKER_DISAPPEARTEXTSTYLE_0500
     * @tc.desc   testing disappearTextStyle for textPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextPickerDisappearTextStyle005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerDisappearTextStyle005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextPickerDisappearTextStyle006
     * @tc.number SUB_ARKUI_CAPI_TEXTPICKER_DISAPPEARTEXTSTYLE_0600
     * @tc.desc   testing disappearTextStyle for textPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextPickerDisappearTextStyle006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerDisappearTextStyle006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextPickerDisappearTextStyle007
     * @tc.number SUB_ARKUI_CAPI_TEXTPICKER_DISAPPEARTEXTSTYLE_0700
     * @tc.desc   testing disappearTextStyle for textPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextPickerDisappearTextStyle007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerDisappearTextStyle007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextPickerDisappearTextStyle008
     * @tc.number SUB_ARKUI_CAPI_TEXTPICKER_DISAPPEARTEXTSTYLE_0800
     * @tc.desc   testing disappearTextStyle for textPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextPickerDisappearTextStyle008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerDisappearTextStyle008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextPickerDisappearTextStyle009
     * @tc.number SUB_ARKUI_CAPI_TEXTPICKER_DISAPPEARTEXTSTYLE_0900
     * @tc.desc   testing disappearTextStyle for textPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextPickerDisappearTextStyle009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerDisappearTextStyle009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextPickerDisappearTextStyle010
     * @tc.number SUB_ARKUI_CAPI_TEXTPICKER_DISAPPEARTEXTSTYLE_1000
     * @tc.desc   testing disappearTextStyle for textPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextPickerDisappearTextStyle010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerDisappearTextStyle010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextPickerDisappearTextStyle011
     * @tc.number SUB_ARKUI_CAPI_TEXTPICKER_DISAPPEARTEXTSTYLE_1100
     * @tc.desc   testing disappearTextStyle for textPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextPickerDisappearTextStyle011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerDisappearTextStyle011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextPickerDisappearTextStyle012
     * @tc.number SUB_ARKUI_CAPI_TEXTPICKER_DISAPPEARTEXTSTYLE_1200
     * @tc.desc   testing disappearTextStyle for textPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextPickerDisappearTextStyle012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerDisappearTextStyle012()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextPickerDisappearTextStyle013
     * @tc.number SUB_ARKUI_CAPI_TEXTPICKER_DISAPPEARTEXTSTYLE_1300
     * @tc.desc   testing disappearTextStyle for textPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextPickerDisappearTextStyle013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerDisappearTextStyle013()).assertEqual(0)
      done()
    })
  })
}
