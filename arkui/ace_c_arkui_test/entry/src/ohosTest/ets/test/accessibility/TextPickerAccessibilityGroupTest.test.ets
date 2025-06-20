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

export default function textPickerAccessibilityGroupTest() {

  describe('TextPickerAccessibilityGroupTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_ACCESSIBILITYGROUP_0100
     * @tc.name       : testTextPickerAccessibilityGroup001
     * @tc.desc       : testing accessibilityGroup for TextPicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPickerAccessibilityGroup001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerAccessibilityGroup001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_ACCESSIBILITYGROUP_0200
     * @tc.name       : testTextPickerAccessibilityGroup002
     * @tc.desc       : testing accessibilityGroup for TextPicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPickerAccessibilityGroup002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerAccessibilityGroup002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_ACCESSIBILITYGROUP_0300
     * @tc.name       : testTextPickerAccessibilityGroup003
     * @tc.desc       : testing accessibilityGroup for TextPicker with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTextPickerAccessibilityGroup003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerAccessibilityGroup003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTPICKER_ACCESSIBILITYGROUP_0400
     * @tc.name       : testTextPickerAccessibilityGroup004
     * @tc.desc       : testing accessibilityGroup for TextPicker with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTextPickerAccessibilityGroup004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerAccessibilityGroup004()).assertEqual(0)
      done()
    })
  })
}
