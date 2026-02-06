/*
* Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';

export default function datePickerEnableHapticFeedbackTest() {

  describe('DatePickerEnableHapticFeedbackTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   TestDatePickerEnableHapticFeedback001
     * @tc.number SUB_ARKUI_CAPI_DATEPICKER_ENABLEHAPTICFEEDBACK_0100
     * @tc.desc   testing Date Picker EnableHapticFeedback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestDatePickerEnableHapticFeedback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('TestDatePickerEnableHapticFeedback001 START');
      let PAGE_TAG = 'TextPickerColumnWidthsTest';
      await Utils.pushPage('datePicker/datePickerEnableHapticFeedback')
      await Utils.sleep(3000)
      let strJson = getInspectorByKey('enableHapticFeedback_001');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[enableHapticFeedback_001]:" + JSON.stringify(obj.$attrs.enableHapticFeedback));
      expect(obj.$attrs.enableHapticFeedback).assertEqual(true);
      await Utils.sleep(1000)
      console.info('enableHapticFeedback_001 END');
      done();
    });

    /**
     * @tc.name   TestDatePickerEnableHapticFeedback002
     * @tc.number SUB_ARKUI_CAPI_DATEPICKER_ENABLEHAPTICFEEDBACK_0200
     * @tc.desc   testing Date Picker EnableHapticFeedback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestDatePickerEnableHapticFeedback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('TestDatePickerEnableHapticFeedback002 START');
      let PAGE_TAG = 'DatePickerEnableHapticFeedback';
      await Utils.pushPage('datePicker/datePickerEnableHapticFeedback')
      await Utils.sleep(3000)
      let strJson = getInspectorByKey('enableHapticFeedback_002');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[enableHapticFeedback_002]:" + JSON.stringify(obj.$attrs.enableHapticFeedback));
      expect(obj.$attrs.enableHapticFeedback).assertEqual(false);
      await Utils.sleep(1000)
      console.info('enableHapticFeedback_002 END');
      done();
    });

    /**
     * @tc.name   TestDatePickerEnableHapticFeedback003
     * @tc.number SUB_ARKUI_CAPI_DATEPICKER_ENABLEHAPTICFEEDBACK_0300
     * @tc.desc   testing Date Picker EnableHapticFeedback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestDatePickerEnableHapticFeedback003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('TestDatePickerEnableHapticFeedback003 START');
      let PAGE_TAG = 'DatePickerEnableHapticFeedback';
      await Utils.pushPage('datePicker/datePickerEnableHapticFeedback')
      await Utils.sleep(3000)
      let strJson = getInspectorByKey('enableHapticFeedback_003');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[enableHapticFeedback_003]:" + JSON.stringify(obj.$attrs.enableHapticFeedback));
      expect(obj.$attrs.enableHapticFeedback).assertEqual(true);
      await Utils.sleep(1000)
      console.info('enableHapticFeedback_003 END');
      done();
    });

  })
}