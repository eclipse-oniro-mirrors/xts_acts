'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils'

export default function TimePickerDialogEnableHapticFeedbackTest() {
  describe('TimePickerDialogEnableHapticFeedback', () => {
    beforeAll(() => {
      console.info("TimePickerDialogEnableHapticFeedbackTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.nowear.api18.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info('TimePickerDialogEnableHapticFeedback beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/timePickerDialog/timePickerDialogEnableHapticFeedback',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get TimePickerDialogEnableHapticFeedback state pages:' + JSON.stringify(pages));
        if (!('timePickerDialogEnableHpaticFeedback' == pages.name)) {
          console.info('get TimePickerDialogEnableHapticFeedback pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2500);
        }
      } catch (err) {
        console.error('push TimePickerDialogEnableHapticFeedback page error:' + err);
      }
      console.info('TimePickerDialogEnableHapticFeedback beforeEach end');
    });

    

     
/**
     * @tc.number   TimePickerDialog_EnableHapticFeedback_static_001
     * @tc.name     TimePickerDialog_EnableHapticFeedback_static_001
     * @tc.desc     TimePickerDialog_EnableHapticFeedback_static_001
     * @tc.level    Level.LEVEL1
     */
it('TimePickerDialog_EnableHapticFeedback_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'TimePickerDialog_EnableHapticFeedback_static_001';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(1000);
      inspector.sendEventByKey('TimePickerDialog1', 10, "")
      await CommonFunc.sleep(1000);
      let obj1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);
      let timePicker1 = JSON.stringify(obj1.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[1])
      console.info("[TimePickerDialog_EnableHapticFeedback_static_001] obj1 is: " + timePicker1);
      console.info("[TimePickerDialog_EnableHapticFeedback_static_001] obj1 is: " + JSON.stringify(JSON.parseJsonElement(timePicker1).getElement('$attrs').getString('enableHapticFeedback')));
      inspector.sendEventByKey('TimePickerDialog1', 10, "")
      expect(JSON.parseJsonElement(timePicker1).getElement('$attrs').getString('enableHapticFeedback')).assertEqual(true);
      console.info('[' + tagName + '] END ===========================');
      await CommonFunc.sleep(2000);
      done();
    });

    

    
/**
     * @tc.number   TimePickerDialog_EnableHapticFeedback_static_002
     * @tc.name     TimePickerDialog_EnableHapticFeedback_static_002
     * @tc.desc     TimePickerDialog_EnableHapticFeedback_static_002
     * @tc.level    Level.LEVEL1
     */
it('TimePickerDialog_EnableHapticFeedback_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'TimePickerDialog_EnableHapticFeedback_static_002';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(1000);
      inspector.sendEventByKey('TimePickerDialog2', 10, "")
      await CommonFunc.sleep(1000);
      let obj2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);
      let timePicker2 = JSON.stringify(obj2.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[1])
      console.info("[TimePickerDialog_EnableHapticFeedback_static_002] obj2 is: " + timePicker2);
      console.info("[TimePickerDialog_EnableHapticFeedback_static_002] obj2 is: " + JSON.stringify(JSON.parseJsonElement(timePicker2).getElement('$attrs').getString('enableHapticFeedback')));
      inspector.sendEventByKey('TimePickerDialog2', 10, "")
      expect(JSON.parseJsonElement(timePicker2).getElement('$attrs').getString('enableHapticFeedback')).assertEqual(false);
      console.info('[' + tagName + '] END ===========================');
      await CommonFunc.sleep(2000);
      done();
    });

    

    
/**
     * @tc.number   TimePickerDialog_EnableHapticFeedback_static_003
     * @tc.name     TimePickerDialog_EnableHapticFeedback_static_003
     * @tc.desc     TimePickerDialog_EnableHapticFeedback_static_003
     * @tc.level    Level.LEVEL1
     */
it('TimePickerDialog_EnableHapticFeedback_static_003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'TimePickerDialog_EnableHapticFeedback_static_003';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(1000);
      inspector.sendEventByKey('TimePickerDialog3', 10, "")
      await CommonFunc.sleep(1000);
      let obj3 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);
      let timePicker3 = JSON.stringify(obj3.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[1])
      console.info("[TimePickerDialog_EnableHapticFeedback_static_003] obj3 is: " + timePicker3);
      console.info("[TimePickerDialog_EnableHapticFeedback_static_003] obj3 is: " + JSON.stringify(JSON.parseJsonElement(timePicker3).getElement('$attrs').getString('enableHapticFeedback')));
      inspector.sendEventByKey('TimePickerDialog3', 10, "")
      expect(JSON.parseJsonElement(timePicker3).getElement('$attrs').getString('enableHapticFeedback')).assertEqual(true);
      console.info('[' + tagName + '] END ===========================');
      await CommonFunc.sleep(2000);
      done();
    });

    

    
/**
     * @tc.number   TimePickerDialog_EnableHapticFeedback_static_004
     * @tc.name     TimePickerDialog_EnableHapticFeedback_static_004
     * @tc.desc     TimePickerDialog_EnableHapticFeedback_static_004
     * @tc.level    Level.LEVEL1
     */
it('TimePickerDialog_EnableHapticFeedback_static_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'TimePickerDialog_EnableHapticFeedback_static_004';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(1000);
      inspector.sendEventByKey('TimePickerDialog4', 10, "")
      await CommonFunc.sleep(1000);
      let obj4 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);
      let timePicker4 = JSON.stringify(obj4.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[1])
      console.info("[TimePickerDialog_EnableHapticFeedback_static_004] obj4 is: " + timePicker4);
      console.info("[TimePickerDialog_EnableHapticFeedback_static_004] obj4 is: " + JSON.stringify(JSON.parseJsonElement(timePicker4).getElement('$attrs').getString('enableHapticFeedback')));
      inspector.sendEventByKey('TimePickerDialog4', 10, "")
      expect(JSON.parseJsonElement(timePicker4).getElement('$attrs').getString('enableHapticFeedback')).assertEqual(true);
      console.info('[' + tagName + '] END ===========================');
      await CommonFunc.sleep(2000);
      done();
    });

    })
}
