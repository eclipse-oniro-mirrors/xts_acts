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

export default function textPickerAccessibilityLevelTest() {

  describe('TextPickerAccessibilityLevelTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testTextPickerAccessibilityLevel001
     * @tc.number SUB_ARKUI_CAPI_TEXTPICKER_ACCESSIBILITYLEVEL_0100
     * @tc.desc   testing accessibilityLevel for TextPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextPickerAccessibilityLevel001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerAccessibilityLevel001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextPickerAccessibilityLevel002
     * @tc.number SUB_ARKUI_CAPI_TEXTPICKER_ACCESSIBILITYLEVEL_0200
     * @tc.desc   testing accessibilityLevel for TextPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextPickerAccessibilityLevel002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerAccessibilityLevel002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextPickerAccessibilityLevel003
     * @tc.number SUB_ARKUI_CAPI_TEXTPICKER_ACCESSIBILITYLEVEL_0300
     * @tc.desc   testing accessibilityLevel for TextPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextPickerAccessibilityLevel003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerAccessibilityLevel003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextPickerAccessibilityLevel004
     * @tc.number SUB_ARKUI_CAPI_TEXTPICKER_ACCESSIBILITYLEVEL_0400
     * @tc.desc   testing accessibilityLevel for TextPicker with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextPickerAccessibilityLevel004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerAccessibilityLevel004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextPickerAccessibilityLevel005
     * @tc.number SUB_ARKUI_CAPI_TEXTPICKER_ACCESSIBILITYLEVEL_0500
     * @tc.desc   testing accessibilityLevel for TextPicker with alnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextPickerAccessibilityLevel005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerAccessibilityLevel005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextPickerAccessibilityLevel006
     * @tc.number SUB_ARKUI_CAPI_TEXTPICKER_ACCESSIBILITYLEVEL_0600
     * @tc.desc   testing accessibilityLevel for TextPicker with alnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextPickerAccessibilityLevel006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPickerAccessibilityLevel006()).assertEqual(0)
      done()
    })
  })
}
