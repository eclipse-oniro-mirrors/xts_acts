'use static';
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

export default function EnableHapticFeedback() {
  describe('EnableHapticFeedback', () => {
    beforeAll(() => {
      console.info("EnableHapticFeedback beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.nowear.api18.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info('EnableHapticFeedback beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePickerDialog/datePickerDialogEnableHapticFeedback',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get EnableHapticFeedback state pages:' + JSON.stringify(pages));
        if (!('datePickerDialogEnableHapticFeedback' == pages.name)) {
          console.info('get EnableHapticFeedback pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push EnableHapticFeedback page error:' + err);
      }
      console.info('EnableHapticFeedback beforeEach end');
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('EnableHapticFeedback after each called');
    });
    
    
/**
     * @tc.number   DatePickerDialog_EnableHapticFeedback_static_001
     * @tc.name     DatePickerDialog_EnableHapticFeedback_static_001
     * @tc.desc     DatePickerDialog_EnableHapticFeedback_static_001
     * @tc.level    Level.LEVEL1
     */
it('DatePickerDialog_EnableHapticFeedback_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'DatePickerDialog_EnableHapticFeedback_static_001';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(1000);
      inspector.sendEventByKey('DatePickerDialog1', 10, '')
      await CommonFunc.sleep(1000);
      let obj1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);
      let datePicker1 = JSON.stringify(obj1.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[1].getArray('$children')[0])
      console.info('[DatePickerDialog_EnableHapticFeedback_static_001] obj1 is: ' + datePicker1);
      console.info('[DatePickerDialog_EnableHapticFeedback_static_001] obj1 is: ' + JSON.stringify(JSON.parseJsonElement(datePicker1).getElement('$attrs').getString('enableHapticFeedback')));
      inspector.sendEventByKey('DatePickerDialog1', 10, '')
      expect(JSON.parseJsonElement(datePicker1).getElement('$attrs').getString('enableHapticFeedback')).assertEqual(true);
      console.info('[' + tagName + '] END ===========================');
      await CommonFunc.sleep(2000);
      done();
    });

    
    
/**
     * @tc.number   DatePickerDialog_EnableHapticFeedback_static_002
     * @tc.name     DatePickerDialog_EnableHapticFeedback_static_002
     * @tc.desc     DatePickerDialog_EnableHapticFeedback_static_002
     * @tc.level    Level.LEVEL1
     */
it('DatePickerDialog_EnableHapticFeedback_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'DatePickerDialog_EnableHapticFeedback_static_002';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(1000);
      inspector.sendEventByKey('DatePickerDialog2', 10, '')
      await CommonFunc.sleep(1000);
      let obj1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);
      let datePicker1 = JSON.stringify(obj1.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[1].getArray('$children')[0])
      console.info('[DatePickerDialog_EnableHapticFeedback_static_002] obj1 is: ' + datePicker1);
      console.info('[DatePickerDialog_EnableHapticFeedback_static_002] obj1 is: ' + JSON.stringify(JSON.parseJsonElement(datePicker1).getElement('$attrs').getString('enableHapticFeedback')));
      inspector.sendEventByKey('DatePickerDialog2', 10, '')
      expect(JSON.parseJsonElement(datePicker1).getElement('$attrs').getString('enableHapticFeedback')).assertEqual(false);
      console.info('[' + tagName + '] END ===========================');
      await CommonFunc.sleep(2000);
      done();
    });

    
    
/**
     * @tc.number   DatePickerDialog_EnableHapticFeedback_static_003
     * @tc.name     DatePickerDialog_EnableHapticFeedback_static_003
     * @tc.desc     DatePickerDialog_EnableHapticFeedback_static_003
     * @tc.level    Level.LEVEL1
     */
it('DatePickerDialog_EnableHapticFeedback_static_003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'DatePickerDialog_EnableHapticFeedback_static_003';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(1000);
      inspector.sendEventByKey('DatePickerDialog3', 10, '')
      await CommonFunc.sleep(1000);
      let obj1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);
      let datePicker1 = JSON.stringify(obj1.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[1].getArray('$children')[0])
      console.info('[DatePickerDialog_EnableHapticFeedback_static_003] obj1 is: ' + datePicker1);
      console.info('[DatePickerDialog_EnableHapticFeedback_static_003] obj1 is: ' + JSON.stringify(JSON.parseJsonElement(datePicker1).getElement('$attrs').getString('enableHapticFeedback')));
      inspector.sendEventByKey('DatePickerDialog3', 10, '')
      expect(JSON.parseJsonElement(datePicker1).getElement('$attrs').getString('enableHapticFeedback')).assertEqual(true);
      console.info('[' + tagName + '] END ==========================='); 
      await CommonFunc.sleep(2000);
      done();
    });
    
    
    
/**
     * @tc.number   DatePickerDialog_EnableHapticFeedback_static_004
     * @tc.name     DatePickerDialog_EnableHapticFeedback_static_004
     * @tc.desc     DatePickerDialog_EnableHapticFeedback_static_004
     * @tc.level    Level.LEVEL1
     */
it('DatePickerDialog_EnableHapticFeedback_static_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'DatePickerDialog_EnableHapticFeedback_static_004';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(1000);
      inspector.sendEventByKey('DatePickerDialog4', 10, '')
      await CommonFunc.sleep(1000);
      let obj1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);
      let datePicker1 = JSON.stringify(obj1.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[1].getArray('$children')[0])
      console.info('[DatePickerDialog_EnableHapticFeedback_static_004] obj1 is: ' + datePicker1);
      console.info('[DatePickerDialog_EnableHapticFeedback_static_004] obj1 is: ' + JSON.stringify(JSON.parseJsonElement(datePicker1).getElement('$attrs').getString('enableHapticFeedback')));
      inspector.sendEventByKey('DatePickerDialog4', 10, '')
      expect(JSON.parseJsonElement(datePicker1).getElement('$attrs').getString('enableHapticFeedback')).assertEqual(true);
      console.info('[' + tagName + '] END ===========================');
      await CommonFunc.sleep(2000);
      done();
    });
  })
}