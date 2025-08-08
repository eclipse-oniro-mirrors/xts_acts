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

export default function datePickerAccessibilityLevelTest() {

  describe('DatePickerAccessibilityLevelTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_ACCESSIBILITYLEVEL_0100
     * @tc.name       : testDatePickerAccessibilityLevel001
     * @tc.desc       : testing accessibilityLevel for DatePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDatePickerAccessibilityLevel001', 0, async (done: Function) => {
      expect(nativeFunc.testDatePickerAccessibilityLevel001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_ACCESSIBILITYLEVEL_0200
     * @tc.name       : testDatePickerAccessibilityLevel002
     * @tc.desc       : testing accessibilityLevel for DatePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDatePickerAccessibilityLevel002', 0, async (done: Function) => {
      expect(nativeFunc.testDatePickerAccessibilityLevel002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_ACCESSIBILITYLEVEL_0300
     * @tc.name       : testDatePickerAccessibilityLevel003
     * @tc.desc       : testing accessibilityLevel for DatePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDatePickerAccessibilityLevel003', 0, async (done: Function) => {
      expect(nativeFunc.testDatePickerAccessibilityLevel003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_ACCESSIBILITYLEVEL_0400
     * @tc.name       : testDatePickerAccessibilityLevel004
     * @tc.desc       : testing accessibilityLevel for DatePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDatePickerAccessibilityLevel004', 0, async (done: Function) => {
      expect(nativeFunc.testDatePickerAccessibilityLevel004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_ACCESSIBILITYLEVEL_0500
     * @tc.name       : testDatePickerAccessibilityLevel005
     * @tc.desc       : testing accessibilityLevel for DatePicker with alnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testDatePickerAccessibilityLevel005', 0, async (done: Function) => {
      expect(nativeFunc.testDatePickerAccessibilityLevel005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_DATEPICKER_ACCESSIBILITYLEVEL_0600
     * @tc.name       : testDatePickerAccessibilityLevel006
     * @tc.desc       : testing accessibilityLevel for DatePicker with alnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testDatePickerAccessibilityLevel006', 0, async (done: Function) => {
      expect(nativeFunc.testDatePickerAccessibilityLevel006()).assertEqual(0)
      done()
    })
  })
}
