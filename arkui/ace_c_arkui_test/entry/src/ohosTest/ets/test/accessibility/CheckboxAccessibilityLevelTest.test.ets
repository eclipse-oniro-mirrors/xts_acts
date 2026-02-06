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

export default function checkboxAccessibilityLevelTest() {

  describe('CheckboxAccessibilityLevelTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CHECKBOX_ACCESSIBILITYLEVEL_0100
     * @tc.name       : testCheckboxAccessibilityLevel001
     * @tc.desc       : testing accessibilityLevel for Checkbox with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCheckboxAccessibilityLevel001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCheckboxAccessibilityLevel001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CHECKBOX_ACCESSIBILITYLEVEL_0200
     * @tc.name       : testCheckboxAccessibilityLevel002
     * @tc.desc       : testing accessibilityLevel for Checkbox with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCheckboxAccessibilityLevel002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCheckboxAccessibilityLevel002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CHECKBOX_ACCESSIBILITYLEVEL_0300
     * @tc.name       : testCheckboxAccessibilityLevel003
     * @tc.desc       : testing accessibilityLevel for Checkbox with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCheckboxAccessibilityLevel003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCheckboxAccessibilityLevel003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CHECKBOX_ACCESSIBILITYLEVEL_0400
     * @tc.name       : testCheckboxAccessibilityLevel004
     * @tc.desc       : testing accessibilityLevel for Checkbox with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCheckboxAccessibilityLevel004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCheckboxAccessibilityLevel004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CHECKBOX_ACCESSIBILITYLEVEL_0500
     * @tc.name       : testCheckboxAccessibilityLevel005
     * @tc.desc       : testing accessibilityLevel for Checkbox with alnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCheckboxAccessibilityLevel005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCheckboxAccessibilityLevel005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CHECKBOX_ACCESSIBILITYLEVEL_0600
     * @tc.name       : testCheckboxAccessibilityLevel006
     * @tc.desc       : testing accessibilityLevel for Checkbox with alnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCheckboxAccessibilityLevel006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCheckboxAccessibilityLevel006()).assertEqual(0)
      done()
    })
  })
}
