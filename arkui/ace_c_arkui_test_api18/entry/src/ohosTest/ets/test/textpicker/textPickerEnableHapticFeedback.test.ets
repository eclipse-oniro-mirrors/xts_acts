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
import nativeFunc from 'libnativefunc.so';

export default function textPickerEnableHapticFeedbackTest() {

  describe('textPickerEnableHapticFeedbackTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })


  /**
   * @tc.name   TestTextPickerEnableHapticFeedback0001
   * @tc.number TestTextPickerEnableHapticFeedback0001
   * @tc.desc   TestTextPickerEnableHapticFeedback0001
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('TestTextPickerEnableHapticFeedback0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
    console.info('TestTextPickerEnableHapticFeedback0001 START');
    let PAGE_TAG = 'TextPickerEnableHapticFeedback';
    await Utils.pushPage(`textPicker/textPickerEnableHapticFeedback`)
    await Utils.sleep(3000)
    let strJson = getInspectorByKey('enableHapticFeedback_0001');
    let obj: ESObject = JSON.parse(strJson);
    console.info("[enableHapticFeedback_0001]:" + JSON.stringify(obj.$attrs.enableHapticFeedback));
    expect(obj.$attrs.enableHapticFeedback).assertEqual(true);
    await Utils.sleep(1000)
    console.info('enableHapticFeedback_0001 END');
    done();
  });


  /**
   * @tc.name   TestTextPickerEnableHapticFeedback002
   * @tc.number TestTextPickerEnableHapticFeedback002
   * @tc.desc   TestTextPickerEnableHapticFeedback002
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('TestTextPickerEnableHapticFeedback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
    console.info('TestTextPickerEnableHapticFeedback0002 START');
    let PAGE_TAG = 'TextPickerEnableHapticFeedback';
    await Utils.pushPage(`textPicker/textPickerEnableHapticFeedback`)
    await Utils.sleep(3000)
    let strJson = getInspectorByKey('enableHapticFeedback_0002');
    let obj: ESObject = JSON.parse(strJson);
    console.info("[enableHapticFeedback_0002]:" + JSON.stringify(obj.$attrs.enableHapticFeedback));
    expect(obj.$attrs.enableHapticFeedback).assertEqual(false);
    await Utils.sleep(1000)
    console.info('enableHapticFeedback_0002 END');
    done();
  });


  /**
   * @tc.name   TestTextPickerEnableHapticFeedback0003
   * @tc.number TestTextPickerEnableHapticFeedback0003
   * @tc.desc   TestTextPickerEnableHapticFeedback0003
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('TestTextPickerEnableHapticFeedback0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
    console.info('TestTextPickerEnableHapticFeedback0003 START');
    let PAGE_TAG = 'TextPickerEnableHapticFeedback';
    await Utils.pushPage(`textPicker/textPickerEnableHapticFeedback`)
    await Utils.sleep(3000)
    let strJson = getInspectorByKey('enableHapticFeedback_0003');
    let obj: ESObject = JSON.parse(strJson);
    console.info("[enableHapticFeedback_0003]:" + JSON.stringify(obj.$attrs.enableHapticFeedback));
    expect(obj.$attrs.enableHapticFeedback).assertEqual(true);
    await Utils.sleep(1000)
    console.info('enableHapticFeedback_0003 END');
    done();
  });
  })
}