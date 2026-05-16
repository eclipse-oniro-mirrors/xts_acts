'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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

export default function TextPickerDialogEnableHapticFeedbackTest() {
  describe('TextPickerDialogEnableHapticFeedback', () => {
    beforeAll(async (): Promise<void> => {
      console.info("TextPickerDialogEnableHapticFeedback beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.textPickerDialog.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info('TextPickerDialogEnableHapticFeedback beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPickerDialog/TextPickerDialogEnableHapticFeedback',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get TextPickerDialogEnableHapticFeedback state pages:' + JSON.stringify(pages));
        if (!('TextPickerDialogEnableHapticFeedback' == pages.name)) {
          console.info('get TextPickerDialogEnableHapticFeedback pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2500);
        }
      } catch (err) {
        console.error('push TextPickerDialogEnableHapticFeedback page error:' + err);
      }
      console.info('TextPickerDialogEnableHapticFeedback beforeEach end');
    });
     
    /**
     * @tc.number   SUB_ARKUI_TEXTPICKERDIALOG_ENABLEHAPTICFEEDBACK_STATIC_0100
     * @tc.name     SUB_ARKUI_TEXTPICKERDIALOG_ENABLEHAPTICFEEDBACK_STATIC_0100
     * @tc.desc     SUB_ARKUI_TEXTPICKERDIALOG_ENABLEHAPTICFEEDBACK_STATIC_0100
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_TEXTPICKERDIALOG_ENABLEHAPTICFEEDBACK_STATIC_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKERDIALOG_ENABLEHAPTICFEEDBACK_STATIC_0100 start ===========================');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('TextPickerDialog1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000); 
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);
      console.info('SUB_ARKUI_TEXTPICKERDIALOG_ENABLEHAPTICFEEDBACK_STATIC_0100 getElement start');
      let textPicker1 = tree.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[0];    
      let enableHapticFeedbackVal = textPicker1.getElement('$attrs').getBoolean('enableHapticFeedback');
      console.info("[SUB_ARKUI_TEXTPICKERDIALOG_ENABLEHAPTICFEEDBACK_STATIC_0100] tree enableHapticFeedbackVal is: " + enableHapticFeedbackVal);
      expect(enableHapticFeedbackVal).assertEqual(true);
      console.info('SUB_ARKUI_TEXTPICKERDIALOG_ENABLEHAPTICFEEDBACK_STATIC_0100 END ===========================');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      done();
    });
  
    /**
     * @tc.number   SUB_ARKUI_TEXTPICKERDIALOG_ENABLEHAPTICFEEDBACK_STATIC_0200
     * @tc.name     SUB_ARKUI_TEXTPICKERDIALOG_ENABLEHAPTICFEEDBACK_STATIC_0200
     * @tc.desc     SUB_ARKUI_TEXTPICKERDIALOG_ENABLEHAPTICFEEDBACK_STATIC_0200
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_TEXTPICKERDIALOG_ENABLEHAPTICFEEDBACK_STATIC_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKERDIALOG_ENABLEHAPTICFEEDBACK_STATIC_0200 start ===========================');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('TextPickerDialog2'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000); 
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);
      console.info('SUB_ARKUI_TEXTPICKERDIALOG_ENABLEHAPTICFEEDBACK_STATIC_0200 getElement start');
      let textPicker1 = tree.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[0];    
      let enableHapticFeedbackVal = textPicker1.getElement('$attrs').getBoolean('enableHapticFeedback');
      console.info("[SUB_ARKUI_TEXTPICKERDIALOG_ENABLEHAPTICFEEDBACK_STATIC_0200] tree enableHapticFeedbackVal is: " + enableHapticFeedbackVal);
      expect(enableHapticFeedbackVal).assertEqual(false);
      console.info('SUB_ARKUI_TEXTPICKERDIALOG_ENABLEHAPTICFEEDBACK_STATIC_0200 END ===========================');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      done();
    });
   
    /**
     * @tc.number   SUB_ARKUI_TEXTPICKERDIALOG_ENABLEHAPTICFEEDBACK_STATIC_0300
     * @tc.name     SUB_ARKUI_TEXTPICKERDIALOG_ENABLEHAPTICFEEDBACK_STATIC_0300
     * @tc.desc     SUB_ARKUI_TEXTPICKERDIALOG_ENABLEHAPTICFEEDBACK_STATIC_0300
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_TEXTPICKERDIALOG_ENABLEHAPTICFEEDBACK_STATIC_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKERDIALOG_ENABLEHAPTICFEEDBACK_STATIC_0300 start ===========================');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('TextPickerDialog3'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000); 
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);
      console.info('SUB_ARKUI_TEXTPICKERDIALOG_ENABLEHAPTICFEEDBACK_STATIC_0300 getElement start');
      let textPicker1 = tree.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[0];    
      let enableHapticFeedbackVal = textPicker1.getElement('$attrs').getBoolean('enableHapticFeedback');
      console.info("[SUB_ARKUI_TEXTPICKERDIALOG_ENABLEHAPTICFEEDBACK_STATIC_0300] tree enableHapticFeedbackVal is: " + enableHapticFeedbackVal);
      expect(enableHapticFeedbackVal).assertEqual(true);
      console.info('SUB_ARKUI_TEXTPICKERDIALOG_ENABLEHAPTICFEEDBACK_STATIC_0300 END ===========================');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      done();
    });
  })
}