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

export default function textPickerTextStyleTest() {

  describe('TextPickerTextStyleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_TEXTSTYLE_0100
     * @tc.name       : testTextPickerTextStyle001
     * @tc.desc       : testing textStyle for textPicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPickerTextStyle001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerTextStyle001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_TEXTSTYLE_0200
     * @tc.name       : testTextPickerTextStyle002
     * @tc.desc       : testing textStyle for textPicker with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTextPickerTextStyle002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerTextStyle002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_TEXTSTYLE_0300
     * @tc.name       : testTextPickerTextStyle003
     * @tc.desc       : testing textStyle for textPicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPickerTextStyle003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerTextStyle003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_TEXTSTYLE_0400
     * @tc.name       : testTextPickerTextStyle004
     * @tc.desc       : testing textStyle for textPicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPickerTextStyle004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerTextStyle004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_TEXTSTYLE_0500
     * @tc.name       : testTextPickerTextStyle005
     * @tc.desc       : testing textStyle for textPicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPickerTextStyle005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerTextStyle005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_TEXTSTYLE_0600
     * @tc.name       : testTextPickerTextStyle006
     * @tc.desc       : testing textStyle for textPicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPickerTextStyle006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerTextStyle006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_TEXTSTYLE_0700
     * @tc.name       : testTextPickerTextStyle007
     * @tc.desc       : testing textStyle for textPicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPickerTextStyle007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerTextStyle007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_TEXTSTYLE_0800
     * @tc.name       : testTextPickerTextStyle008
     * @tc.desc       : testing textStyle for textPicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPickerTextStyle008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerTextStyle008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_TEXTSTYLE_0900
     * @tc.name       : testTextPickerTextStyle009
     * @tc.desc       : testing textStyle for textPicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPickerTextStyle009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerTextStyle009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_TEXTSTYLE_1000
     * @tc.name       : testTextPickerTextStyle010
     * @tc.desc       : testing textStyle for textPicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPickerTextStyle010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerTextStyle010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_TEXTSTYLE_1100
     * @tc.name       : testTextPickerTextStyle011
     * @tc.desc       : testing textStyle for textPicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPickerTextStyle011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerTextStyle011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_TEXTSTYLE_1200
     * @tc.name       : testTextPickerTextStyle012
     * @tc.desc       : testing textStyle for textPicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPickerTextStyle012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerTextStyle012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_TEXTSTYLE_1300
     * @tc.name       : testTextPickerTextStyle013
     * @tc.desc       : testing textStyle for textPicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPickerTextStyle013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerTextStyle013()).assertEqual(0)
      done()
    })
  })
}
