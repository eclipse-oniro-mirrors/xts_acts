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

export default function textPickerSelectedTextStyleTest() {

  describe('TextPickerSelectedTextStyleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_SELECTEDTEXTSTYLE_0100
     * @tc.name       : testTextPickerSelectedTextStyle001
     * @tc.desc       : testing selectedTextStyle for textPicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPickerSelectedTextStyle001', 0, async (done: Function) => {
      expect(nativeFunc.testTextPickerSelectedTextStyle001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_SELECTEDTEXTSTYLE_0200
     * @tc.name       : testTextPickerSelectedTextStyle002
     * @tc.desc       : testing selectedTextStyle for textPicker with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTextPickerSelectedTextStyle002', 0, async (done: Function) => {
      expect(nativeFunc.testTextPickerSelectedTextStyle002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_SELECTEDTEXTSTYLE_0300
     * @tc.name       : testTextPickerSelectedTextStyle003
     * @tc.desc       : testing selectedTextStyle for textPicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPickerSelectedTextStyle003', 0, async (done: Function) => {
      expect(nativeFunc.testTextPickerSelectedTextStyle003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_SELECTEDTEXTSTYLE_0400
     * @tc.name       : testTextPickerSelectedTextStyle004
     * @tc.desc       : testing selectedTextStyle for textPicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPickerSelectedTextStyle004', 0, async (done: Function) => {
      expect(nativeFunc.testTextPickerSelectedTextStyle004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_SELECTEDTEXTSTYLE_0500
     * @tc.name       : testTextPickerSelectedTextStyle005
     * @tc.desc       : testing selectedTextStyle for textPicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPickerSelectedTextStyle005', 0, async (done: Function) => {
      expect(nativeFunc.testTextPickerSelectedTextStyle005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_SELECTEDTEXTSTYLE_0600
     * @tc.name       : testTextPickerSelectedTextStyle006
     * @tc.desc       : testing selectedTextStyle for textPicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPickerSelectedTextStyle006', 0, async (done: Function) => {
      expect(nativeFunc.testTextPickerSelectedTextStyle006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_SELECTEDTEXTSTYLE_0700
     * @tc.name       : testTextPickerSelectedTextStyle007
     * @tc.desc       : testing selectedTextStyle for textPicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPickerSelectedTextStyle007', 0, async (done: Function) => {
      expect(nativeFunc.testTextPickerSelectedTextStyle007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_SELECTEDTEXTSTYLE_0800
     * @tc.name       : testTextPickerSelectedTextStyle008
     * @tc.desc       : testing selectedTextStyle for textPicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPickerSelectedTextStyle008', 0, async (done: Function) => {
      expect(nativeFunc.testTextPickerSelectedTextStyle008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_SELECTEDTEXTSTYLE_0900
     * @tc.name       : testTextPickerSelectedTextStyle009
     * @tc.desc       : testing selectedTextStyle for textPicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPickerSelectedTextStyle009', 0, async (done: Function) => {
      expect(nativeFunc.testTextPickerSelectedTextStyle009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_SELECTEDTEXTSTYLE_1000
     * @tc.name       : testTextPickerSelectedTextStyle010
     * @tc.desc       : testing selectedTextStyle for textPicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPickerSelectedTextStyle010', 0, async (done: Function) => {
      expect(nativeFunc.testTextPickerSelectedTextStyle010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_SELECTEDTEXTSTYLE_1100
     * @tc.name       : testTextPickerSelectedTextStyle011
     * @tc.desc       : testing selectedTextStyle for textPicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPickerSelectedTextStyle011', 0, async (done: Function) => {
      expect(nativeFunc.testTextPickerSelectedTextStyle011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_SELECTEDTEXTSTYLE_1200
     * @tc.name       : testTextPickerSelectedTextStyle012
     * @tc.desc       : testing selectedTextStyle for textPicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPickerSelectedTextStyle012', 0, async (done: Function) => {
      expect(nativeFunc.testTextPickerSelectedTextStyle012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_SELECTEDTEXTSTYLE_1300
     * @tc.name       : testTextPickerSelectedTextStyle013
     * @tc.desc       : testing selectedTextStyle for textPicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPickerSelectedTextStyle013', 0, async (done: Function) => {
      expect(nativeFunc.testTextPickerSelectedTextStyle013()).assertEqual(0)
      done()
    })
  })
}
