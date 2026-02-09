'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { expect, describe, it, afterEach, Level, beforeAll  } from '../../../../hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import { UtilsTest } from '../Util.test'
import inspector from '@ohos.arkui.inspector';

export default function textPickerEnableHapticFeedbackTest() {

  describe('textPickerEnableHapticFeedbackTest', () => {
    beforeAll((): void => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api19.static", "EntryAbility")
    });
    afterEach(async (): Promise<void> => {
      await Utils.sleep(100);
    })

   

  /**
     * @tc.number   TestTextPickerEnableHapticFeedback0001
     * @tc.name     TestTextPickerEnableHapticFeedback0001
     * @tc.desc     TestTextPickerEnableHapticFeedback0001
     * @tc.level    Level.LEVEL1
     */
    it('TestTextPickerEnableHapticFeedback0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
    console.info('TestTextPickerEnableHapticFeedback0001 START');
    let PAGE_TAG = 'TextPickerEnableHapticFeedback';
    await Utils.pushPage(`textPicker/textPickerEnableHapticFeedback`)
    await Utils.sleep(3000)
    let strJson = inspector.getInspectorByKey('enableHapticFeedback_0001');
    let obj = JSON.parseJsonElement(strJson);
    console.info("[enableHapticFeedback_0001]:" + JSON.stringify(obj.getElement('$attr').getString('enableHapticFeedback')));
    expect(obj.getElement('$attr').getString('enableHapticFeedback')).assertEqual(true);
    await Utils.sleep(1000)
    console.info('enableHapticFeedback_0001 END');
    done();
  });

   

  /**
     * @tc.number   TestTextPickerEnableHapticFeedback002
     * @tc.name     TestTextPickerEnableHapticFeedback002
     * @tc.desc     TestTextPickerEnableHapticFeedback002
     * @tc.level    Level.LEVEL1
     */
    it('TestTextPickerEnableHapticFeedback002', Level.LEVEL1, async (done: () => void): Promise<void> => {
    console.info('TestTextPickerEnableHapticFeedback0002 START');
    let PAGE_TAG = 'TextPickerEnableHapticFeedback';
    await Utils.pushPage(`textPicker/textPickerEnableHapticFeedback`)
    await Utils.sleep(3000)
    let strJson = inspector.getInspectorByKey('enableHapticFeedback_0002');
    let obj = JSON.parseJsonElement(strJson);
    console.info("[enableHapticFeedback_0002]:" + JSON.stringify(obj.getElement('$attr').getString('enableHapticFeedback')));
    expect(obj.getElement('$attr').getString('enableHapticFeedback')).assertEqual(false);
    await Utils.sleep(1000)
    console.info('enableHapticFeedback_0002 END');
    done();
  });

   

  /**
     * @tc.number   TestTextPickerEnableHapticFeedback0003
     * @tc.name     TestTextPickerEnableHapticFeedback0003
     * @tc.desc     TestTextPickerEnableHapticFeedback0003
     * @tc.level    Level.LEVEL1
     */
    it('TestTextPickerEnableHapticFeedback0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
    console.info('TestTextPickerEnableHapticFeedback0003 START');
    let PAGE_TAG = 'TextPickerEnableHapticFeedback';
    await Utils.pushPage(`textPicker/textPickerEnableHapticFeedback`)
    await Utils.sleep(3000)
    let strJson = inspector.getInspectorByKey('enableHapticFeedback_0003');
    let obj = JSON.parseJsonElement(strJson);
    console.info("[enableHapticFeedback_0003]:" + JSON.stringify(obj.getElement('$attr').getString('enableHapticFeedback')));
    expect(obj.getElement('$attr').getString('enableHapticFeedback')).assertEqual(true);
    await Utils.sleep(1000)
    console.info('enableHapticFeedback_0003 END');
    done();
  });
  })
}