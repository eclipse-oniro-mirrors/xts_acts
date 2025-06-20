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

export default function timePickerAccessibilityLevelTest() {

  describe('TimePickerAccessibilityLevelTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TIMEPICKER_ACCESSIBILITYLEVEL_0100
     * @tc.name       : testTimePickerAccessibilityLevel001
     * @tc.desc       : testing accessibilityLevel for TimePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTimePickerAccessibilityLevel001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerAccessibilityLevel001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TIMEPICKER_ACCESSIBILITYLEVEL_0200
     * @tc.name       : testTimePickerAccessibilityLevel002
     * @tc.desc       : testing accessibilityLevel for TimePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTimePickerAccessibilityLevel002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerAccessibilityLevel002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TIMEPICKER_ACCESSIBILITYLEVEL_0300
     * @tc.name       : testTimePickerAccessibilityLevel003
     * @tc.desc       : testing accessibilityLevel for TimePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTimePickerAccessibilityLevel003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerAccessibilityLevel003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TIMEPICKER_ACCESSIBILITYLEVEL_0400
     * @tc.name       : testTimePickerAccessibilityLevel004
     * @tc.desc       : testing accessibilityLevel for TimePicker with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTimePickerAccessibilityLevel004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerAccessibilityLevel004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TIMEPICKER_ACCESSIBILITYLEVEL_0500
     * @tc.name       : testTimePickerAccessibilityLevel005
     * @tc.desc       : testing accessibilityLevel for TimePicker with alnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTimePickerAccessibilityLevel005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerAccessibilityLevel005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TIMEPICKER_ACCESSIBILITYLEVEL_0600
     * @tc.name       : testTimePickerAccessibilityLevel006
     * @tc.desc       : testing accessibilityLevel for TimePicker with alnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTimePickerAccessibilityLevel006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTimePickerAccessibilityLevel006()).assertEqual(0)
      done()
    })
  })
}
